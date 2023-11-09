package kr.co.invegan.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.invegan.admin.service.MemberManagementService;
import kr.co.invegan.member.dto.MemberDTO;

@Controller
public class MemberManagementController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	MemberManagementService service;
	
  @RequestMapping(value="/admin/list") 
  public String memberList() { 
	  return"/admin/memberList"; 
  }	

	@RequestMapping(value="/admin/memberListCall")
	@ResponseBody
	public HashMap<String,Object> memberList(HttpSession session, @RequestParam HashMap<String, String> params){
		logger.info("params:"+params);
		MemberDTO loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		
		/*
		 * if(loginInfo != null && loginInfo.getIs_admin() != 0) { result.put("success",
		 * 1); ArrayList<HashMap<String, Object>> memberList =
		 * service.memberList(loginInfo,params);
		 * 
		 * result.put("list",memberList); result.put("size", memberList.size());
		 * 
		 * }else { result.put("success", -1); }
		 */
		return service.memberList(loginInfo, params);
	}
	
	/*
	 * @RequestMapping(value="/admin/descList")
	 * 
	 * @ResponseBody public HashMap<String,Object> descList(HttpSession session){
	 * 
	 * MemberDTO loginInfo = (MemberDTO) session.getAttribute("loginInfo");
	 * 
	 * HashMap<String,Object> result = new HashMap<String,Object>();
	 * 
	 * if(loginInfo != null && loginInfo.getIs_admin() != 0) { result.put("success",
	 * 1); ArrayList<HashMap<String, Object>> desc = service.descList();
	 * result.put("desc", desc); result.put("size", desc.size()); }else {
	 * result.put("success", -1); } return result; }
	 * 
	 * @RequestMapping(value="/admin/adminSort")
	 * 
	 * @ResponseBody public HashMap<String,Object> adminSort(@RequestParam int
	 * adminSort){ logger.info("선택한 회원종류 : "+adminSort); HashMap<String,Object>
	 * result = new HashMap<String,Object>();
	 * 
	 * ArrayList<HashMap<String,Object>> type = service.adminSort(adminSort);
	 * result.put("type", type); result.put("size", type.size()); return result; }
	 */

	@RequestMapping(value="/admin/detail")
	public String detail(Model model, HttpSession session, @RequestParam String id) {
		logger.info("상세보기 요청 : "+id);
		String page = "/admin/list";
		
		MemberDTO loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		
		if(loginInfo != null && loginInfo.getIs_admin() != 0) { 
			page = "/admin/detail";
		}else{ 
				page = "/admin/main";
		}
		return page;
	}
	
}
