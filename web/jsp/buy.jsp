<%@ page import="User.function" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="User.toolbean.ShopCar" %>
<%@ page import="User.valuebean.GoodsSingle" %>
<%@ page import="java.util.List" %>
<%@ page import="JavaBean.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>buy</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); //设置取得值的编码方式为同一的编码,否则中文会乱码 %>

<jsp:useBean id="user" class="JavaBean.User">
    <jsp:setProperty name="user" property="*"/>
</jsp:useBean>

<%
    List<GoodsSingle> buylist=(ArrayList)session.getAttribute("buylist");
    if(buylist==null||buylist.isEmpty()){}
    else{
        function f=new function();
        f.Buy(buylist);
        float total=0;
        java.util.Date d = new java.util.Date();
        java.text.SimpleDateFormat dformat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String datetime = dformat.format(d);
        User u= (User) session.getAttribute("person");
        String content="用户:"+u.getUserName()+" ";
        for(int i=0;i<buylist.size();i++) {
            GoodsSingle single = (GoodsSingle) buylist.get(i);
            float price = single.getPrice();            //获取商品价格
            int num = single.getNum();                //获取购买数量
            float money = price * num;
            content=content+"购买:"+single.getName()+single.getNum()+"斤 ";
            money = ((float) Math.round(money * 10)) / 10;//保留一位小数
            total += money;                            //计算应付金额
        }
        boolean vip=false;
        if(Integer.parseInt(session.getAttribute("type").toString())==2){
            vip=true;
        }
        if(vip){
            total = ((float)Math.round(total*100*0.8))/100;//保留两位位小数,会员八折
        }else{
            total = ((float)Math.round(total*100))/100;//保留两位位小数,会员八折
        }
        f.Addincome(content,datetime,total);
        buylist.clear();
    }
%>
<jsp:forward page="/index"/>
</body>
</html>
