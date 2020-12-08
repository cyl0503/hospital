<%--
 table界面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../page-head.jsp"></jsp:include>
<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">门诊退号管理</h4> </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12"> <a href="#" class="btn btn-danger pull-right m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">Upgrade to Pro</a>
                <ol class="breadcrumb">
                    <li><a href="#">控制台</a></li>
                    <li><a href="#">挂号收费</a></li>
                    <li class="active">门诊退号管理</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /row -->
        <div class="row">
            <div class="col-sm-12">
                    <div class="white-box">
                        <h3 class="box-title">退号信息</h3>
                        <div id="div1">
                            <div id="div-1">
                                <div id="div1-1">
                                    <div>
                                        病历编号：<input type="text" id="scaseNumber" name="scaseNumber">
                                    </div>
                                    <div>
                                        <button id="search">搜索</button>
                                    </div>
                                </div>
                            </div>
                            <div id="div2-1">
                                <div>
                                    病历编号：<input type="text" id="caseNumber" name="caseNumber">
                                </div>
                                <div>
                                    患者姓名：<input type="text" id="realName" name="realName">
                                </div>
                                <div>
                                    患者性别：<input type="text" id="sex" name="sex">
                                </div>
                                <div>
                                    身份证号：<input type="text" id="idCard" name="idCard">
                                </div>
                                <div id="d1-3-3">
                                    家庭住址：<input type="text" id="address" name="address">
                                </div>
                            </div>
                            <div id="div2-2">
                                <div>
                                    挂号级别：<input type="text" id="levelId" name="levelId">
                                </div>
                                <div>
                                    挂诊科室：<input type="text" id="deptId" name="deptId">
                                </div>
                                <div>
                                    看诊医生：<input type="text" id="doctorId" name="doctorId">
                                </div>
                                <div id="d1-3-4">
                                    挂号日期：<input type="date" id="createTime" name="createTime">
                                </div>
                                <div>
                                    患者状态：<input type="text" id="status" name="status">
                                </div>
                            </div>
                            <div>
                                <div id="div2-2-4">
                                    <button id="btn-refund" type="submit">退&nbsp;&nbsp;号</button>
                                </div>
                            </div>
                        </div>
                        <div id="div3">
                            <h3 class="box-title">用户列表</h3>
                            <div id="div3-1">
                                <i class="fa fa-spin fa-refresh"></i>
                                <label id="lb_refresh">refresh</label>
                            </div>
                        </div>
                        <div id="div4">
                            <table id="registerTable" class="table table-hover">
                                <thead>
                                <tr>
                                    <th>number</th>
                                    <th>name</th>
                                    <th>sex</th>
                                    <th>idCard</th>
                                    <th>birthday</th>
                                    <th>dept</th>
                                    <th>level</th>
                                    <th>doctor</th>
                                    <th>isBook</th>
                                    <th>createTime</th>
                                    <th>cost</th>
                                    <th>statue</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <div>
                            <button id="btn-pre">上一页</button>
                            <button id="btn-next">下一页</button>
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
    #div1-1,#div2-1,#div2-2,#div3{
        display: flex;
    }
    #div2-1 div,#div2-2 div{
        flex: 1;
    }
    #div2-1 input,#div2-2 input,#div-1 input,#div2-2-4 button{
        width: 98px;
    }
    #div2-1 div,#div2-2 div,#div1-1 div{
        margin: 8px;
    }
    #div3{
        width: 100%;
        height: 30px;
        margin-top: 25px;
        line-height: 30px;
        position: relative;
    }
    #div3-1{
        position: absolute;
        top: 0;
        right: 35px;
    }
    #div4{
        padding-left: 20px;
    }
    #btn-refund{
        width: 120px;
        height: 25px;
    }
    #div2-2-4{
        float: right;
        margin-right: 10px;
        margin-bottom: 20px;
    }

