var web ={


    submitPageForm : function(form,pageNum){

        var url=form.action;
        url=url+"?pageNum="+pageNum;
        form.action=url;
        form.submit();
        //var url = URL(url);
    },
    /**
     * 全局参数设置
     */
    kindEditorParams:{//全局参数设置
        allowFileManager : true,
        uploadJson : '/FileUploaderController',//后台文件上传处理的路径
        filePostName : 'file'//文件的字段名，一会看到后台代码时会解释怎么使用
    },
    /**
     * 创建文件上传的按钮
     * @param uploadId 按钮id
     * @param urlId  路径回显id
     */
    createUploadButton:function(uploadId,urlId){
        var editor = KindEditor.editor(web.kindEditorParams);
        KindEditor('#'+uploadId).click(//为文件上传按钮绑定事件
            function() {
                editor.loadPlugin('image', function() {//加载文件上传插件
                    editor.plugin.imageDialog({
                        showRemote : false,
                        imageUrl : KindEditor('#'+urlId).val(),//获取本地文件路径:如:c:/doc/ccc.png文件
                        clickFn : function(url, title, width, height,
                                           border, align) {//当上传文件成功时的回调函数
                            KindEditor('#'+urlId).val(url);//将路径回显
                            editor.hideDialog();//隐藏文件上传kuang
                        }
                    });
                });
            });
    },
    /**
     * 创建富文本编辑器
     * @param textAreaId  文本框id
     */
    createKindEditor:function(textAreaId){
       return KindEditor.create('#'+textAreaId,web.kindEditorParams);
    }


};




