var store = '', pharmacist = '', chick_drug = {}, list = [];

// 渲染列表
function renderList() {
    $('.no_drug').show();
    if (list.length) {
        $('.no_drug').hide()
    }
    var html = '';
    $.each(list, function (i, item) {
        html += '<li data="' + encodeURIComponent(JSON.stringify(item)) + '">\n' +
            '    <div class="add_drug_item">\n' +
            '        <p class="add_drug_item_name">' + (i + 1) + '、' + item.drug + item.specification + '</p>\n' +
            '        <p class="add_drug_item_explain">用量：' + item.Dosage + '</p>\n' +
            '        <p class="add_drug_item_explain">用法：' + item.administration + '</p>\n' +
            '    </div>\n' +
            '    <div class="add_drug_operation">\n' +
            '        <a lid="' + item.drugNo + '" class="add_drug_edit" href="javascript:;">修改</a>\n' +
            '        <a lid="' + item.drugNo + '" class="add_drug_del" href="javascript:;">删除</a>\n' +
            '    </div>\n' +
            '<input type="hidden" name="drugs['+i+'].drugNo" value="' + item.drugNo + '">'+
            '<input type="hidden" name="drugs['+i+'].drug" value="' + item.drug + '">'+
            '<input type="hidden" name="drugs['+i+'].specification" value="' + item.specification + '">'+
            '<input type="hidden" name="drugs['+i+'].Dosage" value="' + item.Dosage + '">'+
            '<input type="hidden" name="drugs['+i+'].administration" value="' + item.administration + '">'+       
            '</li>';
    });
    $('.add_drug_list ul').html(html)
}

