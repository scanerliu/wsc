<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="zh-CN">
<title>门店---${doctor.realName!''}</title>
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
        <div class="examine">
            <div class="examine_l">
                <div class="add_drug_l bg_unimportance">
                    <div class="add_drug_type">
                        <div id="add_drug_tp" class="add_drug_tp">普通</div>
                    </div>
                    <div class="add_drug_title">
                        <h4>重庆京西医院</h4>
                        <p>(处方伐)</p>
                    </div>
                    <div class="add_drug_info">
                        <span class="add_drug_info_no">NO:${prescript.preNo!''}</span>
                        <div class="add_drug_from">
                            <label class="add_drug_in">
                                <span>科别:</span>
                                <input id="drug_category" type="text" value="${prescript.cat!''}" readonly="readonly">
                            </label>
                            <label class="add_drug_in">
                                <span>床号:</span>
                                <input id="drug_bed" type="text" value="${prescript.bedNo!''}" readonly="readonly">
                            </label>
                            <label class="add_drug_in">
                                <span>门诊号:</span>
                                <input id="drug_outpatient" type="text" value="${prescript.outpatientNo!''}" readonly="readonly">
                            </label>
                            <label class="add_drug_in">
                                <span>日期:</span>
                                <input id="drug_times" class="date_input" type="text" value="<#if prescript.preDate??>${prescript.preDate?string('yyyy-MM-dd')}</#if>" readonly="readonly">
                            </label>
                        </div>
                        <div class="add_drug_from">
                            <label class="add_drug_in">
                                <span>姓名:</span>
                                <input id="drug_name" type="text" value="${prescript.patName!''}" readonly="readonly">
                            </label>
                            <label class="add_drug_in">
                                <span>性别:</span>
                                <input id="drug_sex" type="text" value="${prescript.sex!''}" readonly="readonly">
                            </label>
                            <label class="add_drug_in">
                                <span>年&emsp;龄:</span>
                                <input id="drug_age" type="text" value="${prescript.age!''}" readonly="readonly">
                            </label>
                            <label class="add_drug_in">
                                <span>体重:</span>
                                <input id="drug_weight" type="text" value="${prescript.weight!''}" readonly="readonly">
                            </label>
                        </div>
                        <div class="add_drug_from">
                            <label class="add_drug_in">
                                <span>过敏史:</span>
                                <input id="drug_anaphylaxis" class="add_drug_in1" type="text" value="${prescript.allergy!''}" readonly="readonly">
                            </label>
                        </div>
                        <div class="add_drug_from">
                            <label class="add_drug_in">
                                <span>初步诊断:</span>
                                <input id="drug_diagnosis" class="add_drug_in2" type="text" value="${prescript.diagnosis!''}" readonly="readonly">
                            </label>
                        </div>
                    </div>
                    <div class="add_drug_list">
                        <span class="add_drug_info_no">Rp</span>
                        <ul>
                        	<#if prescript?? && prescript.drugs??>
                        	<#list prescript.drugs as drug>
                            <li>
                                <div class="add_drug_item">
                                    <p class="add_drug_item_name">${drug_index+1}、${drug.drug!''}  ${drug.specification!''}</p>
                                    <p class="add_drug_item_explain">用量：${drug.dosage!''}</p>
                                    <p class="add_drug_item_explain">用法：${drug.administration!''}</p>
                                </div>
                            </li>
                            </#list>
                            </#if>
                        </ul>
                    </div>
                    <div class="add_drug_staff bg_important">
                        <div class="add_drug_from staff_space">
                            <label class="add_drug_in staff_space1">
                                <span>医师:</span>
                                <input id="drug_pharmacist" class="bg_important" type="text">
                                <img src="${prescript.docImg!''}" alt="">
                            </label>
                            <label class="add_drug_in staff_space1">
                                <span>药&emsp;&emsp;师:</span>
                                <input id="drug_pharmacist" class="bg_important" type="text">
                                <img src="${prescript.phaImg!''}" alt="">
                            </label>
                        </div>
                        <div class="add_drug_from">
                            <label class="add_drug_in staff_space1">
                                <span>审核:</span>
                                <input id="drug_examine" class="bg_important" type="text">
                            </label>
                            <label class="add_drug_in staff_space1">
                                <span>配药人员:</span>
                                <input id="drug_dispensing" class="bg_important" type="text">
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
