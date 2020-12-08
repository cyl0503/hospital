<%--
 table界面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../page-head.jsp"></jsp:include>
<script type="text/javascript">
    function tijiao() {
        document.form1.submit();
    }
</script>
<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">用户维护</h4> </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12"> <a href="#" class="btn btn-danger pull-right m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">Upgrade to Pro</a>
                <ol class="breadcrumb">
                    <li><a href="#">控制台</a></li>
                    <li><a href="#">系统管理</a></li>
                    <li class="active">用户维护</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /row -->
        <div class="row">
            <div class="col-sm-12">
                <div class="white-box">
                    <h3 class="box-title">用户列表</h3>
                    <a href="/user/goToAddUser"><div id="userAddBtn"><i class="fa fa-user"></i>&nbsp;&nbsp;新增用户</div></a>
                    <form action="getAllUser" method="post" name="form1">
                    <div id="udiv1">
                        <div>
                            <input type="text" id="userSearchInput" name="realName" value="${realName}">
                        </div>
                        <div>
                            <button id="usersearch" type="submit">搜索</button>
                        </div>
                    </div>
                    <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>userId</th>
                                    <th>userName</th>
                                    <th>password</th>
                                    <th>realName</th>
                                    <th>roleName</th>
                                    <th>deptName</th>
                                    <th>level</th>
                                    <th>option</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${userList}" var="user">
                                <tr>
                                    <td>${user.userId}</td>
                                    <td>${user.userName}</td>
                                    <td>${user.password}</td>
                                    <td>${user.realName}</td>
                                    <td>${user.roleName}</td>
                                    <td>${user.deptName}</td>
                                    <td>${user.levelName}</td>
                                    <td><a href="/user/update_user?id=${user.userId}" target="_self"><i class="fa fa-pencil"></i></a>&nbsp;|&nbsp;<a href="/user/delete_user?id=${user.userId}" onclick="return confirm('确定删除吗？') "><i class="fa fa-trash-o"></i></a></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    <div class="fenye">
                        共 ${page.total } 条数据 ，当前  ${page.pageNum } / ${page.pages } 页

                        <c:choose>
                            <c:when test="${page.hasPreviousPage }">
                                <a href="/user/getAllUser?pageNum=${page.firstPage}" target="_self" >首页</a>
                                <a href="/user/getAllUser?pageNum=${page.prePage}" target="_self">上一页</a>
                            </c:when>
                            <c:otherwise>
                                首页    第一页
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${page.hasNextPage }">
                                <a href="/user/getAllUser?pageNum=${page.nextPage}" target="_self">下一页</a>
                                <a href="/user/getAllUser?pageNum=${page.lastPage}" target="_self">尾页</a>
                            </c:when>
                            <c:otherwise>
                                下一页    尾页
                            </c:otherwise>
                        </c:choose>

                        <select name="pageNum" id="sel" onchange="tijiao()">
                            <c:forEach var="i" begin="1" end="${page.pages }">
                                <option value="${i }"  <c:if test="${i==page.pageNum}">selected="selected"</c:if>   >
                                    第 ${i } 页
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- /.row -->
    </div>
</div>
<!-- /#page-wrapper -->
<jsp:include page="../js-core.jsp"></jsp:include>
<style type="text/css">
    th,tr,td{
        text-align: center;
    }
    #udiv1{
        display: flex;
        margin: 20px;
    }
    #usersearch{
        margin-left: 20px;
    }
    #userAddBtn{
        float: right;
        margin-right: 30px;
        cursor: pointer;
    }
</style>