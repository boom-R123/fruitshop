<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="User.function" %>
<html>
<head>
    <title>register</title>
</head>
<body>
<jsp:useBean id="user" class="JavaBean.User">
    <jsp:setProperty name="user" property="*"/>
</jsp:useBean>
<%
    function f=new function();
    int type=Integer.parseInt(request.getParameter("is_VIP"));
    if(function.Register(user.getUserName(),user.getPassWord(),type)){
        session.setAttribute("register","true");

    }else{
        session.setAttribute("register","false");
    }
%>
<%
    response.sendRedirect("../index.jsp");
%>
</body>
</html>
