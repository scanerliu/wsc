<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<title>订单发货窗口</title>
<link href="/management/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" charset="utf-8" src="/management/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/management/js/common.js"></script>
<script type="text/javascript">
    var api = top.dialog.get(window); //获取窗体对象
    var W = api.data; //获取父对象
    //页面加载完成执行
    $(function () {
        //设置按钮及事件
        api.button([{
            value: '确定',
            callback: function () {
                submitForm();
            },
            autofocus: true
        }, {
            value: '取消',
            callback: function () { }
        }]);
    });

    //提交表单处理
    function submitForm() {
        var currDocument = $(document); //当前文档
        //验证表单
        if ($("#logisticTitleId").val() == "") {
            top.dialog({
                title: '提示',
                content: '请选择配送方式！',
                okValue: '确定',
                ok: function () { },
                onclose: function () {
                    $("#logisticTitleId", currDocument).focus();
                }
            }).showModal(api);
            return false;
        }
        if ($("#ddlExpressId").val() == "") {
            top.dialog({
                title: '提示',
                content: '请选择配送方式！',
                okValue: '确定',
                ok: function () { },
                onclose: function () {
                    $("#ddlExpressId", currDocument).focus();
                }
            }).showModal(api);
            return false;
        }
        //组合参数
        var postData = {
            "orderNo": $("#spanOrderNo", W.document).text(), 
            "logisticTitle": $("#logisticTitleId").val(), 
            "logisticNo": $("#txtExpressNo").val()
        };
        //判断是否需要输入物流单号
        if ($("#txtExpressNo").val() == "") {
            top.dialog({
                title: '提示',
                content: '您确定不填写物流单号吗？',
                okValue: '确定',
                ok: function () {
                    //发送AJAX请求
                    W.sendAjaxUrl(api, postData, "/management/order/update?action=orderExpress");
                },
                cancelValue: '取消',
                cancel: function () {
                    $("#txtExpressNo", currDocument).focus();
                }
            }).showModal(api);
            return false;
        } else {
            //发送AJAX请求
            W.sendAjaxUrl(api, postData, "/management/order/update?action=orderExpress");
            return false;
        }
        return false;
    }
</script>
</head>

<body>
<form method="post" action="" id="form1">
<div class="aspNetHidden">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="">
</div>
<div class="div-content">
  <dl>
    <dt>物流公司名称</dt>
    <dd>
      <input type="text" id="logisticTitleId" name="logisticTitle" class="input txt">
    </dd>
  </dl>
  <dl>
    <dt>发货物流单号</dt>
    <dd><input name="logisticNo" type="text" id="txtExpressNo" class="input txt"></dd>
  </dl>
</div>
</form>


</body></html>