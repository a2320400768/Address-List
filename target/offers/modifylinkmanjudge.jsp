<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 李茂林
  Date: 2021/1/1
  Time: 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    int judgement;
    judgement=2;
    request.getSession().setAttribute("judgement",judgement);
    request.getSession().setAttribute("telephonenumber",request.getParameter("telephonenumber"));
%>
<%--<c:if  test="${updatejudge==2}">
    <script type="text/javascript" language="JavaScript">
        alert("修改失败");
    </script>
    <%
        int updatejudge=(int)request.getSession().getAttribute("updatejudge");
        request.getSession().setAttribute("judgement",updatejudge+10);
    %>
</c:if>--%>
</body>
</html>
