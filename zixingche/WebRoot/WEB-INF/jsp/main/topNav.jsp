<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="/resource/css/dashboard.css" rel="stylesheet">
<link href="/resource/css/custom.css" rel="stylesheet">
<nav class="navbar navbar-default  navbar-fixed-top" role="navigation">
  <div class="container-fluid">
    <!-- 页面变窄时显示-->
    <div class="navbar-header text-center text-primary">

      <a class="navbar-brand" href="#主页">公共自行车租赁系统</a>
    </div>
    <!-- 真正的导航链接-->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

      <ul class="nav navbar-nav navbar-right">
        <li><a href="javascript:void(0)" id="info">个人信息修改</a></li>
        <li><a href="javascript:void(0)" id="logout" target="_parent">退出登录</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<div class="modal fade" id="loginuserModel">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">

        <div class="panel panel-success  text-center wd">
          <div class="panel-heading"><h3 class="text">用户信息</h3></div>
          <input type="hidden" id="loginuserId" />
          <div class="panel-body">
            <form class="form-horizontal" role="form">
              <div class="form-group">
                <label class="col-sm-3 control-label">账号:</label>
                <div class="col-sm-8 ">
                  <input type="text" id="loginusername" class="form-control" placeholder="请输入账号" required/>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label">密码:</label>
                <div class="col-sm-8 ">
                  <input type="password" id="loginpassword" class="form-control" placeholder="请输入密码" required/>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label">姓名:</label>
                <div class="col-sm-8 ">
                  <input type="text" id="loginrealName" class="form-control" placeholder="请输入姓名" required/>
                </div>
              </div>

            </form>
          </div>
          <div class="panel-footer panel-success">
            <div class="alert alert-success " style="display:none" role="alert" id="success">查询失败</div>
            <button class="btn btn-success " type="button" id="logineditBtn">确定</button>
            <button class="btn btn-success " type="button" id="logincloseBtn">关闭</button>
          </div>
        </div>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="loginstudentModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">

        <div class="panel panel-success  text-center ">
          <div class="panel-heading"><h3 class="text">学生信息</h3></div>
          <div class="panel-body">
            <form class="form-horizontal" role="form">
              <div class="form-group">
                <label class="col-sm-3 control-label">账号:</label>
                <div class="col-sm-8 ">
                  <input type="text" id="stuusername" class="form-control" placeholder="请输入账号" required/>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label">密码:</label>
                <div class="col-sm-8 ">
                  <input type="password" id="stupassword" class="form-control" placeholder="请输入密码" required/>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label">姓名:</label>
                <div class="col-sm-8 ">
                  <input type="text" id="sturealName" class="form-control" placeholder="请输入姓名" required/>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label">学号:</label>
                <div class="col-sm-8 ">
                  <input type="number" id="stustuCode" readonly="readonly" class="form-control" placeholder="请输入学号" required/>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-3 control-label">学院:</label>
                <div class="col-sm-8 ">
                  <input type="text" id="stucollege" class="form-control" placeholder="请输入学院" required/>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label">专业:</label>
                <div class="col-sm-8 ">
                  <input type="text" id="stumajor" class="form-control" placeholder="请输入专业" required/>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label">联系方式:</label>
                <div class="col-sm-8 ">
                  <input type="phone" id="stuphone" class="form-control" placeholder="请输入手机号" required/>
                </div>
              </div>

            </form>
          </div>
          <div class="panel-footer panel-success">
            <button class="btn btn-success " type="button" id="stueditBtn">确定</button>
            <button class="btn btn-success " type="button" id="stucloseBtn">关闭</button>
          </div>
        </div>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script src="/resource/js/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/resource/js/bootstrap.min.js"></script>
<script src="/resource/js/dialog.js"></script>
<script>
  $(function(){

    //退出
    $("#logout").click(function(){
      Confirm({
        msg: '你确定要退出该系统吗？',
        onOk: function(){
          window.location.href="/auth/logout";
        }
      });

    });

    $("#info").click(function(){
      //$("#userModel").modal('show');
      if(${users!=null}){
        //用户信息更改

        $("#loginuserId").val('${users.userId}');
        $("#loginusername").val('${users.username}');
        $("#loginpassword").val('${users.password}');
        $("#loginrealName").val('${users.realName}');


        $("#loginuserModel").modal({
          backdrop: 'static',//不可后退
          keyboard: false//进制键盘事件
        }).show();


      }else if(${students!=null}){
        //学生信息更改

        $("#stustuCode").val('${students.stuCode}');
        $("#stuusername").val('${students.username}');
        $("#stupassword").val('${students.password}');
        $("#sturealName").val('${students.realName}');

        $("#stucollege").val('${students.college}');
        $("#stumajor").val('${students.major}');
        $("#stuphone").val('${students.phone}');


        $("#loginstudentModal").modal({
          backdrop: 'static',//不可后退
          keyboard: false//进制键盘事件
        }).show();
      }



    });






    $("#logineditBtn").click(function(){

      //$("#loginuserModel").modal().hide();

      var userId= $("#loginuserId").val();
      var username= $("#loginusername").val();
      var password=$("#loginpassword").val();
      var realName=$("#loginrealName").val();

      var user={
        "userId":userId,
        "username":username,
        "password":password,
        "realName":realName
      };
      $.post("/users/edit",user,function(data){
        if(data&&data.success){
          // 编辑成功：隐藏显示框，刷新界面
          Alert(data.message);
          $("#loginuserModel").modal('hide');
          //刷新界面
        }else{//显示错误信息
          Alert(data['message']);
        }
      });


    });


    $("#stueditBtn").click(function(){

      var stuCode=$("#stustuCode").val();
      var username=$("#stuusername").val();
      var password= $("#stupassword").val();
      var realName=$("#sturealName").val();

      var college=$("#stucollege").val();
      var major=$("#stumajor").val();
      var phone=$("#stuphone").val();

      var student={
        "stuCode":stuCode,
        "username":username,
        "password":password,
        "realName":realName,
        "college":college,
        "major":major,
        "phone":phone

      };
      $.post("/students/edit",student,function(data){
        if(data&&data.success){
          // 编辑成功：隐藏显示框，刷新界面
          Alert(data.message);
          $("#loginstudentModal").modal('hide');

        }else{//显示错误信息
          Alert(data['message']);
        }
      });

    });

    $("#logincloseBtn").click(function(){

      $("#loginuserModel").modal().hide();

    });

    $("#stucloseBtn").click(function(){

      $("#loginstudentModal").modal().hide();

    });

  });


</script>