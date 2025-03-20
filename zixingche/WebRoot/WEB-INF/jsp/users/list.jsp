<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/header.jsp"%>
<!DOCTYPE html>
<!-- saved from url=(0041)http://v3.bootcss.com/examples/dashboard/ -->
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
                        <h3 class="panel-title text-center">系统用户管理</h3>
                    </div>
                    <div class="panel-body">
                        <form class="form-inline col-sm-offset-2" id="userForm" action="/users/list" method="post">
                            <input class="form-control" type="text" name="username" value="${users.username}" placeholder="账号">
                            <input class="form-control" type="text" name="realName" value="${users.realName}" placeholder="姓名">
                            <button class="btn bg-primary glyphicon glyphicon-zoom-in" id="btnUserSearch" type="button">搜索</button>
                            <button class="btn btn-primary glyphicon glyphicon-plus form-control" id="btnAdduser" type="button">添加</button>
                        </form>

                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>账号</th>
                                <th>真实姓名</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${info.list}" var="u">
                                <tr>
                                    <td>${u.userId}</td>
                                    <td>${u.username}</td>
                                    <td>${u.realName}</td>
                                    <td><a class="btn btn-link glyphicon glyphicon-pencil" href="javascript:;" onclick="users.queryUser('${u.userId}')">修改</a>|<a
                                            class="btn btn-link glyphicon glyphicon-ban-circle" href="javascript:;" onclick="users.deleteUser('${u.userId}')">删除</a></td>
                                </tr>
                            </c:forEach>

                            <c:if test="${info.size==0}">
                                <tr>
                                    <td colspan="4" class="text text-center text-danger">没有搜索到结果</td>

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
                <div class="modal fade" id="userModel">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-body">

                                <div class="panel panel-success  text-center wd">
                                    <div class="panel-heading"><h3 class="text">用户信息</h3></div>
                                    <input type="hidden" id="userId" />
                                    <div class="panel-body">
                                        <form class="form-horizontal" role="form" id="form">
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">账号:</label>
                                                <div class="col-sm-8 ">
                                                    <input type="text" id="username" class="form-control" placeholder="请输入账号" required/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">密码:</label>
                                                <div class="col-sm-8 ">
                                                    <input type="password" id="password" class="form-control" placeholder="请输入密码" required/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">姓名:</label>
                                                <div class="col-sm-8 ">
                                                    <input type="text" id="realName" class="form-control" placeholder="请输入姓名" required/>
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
<script src="/resource/js/commom.js"></script>
<script src="/resource/js/dialog.js"></script>
<script src="/resource/js/users/users.js"></script>

<script>
    //超链接跳转页
    function jumpPage(pageNum) {
        var form = $("#userForm");
        var pageNum = ${info.pageNum};
        users.search(form, pageNum);
    }
    //user加载完成后的动作
    $(function () {
        //搜索按钮绑定事件
        $("#btnUserSearch").click(function () {
            //获取表单
            var form = $("#userForm");
            var pageNum = ${info.pageNum};
            users.search(form, pageNum);
        });

        //打开添加用户窗口
        $("#btnAdduser").click(function(){
            //打开模态窗口
            $('#form')[0].reset();
            $("#userId").val('');
            $("#userModel").modal({//显示弹出层
                backdrop: 'static',//不可后退
                keyboard: false//进制键盘事件
            }).show();
        });

        //关闭窗口
        $("#closeBtn").click(function(){
            //关闭窗口
            $("#userModel").modal('hide');
        });
        //点击模态框的确定按钮
        //关闭窗口
        $("#editBtn").click(function(){
            users.editUser();
        });

    });



</script>
</body>
</html>
