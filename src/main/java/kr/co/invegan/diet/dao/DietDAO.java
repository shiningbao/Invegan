package kr.co.invegan.diet.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.invegan.diet.dto.FoodDataDTO;


public interface DietDAO {


	ArrayList<FoodDataDTO> findFoodList(String keyword);

	FoodDataDTO showNutri(int foodId);

	int getServingSize(int food_id);

	HashMap<String, Object> dupleChk(HashMap<String, Object> params);



}
