<%@ page import="java.util.ArrayList" %>
<%@ page import="JavaBean.Cont" %>
<%@ page import="User.function" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>disp</title>
    <link rel="stylesheet" type="text/css" href="../external/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
</head>
<style>
    body{
        overflow: hidden;
    }
    table{
        margin: 10px auto;
    }
    button{
        font-size: 20px;
        margin: 0px 20px;
    }
    .div_button{
        width: 500px;
        margin-left: 38%;
    }
</style>
<body>
<% request.setCharacterEncoding("UTF-8"); //设置取得值的编码方式为同一的编码,否则中文会乱码 %>
<%
    function f=new function();
    ArrayList fb=f.Getfeedback();
    application.setAttribute("Message",fb);
    ArrayList mess=(ArrayList)application.getAttribute("Message");
    int currentPage = 1,start = 0,pageSize=5,pageCounts = 0,rowCounts = 0;
    if(mess==null)  out.print("目前还没有反馈呀");
    else{
        currentPage=Integer.parseInt(request.getParameter("currentPage"));
        rowCounts=mess.size();
        pageCounts=(rowCounts-1)/pageSize+1;
        if(currentPage<1) currentPage=1;
        if(currentPage>pageCounts) currentPage=pageCounts;
        start=(currentPage-1)*pageSize;
    }
%>
<h1 class="text-center">共<%=pageCounts%>页,当前为第<%=currentPage%>页</h1>
<table class="table table-striped" style="width: 80%">
    <tr>
        <th>反馈者</th>
        <th>标题</th>
        <th>留言时间</th>
        <th>内容</th>
    </tr>
    <%
        for(int i=start;i<start+pageSize&&i<rowCounts;i++) {
            Cont c;
            c=(Cont)mess.get(i);
    %>
    <tr>
        <td><%=c.getAuthor()%></td>
        <td><%=c.getTitle()%></td>
        <td><%=c.getTime()%></td>
        <td><%=c.getContent()%></td>
    </tr>
    <%
        }
    %>
</table>

<div class="div_button">
    <a href="look_message.jsp?currentPage=<%=currentPage-1%>">
        <button type="button" value="前一页">
            前一页
        </button>
    </a>
    <a href="show.jsp">
        <button type="button" value="继续留言">
            返 回
        </button>
    </a>
    <a href="look_message.jsp?currentPage=<%=currentPage+1%>">
        <button type="button" value="后一页">
            后一页
        </button>
    </a>
</div>

</body>
<script src="../external/jquery/jquery-3.2.0.js" charset="UTF-8"></script>
<script src="../external/bootstrap-3.3.7-dist/js/bootstrap.min.js" charset="UTF-8"></script>
</html>
