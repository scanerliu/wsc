<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="zh-CN">
<title>开处方---${doctor.name!''}</title>
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
<script type="text/javascript">

$(function (){
	
});
</script>

</head>
<body>
<div class="drug">
    <div class="chick_prompt_mask"></div>
    <div class="chick_prompt">
        <p>当前处方中有该门店药品，请先删除药品后才能更改门店</p>
        <button class="close_chick_prompt">知道了</button>
    </div>
    <div class="pharmacist_prompt">
        <p>请选择审核药师</p>
        <button class="close_chick_prompt">知道了</button>
    </div>
    <div class="verification_prompt">
        <p>表单不完整</p>
        <button class="close_chick_prompt">知道了</button>
    </div>
    <div class="add_drug">
    	<form id="addprescriptionform">
        <div class="add_drug_l">
            <div class="add_drug_type">
                <div id="add_drug_tp" class="add_drug_tp">普通</div>
            </div>
            <div class="add_drug_title">
                <h4>重庆京西医院</h4>
                <p>(处方伐)</p>
            </div>
            <div class="add_drug_info">
            	<input name="preNo" type="hidden" value="${no!''}">
                <span class="add_drug_info_no">NO:${no!''}</span>
                <div class="add_drug_from">
                    <label class="add_drug_in">
                        <span>科别:</span>
                        <input id="drug_category" type="text" name="cat">
                    </label>
                    <label class="add_drug_in">
                        <span>床号:</span>
                        <input id="drug_bed" type="number" name="bedNo">
                    </label>
                    <label class="add_drug_in">
                        <span>门诊号:</span>
                        <input id="drug_outpatient" type="number" name="outpatientNo">
                    </label>
                    <label class="add_drug_in">
                        <span>日期:</span>
                        <input id="drug_times" class="date_input" type="text" name="preDate">
                    </label>
                </div>
                <div class="add_drug_from">
                    <label class="add_drug_in">
                        <span>姓名:</span>
                        <input id="drug_name" type="text" name="patName">
                    </label>
                    <label class="add_drug_in">
                        <span>性别:</span>
                        <input id="drug_sex" type="text" name="sex">
                    </label>
                    <label class="add_drug_in">
                        <span>年&emsp;龄:</span>
                        <input id="drug_age" type="number" name="age">
                    </label>
                    <label class="add_drug_in">
                        <span>体重:</span>
                        <input id="drug_weight" type="number" name="weight">
                    </label>
                </div>
                <div class="add_drug_from">
                    <label class="add_drug_in">
                        <span>过敏史:</span>
                        <input id="drug_anaphylaxis" class="add_drug_in1" type="text" name="allergy">
                    </label>
                </div>
                <div class="add_drug_from">
                    <label class="add_drug_in">
                        <span>初步诊断:</span>
                        <input id="drug_diagnosis" class="add_drug_in2" type="text" name="diagnosis">
                    </label>
                </div>
            </div>
            <div class="add_drug_list">
                <span class="add_drug_info_no">Rp</span>
                <ul>
                    
                </ul>
            </div>
            <div class="add_drug_staff">
                <div class="add_drug_from staff_space">
                    <label class="add_drug_in staff_space1">
                        <span>医师:</span>
                        <input id="drug_physician" class="add_drug_in3" type="text">
                    </label>
                    <label class="add_drug_in staff_space1">
                        <span>审核:</span>
                        <input id="drug_examine" class="add_drug_in3" type="text">
                    </label>
                </div>
                <div class="add_drug_from">
                    <label class="add_drug_in staff_space1">
                        <span>药&emsp;&emsp;师:</span>
                        <input id="drug_pharmacist" class="add_drug_in3" type="text">
                    </label>
                    <label class="add_drug_in staff_space1">
                        <span>配药人员:</span>
                        <input id="drug_dispensing" class="add_drug_in3" type="text">
                    </label>
                </div>
            </div>
        </div>
        <div class="add_drug_r">
            <div class="add_drug_head">
                <img src="/wx/images/drug/doctor.png" alt="">
                <span>添加药品</span>
            </div>
            <div class="add_drug_choice">
                <p><span class="prompt">*</span>选择门店:</p>
                <select id="select_name" name="store">
                	<option value="">--请选择门店--</option>
                	<#if deptList??>
                	<#list deptList as dept>
                	<option value="${dept.keyname!''}">${dept.keyname!''}</option>
                	</#list>
                	</#if>
                </select>
            </div>
            <div id="search" style="display: none">
                <div class="add_drug_search">
                    <input id="search_val" name="keyword" type="text">
                    <div id="search_sub" class="add_drug_search_btn">
                        <img src="/wx/images/search.png" alt="">
                    </div>
                    <input id="selectdept" name="dept" type="hidden" value="">
                </div>
                <div class="add_drug_entry" id="druglist">
                    
                </div>
                <div id="remarks" style="display: none" class="add_drug_remarks">
                    <div class="add_drug_remarks_space">
                        <span>用量:</span>
                        <textarea id="dosage"></textarea>
                    </div>
                    <div class="add_drug_remarks_space">
                        <span>用法:</span>
                        <textarea id="usage"></textarea>
                    </div>
                    <div class="add_drug_remarks_oper">
                        <button id="add" type="button">加入处方</button>
                    </div>
                </div>

                <div id="edits" style="display: none" class="add_drug_remarks">
                    <div class="add_drug_remarks_space">
                        <span>用量:</span>
                        <textarea id="dosages"></textarea>
                    </div>
                    <div class="add_drug_remarks_space">
                        <span>用法:</span>
                        <textarea id="usages"></textarea>
                    </div>
                    <div class="add_drug_remarks_oper">
                        <button id="edit" type="button">确定修改</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="add_drug_bottom">
        <div class="add_drug_user">
            <p><span class="prompt">*</span>审核药师:</p>
            <select id="select_user" name="phaId">
                <option value="">--请选择药师--</option>
                <#if doctorList??>
                <#list doctorList as doctor>
                <option value="${doctor.id!''}">${doctor.name!''}</option>
                </#list>
                </#if>
            </select>
        </div>
        <div class="add_drug_submit">
            <button id="submits" type="button">提交</button>
            <button id="cancel" class="add_drug_submit1">取消</button>
        </div>
    </div>
    </form>
</div>
<script type="text/javascript" src="/wx/js/pc_doctor.js"></script>
</body>
</html>
