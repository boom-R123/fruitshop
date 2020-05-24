<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>login</title>
    <link rel="stylesheet" type="text/css" href="../external/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/login.css">
</head>
<body>

<h1 class="text-center" style="font-size: 36px">水果商店系统</h1>

<form class="login_form text-center" action="register_deal.jsp" style="height: 410px">

    <h2 style="border-bottom: 1px blue solid;padding-bottom:10px;width: 80%;margin-left: 10%">注 册</h2>
    <br/><br/>

    <div class="text-center radio">
        <input type="radio"  name="is_VIP"  value="2" checked="checked"/>注册为会员
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <input type="radio"  name="is_VIP"  value="1" />不注册为会员
    </div>
    <div class="form-group">
        <span class="glyphicon glyphicon-user" aria-hidden="true"></span>:
        <input type="text" class="form-control" id="UserName" name="userName" placeholder="请输入用户名" autofocus="autofocus">
    </div>


    <br/><br/>
    <div class="form-group">
        <span class="glyphicon glyphicon-lock" aria-hidden="true" style="margin-top: -5%"></span>:
        <input type="password" class="form-control" id="PassWord" name="passWord" placeholder="请输入密码">
    </div>

    <div class="form-group">
        <span class="glyphicon glyphicon-lock" aria-hidden="true" style="margin-top: 4%"></span>:
        <input type="password" class="form-control" id="RePassWord" name="RepassWord" placeholder="请再次输入密码">
    </div>

    <button type="submit" class="btn btn-success" id="btm_submit">确 定</button>
    <button type="reset" class="btn btn-info" id="btm_reset">重 置</button>
    <a href="../index.jsp"><button type="button" class="btn btn-primary" id="btm_register">返 回</button></a>

</form>

</body>

<script src="../external/jquery/jquery-3.2.0.js" charset="UTF-8"></script>
<script src="../external/bootstrap-3.3.7-dist/js/bootstrap.min.js" charset="UTF-8"></script>
<script>
    window.onload=function () {
        $("#btm_submit").click(function () {
            if($("#UserName").val()==""||$("#RePassWord").val()==""||$("#PassWord").val()==""){
                alert("没有输入完整");
                return false;
            }
            if($("#RePassWord").val()!=$("#PassWord").val()){
                alert("两次密码输入不同");
                return false;
            }
        })
    }
</script>
</html>
