<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="User.valuebean.GoodsSingle" %>
<% request.setCharacterEncoding("UTF-8"); //设置取得值的编码方式为同一的编码,否则中文会乱码 %>
<style>
	table{
		margin: 100px auto;
	}
</style>
<% 
	//获取存储在session中用来存储用户已购买商品的buylist集合对象
	ArrayList buylist=(ArrayList)session.getAttribute("buylist");
	float total=0; 							//用来存储应付金额
%>

<table border="1" width="600" rules="none" cellspacing="0" cellpadding="0">
	<tr height="50"><td colspan="6" align="center">购买的商品如下</td></tr>
	<tr align="center" height="30" bgcolor="lightgrey">
		<td width>商品编号</td>
		<td width>名称</td>
		<td>价格(元/斤)</td>
		<td>数量</td>
		<td>总价(元)</td>
		<td>移除(-1/次)</td>
	</tr>
	<%	if(buylist==null||buylist.size()==0){ %>
	<tr height="100"><td colspan="6" align="center">您的购物车为空！</td></tr>
	<% 
		}
		else{
			for(int i=0;i<buylist.size();i++){
				GoodsSingle single=(GoodsSingle)buylist.get(i);
				String id=single.getId();				//获取商品编号
				String name=single.getName();			//获取商品名称
				float price=single.getPrice();			//获取商品价格
				int num=single.getNum();				//获取购买数量
				float money=price*num;
				money = ((float)Math.round(money*10))/10;//保留一位小数
				total+=money; 							//计算应付金额
	%>
	<tr align="center" height="50">
		<td><%=id%></td>
		<td><%=name%></td>
		<td><%=price%></td>
		<td><%=num%></td>
		<td><%=money%></td>
		<td><a href="../doCar?action=remove&name=<%=single.getName() %>">移除</a></td>
	</tr>
	<%							
			}
		}
	%>
	<%
		boolean vip=false;
		if(Integer.parseInt(session.getAttribute("type").toString())==2){
			vip=true;
		}
		if(vip){
			total = ((float)Math.round(total*100*0.8))/100;//保留两位位小数,会员八折
		}else{
			total = ((float)Math.round(total*100))/100;//保留两位位小数,会员八折
		}
	%>
	<%  if(vip){ %>
	<tr height="50" align="center"><td colspan="6">您是vip用户，享有8折优惠</td></tr>
	<%}%>
	<tr height="50" align="center"><td colspan="6">应付金额：<%=total%></td></tr>
	<tr height="50" align="center">
		<td colspan="2"><a href="show.jsp"><button style="font-size: 16px">继续购物</button></a></td>
		<td colspan="2"><a href="buy.jsp"><button style="font-size: 16px;margin-left: 50px">确认购买</button></a></td>
		<td colspan="2"><a href="../doCar?action=clear"><button style="font-size: 16px">清空购物车</button></a></td>
	</tr>				
</table>