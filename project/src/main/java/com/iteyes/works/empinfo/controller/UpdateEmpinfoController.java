package com.iteyes.works.empinfo.controller;

import java.net.URLDecoder;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iteyes.works.empinfo.service.UpdateEmpinfoService;

@Controller
public class UpdateEmpinfoController {
	
	@Autowired 
	private UpdateEmpinfoService updateService;
	
	@RequestMapping("/updateEmpinfo")
	@ResponseBody
	public String updateEmpinfo(@RequestParam Map<String, String> updateParam) throws Exception{
	
		updateService.updateEmpinfo(updateParam);
		
		return null;
	}
	
	@RequestMapping("/passwd")
	public String passwd() {
		
		return "/passwd";
	}
	
	@RequestMapping("/updatePasswd")
	@ResponseBody
	public String updatePasswd(@RequestParam Map<String, String> passwdParam) throws Exception{
		
		String result = updateService.updatePasswd(passwdParam);
		
		return result;
	}
}










