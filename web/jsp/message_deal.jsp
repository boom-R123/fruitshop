<%@ page import="JavaBean.Cont,java.util.*" %>
<%@ page import="User.function" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>处理</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); //设置取得值的编码方式为同一的编码,否则中文会乱码 %>

<jsp:useBean id="bn" class="JavaBean.Cont">
    <jsp:setProperty name="bn" property="*"/>
</jsp:useBean>

<%
    Cont c=new Cont();
    c.setAuthor(bn.getAuthor());
    c.setTitle(bn.getTitle());
    c.setContent(bn.getContent());
    java.util.Date d = new java.util.Date();
    java.text.SimpleDateFormat dformat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String datetime = dformat.format(d);
    c.setTime(datetime);
    function f=new function();
    f.Addfeedback(c.getAuthor(),c.getTitle(),c.getContent(),c.getTime());
%>
<%
    response.sendRedirect("show.jsp");//一定要用这个而不是forward,否则刷新时会重新提交表单！！！
%>
</body>
</html>
