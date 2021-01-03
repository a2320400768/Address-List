<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 李茂林
  Date: 2020/12/29
  Time: 8:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>通讯录界面</title>
    <link rel="stylesheet" href="./css/mainfacecss.css">
    <script src="js/jquery.min.js"></script>
</head>
<body>
<jsp:include page="userimages.html"/>
<div class="main">
    <div class="logout">
        <a href="login.jsp"><input type="button" value="注销"></a>
    </div>
    <div class="explain">
        Welcome to the Address Book
    </div>
    <div class="content">
        <div class="select">
            <form action="/offers/SelectServlet" class="selectcontent">
                <select name="selectlinkman" class="selectlinkman">
                    <option value="name">姓名</option>
                    <option value="telephonenumber">电话号码</option>
                    <option value="remark">备注</option>
                </select>
                    <input type="text" name="selectdate"  autocomplete="off"/>
                    <input type="submit" value="查询" class="selectbutton">
            </form>
        </div>

        <div class="linkman">
            <table border="1" cellspacing="0" align="center">
                <tr>
                    <th>序号</th>
                    <th>姓名</th>
                    <th>电话号码</th>
                    <th>备注</th>
                    <th>
                        <form action="/offers/addlinkman.jsp">
                            <input type="submit" value="添加">
                        </form>
                    </th>
                </tr>
                <c:choose>
                    <c:when test="${linkMan.size()>0}">
                        <c:if test="${pagenum==0}">
                            <%--${pagenum=pagenum+1}--%>
                            <%
                                Integer pagenum=(int)session.getAttribute("pagenum");
                                session.setAttribute("pagenum",pagenum+1);
                            %>
                        </c:if>
                        <c:if test="${pagenum!=1}">
                            <c:if test="${(linkMan.size()%5>0&&pagenum==(Integer.valueOf(Math.floor(linkMan.size()/5))+2))||(linkMan.size()%5==0&&pagenum==(Integer.valueOf(Math.floor(linkMan.size()/5))+1))}">
                                <%--${pagenum=pagenum-1}--%>
                                <%
                                    Integer pagenum=(int)session.getAttribute("pagenum");
                                    session.setAttribute("pagenum",pagenum-1);
                                %>
                            </c:if>
                        </c:if>
                        <c:forEach items="${linkMan}" var="item" varStatus="status">
                            <c:choose>
                                <c:when test="${(pagenum-1)*5<linkMan.size()&&pagenum==status.index+1}">
                                    <c:choose>
                                        <c:when test="${(pagenum-1)*5<linkMan.size()}">
                                            <tr>
                                                <td><c:out value="${(pagenum-1)*5+1}"/></td>
                                                <td><c:out value="${linkMan[(pagenum-1)*5].name}"/></td>
                                                <td><c:out value="${linkMan[(pagenum-1)*5].telephonenumber}"/></td>
                                                <td><c:out value="${linkMan[(pagenum-1)*5].remark}"/></td>
                                                <td>
                                                    <form action="">
                                                        <input type="button" value="编辑" onclick="javascrtpt:window.location.href='modifylinkman.jsp?name=${linkMan[(pagenum-1)*5].name}&telephonenumber=${linkMan[(pagenum-1)*5].telephonenumber}&remark=${linkMan[(pagenum-1)*5].remark}'">
                                                        <input type="button" value="删除" onclick="javascrtpt:window.location.href='DeleteServlet?telephonenumber=${linkMan[(pagenum-1)*5].telephonenumber}'">
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${(pagenum-1)*5+1<linkMan.size()}">
                                            <tr>
                                                <td><c:out value="${(pagenum-1)*5+2}"/></td>
                                                <td><c:out value="${linkMan[(pagenum-1)*5+1].name}"/></td>
                                                <td><c:out value="${linkMan[(pagenum-1)*5+1].telephonenumber}"/></td>
                                                <td><c:out value="${linkMan[(pagenum-1)*5+1].remark}"/></td>
                                                <td>
                                                    <form action="">
                                                        <input type="button" value="编辑" onclick="javascrtpt:window.location.href='modifylinkman.jsp?name=${linkMan[(pagenum-1)*5+1].name}&telephonenumber=${linkMan[(pagenum-1)*5+1].telephonenumber}&remark=${linkMan[(pagenum-1)*5+1].remark}'">
                                                        <input type="button" value="删除" onclick="javascrtpt:window.location.href='DeleteServlet?telephonenumber=${linkMan[(pagenum-1)*5+1].telephonenumber}'">
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${(status.index)*5+2<linkMan.size()}">
                                            <tr>
                                                <td><c:out value="${(pagenum-1)*5+3}"/></td>
                                                <td><c:out value="${linkMan[(pagenum-1)*5+2].name}"/></td>
                                                <td><c:out value="${linkMan[(pagenum-1)*5+2].telephonenumber}"/></td>
                                                <td><c:out value="${linkMan[(pagenum-1)*5+2].remark}"/></td>
                                                <td>
                                                    <form action="">
                                                        <input type="button" value="编辑" onclick="javascrtpt:window.location.href='modifylinkman.jsp?name=${linkMan[(pagenum-1)*5+2].name}&telephonenumber=${linkMan[(pagenum-1)*5+2].telephonenumber}&remark=${linkMan[(pagenum-1)*5+2].remark}'">
                                                        <input type="button" value="删除" onclick="javascrtpt:window.location.href='DeleteServlet?telephonenumber=${linkMan[(pagenum-1)*5+2].telephonenumber}'">
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${(pagenum-1)*5+3<linkMan.size()}">
                                            <tr>
                                                <td><c:out value="${(pagenum-1)*5+4}"/></td>
                                                <td><c:out value="${linkMan[(pagenum-1)*5+3].name}"/></td>
                                                <td><c:out value="${linkMan[(pagenum-1)*5+3].telephonenumber}"/></td>
                                                <td><c:out value="${linkMan[(pagenum-1)*5+3].remark}"/></td>
                                                <td>
                                                    <form action="">
                                                        <input type="button" value="编辑" onclick="javascrtpt:window.location.href='modifylinkman.jsp?name=${linkMan[(pagenum-1)*5+3].name}&telephonenumber=${linkMan[(pagenum-1)*5+3].telephonenumber}&remark=${linkMan[(pagenum-1)*5+3].remark}'">
                                                        <input type="button" value="删除" onclick="javascrtpt:window.location.href='DeleteServlet?telephonenumber=${linkMan[(pagenum-1)*5+3].telephonenumber}'">
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${(pagenum-1)*5+4<linkMan.size()}">
                                            <tr>
                                                <td><c:out value="${(pagenum-1)*5+5}"/></td>
                                                <td><c:out value="${linkMan[(pagenum-1)*5+4].name}"/></td>
                                                <td><c:out value="${linkMan[(pagenum-1)*5+4].telephonenumber}"/></td>
                                                <td><c:out value="${linkMan[(pagenum-1)*5+4].remark}"/></td>
                                                <td>
                                                    <form action="">
                                                        <input type="button" value="编辑" onclick="javascrtpt:window.location.href='modifylinkman.jsp?name=${linkMan[(pagenum-1)*5+4].name}&telephonenumber=${linkMan[(pagenum-1)*5+4].telephonenumber}&remark=${linkMan[(pagenum-1)*5+4].remark}'">
                                                        <input type="button" value="删除" onclick="javascrtpt:window.location.href='DeleteServlet?telephonenumber=${linkMan[(pagenum-1)*5+4].telephonenumber}'">
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                            </c:choose>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </table>
            <form action="" class="changepage">
                <a href="ChangeServlet?pagenum=${pagenum-1}">
                    <input type="button" value="上一页">
                </a>
                <a href="ChangeServlet?pagenum=${pagenum+1}">
                    <input type="button" value="下一页">
                </a>
            </form>
        </div>

    </div>
</div>
<%--<jsp:include page="mainfacejudge.jsp"/>--%>
</body>
<script>
    window.onload=function () {
        console.log(${addjudge});
        if(${addjudge==1}){
            alert("添加成功");
            ${addjudge=addjudge+10}
        }else if(${updatejudge==1}){
            alert("修改成功");
            ${updatejudge=updatejudge+10}
        }
    }
</script>
</html>
