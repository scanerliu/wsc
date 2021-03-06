<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>审核记录</title>
    <link rel="stylesheet" href="/wx/css/drugtouch/style.css" />
	<link rel="stylesheet" href="/wx/css/drugtouch/wait_examine.css" />
	<script type="text/javascript" src="/wx/js/jquery-2.1.0.min.js"></script>
</head>
<body>
<header>
    <a href="javascript:history.go(-1);" class="back"></a>
    <h3>审核记录</h3>
</header>
<div class="examine_record">
    <ul>
    	<#if preList??>
    	<#list preList as item>
    	<a href="/wx/drug/precheck/${item.id?c}">
        <li>
            <div class="examine_record_info">
                <p class="examine_record_code">审核编号：<span>${item.preNo!''}</span></p>
                <p class="examine_record_state <#if item.status==0>wait_color<#else><#if item.passStatus==0>wait_color<#else>success_color</#if></#if>"><#if item.status==0>待审核<#else><#if item.passStatus==0>未通过<#else>已通过</#if></#if></p>
            </div>
            <div class="examine_record_content">
                <p class="examine_record_name">审核药师：<span>${item.phaName!''}</span></p>
                <p class="examine_record_time">提交时间：<span>${item.preDate}</span></p>
            </div>
        </li>
        </a>
        </#list>
        </#if>
    </ul>
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
