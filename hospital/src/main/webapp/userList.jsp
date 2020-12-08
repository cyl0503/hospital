<%--
  Created by IntelliJ IDEA.
  User: 程艳玲
  Date: 2020/4/19
  Time: 12:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"  %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="searchAll" method="post">
    <table width="80%" border=1>
        <tr>
            <td><input type="checkbox">全选</td>
            <td>userId</td>
            <td>登录账号</td>
            <td>密码</td>
            <td>真实姓名</td>
            <td>角色</td>
            <td>科室</td>
            <td>挂号级别</td>
            <td>操作</td>
        </tr>
        <c:forEach var="user" items="${userList}">
            <tr>
                <td><input type="checkbox" name="ids" value="${user.userId}"></td>
                <td>${user.userId}</td>
                <td>${user.userName}</td>
                <td>${user.password}</td>
                <td>${user.realName}</td>
                <td>${user.roleName}</td>
                <td>${user.deptName}</td>
                <td>${user.levelName}</td>
                <td><a href="update_user?id=${user.userId }">修改</a>|<a href="delete_user?id=${user.userId}" onclick="return confirm('确定删除吗？') ">删除</a></td>
            </tr>
        </c:forEach>
    </table>
    共 ${page.total } 条数据 ，当前  ${page.pageNum } / ${page.pages } 页

    <c:choose>
        <c:when test="${page.hasPreviousPage }">
            <a href="getalluserpagehelper?pageNum=${page.firstPage}" >首页</a>
            <a href="getalluserpagehelper?pageNum=${page.prePage}" >上一页</a>
        </c:when>
        <c:otherwise>
            首页    第一页
        </c:otherwise>
    </c:choose>

    <c:choose>
        <c:when test="${page.hasNextPage }">
            <a href="getalluserpagehelper?pageNum=${page.nextPage}" >下一页</a>
            <a href="getalluserpagehelper?pageNum=${page.lastPage}" >尾页</a>
        </c:when>
        <c:otherwise>
            下一页    尾页
        </c:otherwise>
    </c:choose>

    <select name="pageNum" id="sel" onchange="tijiao()">
        <c:forEach var="i" begin="1" end="${page.pages }">

            <option value="${i }"  <c:if test="${i==page.pageNum }">selected="selected"</c:if>
                第${i }页
            </option>

        </c:forEach>
    </select>
</form>
</body>
</html>
