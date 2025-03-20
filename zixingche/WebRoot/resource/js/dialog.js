var Modal = (function ($) {
    var $body = $(document.body),
        BackDrop = (function () {
            var $backDrop,
                count = 0,
                create = function () {
                    $backDrop = $('<div class="modal-backdrop fade in"></div>').appendTo($body);
                };

            return {
                show: function () {
                    !$backDrop && create();
                    $backDrop[0].style.display = 'block';
                    count++;
                },
                hide: function () {
                    count--;
                    if (!count) {
                        $backDrop.remove();
                        $backDrop = undefined;
                    }
                }
            }
        })(),
        getTpl = function () {
            return ['<div class="modal fade" data-backdrop="false" data-show="false" data-keyboard="false">',
                '    <div class="modal-dialog">',
                '        <div class="modal-content">',
                '            <div class="modal-header">',
                '                <h4 class="modal-title"></h4>',
                '            </div>',
                '            <div class="modal-body"></div>',
                '            <div class="modal-footer"></div>',
                '        </div>',
                '    </div>',
                '</div>'].join("");
        },
        initModal = function (that, opts) {
            var $modal = createModal(that);
            that.setTitle(opts.title);
            that.setContent(opts.content);
            that.addButtons(opts.buttons);
            that.setWidth(opts.width);
            bindHandler(that, opts);
            $modal.modal();//调用bootstrap的Modal组件
            $modal.trigger('contentReady');
        },
        createModal = function (that) {
            var $modal = that.$modal = $(getTpl()).appendTo($body);
            that.$modalTitle = $modal.find('.modal-title');
            that.$modalBody = $modal.find('.modal-body');
            that.$modalFooter = $modal.find('.modal-footer');
            return $modal;
        },
        bindHandler = function (that, opts) {
            var $modal = that.$modal;
            typeof opts.onContentChange === 'function' && $modal.on('contentChange', $.proxy(opts.onContentChange, that));
            typeof opts.onContentReady === 'function' && $modal.on('contentReady', $.proxy(opts.onContentReady, that));
            typeof opts.onModalShow === 'function' && $modal.on('modalShow', $.proxy(opts.onModalShow, that));
            typeof opts.onModalHide === 'function' && $modal.on('modalHide', $.proxy(opts.onModalHide, that));
            $modal.on('show.bs.modal', function () {
                $modal.trigger('modalShow');
            });
            $modal.on('hidden.bs.modal', function () {
                $modal.trigger('modalHide');
            });
        },
        getDefaultBtnCallbackProxy = function (callbackName) {
            return function () {
                var opts = this.options,
                    callback = opts[callbackName] && typeof opts[callbackName] === 'function' ? opts[callbackName] : '';

                return callback && callback.apply(this, arguments);
            }
        };

    function ModalDialog(options) {
        this.options = this.getOptions(options);
        this.$modal = undefined;
        this.$modalTitle = undefined;
        this.$modalBody = undefined;
        this.$modalFooter = undefined;
        this.state = undefined;
    }

    ModalDialog.defaults = {
        title: '',
        content: '',
        width: 600,
        buttons: [
            {
                html: '<button type="button" class="btn btn-sm btn-primary btn-ok">确定</button>',
                selector: '.btn-ok',
                callback: getDefaultBtnCallbackProxy('onOk')
            },
            {
                html: '<button type="button" class="btn btn-sm btn-default btn-cancel">取消</button>',
                selector: '.btn-cancel',
                callback: getDefaultBtnCallbackProxy('onCancel')
            }
        ],
        onOk: $.noop,
        onCancel: $.noop,
        onContentReady: $.noop,
        onContentChange: $.noop,//content替换之后的回调
        onModalShow: $.noop,
        onModalHide: $.noop//modal关闭之后的回调
    };

    $.extend(ModalDialog.prototype, {
        getOptions: function (options) {
            return $.extend({}, ModalDialog.defaults, options || {});
        },
        setOptions: function (options) {
            return $.extend(this.options, options || {});
        },
        open: function (state) {
            this.state = state;
            !this.$modal && initModal(this, this.options);
            BackDrop.show();
            this.$modal.modal('show');
        },
        hide: function () {
            var $modal = this.$modal;
            $modal.modal('hide');
            $modal.one('hidden.bs.modal', function () {
                BackDrop.hide();
            });
        },
        setTitle: function (title, html) {
            this.$modalTitle[html === true ? 'html' : 'text'](title);
        },
        setContent: (function () {
            var init = true;
            return function (content) {
                this.$modalBody.html(content);
                !init ? this.$modal.trigger('contentChange') : (init = false);
            }
        })(),
        addButtons: function (buttons) {
            var buttons = !$.isArray(buttons) ? [] : buttons,
                that = this,
                htmlS = [];
            buttons.forEach(function (btn) {
                htmlS.push(btn.html);

                btn.selector && that.$modal.on('click', btn.selector, $.proxy(function (e) {

                    var self = this,
                        $btn = $(e.currentTarget);

                    //先禁用按钮
                    $btn[0].disabled = true;

                    var callback = typeof btn.callback === 'function' ? btn.callback : '',
                        ret = callback && callback.apply(self, arguments);

                    if (ret === false) {
                        $btn[0].disabled = false;
                        return;
                    }

                    if (typeof(ret) === 'object' && 'done' in ret && typeof ret['done'] === 'function') {
                        //异步任务只有在成功回调的时候关闭Modal
                        ret.done(function () {
                            that.hide();
                        }).always(function () {
                            $btn[0].disabled = false;
                        });
                    } else {
                        $btn[0].disabled = false;
                        that.hide();
                    }

                }, that));
            });

            this.$modalFooter.prepend($(htmlS.join('')));
        },
        hideButton: function (selector) {
            selector && this.$modalFooter.find(selector).hide();
        },
        showButton: function (selector) {
            selector && this.$modalFooter.find(selector).show();
        },
        setWidth: function (width) {
            this.$modal.find('.modal-dialog').css('width', width);
        }
    });

    //针对这些方法统一加个校验
    ['setTitle', 'setContent', 'addButtons', 'hideButton', 'showButton', 'setWidth'].forEach(function (name) {
        var _old = ModalDialog.prototype[name];
        ModalDialog.prototype[name] = function () {
            if (!arguments.length || !this.$modal) {
                return;
            }
            return _old.apply(this, arguments);
        }
    });

    return ModalDialog;
})(jQuery);

