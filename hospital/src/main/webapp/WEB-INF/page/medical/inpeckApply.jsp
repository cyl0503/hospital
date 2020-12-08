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
                <h4 class="page-title">检验申请</h4></div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12"> <a href="#" class="btn btn-danger pull-right m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">Upgrade to Pro</a>
                <ol class="breadcrumb">
                    <li><a href="#">控制台</a></li>
                    <li><a href="#">医生工作站管理</a></li>
                    <li class="active">检验申请</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /row -->
        <div class="row">
            <div class="col-sm-12">
                <div class="white-box">
                    <h3 class="box-title">查询病例信息</h3>
                    <div id="indiv1">
                        <div>
                            病历编号：<input type="text" id="scaseNumber" name="scaseNumber">
                        </div>
                        <div id="indiv1-2">
                            <button id="in_search">搜索</button>
                        </div>
                    </div>
                    <div id="indiv2">
                        <div id="indiv2_1">
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
                                患者年龄：<input type="text" id="age" name="age">
                            </div>
                        </div>
                        <div id="indiv2_2">
                            <div>
                                挂号日期：<input type="text" id="createTime" name="createTime">
                            </div>
                            <div>
                                挂号科室：<input type="text" id="deptId" name="deptId">
                            </div>
                            <div>
                                挂号医生：<input type="text" id="doctorId" name="doctorId">
                            </div>
                            <div>
                                患者状态：<input type="text" id="status" name="status">
                            </div>
                        </div>
                    </div>
                    <div id="indiv3">
                        <div id="div_title2">
                            <h3 class="box-title">检验项目</h3>
                        </div>
                        <div id="indiv3_1">
                            检验项目：
                            <select name="caInspectItemId" id="caInspectItemId">
                                <option value="-1">--请选择--</option>
                                <c:forEach var="inspectItem" items="${inspectList}">
                                    <option value="${inspectItem.id}" data_price="${inspectItem.price}">${inspectItem.itemName}</option>
                                </c:forEach>
                            </select>
                            <button id="inAdd">新增项目</button>
                        </div>
                        <div id="indiv3_2">
                            <form id="InForm">
                                <table id="mt2" class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>项目编号</th>
                                        <th>检查项目</th>
                                        <th>数量</th>
                                        <th>单价</th>
                                        <th>总价</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                        <div id="indiv3_3">
                            <button id="InOpenProject">开立项目</button>
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
    #indiv1{
        width: 100%;
        height: 25px;
        margin-left: 20px;
        line-height: 25px;
        display: flex;
        margin-bottom: 20px;
    }
    #indiv1-2{
        margin-left: 20px;
    }
    #indiv2_1,#indiv2_2{
        display: flex;
        margin: 20px;
    }
    #indiv2_1 div,#indiv2_2 div{
        flex: 1;
    }

    #indiv2 input{
        width: 150px;
    }
    #indiv3_1{
        margin-left: 20px;
    }
    #inAdd{
        margin-left: 20px;
    }
    #indiv3_1 select{
        width: 250px;
        display: inline-block;
    }

    #indiv3_2{
        margin-top: 20px;
    }
    #indiv3_2 i{
        cursor: pointer;
    }
    tbody input{
        width: 120px;
        border: none;
    }
    tbody i{
        font-size: 50px;
    }
</style>
<script type="text/javascript">
    $(function () {
        //根据病历号查询患者信息
        $("#in_search").click(function () {
            $.ajax({
                url:"/register/searchByCaseNumber",
                type:"post",
                data:{scaseNumber: $("#scaseNumber").val()},
                dataType:"json",
                success:function (register) {
                    var createTime = register.createTime.substring(0,10);
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
                    $("#age").val(register.age);
                    $("#createTime").val(createTime);
                    $("#deptId").val(register.dept.deptName);
                    $("#doctorId").val(register.user.realName);
                    $("#status").val(state);
                }
            })
        })

        var num = 0;
            //新增项目
        $("#inAdd").click(function () {
            var inspectItem_value = $("#caInspectItemId").val();//项目编号
            var inspectItem_text = $("#caInspectItemId option:selected").text();//项目的名称
            var data_price = $("#caInspectItemId option:selected").attr("data_price");//项目的单价
            if(inspectItem_value == -1){
                alert("请先选择检查项目!!!");
            }else {
                var arr=[];
                $("tbody tr").each(function () {
                    var text = $(this).find("td").eq(1).find("input").val();
                    arr.push(text);
                });
                var flag = true;
                for (var i=0;i<=arr.length;i++){
                    if(inspectItem_text==arr[i]){
                        alert("不能重复选择");
                        flag = false;
                        break;
                    }
                }
                if(flag==true){
                    var str = "<tr>" +
                        "<td><input type='text' name='ciApplyRecordList["+num+"].itemId' value='"+inspectItem_value+"' readonly='readonly'></td>" +
                        "<td><input type='text' name='ciApplyRecordList["+num+"].itemName' value='"+inspectItem_text+"' readonly='readonly'></td>" +
                        "<td><input type='text' class='number' name='ciApplyRecordList["+num+"].number' value='1'></td>" +
                        "<td><input type='text' class='price' name='ciApplyRecordList["+num+"].price' value='"+data_price+"' readonly='readonly'></td>" +
                        "<td><input type='text' class='total' name='ciApplyRecordList["+num+"].total' value='"+data_price+"' readonly='readonly'></td>" +
                        "<td><div class='col-sm-6 col-md-4 col-lg-3 icon_del'><i class='fa fa-trash-o'></div></td>" +
                        "</tr>";
                    $("tbody").append(str);
                    num++;
                }

            }
        })
        //总金额
        $(document).on("blur",".number",function () {
            var count = parseInt($(this).val());
            var price = parseFloat($(this).parent().next().find("input").val());
            $(this).parent().next().next().find("input").val(count*price);
        })
        //点击删除图标删除整行数据
        $(document).on("click",".icon_del",function () {
            $(this).parent().parent().remove();
        })

        //开立项目
        $("#InOpenProject").click(function () {
            if($("#caseNumber").val()==""){
                alert("请先选择患者");
            }else if($("#caInspectItemId").val()==-1){
                alert("请先选择检查项目");
            }else {
                if(confirm("确定开立项目吗？")==true){
                    $.ajax({
                        url:"/ciitem/openInspectProject?caseNumber="+$("#caseNumber").val(),
                        type: "post",
                        data:$("#InForm").serialize(),
                        success:function (msg) {
                            alert(msg);
                        }
                    })
                }else {
                    return false;
                }
            }
        })
    })
</script>
