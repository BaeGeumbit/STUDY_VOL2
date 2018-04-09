package com.iteyes.works.emplist.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jboss.logging.MessageLogger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.iteyes.works.emplist.mapper.EmplistMapper;

@Service
public class EmplistService {
	
	@Autowired
	private EmplistMapper emplistMapper;
	
	private int row = 10;			// 한 페이지당 나올 row 개수
	private int pageSize = 5;		// 페이징할 사이즈
	private int totalCount = 0;		// 사원목록 총 개수
	private int totalPage = 0;		// 페이지 총 개수
 
	private int startPage = 0;		// 시작 페이지
	private int endPage = 0;		// 마지막 페이지

	private boolean pre = false;	// <<(이전페이지) 보여줄건지
	private boolean next = false;	// >>(다음페이지)

	public Map<String, Object> getEmpList(Map<String, String> param) {
		
		int page = 1;
		if(param.get("page") == null) {
			page = 1;
		}else {
			page = Integer.parseInt(param.get("page"));
		}
		Map<String, Object> map = new HashMap<>();
		
		map.put("row", row);
		map.put("page", page);
		map.put("searchDrop", param.get("searchDrop"));
		map.put("searchText", param.get("searchText"));
		
		List<HashMap<String, String>> emplist = emplistMapper.getEmpSearchList(map);

		if(emplist.size() == 0) {
			
			map.put("emplist", emplist);
			
		}else {	
						
			totalCount = Integer.parseInt(String.valueOf(emplist.get(0).get("CNT")));		
			totalPage = ( (totalCount - 1) / row ) + 1;			
			startPage = ( (page -1) / pageSize ) * pageSize + 1;
			endPage = ((startPage + pageSize -1) < totalPage)?startPage + pageSize -1 : totalPage;
			
			if(startPage != 1) pre = true;
			if(endPage < totalPage) next = true;
			
			map.put("emplist", emplist);
			map.put("pageSize", pageSize);
			map.put("startPage", startPage);
			map.put("endPage", endPage);
			map.put("pre", pre);
			map.put("next", next);
			
			System.out.println("-------------");
			System.out.println("-------------");
			System.out.println("-------------");
			System.out.println("-------------");
			
			System.out.println(map.toString());
			
		}
		
		return map;
		
		//return null;
	}


}
