package kr.co.invegan.diet.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.invegan.diet.service.MyRecipeService;

@Controller
public class MyRecipeController {

	@Autowired MyRecipeService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	// 나만의 레시피 이동
	@RequestMapping(value="/myRecipe/MyRecipeList.go")
	public String MyRecipelist() {
		
		return "/myRecipe/MyRecipeList";
	}
	
	// 나만의 레시피 재료추가
	@RequestMapping(value="/myRecipe/minsert")
	public HashMap<String, Object> minsert(@RequestParam HashMap<String, Object> params) {
		logger.info("params : "+params);
		HashMap<String, Object> result = new HashMap<String, Object>();
		return result;
	}
	
	// 나만의 레시피 재료 검색
	@RequestMapping(value="/myRecipe/mlist.do")
	@ResponseBody
	public HashMap<String, Object> mListdo (@RequestParam String fname) {
		
		logger.info("food_name :"+fname);	
		ArrayList<HashMap<String, Object>> mlist = service.mlist(fname);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("mlist", mlist);
		
		return result;
	}
	
	// 재료 추가
	@RequestMapping(value="/myRecipe/mMaterial")
	public HashMap<String, Object> mMaterial(@RequestParam String mName, @RequestParam int gram) {
		
		logger.info("mName : " + mName);
		logger.info("gram : "+gram);
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> mMaterial = service.mMaterial(mName, gram);
		
		return result;
	}
	
	// 나만의 레시피 이름 입력창
	@RequestMapping(value="/myRecipe/rlistUpdate.do", method = RequestMethod.POST)
	public HashMap<String, Object> rListUpdate(@RequestParam HashMap<String, Object> params) {
		
		logger.info("params : "+params);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		service.rListUpdate(params);
		return result;
	}

	// 나만의 레시피 리스트 출력
	@RequestMapping(value="/myRecipe/listCall", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> mrList(HttpSession session, @RequestParam int user_no){
		HashMap<String, Object> result = new HashMap<String, Object>();
		// 나중에 지우기
		session.setAttribute("loginId", "1");
		
		logger.info("user_no : "+user_no);
		
		if(session.getAttribute("loginId") == null) {
			result.put("login", false);
		}else {
			result.put("login", true);
			ArrayList<HashMap<String, Object>> mrlist = service.mrlist(user_no);
			result.put("mrlist", mrlist);
		}
		
		return result;
	}
	
	// 레시피 재료 출력
	@RequestMapping(value="/myRecipe/rMaterial.do", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> rMaterial(@RequestParam int menu_id){
		HashMap<String, Object> result = new HashMap<String, Object>();
		logger.info("menu_id : "+menu_id);
		
		ArrayList<HashMap<String, Object>> rMaterial = service.rMaterial(menu_id);
		result.put("rMaterial", rMaterial);
		return result;
	}
	
	// 레시피 재료 제거
	@RequestMapping(value="/myRecipe/mdelete.do")
	@ResponseBody
	public HashMap<String, Object> mdelete(@RequestParam int food_id, @RequestParam int menu_id) {
		logger.info("food_id : "+food_id);
		logger.info("menu_id : "+menu_id);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		boolean mdelete = service.mdelete(food_id, menu_id);
		
		result.put("mdelete", mdelete);
	
		return result;
	}
	
	// 레시피 제거
	@RequestMapping(value="/myRecipe/rdelete.do")
	@ResponseBody
	public HashMap<String, Object> rdelete(@RequestParam int menu_id) {
		logger.info("menu_id : "+menu_id);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		boolean rmdelete = service.rmdelete(menu_id);
		boolean rdelete = service.rdelete(menu_id);
		
		result.put("rmdelete", rmdelete);
		result.put("rdelete", rdelete);
	
		return result;
	}
}
