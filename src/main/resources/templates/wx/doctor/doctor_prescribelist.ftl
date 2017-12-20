<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="zh-CN">
<title>处方历史列表---${doctor.name!''}</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="copyright" content="" />
<!--[if IE]>
   <script src="js/html5.js"></script>
<![endif]-->


<link href="/wx/css/doctor_drug.css" rel="stylesheet" type="text/css" />
<link href="/wx/css/date.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/wx/js/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="/wx/js/jquery-date.js"></script>
</head>
<body>
<div class="drug">
    <div class="add_drug lssue">
        <div class="lssue_logo">
            <img src="/wx/images/drug/logo.png" alt="">
            <h4>真善美执业医师</h4>
        </div>
        <div class="lssue_condition">
        	<form id="searchform">
            <label class="lssue_condition_item lssue_condition_quarantine lssue_condition_quarantine1">
                <span>状态:</span>
                <select id="select_state" name="status" class="lssue_condition_item_quarantine">
                    <option value="">--请选择状态--</option>
                    <option value="0">待审核</option>
                    <option value="1">已审核</option>
                </select>
            </label>
            <label class="lssue_condition_item lssue_condition_quarantine">
                <span>结果:</span>
                <select id="select_result" name="passStatus" class="lssue_condition_item_quarantine">
                    <option value="">--请选择结果--</option>
                    <option value="0">未通过</option>
                    <option value="2">已通过</option>
                </select>
            </label>
            <label class="lssue_condition_item">
                <span>日期:</span>
                <input id="drug_times1" name="starDate" class="date_input lssue_condition_item_quarantine" type="text">
            </label>
            —
            <label class="lssue_condition_item">
                <input id="drug_times2" name="endDate" class="date_input" type="text">
            </label>
            <div id="lssue_search_sub" class="lssue_search_btn" onclick="searchPrescriptions(true)">
                <img src="/wx/images/drug/search1.png" alt="">
            </div>
            <a href="/wx/doctor/prescribe">
                <button class="lssue_condition_add">新增处方</button>
            </a>
            </form>
        </div>
        <div id="results">
        </div>
    </div>
</div>
<script type="text/javascript" src="/wx/js/pc_doctor.js"></script>
<script type="text/javascript">
$(function (){
	searchPrescriptions(true);
});
</script>
</body>
</html>
