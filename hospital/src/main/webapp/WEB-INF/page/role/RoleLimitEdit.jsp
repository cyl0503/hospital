<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../page-head.jsp"></jsp:include>
<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">角色权限分配</h4> </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12"> <a href="#" class="btn btn-danger pull-right m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">Upgrade to Pro</a>
                <ol class="breadcrumb">
                    <li><a href="#">控制台</a></li>
                    <li><a href="#">系统管理</a></li>
                    <li class="active">角色管理</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /row -->
        <div class="row">
            <div class="col-sm-12">
                <div class="white-box">
                    <h3 class="box-title">角色权限分配</h3>
                    <div>
                        菜单字串:<input class="menuids" type="text" value="${menuIdStr}"><br>
                        角色ID:<input class="menuids" type="text" value="${roleId}">
                    </div>
                    <form action="/role/roleMenuUpdate" method="post" class="form-horizontal" role="form">
                        <div class="rolediv">
                            <label class="roleLabel">角色ID：</label>
                            <input type="text" name="roleId" value="${roleId}" readonly="readonly">
                        </div>
                        <table class="table table-hover">
                            <tr>
                                <th>一级菜单</th>
                                <th>二级菜单</th>
                            </tr>
                            <c:forEach var="menu" items="${menuList}">
                                <tr>
                                    <td>
                                        <input type="checkbox" value="${menu.id}" name="ids">&nbsp;${menu.menuName}(菜单id:_${menu.id})
                                    </td>
                                    <td>
                                        <c:forEach var="sub_menu" items="${menu.subList}">
                                            <input type="checkbox" value="${sub_menu.id}" name="ids">&nbsp;${sub_menu.menuName}(菜单id:_${sub_menu.id})<br>
                                        </c:forEach>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                        <input id="roleUpdate" type="submit" value="更新" onclick="return confirm('确定提交吗？')">${msg}
                    </form>
                </div>
            </div>
        </div>
        <!-- /.row -->
    </div>
</div>
<!-- /#page-wrapper -->
<!-- /#page-wrapper -->
<jsp:include page="../js-core.jsp"></jsp:include>
<style type="text/css">
    th{
        text-align: center;
    }
    .roleLabel{
        width:60px;
    }
    .rolediv{
        margin-top: 10px;
    }
    #roleUpdate{
        margin-top: 20px;
        margin-left: 20px;
    }
    .menuids{
        width: 400px;
        margin: 5px;
    }
</style>
<script type="text/javascript">
    $(function () {
        var menuIdStr = "${menuIdStr}";
        var meunIdList = menuIdStr.split(",");

        Array.prototype.contains = function (e) {
            for (var i = 0 ;i<this.length;i++){
                if(e == this[i]){
                    return true;
                }
            }
            return false;
        }
        $("input[type=checkbox]").each(function () {
            if(meunIdList.contains(this.value)){
                this.checked = true;
            }
        });
    });
</script>