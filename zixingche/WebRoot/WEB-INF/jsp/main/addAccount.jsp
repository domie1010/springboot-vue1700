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
            <div class="container-fluid ">
                <div class="panel panel-primary  text-center wd">
                    <div class="panel-heading"><h3 class="text">账户充值</h3></div>
                    <div class="panel-body">
                        <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">请选择账户:</label>
                                <div class="col-lg-3">
                                <select class="form-control col-sm-3">
                                    <option>支付宝</option>
                                    <option>微信</option>
                                    <option>中国银行</option>
                                    <option>农业银行</option>
                                </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">金额:</label>
                                <div class="col-sm-3 ">
                                    <input type="number" id="account" class="form-control" value="0" placeholder="请输入终止的金额"/> <span class="text-danger">当前余额:${students.account}</span>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="panel-footer panel-success">

                        <button class="btn btn-success " id="btn" type="button">确定</button>
                    </div>
                </div>
            </div>
        </div>
        <!--中间内容容器 -->
    </div>
</div>
</body>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="/resource/js/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/resource/js/bootstrap.min.js"></script>
<script src="/resource/js/dialog.js"></script>

<script>
    $(function(){

        $("#btn").click(function(){

            var account =$("#account").val();

            $.post("/students/addAccount",{"account":account},function(data){
                if(data){
                    Alert(data['message']);
                }
            });

        });

    });

</script>
</html>
