<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-sm-3 col-md-2 sidebar">
  <ul class="nav nav-sidebar">
    <li class="active"><a href="javascript:void(0)">菜单列表</a></li>
    <c:if test="${users!=null}">

    <li><a href="/users/list" target="_self">系统用户管理</a></li>
    <li><a href="/students/list" target="_self">学生管理</a></li>
    <li><a href="/types/list" target="_self">类型管理</a></li>
    <li><a href="/entity/list" target="_self">自行车管理</a></li>
    <li><a href="/order/list" target="_self">订单管理</a></li>
    </c:if>
    <c:if test="${sessionScope.students!=null}">
      <li><a href="/addAccount" target="_self">我要充值</a></li>
      <li><a href="/entity/rent" target="_self">我要租车</a></li>
      <li><a href="/order/list?fkStuCode=${students.stuCode}" target="_self">我的订单</a></li>
    </c:if>
  </ul>

</div>
