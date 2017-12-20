<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <link href="/wx/css/doctor_drug.css" rel="stylesheet" type="text/css" />
    <link href="/wx/css/date.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/wx/js/jquery-2.1.0.min.js"></script>
    <script type="text/javascript" src="/wx/js/jquery-date.js"></script>
    <title>审核</title>
</head>

<body>
<form>
<input type="hidden" value="${doc.autograph!''}" name="phaImg">
<input type="hidden" value="${doc.name!''}" name="phaName">
<input type="hidden" value="${pre.id?c}" name="id">
<input type="hidden" value="" name="passStatus">
<input type="hidden" value="" name="mark">
<input type="hidden" value="" name="">
<input type="hidden" value="" name="">
<input type="hidden" value="" name="">
</form>
<div class="drug">
    <div class="add_drug lssue">
        <div class="lssue_logo">
            <img src="/wx/images/drug/logo.png" alt="">
            <h4>真善美执业药师</h4>
        </div>
        <div class="examine">
            <div class="examine_l">
                <div class="examine_info">
                    <p>审核编号：<span>${pre.preNo!''}</span></p>
                    <p>申请账号：<span>${pre.store!''}</span></p>
                    <p>时间：<span>${pre.preDate}</span></p>
                </div>
                <div class="examine_lssue">
                    <img src="${pre.imgUrl!''}" alt="">
                </div>

                <div class="add_drug_staff bg_important">
                    <div class="staff_space">
                        <label class="add_drug_in staff_space1">
                            <span>医师:</span>
                            <input id="drug_physician" class="bg_important" type="text">
                            <img src="/wx/images/drug/name.png" alt="">
                        </label>
                    </div>
                </div>

            </div>
            <div class="examine_r">
                <p class="examine_title">审核结果:</p>
                <label class="examine_click">
                    <img src="/wx/images/drug/not_chick.png" alt="">
                    <span>通过</span>
                </label>
                <label class="examine_click">
                    <img src="/wx/images/drug/not_chick.png" alt="">
                    <span>不通过</span>
                </label>
                <div class="add_drug_remarks_space examine_quarantine">
                    <span class="prompt">*原因:</span>
                    <form id="formId" method="POST" action="/wx/examine/update">
                    <textarea id="reason" name="mark"></textarea>
					<input type="hidden" value="${doc.autograph!''}" name="phaImg">
					<input type="hidden" value="${doc.name!''}" name="phaName">
					<input type="hidden" value="${pre.id?c}" name="id">
					<input type="hidden" id="choseId" value="" name="passStatus">
					<input type="hidden" value="" name="">
					<input type="hidden" value="" name="">
					<input type="hidden" value="" name="">
					</form>
                </div>
            </div>
        </div>
    </div>
    <div class="add_drug_bottom">
        <div class="add_drug_submit2">
            <button id="submits">提交</button>
            <button id="cancel" class="add_drug_submit1">取消</button>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="/wx/js/pc_doctor.js"></script>
<script type="text/javascript">
// 审核单选
$('.examine_click').on('click', function () {
    console.log();
    if ($('.examine_click').index($(this)) === 0) {
    $("#choseId").val(0);
    }
    else
    {
     $("#choseId").val(1);
    }
    $.each($('.examine_click').find('img'), function (i, item) {
        $(item).attr('src', '/wx/images/drug/not_chick.png')
    });
    $($(this).find('img')[0]).attr('src', '/wx/images/drug/chick.png');
    $('#reason').attr('placeholder', '');
    if ($('.examine_click').index($(this)) === 1) {
        $('#reason').attr('placeholder', '请填写不通过原因')
    }
});
$('#submits').on('click', function () {
$("#formId").submit();
});
</script>
</html>