$(document).ready(function () {
    // 时间
    $($.date_input.initialize);
    // 选者门店显示搜索
    $('#select_name').change(function (e) {
        console.log(e.target.value);
        if (e.target.value) {
            // 在已经选择门店，且添加了药品后，在点击更改门店时则提示
            if (list.length) {
                $('.chick_prompt').show();
                $('.chick_prompt_mask').show();
            } else {
                store = e.target.value;
                $(this).val(store)
                $("#selectdept").val(store);
            }
            $('#search').show()
        }
    });

    // 选择药师
    $('#select_user').change(function (e) {
        pharmacist = e.target.value;
    });

    // 隐藏提示
    $('.close_chick_prompt').on('click', function () {
        $('.chick_prompt').hide();
        $('.pharmacist_prompt').hide();
        $('.verification_prompt').hide();
        $('.chick_prompt_mask').hide();
    });

    // 点击搜索
    $('#search_sub').on('click', function () {
        var search_val = $('#search_val').val();
        if (search_val) {
            $('#remarks').hide()
        }
        var url = "/wx/doctor/searchdrugs";
        var keyword = $("#search_val").val();
        var store = $("#selectdept").val();
        var loaddata = {"keyword":keyword,"dept":store};
        $("#druglist").load(url,loaddata);
    });

    // 选中
    /*$('.add_drug_entry').on('click', 'li', function () {
        $('.add_drug_chick').remove();
        $(this).append('<div class="add_drug_chick">\n' +
            '    <img src="/wx/images/drug/g.png" alt="">\n' +
            '</div>');
        var data = $(this).attr('data');
        chick_drug = JSON.parse(decodeURIComponent(data));
        $('#edits').hide();
        $('#remarks').show()
    })*/

    // 添加
    $('#add').on('click', function () {
        var dosage = $('#dosage').val();
        var usage = $('#usage').val();
        chick_drug.Dosage = dosage;
        chick_drug.administration = usage;
        list.push(chick_drug);
        renderList();
        $('.add_drug_chick').remove();
        chick_drug = {};
        $('#dosage').val('');
        $('#usage').val('');
        $('#remarks').hide()
    });

    // 修改
    $('.add_drug_list').on('click', '.add_drug_edit', function () {
        var del_id = $(this).attr('lid');
        var this_drug = {};
        $.each(list, function (i, item) {
            if (item.drugNo === del_id) {
                this_drug = item;
                return false
            }
        });
        console.log(this);
        $('#remarks').hide();
        $('#edits').show();
        $("#dosages").val(this_drug.Dosage);
        $("#usages").val(this_drug.administration);
        $("#edit").attr('lid', this_drug.drugNo);
    });

    // 确认修改
    $('#edit').on('click', function () {
        var edit_id = $(this).attr('lid');
        console.log(edit_id);
        $.each(list, function (i, item) {
            if (item.drugNo === edit_id) {
                list[i].Dosage = $("#dosages").val();
                list[i].administration = $("#usages").val();
                return false
            }
        });
        $('#edits').hide();
        renderList()
    });

    // 删除
    $('.add_drug_list').on('click', '.add_drug_del', function () {
        var del_id = $(this).attr('lid');
        $.each(list, function (i, item) {
            if (item.drugNo === del_id) {
                list.splice(i, 1);
                return false
            }
        });
        renderList()
    });

    // 提交
    $('#submits').on('click', function () {
        if (!pharmacist) {
            $('.pharmacist_prompt').show();
            $('.chick_prompt_mask').show();
        } else {
            var drug = [];
            $.each($('.add_drug_list li'), function (i, item) {
                drug.push(JSON.parse(decodeURIComponent($(item).attr('data'))))
            });
            // drug = list
            var drug_category = $('#drug_category').val();
            var drug_bed = $('#drug_bed').val();
            var drug_outpatient = $('#drug_outpatient').val();
            var drug_times = $('#drug_times').val();
            var drug_name = $('#drug_name').val();
            var drug_sex = $('#drug_sex').val();
            var drug_age = $('#drug_age').val();
            var drug_weight = $('#drug_weight').val();
            var drug_anaphylaxis = $('#drug_anaphylaxis').val();
            var drug_diagnosis = $('#drug_diagnosis').val();
           /* var drug_physician = $('#drug_physician').val();
            var drug_examine = $('#drug_examine').val();
            var drug_pharmacist = $('#drug_pharmacist').val();
            var drug_dispensing = $('#drug_dispensing').val();*/
            if (
                drug.length &&
                drug_category && drug_bed && drug_outpatient && drug_times &&
                drug_name && drug_sex && drug_age && drug_weight && drug_anaphylaxis &&
                drug_diagnosis /*&& drug_physician && drug_examine && drug_pharmacist && drug_dispensing*/
                
            ) {
                console.log(drug.length,
                    drug_category, drug_bed, drug_outpatient, drug_times,
                    drug_name, drug_sex, drug_age, drug_weight, drug_anaphylaxis,
                    drug_diagnosis, drug_physician, drug_examine, drug_pharmacist, drug_dispensing);
                var url = "/wx/doctor/doprescribe";
                var postData = $("#addprescriptionform").serializeArray();
                $.post(url,postData,function(data){
                	var result = eval("("+data+")");
                	if(result.error==1){
                		alert("处方提交成功！");
                		$(window).attr('location','/wx/doctor/prescribelist');
                	}else{
                		alert("处方提交失败:请稍后重新操作！")
                	}
                	
                },'text');
            } else {
                $('.verification_prompt').show();
                $('.chick_prompt_mask').show();
            }
        }
    })
});


$(document).ready(function () {
    // 时间
    $($.date_input.initialize);
});

function searchPrescriptions(f){
	var url = "/wx/doctor/searchprescribes";
	var loadData = null;
	if(f){
		loadData = $("#searchform").serializeArray();
	}else{
		loadData = $("#listform").serializeArray();
	}
	$("#results").load(url,loadData);
}
function searchPrescriptions_pha(f){
	var url = "/wx/examine/searchprescribes";
	var loadData = null;
	if(f){
		loadData = $("#searchform").serializeArray();
	}else{
		loadData = $("#listform").serializeArray();
	}
	$("#results").load(url,loadData);
}
