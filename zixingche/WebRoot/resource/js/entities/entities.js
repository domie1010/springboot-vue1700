var entities={
    //搜索表单
    editor:null,
    isCreateKE:false,
    search:function(form,pageNum){
        web.submitPageForm(form,pageNum);
    },
    //用户相关的url
    URL:{
        queryURL:function(id){
           return "/entity/"+id+"/detail";
        },
        editURL:function(){
            return "/entity/edit";
        },
        deleteURL:function(userid){
            return "/entity/"+userid+"/delete";
        }

    },
    //查询单个用户信息
    query:function(id){

        $.get(entities.URL.queryURL(id),{},function(data){

            if(data&&data.success){
               // 弹出模态框并且赋值
                $("#entityid").val(data.data['entityid']);
                $("#entityName").val(data.data['entityName']);
                $("#fkTypeid").val(data.data['fkTypeid']);
                $("#price").val(data.data['price']);
                $("#entityInfo").val(data.data['entityInfo']);
                $("#entityImage").val(data.data['entityImage']);
                $("#entityDesc").val(data.data['entityDesc']);

                if(!entities.isCreateKE){
                    entities.editor= web.createKindEditor('entityDesc');
                    entities.isCreateKE = true;
                }

                entities.editor.html(data.data['entityDesc']);
                //初始化ke

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
        var entityid=$("#entityid").val();
        var entityName=$("#entityName").val();
        var fkTypeid=$("#fkTypeid").val();
        var price=$("#price").val();
        var entityInfo=$("#entityInfo").val();
        var entityImage=$("#entityImage").val();
        var entityDesc=entities.editor.html();

        var entity={
            "entityid":entityid,
            "entityName":entityName,
            "fkTypeid":fkTypeid,
            "price":price,

            "entityInfo":entityInfo,
            "entityImage":entityImage,
            "entityDesc":entityDesc

        };
        $.post(entities.URL.editURL(),entity,function(data){
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
                    $.post(entities.URL.deleteURL(id),{},function(data){
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

