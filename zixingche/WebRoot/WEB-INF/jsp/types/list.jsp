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
            <div class="container-fluid">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title text-center">自行车车辆类型管理</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <button class="btn btn-primary glyphicon glyphicon-plus  col-sm-1 pull-right" id="btnAdd" type="button">添加</button>
                        </div>
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>编号</th>
                                <th>类型</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${types}" var="t" varStatus="vs">
                                <tr>
                                    <td>${vs.count}</td>
                                    <td>${t.typeName}</td>
                                    <td><a class="btn btn-link glyphicon glyphicon-pencil" href="javascript:;" onclick="types.query('${t.typeId}')">修改</a>|<a
                                            class="btn btn-link glyphicon glyphicon-ban-circle" href="javascript:;" onclick="types.delete('${t.typeId}')">删除</a></td>
                                </tr>
                            </c:forEach>

                            <c:if test="${types.size()==0}">
                                <tr>
                                    <td colspan="3" class="text text-center text-danger">没有搜索到结果</td>
                                </tr>

                            </c:if>

                            </tbody>
                        </table>

                    </div>

                </div>
                <!--表格结束 -->

                <!-- 学生信息信息界面-->
                <div class="modal fade" id="modal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-body">

                                <div class="panel panel-success  text-center wd">
                                    <div class="panel-heading"><h3 class="text">类型信息</h3></div>
                                    <div class="panel-body">
                                        <form class="form-horizontal" role="form" id="form">
                                            <input type="hidden" id="typeId"/>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">类型名称:</label>
                                                <div class="col-sm-8 ">
                                                    <input type="text" id="typeName" class="form-control" placeholder="请输入类型" required/>
                                                </div>
                                            </div>

                                        </form>
                                    </div>
                                    <div class="panel-footer panel-success">
                                        <div class="alert alert-success " style="display:none" role="alert" id="success">查询失败</div>
                                        <button class="btn btn-success " type="button" id="editBtn">确定</button>
                                        <button class="btn btn-success " type="button" id="closeBtn">关闭</button>
                                    </div>
                                </div>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->
                <!-- 用户信息界面结束-->

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
<script src="/resource/js/types/types.js"></script>

<script>

    //user加载完成后的动作
    $(function () {

        //打开添加用户窗口
        $("#btnAdd").click(function(){
            //打开模态窗口
            $('#form')[0].reset();
            $("#typeId").val('');


            $("#modal").modal({//显示弹出层
                backdrop: 'static',//不可后退
                keyboard: false//进制键盘事件
            }).show();
        });

        //关闭窗口
        $("#closeBtn").click(function(){
            //关闭窗口
            $("#modal").modal('hide');
        });
        //点击模态框的确定按钮
        //关闭窗口
        $("#editBtn").click(function(){
            types.edit();
        });

    });



</script>
</html>
