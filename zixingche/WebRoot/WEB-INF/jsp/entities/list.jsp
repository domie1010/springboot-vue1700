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
    <style>

        .ke-container.ke-container-default{
            width:520px!important;
        }
    </style>
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
                        <h3 class="panel-title text-center">自行车管理</h3>
                    </div>
                    <div class="panel-body">
                        <form class="form-inline col-sm-offset-2" id="entityForm" action="/entity/list" method="post">
                            <input class="form-control" type="text" name="entityName" value="${entity.entityName}" placeholder="车辆名称">
                            <select class="form-control" name="fkTypeid" >
                                <option value="">请选择类型</option>
                                <c:forEach items="${ts}" var="t">
                                    <option value="${t.typeId}"  ${t.typeId==entity.fkTypeid?'selected="selected"':''}  >${t.typeName}</option>
                                </c:forEach>
                            </select>
                            <button class="btn bg-primary glyphicon glyphicon-zoom-in" id="btnSearch" type="button">搜索</button>
                            <button class="btn btn-primary glyphicon glyphicon-plus form-control" id="btnAdd" type="button">添加</button>
                        </form>

                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>车辆标题</th>
                                <th>类型</th>
                                <th>图片</th>
                                <th>价格</th>
                                <th>备注</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${info.list}" var="e">
                                <tr >
                                    <td>${e.entityid}</td>
                                    <td>${e.entityName}</td>
                                    <td>${e.type.typeName}</td>
                                    <td>
                                        <div class="row">
                                            <div class="col-xs-1 col-md-1">
                                                <img class="thumbnail" src="${e.entityImage}" width="100" height="100" data-src="holder.js/100x100" alt="暂无图片">
                                            </div>
                                        </div>
                                    </td>
                                    <td>${e.price}/天</td>
                                    <td>${e.entityInfo}</td>
                                    <td><a class="btn btn-link glyphicon glyphicon-pencil" href="javascript:;" onclick="entities.query('${e.entityid}')">修改</a>|<a
                                            class="btn btn-link glyphicon glyphicon-ban-circle" href="javascript:;" onclick="entities.delete('${e.entityid}')">删除</a></td>
                                </tr>
                            </c:forEach>

                            <c:if test="${info.size==0}">
                                <tr>
                                    <td colspan="7" class="text text-center text-danger">没有搜索到结果</td>

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
                <div class="modal fade bs-example-modal-lg" id="modal"  >
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-body">

                                <div class="panel panel-success  text-center ">
                                    <div class="panel-heading"><h3 class="text">车辆信息</h3></div>
                                    <div class="panel-body">
                                        <form class="form-horizontal" role="form" id="form">
                                            <input type="hidden" id="entityid"/>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">自行车名称:</label>
                                                <div class="col-sm-4 ">
                                                    <input type="text" id="entityName" class="form-control" placeholder="请输入车辆名称" required/>
                                                </div>
                                                <label class="col-sm-2 control-label">自行车类型:</label>
                                                <div class="col-sm-4 ">
                                                    <select class="form-control" id="fkTypeid" >
                                                        <option value="">请选择类型</option>
                                                        <c:forEach items="${ts}" var="t">
                                                            <option value="${t.typeId}"    >${t.typeName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">价格（每天）:</label>
                                                <div class="col-sm-4 ">
                                                    <input type="number" id="price" class="form-control" placeholder="请输入价格" required/>
                                                </div>
                                                <label class="col-sm-2 control-label">备注信息:</label>
                                                <div class="col-sm-4 ">
                                                    <input type="text" id="entityInfo" class="form-control" placeholder="请输入备注" required/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">上传图片:</label>
                                                <div class="col-sm-4 ">
                                                    <input type="text" id="entityImage" class="form-control" placeholder="图片路径" required/>
                                                </div>
                                                <div class="col-sm-4 ">
                                                    <button type="button" id="btnImage" class="bg-primary col-sm-offset-6" >选择图片</button>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-10 ">
                                        <textarea class="ke-container ke-container-default" id="entityDesc" >
                                        </textarea>
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
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="/resource/js/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/resource/js/bootstrap.min.js"></script>

<script src="/resource/js/dialog.js"></script>
<!--引入kejs -->
<script src="/resource/kindeditor/kindeditor.js"></script>
<script src="/resource/kindeditor/lang/zh_CN.js"></script>
<script src="/resource/js/commom.js"></script>

<script src="/resource/js/entities/entities.js"></script>

<script>
    //超链接跳转页
    function jumpPage(pageNum) {
        var form = $("#entityForm");
        var pageNum = ${info.pageNum};
        entities.search(form, pageNum);
    }
    //user加载完成后的动作
    $(function () {
        //搜索按钮绑定事件
        $("#btnSearch").click(function () {
            //获取表单
            var form = $("#entityForm");
            var pageNum = ${info.pageNum};
            entities.search(form, pageNum);
        });

        //打开添加用户窗口
        $("#btnAdd").click(function(){
            //打开模态窗口

            $('#form')[0].reset();
            $("#entityid").val('');
            if(!entities.isCreateKE){
                entities.editor= web.createKindEditor('entityDesc');
                entities.isCreateKE = true;
            }
            entities.editor.html('');
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
            entities.edit();
        });



        // 初始化控件


        web.createUploadButton('btnImage','entityImage');
    });


</script>
</body>
</html>
