<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>login</title>
    <link rel="stylesheet" type="text/css" href="external/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/login.css">
  </head>
<%
  if(session.getAttribute("result")!=null) {
    if (session.getAttribute("result").equals("false")) {
      out.print("<script type='text/javascript'>alert('登录失败');</script>");
    }
    session.setAttribute("result","true");
  }
  if(session.getAttribute("register")!=null){
    if (session.getAttribute("register").equals("false")) {
      out.print("<script type='text/javascript'>alert('用户名已被注册，注册失败');</script>");
    }
    if (session.getAttribute("register").equals("true")) {
      out.print("<script type='text/javascript'>alert('注册成功');</script>");
    }
    session.setAttribute("register","1");
  }
%>
  <body>

    <h1 class="text-center">水果商店系统</h1>

    <form class="login_form text-center" action="jsp/login_deal.jsp">

      <h2 style="border-bottom: 1px blue solid;padding-bottom:10px;width: 80%;margin-left: 10%">登 录</h2>
      <br/><br/>

      <div class="text-center radio">
        <input type="radio"  name="is_Administrator"  value="1" checked="checked"/>用 户
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <input type="radio"  name="is_Administrator"  value="2" />管理员
      </div>

      <div class="form-group">
        <span class="glyphicon glyphicon-user" aria-hidden="true"></span>:
        <input type="text" class="form-control" value="" id="UserName" name="userName" placeholder="请输入用户名" autofocus="autofocus">
      </div>


      <br/><br/>
      <div class="form-group">
        <span class="glyphicon glyphicon-lock" aria-hidden="true" style="margin-top: -5%"></span>:
        <input type="password" class="form-control" value="" id="PassWord" name="passWord" placeholder="请输入密码">
      </div>

      <button type="submit" class="btn btn-success" id="btm_submit">登 录</button>
      <button type="reset" class="btn btn-info" id="btm_reset">重 置</button>
      <a href="jsp/register.jsp"><button type="button" class="btn btn-primary" id="btm_register">注册</button></a>
    </form>

  </body>

  <script src="external/jquery/jquery-3.2.0.js" charset="UTF-8"></script>
  <script src="external/bootstrap-3.3.7-dist/js/bootstrap.min.js" charset="UTF-8"></script>

</html>
