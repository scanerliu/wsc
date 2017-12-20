<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>审核状态</title>
    <link rel="stylesheet" href="/wx/css/drugtouch/style.css" />
	<link rel="stylesheet" href="/wx/css/drugtouch/wait_examine.css" />
	<script type="text/javascript" src="/wx/js/jquery-2.1.0.min.js"></script>
</head>
<body>
<header>
    <a href="javascript:history.go(-1);" class="back"></a>
    <h3>审核状态</h3>
    <#--<a href="" class="record">审方记录</a>-->
</header>
<div class="wait_examine">
    <div class="wait_examine_icon">
        <img src="/wx/images/drugtouch/wait.png" alt="">
        <span class="<#if pre.status==0>wait_color<#else><#if pre.passStatus==0>wait_color<#else>success_color</#if></#if>"><#if pre.status==0>待审核<#else><#if pre.passStatus==0>未通过<#else>已通过</#if></#if></span>
    </div>
    <div class="wait_examine_info">
        <p class="wait_examine_txt"><span class="wait_examine_name">${pre.phaName!''}</span>
        <#if pre.status==0>
        执业药师正在为您审核处方单，请稍后再 来查询结果！
        <#else><#if pre.passStatus==0>
        业药师审核了您的处方单，但是没有通过。
        <#else>
        业药师审核了您的处方单，并且通过了审核。
        </#if></#if>
        </p>
        <p class="wait_examine_time">提交时间：${pre.preDate}</p>
    </div>
    <div class="wait_examine_img">
        <img src="${pre.imgUrl!''}" alt="">
    </div>
</div>
</body>
<script>
    (function (doc, win) {
        var docEl = doc.documentElement,
            resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
            recalc = function () {
                var clientWidth = docEl.clientWidth;
                if (!clientWidth) return;
                if (clientWidth >= 640) {
                    docEl.style.fontSize = '100px';
                } else {
                    docEl.style.fontSize = 100 * (clientWidth / 640) + 'px';
                }
            };

        if (!doc.addEventListener) return;
        win.addEventListener(resizeEvt, recalc, false);
        doc.addEventListener('DOMContentLoaded', recalc, false);
    })(document, window);
</script>
</html>
