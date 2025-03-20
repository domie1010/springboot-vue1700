
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp"%>
<body>

<div class="container">
  <h3 class="text text-center text-primary">
    <strong>公共自行车租赁系统</strong>
  </h3>
  <div class="panel panel-primary text-center">
    <div class="panel panel-heading">
      <label class="label label-primary">
        <h4> 用户登录</h4>
      </label>
    </div>
    <div class="panel panel-body">
      <form class="form-horizontal" role="form">
        <div class="form-group">

          <strong>用户名:</strong>
          <input type="text"  id="loginusername" placeholder="请输入用户名" required>
        </div>
        <div class="form-group">

          <strong>密&nbsp;&nbsp;&nbsp;码:</strong>
          <input type="password" id="loginpassword" placeholder="请输入密码" required>
        </div>

        <div class="form-group" id="type">

          <strong>类&nbsp;&nbsp;&nbsp;型:</strong>
          <input type="radio" name="type" value="users" checked="checked"/> 管理员 <input type="radio" name="type" value="students"/> 学生
        </div>
        <div class="form-group">

          <input type="button"  id="loginBtn" class="btn btn-success" value="登录">
          <input type="button" id="registBtn" class="btn btn-danger" value="注册">
        </div>

      </form>
    </div>
  </div>
<!-- 用户注册-->
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
                    <input type="number" id="stuCode"  class="form-control" placeholder="请输入学号" required/>
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
  </div>

</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="/resource/js/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/resource/js/bootstrap.min.js"></script>
<script src="/resource/js/dialog.js"></script>
<script src="/resource/js/students/students.js"></script>

<script>

  $(function(){

    //登录
    $("#loginBtn").click(function(){

      //登录
      var username=$("#loginusername").val();
      var password=$("#loginpassword").val();
      if(username==""||password==""){
        Alert("账号或者密码不能能为空");
        return;
      }else{

        var type= $('input:radio:checked').val();
        var user ={
          "username" :username,
          "password" :password,
          "type":type
        };

       $.post("/auth/login",user,function(data){
          if(data&&data.success){
            window.location.href=data.data;
          }else{
            Alert(data.message);
          }
        });

      }

    });

    //打开注册页面
    $("#registBtn").click(function(){
      $("#studentModal").modal({//显示弹出层
        backdrop: 'static',//不可后退
        keyboard: false//进制键盘事件
      }).show();
    });
    //关闭注册界面
    $("#closeBtn").click(function(){
      $("#studentModal").modal('hide');
    });

    //注册
    $("#editBtn").click(function(){

      var stuCode=$("#stuCode").val();
      var username=$("#username").val();
      var password= $("#password").val();
      var realName=$("#realName").val();

      var college=$("#college").val();
      var major=$("#major").val();
      var phone=$("#phone").val();

      var student={
        "stuCode":stuCode,
        "username":username,
        "password":password,
        "realName":realName,

        "college":college,
        "major":major,
        "phone":phone

      };
      $.post("/students/insert",student,function(data){
        if(data&&data.success){
          // 编辑成功：隐藏显示框，刷新界面
          Alert(data.message);
          $("#studentModal").modal('hide');
          //刷新界面
        }else{//显示错误信息
          Alert(data['message']);
        }
      });

    });


  });
</script>
</body>
</html>
