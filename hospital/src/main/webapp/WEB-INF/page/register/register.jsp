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
                <h4 class="page-title">门诊挂号管理</h4> </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12"> <a href="#" class="btn btn-danger pull-right m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">Upgrade to Pro</a>
                <ol class="breadcrumb">
                    <li><a href="#">控制台</a></li>
                    <li><a href="#">挂号收费</a></li>
                    <li class="active">门诊挂号管理</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /row -->
        <div class="row">
            <div class="col-sm-12">
                <div class="white-box">
                    <h3 class="box-title">挂号信息</h3> <span>${msg}</span>
                    <form action="/register/patientRegister" method="post">
                    <div id="d1">
                        <div id="d1-1">
                            <div>
                                病历号：<input type="text" id="caseNumber" name="caseNumber" value="${caseNumber}"><span class="start">*</span>
                            </div>
                            <div>
                                患者姓名：<input type="text" id="realName" name="realName"><span class="start">*</span>
                            </div>
                            <div id="d1-1-3">
                                患者性别：<input type="radio" name="sex" value="男">男<input type="radio" name="sex" value="女">女<span class="start">*</span>
                            </div>
                            <div>
                                患者年龄：<input type="text" id="age" name="age"><span class="start">*</span>
                            </div>
                            <div>
                                出生日期：<input type="date" id="birthday" name="birthday"><span class="start">*</span>
                            </div>

                        </div>
                        <div id="d1-2">
                            <div>
                                身份证号：<input type="text" id="idCard" name="idCard"><span class="start">*</span>
                            </div>
                            <div>
                                家庭住址：<input type="text" id="address" name="address"><span class="start">*</span>
                            </div>
                            <div>
                                挂号级别：
                                <select id="levelId" name="levelId">
                                    <option data-cost="0" value="-1">请选择</option>
                                    <c:forEach var="regLve" items="${reglevList}">
                                        <option data-cost="${regLve.registrationFee}" value="${regLve.id}">${regLve.levelName}</option>
                                    </c:forEach>
                                </select><span class="start">*</span>
                            </div>
                        </div>
                        <div id="d1-3">
                            <div>
                                挂号科室：
                                <select id="deptId" name="deptId">
                                    <option value="-1">请选择</option>
                                    <c:forEach var="dept" items="${deptList}">
                                        <option value="${dept.id}">${dept.deptName}</option>
                                    </c:forEach>
                                </select><span class="start">*</span>
                            </div>
                            <div>
                                挂号医生：
                                <select id="doctor" name="doctorId">
                                    <option value="-1">请选择</option>
                                </select><span class="start">*</span>
                            </div>
                            <div id="d1-3-3">
                                初始号额：<input type="text" id="levelQuota" name="levelQuota" readonly="readonly">
                            </div>
                            <div id="d1-3-4">
                                已用号额：<input type="text" id="usedLevelQuota" name="usedLevelQuota" readonly="readonly">
                            </div>
                        </div>
                        <div id="d1-4">
                            <div>
                                看诊日期：<input type="date" id="visitDate" name="visitDate"><span class="start">*</span>
                            </div>
                            <div>
                                是否需要病历本：
                                <input type="radio" id="yes" name="isBook" value="1">是
                                <input type="radio" id="no" name="isBook" value="2">否
                                <span class="start">*</span>
                            </div>
                            <div>
                                总金额：<input type="text" id="cost" name="cost" readonly="readonly">
                            </div>
                            <div id="d1-4-4">
                                <button id="btn-re" type="submit">挂&nbsp;&nbsp;号</button>
                            </div>
                        </div>
                    </div>
                    </form>
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
                                    <th>status</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        <div>
                            <button id="btn-pre">上一页</button>
                            <button id="btn-next">下一页</button>
                        </div>
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
    #d1-1,#d1-2,#d1-3,#d1-4,#div3{
        display: flex;
    }
    #d1-1 input[type=text]{
        width: 90px;
    }
    #d1-1 div{
        margin: 10px;
    }
    #d1-2 div,#d1-4 div,#d1-3 div{
        margin: 12px;
     }
    .start{
        color: red;
    }
    #d1-2 input,#d1-2 input,#d1-2 select{
        width: 140px;
    }
    #d1-3 input{
        width: 85px;
    }
    #d1-3 select{
        width: 140px;
    }
    #btn-re{
        width: 120px;
        height: 25px;
    }
    #d1-3-3,#d1-3-4 {
        margin-top: 3px;
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
        right: 10px;
    }
    #div4{
        padding-left: 20px;
    }

</style>
<script type="text/javascript">
    $(function () {
         $("#levelId,#deptId").change(function () {
             $.ajax({
                 url:"/register/getDoctorByDeptAndRegisterLevel",
                 type:"post",
                 data:{levelName:$("#levelId option:selected").text(),deptName:$("#deptId option:selected").text()},
                 dataType:"json",
                 success:function (doctorList) {
                     $("#doctor").empty();
                     $("#doctor").append("<option value='-1'>请选择</option>");
                      $.each(doctorList,function (key,doctor) {
                            var str = "<option value="+doctor.userId+">"+doctor.realName+"</option>";
                            $("#doctor").append(str);
                      })
                 }
             });
         });
         //查询初始号额，已用号额
        $("#doctor").change(function () {
            $.ajax({
                url:"/register/getDoctorQuota",
                type:"post",
                data:{doctorId:$("#doctor").val()},
                dateType:"json",
                success:function (data) {
                   var d = data.split("-");
                   var levelQuota=d[0];
                   var usedlevelQuota=d[1];
                    $("#levelQuota").val(levelQuota);
                    $("#usedLevelQuota").val(usedlevelQuota);
                }
            });
        })
         //是否需要病历本 是 +1 否 0
        $("#yes").click(function () {
            var registrationFee = $("#levelId option:selected").attr("data-cost");
            $("#cost").val(parseInt(registrationFee)+1);
        })
        $("#no").click(function () {
            var registrationFee = $("#levelId option:selected").attr("data-cost");
            $("#cost").val(parseInt(registrationFee));
        })
        //填写出生日期自动计算年龄
        $("#birthday").blur(function () {
            var birthday_v = $("#birthday").val();
            var birthdays = birthday_v.split("-");
            var day = new Date();
            var year = day.getFullYear();
            var age = year-birthdays[0];
            $("#age").val(age);
        })

        var pageNum = 1;
        function getRegisterData() {
            $.ajax({
                url:"/register/getRegisterList?pageNum="+pageNum,
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
    });
</script>
