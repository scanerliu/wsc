package com.zxsm.wsc.controller.front.wx;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zxsm.wsc.common.Controllers.DjBaseController;
import com.zxsm.wsc.entity.doctor.DjDoctorParam;
import com.zxsm.wsc.service.doctor.DjPrescriptionService;

@Controller
@RequestMapping(value = "/wx/examine")
public class DjExamineController extends DjBaseController 
{
	@Autowired
	private DjPrescriptionService preSvs;
	
	@RequestMapping()
	public String exList()
	{
		return "";
	}

	@RequestMapping("/{did}")
	public String doctor(DjDoctorParam param,ModelMap map,@PathVariable Long did)
	{
		return "/wx/doctor/examine";
	}
	
	@RequestMapping("update")
	public String update(DjDoctorParam param,ModelMap map)
	{
		return "";
	}
}
