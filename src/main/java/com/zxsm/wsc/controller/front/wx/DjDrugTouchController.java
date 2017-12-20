package com.zxsm.wsc.controller.front.wx;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.zxsm.wsc.common.Controllers.DjBaseController;
import com.zxsm.wsc.common.UtilsTools.DjTools;
import com.zxsm.wsc.entity.doctor.DjDoctor;
import com.zxsm.wsc.entity.doctor.DjDoctorParam;
import com.zxsm.wsc.entity.doctor.DjPrescription;
import com.zxsm.wsc.entity.doctor.DjPrescriptionParam;
import com.zxsm.wsc.entity.management.DjNaviItem;
import com.zxsm.wsc.entity.user.DjUser;
import com.zxsm.wsc.service.doctor.DjDoctorService;
import com.zxsm.wsc.service.doctor.DjPrescriptionService;
import com.zxsm.wsc.service.management.DjNaviItemService;


@Controller
@RequestMapping(value = "/wx/drug")
public class DjDrugTouchController extends DjBaseController
{
	@Autowired
	private DjDoctorService doctorSvs;
	
	@Autowired
	private DjNaviItemService djNaviItemSvs;
	
	@Value("${imagePath}")
	private String rootPath;
	
	@Autowired
	private DjPrescriptionService preSvs;
	
	//目录
	@RequestMapping("/cate")
	public String cate(DjDoctorParam param,ModelMap map,HttpServletRequest req)
	{
		return "/wx/drug/index";
	}
	
	// 医生列表
	@RequestMapping(value="/list")
	public String doctorList(DjDoctorParam param,ModelMap map,HttpServletRequest res)
	{
		if(!isLogin())
			return URL_RedirectLogin;

		DjUser user = getUserInfo();
		map.addAttribute("user", user);

		Map<String ,Object>searchMap = new HashMap<String,Object>();

		if(StringUtils.isNotBlank(param.keywords))
		{
			if(!res.getMethod().equalsIgnoreCase("POST"))
			{
				searchMap.put(DjDoctor.sCat, param.keywords);
				map.addAttribute("title", param.keywords);
				DjNaviItem docNavi = djNaviItemSvs.findDocItemByTitle(param.keywords);
				if(docNavi != null)
					map.addAttribute("summary", docNavi.getSummary());
			}
			else
				searchMap.put("keywords", param.keywords);
		}
		searchMap.put(DjDoctor.sUtype, 1);
		map.addAttribute("doctor_list", doctorSvs.find(searchMap,param.page, param.size));
		return "/wx/drug/doctor_list";
	}
	
	// 药师详细
	@RequestMapping("/{did}")
	public String doctor(DjDoctorParam param,ModelMap map,@PathVariable Long did)
	{
		DjDoctor doctor = doctorSvs.findOne(did);
		map.addAttribute("doctor",doctor);
		return "/wx/drug/doctor_detail";
	}
	// 处方上传页面
	@RequestMapping(value="/upload/{did}", method=RequestMethod.GET)
	public String uploadid(DjDoctorParam param,ModelMap map,@PathVariable Long did)
	{
		DjDoctor doctor = doctorSvs.findOne(did);
		map.addAttribute("doctor",doctor);
		return "/wx/drug/upload";
	}
	
	// 处理上传页面
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> upload(DjPrescriptionParam param,ModelMap map,
			MultipartFile imgFile)
	{
		Map<String, Object> res = new HashMap<String, Object>();
		if(!isLogin())
		{
			res.put("error", 1);
			res.put("message", "未登录");
			return res;
		}
		if (null == imgFile || imgFile.isEmpty())
		{
			res.put("error", 1);
			res.put("message", "图片不存在");
			return res;
		}
		String name = imgFile.getOriginalFilename();
		// String contentType = Filedata.getContentType();

		String ext = "";

		if (-1 != name.lastIndexOf("."))
		{
			ext = name.substring(name.lastIndexOf(".")).substring(1);
		}

		try
		{
			byte[] bytes = imgFile.getBytes();

			Date dt = new Date(System.currentTimeMillis());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			String fileName = sdf.format(dt) + "." + ext;

			String uri = rootPath + "cf/" + fileName;
			DjTools.createDir(rootPath + "/cf");

			File file1 = new File(uri);

			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(file1));
			stream.write(bytes);
			stream.close();

			res.put("error", 0);
			res.put("url", "/images/cf/" + fileName);

			DjUser user = getUserInfo();
			preSvs.initPres(user.getRealName(), user.getId(), "/images/cf/" + fileName, param.getPhaName(), param.getPhaId());
		}
		catch (Exception e)
		{
			res.put("error", 1);
			res.put("message", "读取错误");
		}
		
		return res;
	}
	
	// 审核单列表
	@RequestMapping("/precheck")
	public String prechecklist(DjPrescriptionParam param,ModelMap map)
	{
		if(!isLogin())
			return URL_RedirectLogin;
		DjUser user = getUserInfo();
		Map<String ,Object>searchMap = new HashMap<String,Object>();
		searchMap.put(DjPrescription.sStore, user.getRealName());
		List<DjPrescription> preList = preSvs.find(searchMap);
		map.put("preList", preList);
		
		return "/wx/drug/precheck_list";
	}
	
	// 审核单列表
	@RequestMapping("/precheck/{did}")
	public String precheck(DjPrescriptionParam param,ModelMap map,@PathVariable Long did)
	{
		if(!isLogin())
			return URL_RedirectLogin;
		DjUser user = getUserInfo();
		Map<String ,Object>searchMap = new HashMap<String,Object>();
		searchMap.put(DjPrescription.sStore, user.getRealName());
		DjPrescription preList = preSvs.findOne(did);
		map.put("pre", preList);

		return "/wx/drug/precheck";
	}
	
	
	
}
