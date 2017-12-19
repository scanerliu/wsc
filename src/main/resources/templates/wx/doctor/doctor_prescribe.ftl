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
<script type="text/javascript" src="/wx/js/jquery-2.1.0.min.js"></script>
<!--<script type="text/javascript" src="/wx/js/common.js"></script>-->
<script type="text/javascript">

$(function (){
	<#if msg??>
	setTimeout(warning("${msg!''}"),10);
	</#if>
  
    $("#btnSmsCode").click(function()
	{
        
        var mob = $("#mobileId").val();
        var re = /^\d{1,}$/;
        
        if (!re.test(mob))
        {
            alert("请输入正确数字");
            return;
        }
        $("#btnSmsCode").attr("disabled","disabled"); 
        
        $.ajax({  
            url : "/wx/doctor/number",  
            async : true,  
            type : 'POST',  
            data : {"number": mob},  
            success : function(data) {  
                
                if(data.error == 1)
                {  
                    alert("修改成功");
                    t1 = setInterval(tip, 1000);  
                }
                else
                {
                    warning(data.info);
                    $("#btnSmsCode").removeAttr("disabled");
                }
            },  
            error : function(XMLHttpRequest, textStatus,  
                    errorThrown) {  
                alert(textStatus);
            }  
  
        });
    });
});

var seed=300;    //60秒  
var t1=null; 

function tip() 
{  
    seed--;  
    if (seed < 1) 
    {  
        enableBtn();  
        seed = 300;  
        $("#btnSmsCode").val('确定');  
        var t2 = clearInterval(t1);  
    } else {  
        $("#btnSmsCode").val(seed + "s后确定");  
    }  
} 

function enableBtn()
{  
    $("#btnSmsCode").removeAttr("disabled");   
}

function changeStatus()
{
	$("#form1").submit();
}
</script>

