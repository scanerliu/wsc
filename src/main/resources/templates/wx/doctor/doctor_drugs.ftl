<ul>
	<#if drugList?? && drugList?size gt 0>
	<#list drugList as drug>
    <li data="${drug.jsonstr!''}">
        <div class="add_drug_detail">
            <p>
                ${drug.abc!'c'} <span>${drug.drug!'c'}</span>
                ${drug.specification!''}
            </p>
            <p class="prompt">￥${drug.price!''}</p>  
            <p>库存:${drug.stockInt!'0'}</p>  
        </div>
    </li>
    </#list>
    <#else>
    <li>
    	暂无相关药品
    </li>
    </#if>
</ul>
<#if drugList?? && drugList?size gt 0>
<script type="text/javascript">
$(document).ready(function () {
// 选中
    $('.add_drug_entry').on('click', 'li', function () {
        $('.add_drug_chick').remove();
        $(this).append('<div class="add_drug_chick">\n' +
            '    <img src="/wx/images/drug/g.png" alt="">\n' +
            '</div>');
        var data = $(this).attr('data');
        chick_drug = JSON.parse(decodeURIComponent(data));
        $('#edits').hide();
        $('#remarks').show()
    })    
});
</script>
</#if>