<script>
function gotopage${pageId!''}(num){
    $("#sc_page${pageId!''}").val(num);
    try 
       {  
         if(fnGotoPage${pageId!''}&&typeof(fnGotoPage${pageId!''})=="function")  
         {
            fnGotoPage${pageId!''}(num);
         }
       }catch(e)
      {
        alert("not fnGotoPage${pageId!''} function"); 
      }  
}
</script>
<div id="pages" class="pension-page">
    <div class="pension-page-txt">显示 ${sc.pageSize}条/页&nbsp;共 ${sc.totalCount!"0"} 条记录 <#if sc.totalPageCount==0>0<#else>${sc.pageNo}</#if>/${sc.totalPageCount} 页</div>
    <div style="display: inline-block;">
    <ul>
    <#if sc??>
            <#assign continueEnter=false>
            <#if sc.pageNo <=1>
            <#else>
                 <a href="javascript:;" onclick="gotopage${pageId!''}(${sc.pageNo-1})"><li class="page-left" pagenumber="-1"> &lt;上一页</li></a>
            </#if>
            
            <#if sc??>
            <#assign continueEnter=false>
            <#if sc.totalPageCount gt 0>
                <#list 1..sc.totalPageCount as page>
                    <#if page <= 3 || (sc.totalPageCount-page) < 3 || (sc.pageNo-page)?abs<3 >
                        <#if page == sc.pageNo>
                            <a href="javascript:;" class="active"><li class="page-hover">${page}</li></a>
                        <#else>
                            <a href="javascript:;" onclick="gotopage${pageId!''}(${page})"><li>${page}</li></a>
                        </#if>
                        <#assign continueEnter=false>
                    <#else>
                        <#if !continueEnter>
                            <b class="pn-break">&hellip;</b>
                            <#assign continueEnter=true>
                        </#if>
                    </#if>
                </#list>
            </#if>
        </#if>
        <#if sc.pageNo == sc.totalPageCount || sc.totalPageCount==0>
        <#else>
            <a href="javascript:;" onclick="gotopage${pageId!''}(${sc.pageNo+1})"><li class="page-right" pagenumber="0">下一页 &gt;</li></a>
        </#if>
    </#if>
    <input type="hidden" name="pageNo" id="sc_page${pageId!''}" value="${sc.pageNo}"/>
    </div>
    <div class="pension-page-oper">
    	到<input id="inputgotopage" name="inputgotopage" type="text" value="${sc.pageNo}" size="5" onkeyup="return formatInputInteger(this,1,99999);">页
    	<button class="page-go" onclick="gotopage${pageId}($('[name=inputgotopage]').val())">跳转</button>
    </div>
</div>