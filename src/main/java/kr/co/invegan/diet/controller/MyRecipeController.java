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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.invegan.diet.service.MyRecipeService;
import kr.co.invegan.member.dto.MemberDTO;

@Controller
public class MyRecipeController {

	@Autowired MyRecipeService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	MemberDTO loginInfo = null;
	
	// 나만의 레시피 이동
	@RequestMapping(value="/myRecipe/MyRecipeList.go")
	public String MyRecipelist(HttpSession session, RedirectAttributes reAttr) {
		logger.info("나만의 레시피 페이지 이동");
		String page = "redirect:member/login.go";
		loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		if (loginInfo != null) {
			logger.info("User_no : " + loginInfo.getUser_no());
			page = "myRecipe/MyRecipeList";
		} else {
			logger.info("로그인 x");
			reAttr.addFlashAttribute("msg", "로그인 후 이용 가능한 서비스입니다.");
		}
		
		return page;
	}
	
	// 나만의 레시피 재료추가 이동
	@RequestMapping(value="*/addRecipeMaterial")
	public String minsertgo(HttpSession session, RedirectAttributes reAttr) {
		logger.info("나만의 레시피 재료 추가 이동");
		String page = "redirect:member/login.go";
		loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		if (loginInfo != null) {
			logger.info("User_no : " + loginInfo.getUser_no());
			page = "myRecipe/addRecipeMaterial";
		} else {
			logger.info("로그인 x");
			reAttr.addFlashAttribute("msg", "로그인 후 이용 가능한 서비스입니다.");
		}
		return page;
	}
	
	// 나만의 레시피 재료추가
	@RequestMapping(value="/myRecipe/minsert.do", method = RequestMethod.POST)
	public HashMap<String, Object> minsert(HttpSession session, @RequestParam(required = false) Integer menu_id) {
		logger.info("menu_id : "+menu_id);
		HashMap<String, Object> result = new HashMap<String, Object>();
		session.setAttribute("menu_id", menu_id);
		if (menu_id == null ) {
			result.put("msg", "레시피를 선택해 주세요");
		} else {
			session.setAttribute("menu_id", menu_id);
			result.put("msg", "재료를 입력해주세요");
		}
		return result;
	} 
	
	// 나만의 레시피 재료 검색
	@RequestMapping(value="/myRecipe/mlist.do")
	@ResponseBody
	public HashMap<String, Object> mListdo (HttpSession session, @RequestParam String fName) {
		
		logger.info("menu_id : "+session.getAttribute("menu_id"));
		logger.info("food_name :"+fName);	
		ArrayList<HashMap<String, Object>> mlist = service.mlist(fName);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("mlist", mlist);
		
		return result;
	}
	
	// 재료 추가
	@RequestMapping(value="/myRecipe/mMaterial")
	public HashMap<String, Object> mMaterial(@RequestParam int food_id, @RequestParam int grams, HttpSession session) {
		
		Integer menu_id = (Integer) session.getAttribute("menu_id");
		logger.info("food_id : " + food_id);
		logger.info("gram : "+grams);
		logger.info("menu_id : "+menu_id);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
	    if (menu_id != null) {
	        service.mMaterial(food_id, grams, menu_id);
	    } else {
	        result.put("msg", "올바른 접근이 아닙니다.");
	    }
		
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
	@RequestMapping(value="*/mrlistCall", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> mrList(HttpSession session){
		HashMap<String, Object> result = new HashMap<String, Object>();
		// 나중에 지우기
		loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		
		logger.info("user_no : "+loginInfo.getUser_no());
		
		if(loginInfo == null) {
			logger.info("로그인 되어있지 않음");
			result.put("login", false);
		}else {
			result.put("login", true);
			ArrayList<HashMap<String, Object>> mrlist = service.mrlist(loginInfo.getUser_no());
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
	
	// 레시피 영양소 출력
	@RequestMapping(value="/myRecipe/rNutri.do")
	@ResponseBody
	public HashMap<String, Object> rNutrido(@RequestParam int menu_id) {
		logger.info("menu_id : "+menu_id);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> rNutrido = service.rNutrido(menu_id);
		logger.info("rNutrido : "+rNutrido);
		
		result.put("rNutri", rNutrido);
		
		return result;
	}
}
