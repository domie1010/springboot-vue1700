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
                        <h3 class="panel-title text-center">订单管理</h3>
                    </div>
                    <div class="panel-body">
                        <form class="form-inline col-sm-offset-2" id="form" action="/order/list" method="post">
                            <input class="form-control" type="text" name="orderId" value="${order.orderId}" placeholder="订单号">
                            <input class="form-control" ${students.stuCode==null?'type="text"':'type="hidden"'}  name="fkStuCode" value="${order.fkStuCode}" placeholder="学生学号">
                            <select class="form-control" name="orderState" >
                                <option value="">请选择订单类型</option>
                                <option value="出租中"  ${order.orderState=='出租中'?'selected="selected"':''}  >出租中</option>
                                <option value="已归还"  ${order.orderState=='已归还'?'selected="selected"':''}  >已归还</option>
                            </select>
                            <button class="btn bg-primary glyphicon glyphicon-zoom-in" id="btnSearch" type="button">搜索</button>
                        </form>

                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>订单号</th>
                                <th>学生学号</th>
                                <th>学生信息</th>
                                <th>自行车名称</th>
                                <th>自行车信息</th>
                                <th>租用开始时间</th>
                                <th>归还时间</th>
                                <th>租用价格</th>
                                <th>订单状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${info.list}" var="o">
                                <tr>
                                    <td>${o.orderId}</td>
                                    <td>${o.fkStuCode}</td>
                                    <td>${o.students.college}-${o.students.major}-${o.students.realName}-${o.students.phone}</td>
                                    <td>${o.entity.entityName}</td>
                                    <td>${o.entity.entityInfo}</td>
                                    <td><fmt:formatDate value="${o.startDate}" pattern="yyyy-MM-dd"/></td>
                                    <td><fmt:formatDate value="${o.endDate}" pattern="yyyy-MM-dd"/></td>
                                    <td>${o.totalPrice}</td>
                                    <td>${o.orderState}</td>
                                    <td><a class="btn btn-link glyphicon glyphicon-pencil" href="javascript:;" onclick="order.toEdit('${o.orderId}','${o.orderState}')">修改状态</a>|<a
                                            class="btn btn-link glyphicon glyphicon-ban-circle" href="javascript:;" onclick="order.delete('${o.orderId}')">删除</a></td>
                                </tr>
                            </c:forEach>

                            <c:if test="${info.size==0}">
                                <tr>
                                    <td colspan="10" class="text text-center text-danger">没有搜索到结果</td>

                                </tr>

                            </c:if>

                            </tbody>
                        </table>
                        <div class="panel-footer">
                            <c:if test="${info.size>0}">
                                <nav>
                                    <ul class="pagination pull-right">
                                        <li><a href="javascript:;" onclick="jumpPage(1)">
                                            <div class="text-primary">首页</div>
                                        </a></li>
                                        <c:forEach items="${info.navigatepageNums}" var="pageNum">
                                            <li><a href="javascript:;" onclick="jumpPage(${pageNum})">${pageNum} </a></li>
                                        </c:forEach>
                                        <li><a href="javascript:;" onclick="jumpPage(${info.size})">
                                            <div class="text-primary">尾页</div>
                                        </a></li>
                                    </ul>
                                </nav>
                            </c:if>
                        </div>
                    </div>

                </div>
                <!--表格结束 -->

                <!-- 用户信息界面-->
                <div class="modal fade" id="modal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-body">

                                <div class="panel panel-success  text-center wd">
                                    <div class="panel-heading"><h3 class="text">修改订单状态</h3></div>

                                    <div class="panel-body">
                                        <form class="form-horizontal" role="form">
                                            <input type="hidden" id="orderId" />
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">当前状态:</label>
                                                <select class="form-control col-sm-3" id="orderState" >
                                                    <option value="出租中"  >出租中</option>
                                                    <option value="已归还"  >已归还</option>
                                                </select>
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
<script src="/resource/js/commom.js"></script>
<script src="/resource/js/dialog.js"></script>
<script src="/resource/js/order/order.js"></script>

<script>
    //超链接跳转页
    function jumpPage(pageNum) {
        var form = $("#form");
        var pageNum = ${info.pageNum};
        order.search(form, pageNum);
    }
    //user加载完成后的动作
    $(function () {
        //搜索按钮绑定事件
        $("#btnSearch").click(function () {
            //获取表单
            var form = $("#form");
            var pageNum = ${info.pageNum};
            order.search(form, pageNum);
        });



        //关闭窗口
        $("#closeBtn").click(function(){
            //关闭窗口
            $("#modal").modal('hide');
        });
        //点击模态框的确定按钮
        //关闭窗口
        $("#editBtn").click(function(){
            order.edit();
        });

    });



</script>
</html>
