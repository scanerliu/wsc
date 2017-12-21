package com.zxsm.wsc.controller.front.wx;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zxsm.wsc.common.Controllers.DjBaseController;
import com.zxsm.wsc.common.UtilsTools.CookiesUtil;
import com.zxsm.wsc.entity.doctor.DjDoctor;
import com.zxsm.wsc.entity.doctor.DjDoctorParam;
import com.zxsm.wsc.entity.doctor.DjPrescription;
import com.zxsm.wsc.entity.doctor.DjPrescriptionParam;
import com.zxsm.wsc.entity.user.DjUser;
import com.zxsm.wsc.service.doctor.DjDoctorService;
import com.zxsm.wsc.service.doctor.DjPrescriptionService;
import com.zxsm.wsc.service.user.DjUserService;



@Controller
@RequestMapping(value = "/wx/store")
public class DjStorePcController extends DjBaseController {
	
	@Autowired
	private DjPrescriptionService preSvs;
	
	@Autowired
	private DjDoctorService doctorSvs;
	
	@Autowired
	private DjUserService userSvs;
	
	/**
	 * 门店查看处方列表
	 * @param param
	 * @param map
	 * @param req
	 * @param session
	 * @return
	 */
	@RequestMapping()
	public String prescribelist(DjDoctorParam param,ModelMap map,HttpServletRequest req,HttpSession session)
	{
		Map<String, Object> res = new HashMap<String, Object>();
		res.put("error", 0);
		
		if(!isLogin())
		{
			return "redirect:/wx/doctor/login";
		}
		DjUser djDoctor = userSvs.findOne(getUserInfo().getId());
		map.addAttribute("doctor",djDoctor);
		return "/wx/drug/store_prescribelist";
	}
	/**
	 * 处方数据查询页
	 * @param param
	 * @param map
	 * @param req
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/searchprescribes")
	public String searchprescribes(DjPrescriptionParam sc, ModelMap map,HttpServletRequest req,HttpSession session)
	{
		Map<String, Object> res = new HashMap<String, Object>();
		res.put("error", 0);
		
		if(!isLogin())
		{
			return "redirect:/wx/doctor/login";
		}
		
		
		DjUser user = getUserInfo();
		
		Map<String ,Object>searchMap = new HashMap<String,Object>();
		searchMap.put(DjPrescription.sType, 0);
		searchMap.put(DjPrescription.sStore, user.getRealName());
		searchMap.put(DjPrescription.sStatus, sc.getStatus());
		searchMap.put(DjPrescription.sPassStatus, sc.getPassStatus());
		searchMap.put(DjPrescription.sStartDate,sc.getStarDate());
		searchMap.put(DjPrescription.sEndDate,sc.getEndDate());
		Page<DjPrescription> page = preSvs.find(searchMap,sc.getPageNo()-1, sc.getPageSize());
		sc.setTotalCount(page.getTotalElements());
		map.addAttribute("prescList",page.getContent());
		map.addAttribute("sc",sc);
		return "/wx/drug/store_prescribelistbody";
	}
	
	/**
	 * 处方详情页
	 * @param id
	 * @param map
	 * @param req
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/prescribeitem{id}")
	public String prescribeitem(@PathVariable("id") Long id, ModelMap map,HttpServletRequest req,HttpSession session)
	{
		Map<String, Object> res = new HashMap<String, Object>();
		res.put("error", 0);
		
		DjDoctor doctor = isLogin(session,req);
		
		if(!isLogin())
		{
			return "redirect:/wx/doctor/login";
		}
		
		DjUser user = getUserInfo();
		DjPrescription prescript = preSvs.findOne(id);
		if(null!=prescript && user.getRealName().equals(prescript.getStore())){
			map.addAttribute("prescript",prescript);
		}
		return "/wx/drug/store_prescribeitem";
	}

	@RequestMapping("/{did}")
	public String doctor(DjPrescriptionParam param,ModelMap map,@PathVariable Long did,HttpServletRequest req,HttpSession session)
	{
		if(!isLogin())
		{
			return "redirect:/wx/doctor/login";
		}
		
		DjUser user = getUserInfo();
		DjPrescription prescript = preSvs.findOne(did);
		if(null!=prescript && user.getRealName().equals(prescript.getStore())){
			map.addAttribute("prescript",prescript);
		}
		map.addAttribute("doctor", getUserInfo());
		return "/wx/drug/store_prescribeitem";
	}
	
	public DjDoctor isLogin(HttpSession session,HttpServletRequest req)
	{
		DjDoctor user = (DjDoctor)session.getAttribute("doctor");

		if(user == null)
		{
			Cookie username = CookiesUtil.getCookieByName(req, "pc_username");
			Cookie password = CookiesUtil.getCookieByName(req, "pc_password");
			if(username == null || password == null)
				return null;
			user = doctorSvs.findByUsernameAndPassword((String)username.getValue(), (String)password.getValue());
			if(user == null)
				return null;
			session.setAttribute("doctor", user);
		}
		return user;
	}

}
