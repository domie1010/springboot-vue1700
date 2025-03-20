var users={
    //搜索表单
    search:function(form,pageNum){
        web.submitPageForm(form,pageNum);
    },
    //用户相关的url
    URL:{
        queryUserById:function(id){
           return "/users/"+id+"/detail";
        },
        editUserURL:function(){
            return "/users/edit";
        },
        deleteUserURL:function(userid){
            return "/users/"+userid+"/delete";
        }

    },
    //查询单个用户信息
    queryUser:function(userid){

        $.get(users.URL.queryUserById(userid),{},function(data){

            if(data&&data.success){
               // 弹出模态框并且赋值
                $("#userId").val(data.data['userId']);
                $("#username").val(data.data['username']);
                $("#password").val(data.data['password']);
                $("#realName").val(data.data['realName']);
                $("#userModel").modal({//显示弹出层
                    backdrop: 'static',//不可后退
                    keyboard: false//进制键盘事件
                }).show();
            }else{
                $("#success").show();
            }
        });
    },
    //编辑用户信息
    editUser:function(){
        var userId= $("#userId").val();
        var username= $("#username").val();
        var password=$("#password").val();
        var realName=$("#realName").val();

        var user={
            "userId":userId,
            "username":username,
            "password":password,
            "realName":realName
        };
        $.post(users.URL.editUserURL(),user,function(data){
            if(data&&data.success){
                // 编辑成功：隐藏显示框，刷新界面
                Alert(data.message);
                $("#userModel").modal('hide');
                //刷新界面
                window.location.reload();

            }else{//显示错误信息
                Alert(data['message']);
            }
        });

    },
    //删除用户
    deleteUser:function(userid){
        if(userid&&!isNaN(userid)){
            Confirm({
                msg: '你确定要删除该数据吗？',
                onOk: function(){
                    $.post(users.URL.deleteUserURL(userid),{},function(data){
                        if(data){
                            Alert(data.message);
                            window.location.reload();
                        }
                    });
                },
                onCancel: function(){
                }

            });
        }
    }



}

