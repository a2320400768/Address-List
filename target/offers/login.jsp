<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 李茂林
  Date: 2020/12/28
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/logincss.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.js"></script>
</head>
<body>
<%--<jsp:include page="loginbackground.html"/>--%>
<jsp:include page="top.jsp"/>
<%--<jsp:include page="loginjudge.jsp"/>--%>
<div class="main">
        <div class="loginbox">
            <div class="explain">
                Please sign in
            </div>
            <jsp:include page="loginjudge.jsp"/>
            <span class="hint1">请输入用户名</span>
            <span class="hint2">用户名或密码错误</span>
            <div class="logintext">
                <form action="/offers/LoginServlet" method="post" enctype="multipart/form-data">
                    用户名:<input class="loginadmin" type="text" name="username"  autocomplete="off"/>
                    <br>
                    &nbsp&nbsp&nbsp密码:<input class="loginpassword" type="password" name="password"  autocomplete="off">
                    <input class="loginbutton" type="button" value="登录" >
                    <a href="register.jsp"><input  type="button" value="注册" class="registerbutton"></a>
                </form>
            </div>

        </div>

</div>
<script>
    $(function () {
        $('.logintext .loginbutton').click(function () {
            var username=$('.loginadmin').val();
            var password=$('.loginpassword').val();
            var url="/offers/LoginServlet";

            $.ajax({
                async:true,
                cache: true,
                contentType:"multipart/form-data",
                data:{"username":username,"password":password},
                dateType:'json',
                type:'GET',
                url:url,
                error:function (xhr,textstatus,errorThrown) {
                    console.log(textstatus);
                    console.log(errorThrown);
                },
                success:function (data) {
                    if(data==='1'){
                        $('.hint1').css("display","block");
                        $('.hint1').siblings('span').css("display","none");
                    }else if(data==='2'){
                        $('.hint2').css("display","block");
                        $('.hint2').siblings('span').css("display","none");
                        $('.loginpassword').val("");
                    }else if(data==="3"){
                        $('.loginbox span').css("display","none");
                        location.href="MainfaceServlet";
                    }
                }
            })
        })
    })
</script>
</body>
</html>
