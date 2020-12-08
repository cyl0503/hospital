<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../page-head.jsp"></jsp:include>
<!-- Page Content -->
<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row bg-title">
			<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
				<h4 class="page-title">添加用户</h4> </div>
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
					<h3 class="box-title">添加用户</h3> ${msg}
					<form action="/user/addUser" method="post" class="form-horizontal" role="form">
						<div class="userdiv">
							<label class="userLabel">登陆账号：</label>
							<input type="text" name="userName">
						</div>
						<div class="userdiv">
							<label class="userLabel">用户密码：</label>
							<input type="text" name="password">
						</div>
						<div class="userdiv">
							<label class="userLabel">真实姓名：</label>
							<input type="text" name="realName">
						</div>
						<div class="userdiv">
							<label class="userLabel">用户角色：</label>
							<select name="roleId">
								<option value="-1">--请选择--</option>
								<c:forEach var="role" items="${roleList}">
									<option value="${role.id}">${role.roleName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="userdiv">
							<label class="userLabel">所在科室：</label>
							<select name="deptId">
								<option value="-1">--请选择--</option>
								<c:forEach var="dept" items="${deptList}">
									<option value="${dept.id}">${dept.deptName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="userdiv">
							<label class="userLabel">挂号级别：</label>
							<select name="levelId">
								<option value="-1">--请选择--</option>
								<c:forEach var="regl" items="${regLevList}">
									<option value="${regl.id}">${regl.levelName}</option>
								</c:forEach>
							</select>
						</div>
						<input id="userUpdate" type="submit" value="添加">
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
	.userLabel{
		width:80px;
	}
	.userdiv{
		margin-left: 20px;
		margin-top: 10px;
	}
	#userUpdate{
		margin-top: 20px;
		margin-left: 20px;
	}
</style>