<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 李茂林
  Date: 2021/1/1
  Time: 10:15
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
            margin-top:15px;
            margin-left:130px;
            font:20px "微软雅黑";
            display: none;
        }
    </style>
</head>
<body>
<c:if  test="${judge==4}">
    <script type="text/javascript" language="JavaScript">
        alert("注册成功");
    </script>
    <%
        int judge=(int)request.getSession().getAttribute("judge");
        request.getSession().setAttribute("judge",judge+10);
    %>
</c:if>
<%--<c:if  test="${judge==5}">
    <span>请输入用户名</span>
    <%
        int judge=(int)request.getSession().getAttribute("judge");
        request.getSession().setAttribute("judge",judge+10);
    %>
</c:if>
<c:if  test="${judge==6}">
    <span>用户名或密码错误</span>
    <%
        int judge=(int)request.getSession().getAttribute("judge");
        request.getSession().setAttribute("judge",judge+10);
    %>
</c:if>--%>
</body>
</html>
