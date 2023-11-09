package kr.co.invegan.diet.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.invegan.diet.dao.DietDAO;
import kr.co.invegan.diet.dto.DailyNutriDTO;
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

	public String addMenuDo(String upsertSort, DietDTO dietDTO){
		logger.info("addMenuDo() 실행");
		int row = 0;
		String msg = "메뉴 등록 실패";
		
		if(upsertSort.equals("0")) {		// =true || insert
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
	
	public FoodDataDTO getNutri(int loginUser_no, String selectDate, String dietCate) {
		logger.info("getNutri() 실행 || prameter : "+ loginUser_no +" / "+selectDate+" / "+dietCate);
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("loginUser_no", loginUser_no);
		params.put("selectDate", selectDate);
		
		FoodDataDTO getNutriInfo = null;
		
		if(dietCate.equals("전체")) {
			logger.info("전체 영양소 불러오기");
			// 전체 총합 가져오기
			getNutriInfo = dietDAO.getAllNutri(params);
		}else{
			logger.info("특정 식단 영양소 불러오기");
			params.put("dietCate", dietCate);
			getNutriInfo = dietDAO.getNutri(params);
		}
		return getNutriInfo;
	}

<<<<<<< HEAD
	public void addMaterialAdm(HashMap<String, Object> params) {

		int row = dietDAO.addMaterialAdm(params);
		if(row>0) {
			logger.info("식재료가 정상적으로 추가 되었습니다.");
		}else {
			logger.info("식재료 추가에 실패하였습니다.");
		}
	}
=======
	public DailyNutriDTO getDailyNutri(int loginUser_no) {
		logger.info("회원의 영양소별 1회 제공량 가져오기");
		return dietDAO.getDailyNutri(loginUser_no);
	}

	
>>>>>>> origin/master
	
	


}
