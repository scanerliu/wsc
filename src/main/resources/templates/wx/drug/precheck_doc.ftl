<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>处方详情</title>
    <link rel="stylesheet" href="/wx/css/drugtouch/style.css" />
	<link rel="stylesheet" href="/wx/css/drugtouch/wait_examine.css" />
	<script type="text/javascript" src="/wx/js/jquery-2.1.0.min.js"></script>
    <script type="text/javascript" src="/wx/js/html2canvas.js"></script>
</head>
<body>
<header>
    <a href="javascript:history.go(-1);" class="back"></a>
    <h3>处方详情</h3>
</header>
<div class="pharmacist_info">
    <div class="pharmacist_form">
        <div class="add_drug_type">
            <div id="add_drug_tp" class="add_drug_tp">普通</div>
        </div>
        <div class="add_drug_title">
            <h4>重庆京西医院</h4>
            <p>(处方伐)</p>
        </div>
        <div class="add_drug_info">
            <span class="add_drug_info_no">${pre.preNo!''}</span>
            <div class="add_drug_from">
                <label class="add_drug_in">
                    <span>科&emsp;别:</span>
                    <input disabled id="drug_category" value="${pre.cat!''}" type="text">
                </label>
                <label class="add_drug_in">
                    <span>床号:</span>
                    <input disabled id="drug_category" value="${pre.bedNo!''}" type="text">
                </label>
            </div>
            <div class="add_drug_from">
                <label class="add_drug_in">
                    <span>门诊号:</span>
                    <input disabled id="drug_category" value="${pre.outpatientNo!''}" type="text">
                </label>
                <label class="add_drug_in">
                    <span>日期:</span>
                    <input disabled id="drug_category" value="${pre.preDate!''}" type="text">
                </label>
            </div>
            <div class="add_drug_from">
                <label class="add_drug_in">
                    <span>姓&emsp;名:</span>
                    <input disabled id="drug_category" value="${pre.patName!''}" type="text">
                </label>

                <label class="add_drug_in">
                    <span>性别:</span>
                    <input disabled id="drug_category" value="${pre.sex!''}" type="text">
                </label>
            </div>
            <div class="add_drug_from">
                <label class="add_drug_in">
                    <span>年&emsp;龄:</span>
                    <input disabled id="drug_category" value="${pre.age!''}" type="text">
                </label>
                <label class="add_drug_in">
                    <span>体重:</span>
                    <input disabled id="drug_category" value="${pre.weight!''}" type="text">
                </label>
            </div>
            <div class="add_drug_from">
                <label class="add_drug_in">
                    <span>过敏史:</span>
                    <input disabled id="drug_category" class="add_drug_in1" value="${pre.allergy!''}" type="text">
                </label>
            </div>
            <div class="add_drug_from">
                <label class="add_drug_in">
                    <span>初步诊断:</span>
                    <input disabled id="drug_category" class="add_drug_in2" value="${pre.diagnosis!''}" type="text">
                </label>
            </div>
        </div>
        <div class="add_drug_list">
            <span class="add_drug_info_no">Rp</span>
            <ul>
            	<#if pre.drugs?? && pre.drugs?size gt 0>
            	<#list pre.drugs as item>
                <li>
                    <div class="add_drug_item">
                        <p class="add_drug_item_name">${item.drug!''}</p>
                        <p class="add_drug_item_explain">用量：${item.administration!''}</p>
                        <p class="add_drug_item_explain">用法：${item.Dosage!''}</p>
                    </div>
                </li>
                </#list>
                </#if>
            </ul>
        </div>
        <div class="add_drug_staff">
            <div class="add_drug_from staff_space">
                <label class="staff_space1">
                    <span>医师:</span>
                    <img src="${pre.docImg!''}" alt="">
                </label>
                <label class="staff_space1">
                    <span>药&emsp;&emsp;师:</span>
                    <img src="${pre.phaImg!''}" alt="">
                </label>
            </div>
            <div class="add_drug_from">
                <label class="staff_space1">
                    <span>审核:</span>
                    <input disabled class="staff_space1_input" id="drug_examine" type="text">
                </label>
                <label class="staff_space1">
                    <span>配药人员:</span>
                    <input disabled class="staff_space1_input" id="drug_dispensing" type="text">
                </label>
            </div>
        </div>
    </div>
</div>
<footer>
    <div class="pharmacist_btn1">取消</div>
    <div id="html2canvas" class="pharmacist_btn2">保存图片</div>
</footer>
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

    $('#html2canvas').on('click', function () {
        var targetDom = $(".pharmacist_form");
        var copyDom = targetDom.clone();
        copyDom.width(targetDom.width() + "px");
        copyDom.height(targetDom.height() + "px");
        $(copyDom).attr('style', 'position: absolute; z-index: 0;')
        $(copyDom).attr('id', 'copyDom')
        $('body').append(copyDom);
        html2canvas(copyDom, {
            height: $(".pharmacist_form").outerHeight(),
            onrendered: function (canvas) {
                var imgURL = canvas.toDataURL("image/png");
                console.warn(imgURL);
                $('#copyDom').remove()
            }
        });
    })
</script>
</html>
