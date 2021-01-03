<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 李茂林
  Date: 2021/1/1
  Time: 10:29
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
    judgement=1;
    request.getSession().setAttribute("judgement",judgement);
%>
<%--<c:if  test="${addjudge==2}">
    <script type="text/javascript" language="JavaScript">
        alert("添加失败,电话号码已存在");
    </script>
    <%
        int addjudge=(int)request.getSession().getAttribute("addjudge");
        request.getSession().setAttribute("addjudge",addjudge+10);
    %>
</c:if>--%>

</body>
</html>
