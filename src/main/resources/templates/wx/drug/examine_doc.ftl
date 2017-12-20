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
    <title>药师待审核</title>
</head>

<body>
<div class="drug">
    <div class="add_drug lssue">
        <div class="lssue_logo">
            <img src="/wx/images/drug/logo.png" alt="">
            <h4>真善美执业医师</h4>
        </div>
        <div class="examine">
            <div class="examine_l">
                <div class="examine_info">
                    <p>所属门店：<span>上海城店</span></p>
                    <p>医生：<span>刘波</span></p>
                </div>


                <div class="add_drug_l bg_unimportance">
                    <div class="add_drug_type">
                        <div id="add_drug_tp" class="add_drug_tp">普通</div>
                    </div>
                    <div class="add_drug_title">
                        <h4>重庆京西医院</h4>
                        <p>(处方笺)</p>
                    </div>
                    <div class="add_drug_info">
                        <span class="add_drug_info_no">NO:201712181254001</span>
                        <div class="add_drug_from">
                            <label class="add_drug_in">
                                <span>科别:</span>
                                <input id="drug_category" type="text">
                            </label>
                            <label class="add_drug_in">
                                <span>床号:</span>
                                <input id="drug_bed" type="text">
                            </label>
                            <label class="add_drug_in">
                                <span>门诊号:</span>
                                <input id="drug_outpatient" type="text">
                            </label>
                            <label class="add_drug_in">
                                <span>日期:</span>
                                <input id="drug_times" class="date_input" type="text">
                            </label>
                        </div>
                        <div class="add_drug_from">
                            <label class="add_drug_in">
                                <span>姓名:</span>
                                <input id="drug_name" type="text">
                            </label>
                            <label class="add_drug_in">
                                <span>性别:</span>
                                <input id="drug_sex" type="text">
                            </label>
                            <label class="add_drug_in">
                                <span>年&emsp;龄:</span>
                                <input id="drug_age" type="text">
                            </label>
                            <label class="add_drug_in">
                                <span>体重:</span>
                                <input id="drug_weight" type="text">
                            </label>
                        </div>
                        <div class="add_drug_from">
                            <label class="add_drug_in">
                                <span>过敏史:</span>
                                <input id="drug_anaphylaxis" class="add_drug_in1" type="text">
                            </label>
                        </div>
                        <div class="add_drug_from">
                            <label class="add_drug_in">
                                <span>初步诊断:</span>
                                <input id="drug_diagnosis" class="add_drug_in2" type="text">
                            </label>
                        </div>
                    </div>
                    <div class="add_drug_list">
                        <span class="add_drug_info_no">Rp</span>
                        <ul>
                            <li data="%7B%22id%22%3A3%2C%22name%22%3A%22999%E6%84%9F%E5%86%92%E7%81%B5%E9%A2%97%E7%B2%92%22%7D">
                                <div class="add_drug_item">
                                    <p class="add_drug_item_name">1、999感冒灵</p>
                                    <p class="add_drug_item_explain">用量：开三盒</p>
                                    <p class="add_drug_item_explain">用法：每日三次，每次三颗</p>
                                </div>
                            </li>
                            <li data="%7B%22id%22%3A3%2C%22name%22%3A%22999%E6%84%9F%E5%86%92%E7%81%B5%E9%A2%97%E7%B2%92%22%7D">
                                <div class="add_drug_item">
                                    <p class="add_drug_item_name">1、999感冒灵</p>
                                    <p class="add_drug_item_explain">用量：开三盒</p>
                                    <p class="add_drug_item_explain">用法：每日三次，每次三颗</p>
                                </div>
                            </li>
                            <li data="%7B%22id%22%3A3%2C%22name%22%3A%22999%E6%84%9F%E5%86%92%E7%81%B5%E9%A2%97%E7%B2%92%22%7D">
                                <div class="add_drug_item">
                                    <p class="add_drug_item_name">1、999感冒灵</p>
                                    <p class="add_drug_item_explain">用量：开三盒</p>
                                    <p class="add_drug_item_explain">用法：每日三次，每次三颗</p>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="add_drug_staff bg_important">
                        <div class="add_drug_from staff_space">
                            <label class="add_drug_in staff_space1">
                                <span>医师:</span>
                                <input id="drug_physician" class="bg_important" type="text">
                                <img src="/wx/images/drug/name.png" alt="">
                            </label>
                            <label class="add_drug_in staff_space1">
                                <span>药&emsp;&emsp;师:</span>
                                <input id="drug_pharmacist" class="bg_important" type="text">
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
                    <textarea id="reason"></textarea>
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
</html>