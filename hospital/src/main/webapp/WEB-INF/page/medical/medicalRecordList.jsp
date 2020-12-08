<%--
 table界面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../page-head.jsp"></jsp:include>
<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">病例</h4> </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12"> <a href="#" class="btn btn-danger pull-right m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">Upgrade to Pro</a>
                <ol class="breadcrumb">
                    <li><a href="#">控制台</a></li>
                    <li><a href="#">医生工作站管理</a></li>
                    <li class="active">病例</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /row -->
        <div class="row">
            <div class="col-sm-12">
                <div class="white-box">
                    <h3 class="box-title">查询病例信息</h3>
                    <div id="mdiv1">
                        <div>
                            病历编号：<input type="text" id="scaseNumber" name="scaseNumber">
                        </div>
                        <div id="mdiv1-2">
                            <button id="msearch">查询</button>
                        </div>
                    </div>
                    <div id="mdiv2">
                        <div id="div_title1">
                            <h3 class="box-title">待诊患者</h3>
                        </div>
                        <table id="mt1" class="table table-hover">
                            <thead>
                            <tr>
                                <th>number</th>
                                <th>name</th>
                                <th>sex</th>
                                <th>age</th>
                                <th>doctor</th>
                                <th>dept</th>
                                <th>level</th>
                                <th>time</th>
                                <th>statue</th>
                                <th>option</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="register" items="${registerNotList}">
                                <tr>
                                    <td>${register.caseNumber}</td>
                                    <td>${register.realName}</td>
                                    <td>${register.sex}</td>
                                    <td>${register.age}</td>
                                    <td>${register.user.realName}</td>
                                    <td>${register.dept.deptName}</td>
                                    <td>${register.regLve.levelName}</td>
                                    <td>
                                        <fmt:formatDate value="${register.createTime}" pattern="yyyy-MM-dd"></fmt:formatDate>
                                    </td>
                                    <td><c:if test="${register.status==1}">已挂号</c:if></td>
                                    <td><a href="/medical/updateRegisterStatusToMedicalRecord?flag=1&caseNumber=${register.caseNumber}" target="_self">看诊</a></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div id="mdiv3">
                        <div id="div_title2">
                            <h3 class="box-title">已诊患者</h3>
                        </div>
                        <table id="mt2" class="table table-hover">
                            <thead>
                            <tr>
                                <th>number</th>
                                <th>name</th>
                                <th>sex</th>
                                <th>age</th>
                                <th>doctor</th>
                                <th>dept</th>
                                <th>level</th>
                                <th>time</th>
                                <th>statue</th>
                                <th>option</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="register" items="${registerHaveList}">
                                <tr>
                                    <td>${register.caseNumber}</td>
                                    <td>${register.realName}</td>
                                    <td>${register.sex}</td>
                                    <td>${register.age}</td>
                                    <td>${register.user.realName}</td>
                                    <td>${register.dept.deptName}</td>
                                    <td>${register.regLve.levelName}</td>
                                    <td>
                                        <fmt:formatDate value="${register.createTime}" pattern="yyyy-MM-dd"></fmt:formatDate>
                                    </td>
                                    <td>
                                        <c:if test="${register.status==2}">医生接诊</c:if>
                                        <c:if test="${register.status==3}">看诊结束</c:if>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${register.status==3}">
                                                看诊
                                            </c:when>
                                            <c:otherwise>
                                                <a href="/medical/updateRegisterStatusToMedicalRecord?flag=2&caseNumber=${register.caseNumber}" target="_self">看诊</a>
                                            </c:otherwise>
                                        </c:choose>
                                        </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
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
    body{
        margin: 0;
        padding: 0;
    }
    #mdiv1{
        width: 100%;
        height: 25px;
        margin-left: 20px;
        line-height: 25px;
        display: flex;
        margin-bottom: 20px;
    }
    #mdiv1-2{
        margin-left: 20px;
    }
 

</style>
