<%--
  Created by IntelliJ IDEA.
  User: 李茂林
  Date: 2021/1/3
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String name=request.getParameter("name");
    String telephonenumber=request.getParameter("telephonenumber");
    String remark=request.getParameter("remark");
    request.getSession().setAttribute("name",name);
    request.getSession().setAttribute("telephonenumber",telephonenumber);
    request.getSession().setAttribute("remark",remark);

%>
</body>
</html>
