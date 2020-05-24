<%@ page import="User.function" %><%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/5/23
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>stock</title>
</head>
<body>
<%
    String id=request.getParameter("fruit_id");
    int num=Integer.parseInt(request.getParameter("fruit_num"));
    float money=Float.parseFloat(request.getParameter("fruit_money"));
    java.util.Date d = new java.util.Date();
    java.text.SimpleDateFormat dformat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String datetime = dformat.format(d);
    String content="购买了"+id+"号水果"+num+"斤";
    function f=new function();
    f.Stock(id,num);
    f.AddSpend(content,datetime,money);
%>
<%
    response.sendRedirect("admin.jsp");//一定要用这个而不是forward,否则刷新时会重新提交表单！！！
%>
</body>
</html>
