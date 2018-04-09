package com.iteyes.works.emplist.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;

import com.iteyes.works.emplist.controller.IEmplistController;
import com.iteyes.works.emplist.service.EmplistService;

@Controller
public class EmplistController implements IEmplistController{

	@Autowired
	private EmplistService emplistService;

	/**
	 *  사원 목록 조회
	 *  페이징 처리
	 */
	@Override
	public Map<String, Object> emplist(@RequestParam Map<String, String> param) {
		
		Map<String, Object> map  = emplistService.getEmpList(param);

		return map;
	}

	@Override
	public String emplist() {
		
		return "/emplist";
	}
		
}
