package kr.co.invegan.diet.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.invegan.diet.dto.DietDTO;
import kr.co.invegan.diet.dto.FoodDataDTO;
import kr.co.invegan.diet.service.DietService;

@Controller

public class DietController {

	@Autowired DietService dietService;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "diet/tempCalander")
	public String tempCalander() {
		return "diet/tempCalander";
	}
	
	@RequestMapping(value = "diet/addMenu.go")
	public String addMenuGo(HttpSession session,@RequestParam String chk, @RequestParam String loginId) {
		logger.info("메뉴 추가 페이지 요청 || chk값 = " + chk);
		// 임시 로그인 세션 추가 
		session.setAttribute("loginId", loginId);
		// chk = true 이면 메뉴 추가
		// chk = false 이면 메뉴 수정
		session.setAttribute("addMenuChk", chk);
		
		// 추후 페이지 접근 제한에도 chk 활용
		
		return "diet/addMenu";
	}
	
	 @RequestMapping(value = "diet/addMenu.do")
	 @ResponseBody 
	 public HashMap<String, Object> addMenuDo(HttpSession session,@RequestParam HashMap<String, Object> params ){ 
		 logger.info("메뉴 추가 / 수정 요청 ");
		 logger.info(" |||||| params : "+params);
		 String addMenuChk = (String) session.getAttribute("addMenuChk");
		 logger.info("session :: chk = "+addMenuChk);
		 
		 DietDTO dietDTO = new DietDTO();
		 dietDTO.setUser_id((String) session.getAttribute("loginId"));
		 dietDTO.setDate((String) params.get("select_date"));
		 dietDTO.setFood_id( Integer.parseInt(params.get("food_id").toString()));
		 dietDTO.setDiet_category((String) params.get("diet_category"));
		 dietDTO.setCategory((String) params.get("menu_category"));
		 dietDTO.setRecipe_name((String) params.get("recipe_name"));
		 dietDTO.setGram(Integer.parseInt(params.get("gram").toString()));
		 
		 HashMap<String,Object> result = new HashMap<String, Object>(); 
		 dietService.addMenuDo(addMenuChk, dietDTO);
		 return result; 
	 }
	 
	 
	 @RequestMapping(value = "diet/defaultMenu.go")
	 public String defaultMenuGo() {
		 logger.info("기본메뉴 페이지 요청 || ");
		 return "diet/defaultMenu";
	 }
	
	@RequestMapping(value = "diet/searchFood")
	@ResponseBody
	public HashMap<String, Object> searchFood(String keyword){
		logger.info("식품 검색 기능 요청  || keyword : " + keyword);
		HashMap<String, Object> result = new HashMap<String, Object>(); 
		ArrayList<FoodDataDTO> searchFoodResult = dietService.findFoodList(keyword);
		if(searchFoodResult.size() == 0) {
			result.put("success", 0);	
			result.put("msg", "검색 결과가 없습니다.");
		}else {
			result.put("success", 1);
			logger.info("findFoodList size : " + searchFoodResult.size());
			result.put("findFoodList", searchFoodResult);
			result.put("findFoodListSize", searchFoodResult.size());
		}
		
		return result;
	}
		
	 @RequestMapping(value = "diet/showNutri")
	 @ResponseBody 
	 public HashMap<String, Object> showNutri(int foodId){ 
		 logger.info("식품 영양상세보기 요청 || foodId : " + foodId); 
		 HashMap<String,Object> result = new HashMap<String, Object>(); 
		 FoodDataDTO showNutri = dietService.showNutri(foodId); 
		 result.put("showNutri", showNutri); 
		 return result; 
	 }
	 
	
	 
	
	 
	
	

	
	
}
