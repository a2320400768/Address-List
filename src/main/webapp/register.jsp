<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 李茂林
  Date: 2020/12/28
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/registercss.css">
    <script src="js/jquery.min.js"></script>
    <style>
        span{
            width: 200px;
            color: red;
            position: absolute;
            margin-top:20px;
            margin-left:180px;
            font: 20px 微软雅黑;
            display: none;
        }
    </style>
</head>
<body>
<%--<jsp:include page="loginbackground.html"/>--%>
<jsp:include page="top.jsp"/>

<div class="main">
    <div class="registerbox">
        <div class="explain">
            Please Register
        </div>
        <span class="hint1">请输入用户名</span>
        <span class="hint2">请输入密码</span>
        <span class="hint3">请再次输入密码</span>
        <span class="hint4">两次输入的密码不一致</span>
        <span class="hint5">用户名已被注册</span>
        <div class="registertext">
            <form action="/offers/RegisterServlet" method="post" enctype="multipart/form-data">
                用户名:<input type="text" class="username" name="username"  autocomplete="off"/>
                <br>
                密码:<input type="password" class="password" name="password"  autocomplete="off">
                <br>
                确认密码:<input type="password" class="password2" name="password2"  autocomplete="off">
                <br>
                <input type="button" value="注册" class="registerbutton">
                <a href="login.jsp"><input type="button" value="返回" class="returnbutton"></a>
            </form>
        </div>
    </div>
</div>
<script>
    $(function () {
        $('.registertext .registerbutton').click(function () {
            var username=$(".username").val();
            var password=$('.password').val();
            var password2=$('.password2').val();
            var url="/offers/RegisterServlet";


            $.ajax({
                async:true,
                cache: true,
                contentType:"multipart/form-data",
                data:{"username":username,"password":password,"password2":password2},
                dateType:'json',
                type:'GET',
                url:url,
                error:function (xhr,textstatus,errorThrown) {
                    console.log(textstatus);
                    console.log(errorThrown);
                },
                success:function (data) {
                    if(data==="1"){
                        $('.main .registerbox .hint1').css("display","block");
                        $('.main .registerbox .hint1').siblings('span').css("display","none");
                        console.log(data);
                    }else if(data==="2"){
                        $('.main .registerbox .hint2').css("display","block");
                        $('.main .registerbox .hint2').siblings('span').css("display","none");
                        console.log(data);
                        $('.username').text(username);
                        $('.password').text(password);
                        $('.password2').text(password2);
                    }
                    else if(data==="3"){
                        $('.main .registerbox .hint3').css("display","block");
                        $('.main .registerbox .hint3').siblings('span').css("display","none");
                        console.log(data);
                        $('.username').text(username);
                        $('.password').text(password);
                        $('.password2').text(password2);
                    }
                    else if(data==="4"){
                        $('.main .registerbox .hint4').css("display","block");
                        $('.main .registerbox .hint4').siblings('span').css("display","none");
                        console.log(data);
                        $('.username').text(username);
                        $('.password').text(password);
                        $('.password2').text(password2);
                    }
                    else if(data==="5"){
                        $('.main .registerbox .hint5').css("display","block");
                        $('.main .registerbox .hint5').siblings('span').css("display","none");
                        console.log(data);
                        $('.username').text(username);
                        $('.password').text(password);
                        $('.password2').text(password2);
                    }else {
                        $('.main .registerbox span').css("display","none");
                        console.log(data)
                        location.href="login.jsp";
                    }
                }

            });
        });
    })
</script>
</body>
</html>
