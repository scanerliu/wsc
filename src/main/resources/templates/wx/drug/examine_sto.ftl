<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/date.css">
    <script type="text/javascript" src="js/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="js/jquery-date.js"></script>
    <title>审核</title>
</head>

<body>
<div class="drug">
    <div class="add_drug lssue">
        <div class="lssue_logo">
            <img src="./img/logo.png" alt="">
            <h4>真善美执业医师</h4>
        </div>
        <div class="examine">
            <div class="examine_l">
                <div class="examine_info">
                    <p>审核编号：<span>1701245625246</span></p>
                    <p>申请账号：<span>上海城店</span></p>
                    <p>时间：<span>2017-12-15 18:58</span></p>
                </div>
                <div class="examine_lssue">
                    <img src="./img/lssue.png" alt="">
                </div>

                <div class="add_drug_staff bg_important">
                    <div class="staff_space">
                        <label class="add_drug_in staff_space1">
                            <span>医师:</span>
                            <input id="drug_physician" class="bg_important" type="text">
                            <img src="./img/name.png" alt="">
                        </label>
                    </div>
                </div>

            </div>
            <div class="examine_r">
                <p class="examine_title">审核结果:</p>
                <label class="examine_click">
                    <img src="./img/not_chick.png" alt="">
                    <span>通过</span>
                </label>
                <label class="examine_click">
                    <img src="./img/not_chick.png" alt="">
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
<script type="text/javascript" src="js/sub.js"></script>
</html>