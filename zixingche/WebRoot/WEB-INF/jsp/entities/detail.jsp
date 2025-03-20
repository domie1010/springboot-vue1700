<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/header.jsp"%>
<!DOCTYPE html>
<html lang="cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

</head>
<body>
<%@include file="/WEB-INF/jsp/main/topNav.jsp"%>
<div class="container-fluid">
    <div class="row">
        <!--leftmenu -->
        <%@include file="/WEB-INF/jsp/main/leftMenu.jsp"%>
        <!-- left menu-->
        <!--中间内容容器 -->
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

            <div class="panel panel-success  text-center ">
                <div class="panel-heading"><h3 class="text">车辆信息</h3></div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" id="form">
                        <input type="hidden" id="entityid"/>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">自行车名称:</label>
                            <div class="col-sm-4 ">
                                ${e.entityName}
                            </div>

                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">价格（每天）:</label>
                            <div class="col-sm-4 ">
                                ${e.price}
                            </div>
                            <label class="col-sm-2 control-label">备注信息:</label>
                            <div class="col-sm-4 ">
                                ${e.entityInfo}
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">封面</label>
                            <div class="row">
                                <div class="col-xs-1 col-md-1">
                                    <img class="thumbnail" src="${e.entityImage}" width="300" height="300" data-src="holder.js/100x100" alt="暂无图片">
                                </div>
                            </div>
                        </div>
                        <div class="form-group text-center">
                           宝贝详情： ${e.entityDesc}
                        </div>

                    </form>
                </div>
                <div class="panel-footer panel-success">
                    <button class="btn btn-success " type="button" id="editBtn">租用</button>
                    <button class="btn btn-success " type="button" id="closeBtn">返回</button>
                </div>
            </div>
        </div>
        <!--中间内容容器 -->
    </div>
</div>

<div class="modal fade" id="entityModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">

                <div class="panel panel-success  text-center wd">
                    <div class="panel-heading"><h3 class="text">车辆租用单</h3></div>
                    <input type="hidden" id="userId" />
                    <div class="panel-body">
                        <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">请选择租用日期:</label>
                                <div class="col-sm-8 ">
                                    <input type="text" id="startDate" onclick=" WdatePicker({dateFmt:'yyyy-MM-dd'})"  class="form-control" placeholder="请选择租用日期" required/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">请选择归还日期:</label>
                                <div class="col-sm-8 ">
                                    <input type="text" id="endDate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"  class="form-control" placeholder="请选择归还日期" required/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">总价格:</label>
                                <div class="col-sm-3 ">
                                    <input type="number" id="totalPrice" class="form-control col-sm-4" readonly="readonly" required/>

                                </div>
                                <button type="button" id="calc" class="btn btn-primary" readonly="readonly" >计算租金</button>
                            </div>

                        </form>
                    </div>
                    <div class="panel-footer panel-success">
                        <div class="alert alert-success " style="display:none" role="alert" id="success">查询失败</div>
                        <button class="btn btn-success " type="button" id="eneditBtn">确定</button>
                        <button class="btn btn-success " type="button" id="encloseBtn">关闭</button>
                    </div>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script src="/resource/js/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/resource/js/bootstrap.min.js"></script>
<script src="/resource/js/commom.js"></script>
<script src="/resource/js/dialog.js"></script>
<script type="text/javascript" src="/resource/My97DatePicker/WdatePicker.js"></script>

<script>

    $(function(){

        //打开添加用户窗口
        $("#editBtn").click(function(){
            //打开模态窗口
            $("#entityModal").modal({//显示弹出层
                backdrop: 'static',//不可后退
                keyboard: false//进制键盘事件
            }).show();
        });


        $("#encloseBtn").click(function(){
            $("#entityModal").modal('hide');
        });

        $("#closeBtn").click(function() {
            window.history.back();
        });

        function calcPrice(startDate,endDate){

            var startTime = new Date(startDate).getTime();
            var endTime = new Date(endDate).getTime();

            if(startTime>endTime){
                alert("还车时间不能小于借车时间");
                return false;
            }

            var day = (endTime-startTime)/1000/60/60/24;

            day = parseInt(day)<1?1:parseInt(day);

            var totalPrice = ${e.price}*day;
            $("#totalPrice").val(totalPrice);
            return true;
        }

        function dateChange(){

           var startDate =$("#startDate").val();
            var endDate =$("#endDate").val();

            if(startDate!=null&&endDate!=null){
                calcPrice(startDate,endDate);
            }

        }


        $("#calc").click(function(){
            dateChange();
        });
        //租用
        $("#eneditBtn").click(function() {

            var totalPrice= $("#totalPrice").val();

            if(totalPrice==null||totalPrice==""){
                Alert("请点击计算租金");
                return;
            }
            //重新计算
            dateChange();
            totalPrice= $("#totalPrice").val();
            if(totalPrice>${students.account}){
                Alert("您的余额不足哦，请充值");
                return;
            }else{

                var order ={
                    "fkStuCode":${students.stuCode},
                    "fkEntityId":${e.entityid},
                    "startDate":$("#startDate").val(),
                    "endDate":$("#endDate").val(),
                    "totalPrice":$("#totalPrice").val(),
                    "orderState":"出租中"
                };


                $.post("/order/insert",order,function(data){
                   if(data){
                       Alert(data.message);
                   }
                });


            }

        });


    });
</script>
</body>
</html>
