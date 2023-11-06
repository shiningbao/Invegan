package kr.co.invegan.diet.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.invegan.diet.dao.DietDAO;
import kr.co.invegan.diet.dto.DietDTO;
import kr.co.invegan.diet.dto.FoodDataDTO;

@Service
public class DietService{

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

	public String addMenuDo(String addMenuChk, DietDTO dietDTO){
		logger.info("addMenuDo() 실행");
		int row = 0;
		String msg = "메뉴 등록 실패";
		
		if(addMenuChk.equals("add")) {		// =true || insert
			logger.info("메뉴 추가 기능 실행");
			row += dietDAO.addDiet(dietDTO);
			row += dietDAO.addMenu(dietDTO);
			logger.info("get diet_id = "+dietDTO.getDiet_id()+" / get menu_id = "+dietDTO.getMenu_id());
			row += dietDAO.addMaterial(dietDTO);
			row += dietDAO.addDietComp(dietDTO);
			logger.info("저장 결과 : "+row);
		}else {								// = false || update
			logger.info("메뉴 수정 기능 실행");
		}
		if(row == 4) {
			msg = "메뉴를 등록 성공";
		}
		return msg;  
	}


	public ArrayList<DietDTO> getDietList(String date, int user_no) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("date", date);
		params.put("loginId", user_no);
		return dietDAO.getDietList(params);
		
	}


}
