package kr.co.invegan.diet.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.invegan.diet.dao.DietDAO;
import kr.co.invegan.diet.dto.FoodDataDTO;

@Service
public class DietService {

	@Autowired DietDAO dietDAO;
	
	Logger logger = LoggerFactory.getLogger(getClass());

	public ArrayList<FoodDataDTO> findFoodList(String keyword) {
		logger.info("findFood() || keyword : " + keyword);
		ArrayList<FoodDataDTO> findFoodList = dietDAO.findFoodList(keyword);
		
		return findFoodList;
	}

	public FoodDataDTO showNutri(int foodId) {
		logger.info("showNutri() || foodId : "+foodId);
		return dietDAO.showNutri(foodId);
	}

	public void addMenuDo(String addMenuChk, HashMap<String, Object> params) {
		logger.info("addMenuDo() 실행 || addMenuChk : "+addMenuChk+" param : "+params);
		
		if(addMenuChk.equals("add")) {		// =true || insert
			logger.info("메뉴 추가 기능 실행");
			dietDAO.addDiet(params);
		}else {								// = false || update
			logger.info("메뉴 수정 기능 실행");
		}
		
		
		
//		HashMap<String, Object> dupleChk = null;
		// 메뉴추가전 중복 체크
//		try {
//			// update
//			dupleChk = dietDAO.dupleChk(params);
//			// hashmap 체크
////			date||2023-10-31
////			diet_category||아침
////			food_id||16244
//			dupleChk.forEach((key, value)->{
//				System.out.println(key+"||"+value);
//			});
//			
//		} catch (Exception e) {	// dupleChk 의 결과가 없을 경우 NullPointException
//			// insert
//		}
		
	}


}