var Alert, Confirm;
(function () {
    var modal,
        Proxy = function (isAlert) {
            return function () {
                if (arguments.length != 1) return;
                var msg = typeof arguments[0] === 'string' && arguments[0] || arguments[0].msg || '',
                    onOk = typeof arguments[0] === 'object' && typeof arguments[0].onOk === 'function' && arguments[0].onOk,
                    onCancel = typeof arguments[0] === 'object' && typeof arguments[0].onCancel === 'function' && arguments[0].onCancel,
                    width = typeof arguments[0] === 'object' && arguments[0].width || 400,
                    _onModalShow = function () {
                        this.setWidth(width);
                        this.setContent(msg);
                        this[(isAlert ? 'hide' : 'show') + 'Button']('.btn-cancel');
                    },
                    _onModalHide = function () {
                        this.setContent('');
                    };

                //延迟初始化modal
                if(!modal) {
                    modal = new Modal({
                        'title': '操作提示',
                        onModalShow: _onModalShow,
                        onModalHide: _onModalHide,
                        onContentReady: function(){
                            this.$modalBody.css({
                                'padding-top': '30px',
                                'padding-bottom': '30px'
                            })
                        }
                    });
                } else {
                    var $modal = modal.$modal;
                    //如果modal已经初始化则需要重新监听事件
                    $modal.off('modalShow modalHide');
                    $modal.off('modalShow modalHide');
                    $modal.on('modalShow', $.proxy(_onModalShow, modal));
                    $modal.on('modalHide', $.proxy(_onModalHide, modal));
                }

                modal.setOptions({
                    onOk: onOk || $.noop,
                    onCancel: onCancel || $.noop
                });

                modal.open();
            }
        };

    Alert = Proxy(true);
    Confirm = Proxy();
})();