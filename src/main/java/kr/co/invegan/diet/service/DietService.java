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

	public void addMenuDo(HashMap<String, Object> params) {
		logger.info("addMenuDo() 실행 || param : "+params);
		HashMap<String, Object> dupleChk = null;
//		int food_id = Integer.parseInt(params.get("food_id").toString());// 필요한가.. ?
		logger.info("::"+params);
		try {
			// update
			dupleChk = dietDAO.dupleChk(params);
			// hashmap 체크
//			date||2023-10-31
//			diet_category||아침
//			food_id||16244
			dupleChk.forEach((key, value)->{
				System.out.println(key+"||"+value);
			});
			
		} catch (Exception e) {	// dupleChk 의 결과가 없을 경우 NullPointException
			// insert
		}
		

		
		
		
		
		
	}


	
	

}
