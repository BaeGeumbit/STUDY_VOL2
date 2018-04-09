package com.iteyes.works.emplist.controller;


import java.util.Map;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

public interface IEmplistController {
	
	@RequestMapping("/emplist")
	public String emplist();

	@RequestMapping(value="/emplist/search", method= RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> emplist(@RequestParam Map<String, String> param);

}