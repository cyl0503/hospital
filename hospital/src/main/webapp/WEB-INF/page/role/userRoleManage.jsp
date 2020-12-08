<%--
 table界面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                <h4 class="page-title">用户角色管理</h4> </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12"> <a href="#" class="btn btn-danger pull-right m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">Upgrade to Pro</a>
                <ol class="breadcrumb">
                    <li><a href="#">控制台</a></li>
                    <li><a href="#">系统管理</a></li>
                    <li class="active">用户角色管理</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /row -->
        <div class="row">
            <div class="col-sm-12">
                <div class="white-box">
                    <h3 class="box-title">用户角色分配</h3>
                    <form action="/role/updateUserRole" method="post" name="form1">
                        用户id:<input type="text" name="userId" value="${user.userId}"> <br>
                        <table class="table table-hover">
                            <tr>
                                <td>用户账户:</td>
                                <td><input type="text" value="${user.userName}"></td>
                            </tr>
                            <tr>
                                <td>用户角色:</td>
                                <td>
                                    <c:forEach var="role" items="${roleList}">
                                        <input type="radio" value="${role.id}" name="roleId" <c:if test="${role.id == user.roleId}">checked="checked"</c:if> >${role.roleName}<br>
                                    </c:forEach>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input type="submit" value="提交">${msg}
                                </td>
                            </tr>
                        </table>
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
    #rolediv1{
        display: flex;
        margin: 20px;
    }
    #rolesearch{
        margin-left: 20px;
    }
</style>