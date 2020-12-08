<%--
  Created by IntelliJ IDEA.
  User: 程艳玲
  Date: 2020/4/20
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/materialize.min.css">
    <link rel="stylesheet" href="../../css/tooplate.css">
    <style>
        .col-xl-6 col-lg-6 col-md-6 col-sm-12 ml-auto mr-0 text-center{
            margin-bottom: 10px;
        }
    </style>
</head>
<body id="login">
<div class="container">
    <div class="row tm-register-row tm-mb-35">
        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 tm-login-l">
            <form action="login" method="post" class="tm-bg-black p-5 h-100">
                <div class="input-field">
                    <input placeholder="Username" id="username" name="userName" type="text" class="validate" value="${userName}">
                </div>
                <div class="input-field mb-5">
                    <input placeholder="Password" id="password" name="password" type="password" class="validate" value="${password}">
                </div>
                <div>${msg}</div>
                <div class="tm-flex-lr">
                    <a href="#" class="white-text small">Forgot Password?</a>
                    <button type="submit" class="waves-effect btn-large btn-large-white px-4 black-text rounded-0">Login</button>
                </div>
            </form>
        </div>
        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 tm-login-r">
            <header class="font-weight-light tm-bg-black p-5 h-100">
                <h3 class="mt-0 text-white font-weight-light">云医院信息系统</h3>
                <p>向善观</p>
                <p>大爱观</p>
                <p>世界观</p>
                <%--<p class="mb-0">Vestibulum neque neque, porttitor quis lacinia eu, iaculis id dui. Mauris quis velit lectus.</p>--%>
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 ml-auto mr-0 text-center">
                    <a href="../../register.html" class="waves-effect btn-large btn-large-white px-4 black-text rounded-0">Create New Account</a>
                </div>
        
            </header>
        </div>
    </div>

</div>

<script src="js/jquery-3.2.1.slim.min.js"></script>
<script src="js/materialize.min.js"></script>
<script>
    $(document).ready(function () {
        $('select').formSelect();
    });
</script>
</body>
</html>
