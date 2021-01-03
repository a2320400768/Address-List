<%--
  Created by IntelliJ IDEA.
  User: 李茂林
  Date: 2020/12/29
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>添加联系人</title>
    <link rel="stylesheet" href="./css/addlinkmancss.css">
</head>
<body>
<jsp:include page="userimages.html"/>
    <div class="main">
        <div class="explain">
            <div class="explainChinese">
                添加一名联系人
            </div>
            <div class="explainEnglish">
                Please add a contact
            </div>

        </div>
        <jsp:include page="ampublicpage.jsp"/>
        <jsp:include page="addlinkmanjudge.jsp"/>
        <%--<div class="content">
            <table border="1" cellspacing="0" align="center" cellpadding="0">
                <tr>
                    <td>姓名</td>
                    <td>
                        <input type="text">
                    </td>
                </tr>
                <tr>
                    <td>性别</td>
                    <td>
                        <input type="text">
                    </td>
                </tr>
                <tr>
                    <td>电话号码</td>
                    <td>
                        <input type="text">
                    </td>
                </tr>
            </table>
            <form action="" class="changebutton">
                <input type="button" value="保存">
                <input type="button" value="取消">
            </form>
        </div>--%>
    </div>
</body>
</html>
