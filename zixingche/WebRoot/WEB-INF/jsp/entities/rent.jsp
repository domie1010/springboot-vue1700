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
                                    <td><a class="btn btn-link glyphicon glyphicon-pencil" href="/entity/${e.entityid}/torent">查看详情</a>
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


    });


</script>
</body>
</html>
