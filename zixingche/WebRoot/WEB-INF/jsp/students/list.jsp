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
                        <h3 class="panel-title text-center">学生信息管理</h3>
                    </div>
                    <div class="panel-body">
                        <form class="form-inline col-sm-offset-2" id="studentsForm" action="/students/list" method="post">
                            <input class="form-control" type="text" name="stuCode" value="${students.stuCode}" placeholder="学号">
                            <input class="form-control" type="text" name="realName" value="${students.realName}" placeholder="姓名">
                            <button class="btn bg-primary glyphicon glyphicon-zoom-in" id="btnSearch" type="button">搜索</button>
                        </form>

                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>学号</th>
                                <th>账号</th>
                                <th>真实姓名</th>
                                <th>学院</th>
                                <th>专业</th>
                                <th>联系方式</th>
                                <th>账户余额</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${info.list}" var="s">
                                <tr>
                                    <td>${s.stuCode}</td>
                                    <td>${s.username}</td>
                                    <td>${s.realName}</td>
                                    <td>${s.college}</td>
                                    <td>${s.major}</td>
                                    <td>${s.phone}</td>
                                    <td>${s.account}</td>
                                    <td><a class="btn btn-link glyphicon glyphicon-pencil" href="javascript:;" onclick="students.query('${s.stuCode}')">修改</a>|<a
                                            class="btn btn-link glyphicon glyphicon-ban-circle" href="javascript:;" onclick="students.delete('${s.stuCode}')">删除</a></td>
                                </tr>
                            </c:forEach>

                            <c:if test="${info.size==0}">
                                <tr>
                                    <td colspan="8" class="text text-center text-danger">没有搜索到结果</td>

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

                <!-- 学生信息信息界面-->
                <div class="modal fade" id="studentModal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-body">

                                <div class="panel panel-success  text-center wd">
                                    <div class="panel-heading"><h3 class="text">学生信息</h3></div>
                                    <div class="panel-body">
                                        <form class="form-horizontal" role="form">
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
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">学号:</label>
                                                <div class="col-sm-8 ">
                                                    <input type="number" id="stuCode" readonly="readonly" class="form-control" placeholder="请输入学号" required/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">余额:</label>
                                                <div class="col-sm-8 ">
                                                    <input type="text" id="account" class="form-control" placeholder="请输入金额" required/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">学院:</label>
                                                <div class="col-sm-8 ">
                                                    <input type="text" id="college" class="form-control" placeholder="请输入学院" required/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">专业:</label>
                                                <div class="col-sm-8 ">
                                                    <input type="text" id="major" class="form-control" placeholder="请输入专业" required/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">联系方式:</label>
                                                <div class="col-sm-8 ">
                                                    <input type="phone" id="phone" class="form-control" placeholder="请输入手机号" required/>
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
<script src="/resource/js/commom.js"></script>
<script src="/resource/js/dialog.js"></script>
<script src="/resource/js/students/students.js"></script>

<script>
    //超链接跳转页
    function jumpPage(pageNum) {
        var form = $("#studentsForm");
        var pageNum = ${info.pageNum};
        users.search(form, pageNum);
    }
    //user加载完成后的动作
    $(function () {
        //搜索按钮绑定事件
        $("#btnSearch").click(function () {
            //获取表单
            var form = $("#studentsForm");
            var pageNum = ${info.pageNum};
            students.search(form, pageNum);
        });

        //打开添加用户窗口
//        $("#btnAdd").click(function(){
//            //打开模态窗口
//            $("#studentModal").modal({//显示弹出层
//                backdrop: 'static',//不可后退
//                keyboard: false//进制键盘事件
//            }).show();
//        });

        //关闭窗口
        $("#closeBtn").click(function(){
            //关闭窗口
            $("#studentModal").modal('hide');
        });
        //点击模态框的确定按钮
        //关闭窗口
        $("#editBtn").click(function(){
            students.edit();
        });

    });



</script>
</html>
