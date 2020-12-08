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
                <h4 class="page-title">挂号级别管理</h4> </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12"> <a href="#" class="btn btn-danger pull-right m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">Upgrade to Pro</a>
                <ol class="breadcrumb">
                    <li><a href="#">控制台</a></li>
                    <li><a href="#">系统管理</a></li>
                    <li class="active">挂号级别管理</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /row -->
        <div class="row">
            <div class="col-sm-12">
                <div class="white-box">
                    <h3 class="box-title">挂号级别列表</h3>
                    <a href="/registerLevel/goToAddRegLevel"><div id="regLevelAddBtn"><i class="fa fa-user"></i>&nbsp;&nbsp;新增挂号级别</div></a>
                    <form action="getRegisterLevelList" method="post" name="form1">
                        <div id="regLeveldiv1">
                            <div>
                                <input type="text" id="levelName" name="levelName" value="${levelName}">
                            </div>
                            <div>
                                <button id="regLevelsearch" type="submit">查询</button>
                            </div>
                        </div>
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>级别名称</th>
                                <th>挂号费用</th>
                                <th>挂号限额</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${registerLevelList}" var="regLevel">
                                <tr>
                                    <td>${regLevel.id}</td>
                                    <td>${regLevel.levelName}</td>
                                    <td>${regLevel.registrationFee}</td>
                                    <td>${regLevel.levelQuota}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${regLevel.delFlag==1}">
                                                正常
                                            </c:when>
                                            <c:when test="${regLevel.delFlag==0}">
                                                已删除
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td><a href="/registerLevel/updateRegLevel?id=${regLevel.id}" target="_self"><i class="fa fa-pencil"></i></a>&nbsp;|&nbsp;<a href="/registerLevel/delRegLevel?id=${regLevel.id}" onclick="return confirm('确定删除吗？') "><i class="fa fa-trash-o"></i></a></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="fenye">
                            共 ${page.total } 条数据 ，当前  ${page.pageNum } / ${page.pages } 页

                            <c:choose>
                                <c:when test="${page.hasPreviousPage }">
                                    <a href="/registerLevel/getRegisterLevelList?pageNum=${page.firstPage}" target="_self" >首页</a>
                                    <a href="/registerLevel/getRegisterLevelList?pageNum=${page.prePage}" target="_self">上一页</a>
                                </c:when>
                                <c:otherwise>
                                    首页    第一页
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${page.hasNextPage }">
                                    <a href="/registerLevel/getRegisterLevelList?pageNum=${page.nextPage}" target="_self">下一页</a>
                                    <a href="/registerLevel/getRegisterLevelList?pageNum=${page.lastPage}" target="_self">尾页</a>
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
    #regLeveldiv1{
        display: flex;
        margin: 20px;
    }
    #regLevelsearch{
        margin-left: 20px;
    }
    #regLevelAddBtn{
        float: right;
        margin-right: 60px;
        cursor: pointer;
    }
</style>