<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="User.valuebean.GoodsSingle" %>
<%@ page import="User.function" %>
<%@ page import="JavaBean.Income" %>
<%@ page import="java.util.List" %>
<%@ page import="JavaBean.fruit" %>
<%@ page import="JavaBean.User" %>
<% request.setCharacterEncoding("UTF-8"); //设置取得值的编码方式为同一的编码,否则中文会乱码 %>
<%	ArrayList goodslist=(ArrayList)session.getAttribute("goodslist");	%>
<link rel="stylesheet" type="text/css" href="../external/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="../css/admin.css">
<body>
    <%
        function f=new function();
        List<Income> incomes=f.GetIncome();
        List<Income> spends=f.GetSpend();
        List<fruit> fruits=f.GetFruit();
        List<User> users=f.GetUser();
        float n=0;//总收入
        float spend=0;//总支出
    %>
    <h1 class="text-center">管 理 员 界 面
        <a id="back" href="../index.jsp">
            <button>退出登录</button>
        </a>
    </h1>

    <div class="left">
        <h2 class="text-center">收入明细</h2>
        <table class="table table-hover table_income" style="width: 100%">
            <tr class="text-center">
                <th>记录编号</th>
                <th class="text-center">内容</th>
                <th>收入金额</th>
                <th class="text-center">时间</th>
            </tr>
            <%
                for(int i=0;i<incomes.size();i++) {
                   Income ic=incomes.get(i);
                   n=n+ic.getMoney();
            %>
            <tr>
                <td><%=ic.getId()%></td>
                <td><%=ic.getContent()%></td>
                <td><%=ic.getMoney()%>元</td>
                <td><%=ic.getDate()%></td>
            </tr>
            <%
                }
                n = ((float)Math.round(n*100))/100;//保留两位位小数,会员八折
            %>
        </table>

        <hr/>

        <h2 class="text-center">支出明细</h2>
        <table class="table table-hover" style="width: 95%">
            <tr class="text-center">
                <th>记录编号</th>
                <th class="text-center">内容</th>
                <th>支出金额</th>
                <th class="text-center">时间</th>
            </tr>
            <%
                for(int i=0;i<spends.size();i++) {
                    Income ic=spends.get(i);
                    spend=spend+ic.getMoney();
            %>
            <tr>
                <td><%=ic.getId()%></td>
                <td><%=ic.getContent()%></td>
                <td><%=ic.getMoney()%>元</td>
                <td><%=ic.getDate()%></td>
            </tr>
            <%
                }
                spend = ((float)Math.round(spend*100))/100;//保留两位位小数,会员八折
            %>
        </table>

        <hr style="border: #000000 1px solid"/>

        <h3 class="text-center">
            总收入为:<%=n%>元&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            总支出为:<%=spend%>元&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
            总利润:<%=((float)Math.round((n-spend)*100))/100%>元
        </h3>



    </div>

    <div class="right">

        <h2 class="text-center">销售情况</h2>
        <table class="table table-bordered table-sell" style="width: 95%">
            <tr class="text-center">
                <th>水果编号</th>
                <th>水果名称</th>
                <th>现有库存</th>
                <th>销售量</th>
            </tr>
            <%
                for(int i=0;i<fruits.size();i++) {
                    fruit f1=fruits.get(i);
            %>
            <tr>
                <td><%=f1.getId()%></td>
                <td><%=f1.getName()%></td>
                <td><%=f1.getInventory()%>斤</td>
                <td><%=f1.getSell()%>斤</td>
            </tr>
            <%
                }
            %>
        </table>
        <hr/>

        <h2 class="text-center">购入水果</h2>
        <form class="fruit_form" action="stock.jsp">
            水果编号: <input type="text" name="fruit_id" value="">
            进货量: <input type="text" name="fruit_num">
            所用金额: <input type="text" name="fruit_money">
            <button type="submit" class="btn btn-success" style="font-size: 20px;">确认进货</button>
        </form>
        <hr style="border: #ff7570 2px solid"/>

        <h2 class="text-center">用户详情</h2>
        <table class="table table-hover table-bordered table_user" style="width: 90%">
            <tr class="text-center">
                <th class="text-center">用户名</th>
                <th class="text-center">密码</th>
                <th class="text-center">类型(点击可以更改类型)</th>
            </tr>
            <%
                for(int i=0;i<users.size();i++) {
                    User u=users.get(i);
            %>
            <tr>
                <td class="text-center"><%=u.getUserName()%></td>
                <td class="text-center"><%=u.getPassWord()%></td>
                <%  String type="";
                    if(u.getType()==2){
                        type="会员";
                    }else{
                        type="普通用户";
                    }
                %>
                <td class="text-center ChangeType"><%=type%></td>
            </tr>
            <%}%>
        </table>


    </div>

    <script src="../external/jquery/jquery-3.2.0.js" charset="UTF-8"></script>
    <script src="../external/bootstrap-3.3.7-dist/js/bootstrap.min.js" charset="UTF-8"></script>
    <script>
        $(function () {
            $(".ChangeType").click(function () {
                var InfOut={};
                var type=this.innerText;
                var obj=this;
                InfOut["name"]=$(this).parent().find("td:first").text();
                $.ajax({
                    type: "post",
                    url: "../Servlet",
                    data: InfOut,
                    success: function (data) {
                        var result = data;
                        if(result){
                            alert("更改成功！");
                            if(type=="会员"){
                                $(obj).text("普通用户");
                            }else{
                                $(obj).text("会员");
                            }
                        }else{
                            alert("更改失败！");
                        }

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(XMLHttpRequest.status);
                    },
                });
            });
        })
    </script>

</body>