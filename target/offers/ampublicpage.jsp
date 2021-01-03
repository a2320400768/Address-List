<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: 李茂林
  Date: 2020/12/29
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="./css/ampubliccss.css">
    <script src="js/jquery.min.js"></script>
</head>
<body>
<jsp:include page="userimages.html"/>
<%--<span class="hint1">添加失败,电话号码已存在</span>
<span class="hint3">请再次输入密码</span>
<span class="hint4">两次输入的密码不一致</span>
<span class="hint5">用户名已被注册</span>--%>
<jsp:include page="modifylinkmandata.jsp"/>
<div class="content">
    <form action="/offers/AddUpdateServlet" class="changebutton">
    <table border="1" cellspacing="0" align="center" cellpadding="0">
        <tr>
            <td>姓名</td>
            <td>
                <input type="text" name="name"  autocomplete="off" class="name" value="${name}">
            </td>
        </tr>
        <tr>
            <td>电话号码</td>
            <td>
                <input type="text" name="telephonenumber"  autocomplete="off" class="telephonenumber" value="${telephonenumber}">
            </td>
        </tr>
        <tr>
            <td>备注</td>
            <td>
                <input type="text" name="remark"  autocomplete="off" class="remark" value="${remark}">
            </td>
        </tr>
    </table>

        <input type="button" value="保存" class="firstbutton">
        <input type="button" value="取消" class="lastbutton" onclick="javascrtpt:window.location.href='MainfaceServlet'">
    </form>
</div>
<script>
    $(function () {
        $('.firstbutton').click(function () {
            var name=$('.name').val();
            var telephonenumber=$(".telephonenumber").val();
            var remark=$(".remark").val();
            var url="/offers/AddUpdateServlet";

            $.ajax({
                async:true,
                cache: true,
                contentType:"multipart/form-data",
                data:{"name":name,"telephonenumber":telephonenumber,"remark":remark},
                dateType:'json',
                type:'GET',
                url:url,
                error:function (xhr,textstatus,errorThrown) {
                    console.log(textstatus);
                    console.log(errorThrown);
                },
                success:function (data) {
                    if(data==="1"){
                        alert("修改失败，电话号码已存在");
                    }else if(data==="3"){
                        alert("添加失败，电话号码已存在");
                    }
                    else{
                        location.href="MainfaceServlet";
                    }
                }
            })
        })
    })
</script>
</body>
</html>