</style>
<script type="text/javascript">
    $(function () {
        $("#search").click(function () {
            $.ajax({
                url:"/register/searchByCaseNumber",
                type:"post",
                data:{scaseNumber:$("#scaseNumber").val()},
                dataType:"json",
                success:function (register) {
                    var createTime1 = register.createTime.substring(0,10);
                    var state ="";
                    if(register.status==1){
                        state="已挂号";
                    }else if(register.status==2){
                        state="医生接诊";
                    }else if(register.status==3){
                        state="看诊结束";
                    }else if(register.status==4){
                        state="已退号";
                    }
                     $("#caseNumber").val(register.caseNumber);
                     $("#realName").val(register.realName);
                     $("#sex").val(register.sex);
                     $("#idCard").val(register.idCard);
                     $("#address").val(register.address);
                     $("#createTime").val(createTime1);
                     $("#deptId").val(register.deptId);
                     $("#levelId").val(register.levelId);
                     $("#doctorId").val(register.doctorId);
                     $("#status").val(state);
                }
            })
        })

        //退号
        $("#btn-refund").click(function () {
            if(confirm("确定退号吗？")==true){
                $.ajax({
                    url:"/register/refund",
                    type:"post",
                    data:{caseNumber:$("#caseNumber").val()},
                    dataType:"json",
                    success:function (register) {
                                var createTime1 = register.createTime.substring(0,10);
                                var state ="";
                                if(register.status==1){
                                    state="已挂号";
                                }else if(register.status==2){
                                    state="医生接诊";
                                }else if(register.status==3){
                                    state="看诊结束";
                                }else if(register.status==4){
                                    state="已退号";
                                }
                                $("#caseNumber").val(register.caseNumber);
                                $("#realName").val(register.realName);
                                $("#sex").val(register.sex);
                                $("#idCard").val(register.idCard);
                                $("#address").val(register.address);
                                $("#createTime").val(createTime1);
                                $("#deptId").val(register.deptId);
                                $("#levelId").val(register.levelId);
                                $("#doctorId").val(register.doctorId);
                                $("#status").val(state);
                                alert("退号成功");
                    }
                })
            }else {
                return false;
            }
        })

        var pageNum = 1;
        function getRegisterData() {
            $.ajax({
                url:"/register/getRegisterList?pageNum"+pageNum,
                type:"post",
                dataType:"json",
                success:function (registerList) {
                    $("#registerTable tr:not(:first)").empty();
                    $.each(registerList,function (key,register) {
                        var createTime = register.createTime.substring(0,10);
                        var birthday = register.birthday.substring(0,10);
                        var Book="";
                        if(register.isBook==1){
                            Book="是";
                        }else{
                            Book="否";
                        }
                        var state ="";
                        if(register.status==1){
                            state="已挂号";
                        }else if(register.status==2){
                            state="医生接诊";
                        }else if(register.status==3){
                            state="看诊结束";
                        }else if(register.status==4){
                            state="已退号";
                        }
                        var str="<tr>" +
                            "<td>"+register.caseNumber+"</td><td>"+register.realName+"</td>" +
                            "<td>"+register.sex+"</td><td>"+register.idCard+"</td>" +
                            "<td>"+birthday+"</td><td>"+register.dept.deptName+"</td>" +
                            "<td>"+register.regLve.levelName+"</td><td>"+register.user.realName+"</td>" +
                            "<td>"+Book+"</td><td>"+createTime+"</td>" +
                            "<td>"+register.cost+"</td><td>"+state+"</td>" +
                            "</tr>";
                        $("tbody").append(str);
                    })
                }
            });
        }

        //点击刷新查询患者信息列表
        $("#div3-1").click(function () {
            pageNum = 1;
            getRegisterData();
        });
        //上一页
        $("#btn-pre").click(function () {
            if((pageNum-1)==0){
                alert("没有上一页数据");
            }else{
                pageNum=pageNum-1;
                getRegisterData();
            }
        });
        $("#btn-next").click(function () {
            pageNum=pageNum+1;
            getRegisterData();
        });

    })
</script>
