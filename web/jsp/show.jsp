<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="User.valuebean.GoodsSingle" %>
<% request.setCharacterEncoding("UTF-8"); //设置取得值的编码方式为同一的编码,否则中文会乱码 %>
<% ArrayList goodslist = (ArrayList) session.getAttribute("goodslist");%>
<link rel="stylesheet" type="text/css" href="../external/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="../css/show.css">
<body>
<h1 class="text-center">用 户 界 面
    <a id="back" href="../index.jsp">
        <button>退出登录</button>
    </a>
</h1>

<div class="left">
    <h2 class="text-center">购物板块</h2>
    <table border="1" rules="none" cellspacing="0" cellpadding="0">
        <tr height="50">
            <td colspan="6" align="center">提供商品如下</td>
        </tr>
        <tr align="center" height="30" bgcolor="lightgrey">
            <td>商品编号
            <td>
            <td>名称</td>
            <td>价格(元/斤)</td>
            <td>商品库存</td>
            <td>购买</td>
        </tr>
        <% if (goodslist == null || goodslist.size() == 0) { %>
        <tr height="100">
            <td colspan="5" align="center">没有商品可显示！</td>
        </tr>
        <%
        } else {
            for (int i = 0; i < goodslist.size(); i++) {
                GoodsSingle single = (GoodsSingle) goodslist.get(i);
        %>
        <tr height="50" align="center">
            <td colspan="2"><%=single.getId()%>
            </td>
            <td><%=single.getName()%>
            </td>
            <td><%=single.getPrice()%>
            </td>
            <td><%=single.getInventory()%>
            </td>
            <td><a href="../doCar?action=buy&id=<%=i%>">购买</a></td>
        </tr>
        <%
                }
            }
        %>
        <tr height="50">
            <td align="center" colspan="6"><a href="shopcar.jsp">查看购物车</a></td>
        </tr>
    </table>
    <%
        boolean vip = false;
        if (Integer.parseInt(session.getAttribute("type").toString()) == 2) {
            vip = true;
        }
    %>
    <%if (vip) {%>
    <h3 class="text-center">您已经是我们的会员啦!</h3>
    <%}%>
    <%if (!vip) {%>
    <div class="vip">
        <h3>是否开通会员(100元)?</h3>
        <form action="vip_deal.jsp">
            <button type="submit">
					<span class="glyphicon glyphicon-ok" aria-hidden="true">

					</span>

            </button>
        </form>
    </div>
    <%}%>
</div>

<div class="right">
    <h2 class="text-center">反馈板块</h2>
    <form action="message_deal.jsp" class="form">
        反馈名:&nbsp&nbsp<input type="text" name="author" id="author" style="margin-top: 10px;width: 80%"/>
        <br>
        <br>
        标 &nbsp&nbsp题:&nbsp&nbsp<input type="text" id="title" name="title" style="width: 80%;"/>
        <br>
        <br>
        内 &nbsp&nbsp容:&nbsp&nbsp<textarea name="content" id="content"
                                          style="height: 260px;width:80%;position: absolute"></textarea>
        <br>
        <button type="submit" class="btn btn-success message" value="反 馈" id="btm_feedback">
            反 馈
        </button>
        <a href="look_message.jsp?currentPage=1" id="lookmessage">
            <button type="button" class="btn btn-primary lookmessage" value="查看反馈">
                查看反馈
            </button>
        </a>
    </form>

</div>


<script src="../external/jquery/jquery-3.2.0.js" charset="UTF-8"></script>
<script src="../external/bootstrap-3.3.7-dist/js/bootstrap.min.js" charset="UTF-8"></script>

<script>
    window.onload = function () {
        $("#btm_feedback").click(function () {
            if ($("#author").val() == "" || $("#content").val() == "" || $("#title").val() == "") {
                alert("输入不能为空!");
                return false;
            }
        })
    }
</script>

</body>