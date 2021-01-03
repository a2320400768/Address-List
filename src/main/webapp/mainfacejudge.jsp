<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 李茂林
  Date: 2021/1/1
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--<c:if  test="${judge==7}">
    <script type="text/javascript" language="JavaScript">
        alert("登录成功");
    </script>
    <%
        int judge=(int)request.getSession().getAttribute("judge");
        request.getSession().setAttribute("judge",judge+10);
    %>
</c:if>--%>
<c:if  test="${addjudge==1}">
    <%--<script type="text/javascript" language="JavaScript">
        alert("添加成功");
    </script>--%>
    <%
        int addjudge=(int)request.getSession().getAttribute("addjudge");
        request.getSession().setAttribute("addjudge",addjudge+10);
    %>
</c:if>
<c:if  test="${updatejudge==1}">
    <%--<script type="text/javascript" language="JavaScript">
        alert("修改成功");
    </script>--%>
    <%
        int updatejudge=(int)request.getSession().getAttribute("updatejudge");
        request.getSession().setAttribute("updatejudge",updatejudge+10);
    %>
</c:if>
</body>
</html>
