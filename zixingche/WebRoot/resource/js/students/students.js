var students={
    //搜索表单
    search:function(form,pageNum){
        web.submitPageForm(form,pageNum);
    },
    //相关的url
    URL:{
        queryById:function(id){
           return "/students/"+id+"/detail";
        },
        editURL:function(){
            return "/students/edit";
        },
        deleteURL:function(id){
            return "/students/"+id+"/delete";
        }

    },
    //查询单个用户信息
    query:function(id){

        $.get(students.URL.queryById(id),{},function(data){

            if(data&&data.success){
               // 弹出模态框并且赋值
                $("#stuCode").val(data.data['stuCode']);
                $("#username").val(data.data['username']);
                $("#password").val(data.data['password']);
                $("#realName").val(data.data['realName']);

                $("#college").val(data.data['college']);
                $("#major").val(data.data['major']);
                $("#account").val(data.data['account']);
                $("#phone").val(data.data['phone']);

                $("#studentModal").modal({//显示弹出层
                    backdrop: 'static',//不可后退
                    keyboard: false//进制键盘事件
                }).show();
            }else{
                $("#success").show();
            }
        });
    },
    //编辑用户信息
    edit:function(){
        var stuCode=$("#stuCode").val();
        var username=$("#username").val();
        var password= $("#password").val();
        var realName=$("#realName").val();

        var college=$("#college").val();
        var major=$("#major").val();
        var account=$("#account").val();
        var phone=$("#phone").val();

        var student={
            "stuCode":stuCode,
            "username":username,
            "password":password,
            "realName":realName,

            "college":college,
            "major":major,
            "account":account,
            "phone":phone,

        };
        $.post(students.URL.editURL(),student,function(data){
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
    delete:function(id){
        if(id&&!isNaN(id)){
            Confirm({
                msg: '你确定要删除该数据吗？',
                onOk: function(){
                    $.post(students.URL.deleteURL(id),{},function(data){
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

