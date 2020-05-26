<%@ page import="User.function" %><%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/5/26
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Addfruit</title>
</head>
<body>
<%
    String name=request.getParameter("fruit_name");
    float money=Float.parseFloat(request.getParameter("fruit_money"));
    function f=new function();
    f.AddFruit(name,money);
%>
<%
    response.sendRedirect("admin.jsp");//一定要用这个而不是forward,否则刷新时会重新提交表单！！！
%>
</body>
</html>
