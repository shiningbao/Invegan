package kr.co.invegan.diet.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.invegan.diet.dto.FoodDataDTO;
import kr.co.invegan.diet.service.DietService;

@Controller
public class DietController {

	@Autowired DietService dietService;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "diet/addMenu.go")
	public String addMenuGo() {
		logger.info("메뉴 추가 페이지 요청");
		return "diet/addMenu";
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