</head>
<body>
<div class="drug">
    <div class="add_drug">
        <div class="add_drug_l">
            <div class="add_drug_type">
                <div id="add_drug_tp" class="add_drug_tp">普通</div>
            </div>
            <div class="add_drug_title">
                <h4>重庆京西医院</h4>
                <p>(处方伐)</p>
            </div>
            <div class="add_drug_info">
                <span class="add_drug_info_no">NO:201712181254001</span>
                <div class="add_drug_from">
                    <label class="add_drug_in">
                        <span>科别:</span>
                        <input type="text">
                    </label>
                    <label class="add_drug_in">
                        <span>床号:</span>
                        <input type="text">
                    </label>
                    <label class="add_drug_in">
                        <span>门诊号:</span>
                        <input type="text">
                    </label>
                    <label class="add_drug_in">
                        <span>日期:</span>
                        <input type="text">
                    </label>
                </div>
                <div class="add_drug_from">
                    <label class="add_drug_in">
                        <span>姓名:</span>
                        <input type="text">
                    </label>
                    <label class="add_drug_in">
                        <span>性别:</span>
                        <input type="text">
                    </label>
                    <label class="add_drug_in">
                        <span>年&emsp;龄:</span>
                        <input type="text">
                    </label>
                    <label class="add_drug_in">
                        <span>体重:</span>
                        <input type="text">
                    </label>
                </div>
                <div class="add_drug_from">
                    <label class="add_drug_in">
                        <span>过敏史:</span>
                        <input class="add_drug_in1" type="text">
                    </label>
                </div>
                <div class="add_drug_from">
                    <label class="add_drug_in">
                        <span>初步诊断:</span>
                        <input class="add_drug_in2" type="text">
                    </label>
                </div>
            </div>
            <div class="add_drug_list">
                <span class="add_drug_info_no">Rp</span>
                <ul>
                    <li>
                        <div class="add_drug_item">
                            <p class="add_drug_item_name">1、999感冒灵</p>
                            <p class="add_drug_item_explain">用量：开三盒</p>
                            <p class="add_drug_item_explain">用法：每日三次，每次三颗</p>
                        </div>
                        <div class="add_drug_operation">
                            <a href="javascript:;">修改</a>
                            <a href="javascript:;">删除</a>
                        </div>
                    </li>
                    <li>
                        <div class="add_drug_item">
                            <p class="add_drug_item_name">1、999感冒灵</p>
                            <p class="add_drug_item_explain">用量：开三盒</p>
                            <p class="add_drug_item_explain">用法：每日三次，每次三颗</p>
                        </div>
                        <div class="add_drug_operation">
                            <a href="javascript:;">修改</a>
                            <a href="javascript:;">删除</a>
                        </div>
                    </li>
                    <li>
                        <div class="add_drug_item">
                            <p class="add_drug_item_name">1、999感冒灵</p>
                            <p class="add_drug_item_explain">用量：开三盒</p>
                            <p class="add_drug_item_explain">用法：每日三次，每次三颗</p>
                        </div>
                        <div class="add_drug_operation">
                            <a href="javascript:;">修改</a>
                            <a href="javascript:;">删除</a>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="add_drug_staff">
                <div class="add_drug_from staff_space">
                    <label class="add_drug_in staff_space1">
                        <span>医师:</span>
                        <input class="add_drug_in3" type="text">
                    </label>
                    <label class="add_drug_in staff_space1">
                        <span>医师:</span>
                        <input class="add_drug_in3" type="text">
                    </label>
                </div>
                <div class="add_drug_from">
                    <label class="add_drug_in staff_space1">
                        <span>医师:</span>
                        <input class="add_drug_in3" type="text">
                    </label>
                    <label class="add_drug_in staff_space1">
                        <span>医师:</span>
                        <input class="add_drug_in3" type="text">
                    </label>
                </div>
            </div>
        </div>
        <div class="add_drug_r">
            <div class="add_drug_head">
                <img src="./img/doctor.png" alt="">
                <span>添加药品</span>
            </div>
            <div class="add_drug_choice">
                <p><span class="prompt">*</span>选择门店:</p>
                <select id="select_name">
                    <option value="门店1">门店1</option>
                    <option value="门店1">门店1</option>
                    <option value="门店1">门店1</option>
                    <option value="门店1">门店1</option>
                    <option value="门店1">门店1</option>
                </select>
            </div>
            <div class="add_drug_search">
                <input type="text">
                <div class="add_drug_search_btn">
                    <img src="./img/search.png" alt="">
                </div>
            </div>
            <div class="add_drug_entry">
                <ul>
                    <li>
                        <img src="./img/dur.png" alt="">
                        <div class="add_drug_detail">
                            <p>
                                <span>999感冒灵颗粒</span>
                                <img src="./img/a.png" alt="">
                            </p>
                            <p class="prompt">￥25</p>
                        </div>
                    </li>
                    <li>
                        <img src="./img/dur.png" alt="">
                        <div class="add_drug_detail">
                            <p>
                                <span>999感冒灵颗粒</span>
                                <img src="./img/a.png" alt="">
                            </p>
                            <p class="prompt">￥25</p>
                        </div>
                    </li>
                    <li>
                        <img src="./img/dur.png" alt="">
                        <div class="add_drug_detail">
                            <p>
                                <span>999感冒灵颗粒</span>
                                <img src="./img/a.png" alt="">
                            </p>
                            <p class="prompt">￥25</p>
                        </div>
                    </li>
                    <li>
                        <img src="./img/dur.png" alt="">
                        <div class="add_drug_detail">
                            <p>
                                <span>999感冒灵颗粒</span>
                                <img src="./img/a.png" alt="">
                            </p>
                            <p class="prompt">￥25</p>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="add_drug_remarks">
                <div class="add_drug_remarks_space">
                    <span>用量:</span>
                    <textarea></textarea>
                </div>
                <div class="add_drug_remarks_space">
                    <span>用量:</span>
                    <textarea></textarea>
                </div>
                <div class="add_drug_remarks_oper">
                    <button>加入处方</button>
                </div>
            </div>
        </div>
    </div>
    <div class="add_drug_bottom">
        <div class="add_drug_user">
            <p><span class="prompt">*</span>审核药师:</p>
            <select id="select_user">
                <option value="门店1">门店1</option>
                <option value="门店1">门店1</option>
                <option value="门店1">门店1</option>
                <option value="门店1">门店1</option>
                <option value="门店1">门店1</option>
            </select>
        </div>
        <div class="add_drug_submit">
            <button>提交</button>
            <button class="add_drug_submit1">取消</button>
        </div>
    </div>
</div>
</body>
</html>
