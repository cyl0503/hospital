<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../page-head.jsp"></jsp:include>
<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Basic Table</h4> </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12"> <a href="#" class="btn btn-danger pull-right m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">Upgrade to Pro</a>
                <ol class="breadcrumb">
                    <li><a href="#">控制台</a></li>
                    <li><a href="#">用户管理</a></li>
                    <li class="active">用户列表</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /row -->
        <div class="row">
            <div class="col-sm-12">
                <div class="white-box">
                    <h3 class="box-title">修改</h3>
                    <form action="/constant/update_constant" method="post" class="form-horizontal" role="form">
                        ID：<input type="text" name="id" value="${constantItem.id}" readonly="readonly"><br>
                        常数项类型：<input type="text" name="constantid" value="${constantItem.constantid}"><br>
                        常数项名称：<input type="text" name="constantitemname" value="${constantItem.constantitemname}"><br>
                        标志：<input type="text" name="delflag" value="${constantItem.delflag}"><br>
                        <input type="submit" value="修改">
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

