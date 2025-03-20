var order={
    //搜索表单
    search:function(form,pageNum){
        web.submitPageForm(form,pageNum);
    },
    //用户相关的url
    URL:{
        queryById:function(id){
           return "/order/"+id+"/detail";
        },
        editURL:function(){
            return "/order/edit";
        },
        deleteURL:function(id){
            return "/order/"+id+"/delete";
        }

    },

    toEdit:function(orderid,state){
        $("#orderId").val(orderid);
        $("#orderState").val(state);
        //打开弹出框
        $("#modal").modal({//显示弹出层
            backdrop: 'static',//不可后退
            keyboard: false//进制键盘事件
        }).show();

    },

    //编辑信息
    edit:function(){
        var orderId=$("#orderId").val();
        var orderState=$("#orderState").val();

        var orders={
            "orderId":orderId,
            "orderState":orderState
        };
        $.post(order.URL.editURL(),orders,function(data){
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
                    $.post(order.URL.deleteURL(id),{},function(data){
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

