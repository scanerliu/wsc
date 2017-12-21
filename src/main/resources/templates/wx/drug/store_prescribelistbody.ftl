<div class="lssue_quarantine"></div>
<div class="lssue_list">
    <table>
        <thead>
        <tr>
            <th class="lssue_list_td_w1">序号</th>
            <th class="lssue_list_td_w2">审核编号</th>
            <th class="lssue_list_td_w1">时间</th>
            <th class="lssue_list_td_w1">状态</th>
            <th class="lssue_list_td_w1">结果</th>
            <th class="lssue_list_td_w1">操作</th>
        </tr>
        </thead>
        <tbody>
        <#if prescList??>
        <#list prescList as presc>
        <tr>
            <td class="lssue_list_td_w1">${presc_index+1!''}</td>
            <td class="lssue_list_td_w2">${presc.preNo!''}</td>
            <td class="lssue_list_td_w1"><#if presc.preDate??>${presc.preDate?string('yyyy-MM-dd')}</#if></td>
            <td class="lssue_list_td_w1"><#if presc.status?? && presc.status==1>已审核<#else>待审核</#if></td>
            <td class="lssue_list_td_w1"><#if presc.passStatus?? && presc.passStatus==1>已通过<#else>未通过</#if></td>
            <td class="lssue_list_td_w1"><a href="/wx/store/${presc.id?c}">详情</a></td>
        </tr>
        </#list>
        </#if>
        </tbody>
    </table>
</div>
<input type="hidden" value="${sc.status!''}" name="status">
<input type="hidden" value="${sc.passStatus!''}" name="passStatus">
<input type="hidden" value="<#if sc.starDate??>${sc.starDate?string('yyyy-MM-dd')}</#if>" name="starDate">
<input type="hidden" value="<#if sc.starDate??>${sc.endDate?string('yyyy-MM-dd')}</#if>" name="endDate">
<#if prescList?? && prescList?size gt 0>
<#assign pageId="PrescriptionStore" />
<#include "../commonpostpage.ftl" />
<div class="clear"></div>
</#if>