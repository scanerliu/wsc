<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>医生开方</title>
    <link rel="stylesheet" href="/wx/css/drugtouch/style.css" />
	<link rel="stylesheet" href="/wx/css/drugtouch/wait_examine.css" />
	<script type="text/javascript" src="/wx/js/jquery-2.1.0.min.js"></script>
</head>
<body>
<header>
    <a href="javascript:history.go(-1);" class="back"></a>
    <h3>医生开方</h3>
</header>
<div class="examine_record">
    <ul>
    	<#if preList??>
    	<#list preList as item>
    	<a href="/wx/drug/precheckdoc/${item.id?c}">
        <li>
            <div class="examine_record_content">
                <p class="examine_record_name">患者姓名：<span>${item.patName!''}</span>
                <#if item.status == 0>
                <span class="examine_record_result wait_color">未审核</span>
                <#elseif item.passStatus == 0>
                <span class="examine_record_result wait_color">未通过</span>
                <#else>
                <span class="examine_record_result success_color">通过</span>
                </#if>
                </p>
                <p class="examine_record_name">开方医师：<span>${item.docName!''}</span></p>
                <p class="examine_record_time info_color">提交时间：<span class="info_color">${item.preDate}</span></p>
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
