var types={
    //搜索表单
    search:function(form,pageNum){
        web.submitPageForm(form,pageNum);
    },
    //相关的url
    URL:{
        queryById:function(id){
           return "/types/"+id+"/detail";
        },
        editURL:function(){
            return "/types/edit";
        },
        deleteURL:function(id){
            return "/types/"+id+"/delete";
        }

    },
    //查询单个用户信息
    query:function(id){

        $.get(types.URL.queryById(id),{},function(data){

            if(data&&data.success){
               // 弹出模态框并且赋值
                $("#typeId").val(data.data['typeId']);
                $("#typeName").val(data.data['typeName']);


                $("#modal").modal({//显示弹出层
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
        var typeId=$("#typeId").val();
        var typeName=$("#typeName").val();


        var type={
            "typeId":typeId,
            "typeName":typeName

        };
        $.post(types.URL.editURL(),type,function(data){
            if(data&&data.success){
                // 编辑成功：隐藏显示框，刷新界面
                Alert(data.message);
                $("#modal").modal('hide');
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
                    $.post(types.URL.deleteURL(id),{},function(data){
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

