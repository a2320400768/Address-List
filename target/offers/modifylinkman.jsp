<%--
  Created by IntelliJ IDEA.
  User: 李茂林
  Date: 2020/12/29
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改联系人</title>
    <link rel="stylesheet" href="./css/modifylinkmancss.css">
</head>
<body>
<jsp:include page="userimages.html"/>
    <div class="main">
        <div class="explain">
            <div class="explainChinese">
                修改联系人信息
            </div>
            <div class="explainEnglish">
                Modify contact information
            </div>
        </div>
        <jsp:include page="ampublicpage.jsp"/>
        <jsp:include page="modifylinkmanjudge.jsp"/>
    </div>
</body>
</html>
