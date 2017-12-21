package com.zxsm.wsc.controller.front.wx;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.zxsm.wsc.service.doctor.DjDoctorService;
import com.zxsm.wsc.service.doctor.DjPrescriptionService;

@Controller
@RequestMapping(value = "/wx/examine")
public class DjExamineController extends DjBaseController 
{
	@Autowired
	private DjPrescriptionService preSvs;
	
	@Autowired
	private DjDoctorService doctorSvs;
	
	/**
	 * 处方列表页
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
		
		DjDoctor doctor = isLogin(session,req);
		
		if(doctor == null)
		{
			return "redirect:/wx/doctor/login";
		}
		DjDoctor djDoctor = doctorSvs.findOne(doctor.getId());
		map.addAttribute("doctor",djDoctor);
		return "/wx/drug/doctor_prescribelist";
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
		
		DjDoctor doctor = isLogin(session,req);
		
		if(doctor == null)
		{
			return "redirect:/wx/doctor/login";
		}
		
		Map<String ,Object>searchMap = new HashMap<String,Object>();
		searchMap.put(DjPrescription.sStatus, sc.getStatus());
		searchMap.put(DjPrescription.sPassStatus, sc.getPassStatus());
		searchMap.put(DjPrescription.sStartDate,sc.getStarDate());
		searchMap.put(DjPrescription.sEndDate,sc.getEndDate());
		searchMap.put(DjPrescription.sPhaId, doctor.getId());
		List<DjPrescription> prescList = preSvs.find(searchMap);
		map.addAttribute("prescList",prescList);
		return "/wx/drug/doctor_prescribelistbody";
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
		
		if(doctor == null)
		{
			return "redirect:/wx/doctor/login";
		}
		DjPrescription prescript = preSvs.findOne(id);
		if(null!=prescript && doctor.getId().equals(prescript.getDocId())){
			map.addAttribute("prescript",prescript);
		}
		return "/wx/drug/doctor_prescribeitem";
	}

	@RequestMapping("/{did}")
	public String doctor(DjPrescriptionParam param,ModelMap map,@PathVariable Long did,HttpServletRequest req,HttpSession session)
	{
		DjDoctor doctor = isLogin(session,req);

		if(doctor == null)
		{
			return "redirect:/wx/doctor/login";
		}
		
		DjPrescription pre = preSvs.findOne(did);
		map.addAttribute("pre", pre);
		map.addAttribute("prescript", pre);
		
		map.addAttribute("doc", doctor);
		if(pre == null)
			return "";
		
		if(pre.getPhaId() != doctor.getId())
			return "";
		
		if(pre.getType() == 0)
			return "/wx/drug/doctor_prescribeitem";
		else
			return "/wx/drug/examine_sto";
	}
	
	@RequestMapping("update")
	public String update(DjPrescriptionParam param,ModelMap map,HttpServletRequest req,HttpSession session)
	{
		preSvs.examineUpdate(param);
		return "redirect:/wx/examine";
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
