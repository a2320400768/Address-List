<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 李茂林
  Date: 2021/1/1
  Time: 9:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        span{
            width: 200px;
            color: red;
            position: absolute;
            margin-top:20px;
            margin-left:180px;
            font: 20px 微软雅黑;
        }
    </style>
</head>
<body>
<c:if test="${judge==1}">
    <span>用户名不能为空</span>
    <%
        int judge=(int)request.getSession().getAttribute("judge");
        request.getSession().setAttribute("judge",judge+10);
    %>
</c:if>
<c:if test="${judge==2}">
    <span>两次输入的密码不一致</span>
    <%
        int judge=(int)request.getSession().getAttribute("judge");
        request.getSession().setAttribute("judge",judge+10);
    %>
</c:if>
<c:if test="${judge==3}">
    <span>用户名已被注册</span>
    <%
        int judge=(int)request.getSession().getAttribute("judge");
        request.getSession().setAttribute("judge",judge+10);
    %>
</c:if>
</body>
</html>
