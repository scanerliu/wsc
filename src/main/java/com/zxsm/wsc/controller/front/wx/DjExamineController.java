package com.zxsm.wsc.controller.front.wx;

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
	
	@RequestMapping()
	public String exList()
	{
		return "";
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
		map.addAttribute("doc", doctor);
		if(pre == null)
			return "";
		
		if(pre.getPhaId() != doctor.getId())
			return "";
		
		if(pre.getType() == 0)
			return "/wx/drug/examine_doc";
		else
			return "/wx/drug/examine_sto";
	}
	
	@RequestMapping("update")
	public String update(DjPrescriptionParam param,ModelMap map,HttpServletRequest req,HttpSession session)
	{
		preSvs.examineUpdate(param);
		return "";
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
