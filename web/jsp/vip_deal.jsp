<%@ page import="User.function" %>
<%@ page import="JavaBean.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    function f=new function();
    User u= (User) session.getAttribute("person");
    f.ChangeToVip(u.getUserName());
    java.util.Date d = new java.util.Date();
    java.text.SimpleDateFormat dformat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String datetime = dformat.format(d);
    String content="用户:"+u.getUserName()+" 开通了会员 ";
    f.Addincome(content,datetime,100);
    session.setAttribute("type",2);
%>
<%
    response.sendRedirect("show.jsp");//一定要用这个而不是forward,否则刷新时会重新提交表单！！！
%>
</body>
</html>
