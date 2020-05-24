<%@ page import="User.function" %>
<%@ page import="JavaBean.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); //设置取得值的编码方式为同一的编码,否则中文会乱码 %>

<jsp:useBean id="user" class="JavaBean.User">
    <jsp:setProperty name="user" property="*"/>
</jsp:useBean>

<%
    String is_Administrator=request.getParameter("is_Administrator");
    boolean admin_succeed=false;
    boolean user_succeed=false;
    out.print(is_Administrator);
    if(Integer.parseInt(request.getParameter("is_Administrator"))==2){//是管理员登录
        if(user.getUserName()!=null&&user.getPassWord()!=null&&!user.getUserName().isEmpty()&&!user.getPassWord().isEmpty()) {
            if (user.getUserName().equals("root") && user.getPassWord().equals("111111")) {
                User u=new User();
                u.setUserName("root");
                u.setType(3);//3为管理员
                session.setAttribute("person",u);
                admin_succeed = true;
            }
        }
    }else{
        function f=new function();
        int type=f.Login(user.getUserName(),user.getPassWord());
        if(type>=1){
            user_succeed=true;
            User u=new User();
            u.setUserName(user.getUserName());
            u.setType(type);
            session.setAttribute("person",u);
            session.setAttribute("type",type);
        }
    }
%>

<%if(admin_succeed){ %>
<jsp:forward page="admin.jsp"></jsp:forward>
<%}%>
<%if(user_succeed){ %>
<jsp:forward page="user.jsp"></jsp:forward>
<%}%>
<%
    session.setAttribute("result","false");
    response.sendRedirect("../index.jsp");
%>
</body>
</html>
