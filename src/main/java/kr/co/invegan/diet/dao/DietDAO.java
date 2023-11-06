package kr.co.invegan.diet.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.invegan.diet.dto.DietDTO;
import kr.co.invegan.diet.dto.FoodDataDTO;


public interface DietDAO {


	ArrayList<FoodDataDTO> findFoodList(String keyword);

	FoodDataDTO showNutri(int foodId);

	int getServingSize(int food_id);	// ?

	int addDiet(DietDTO dietDTO);
	int addMenu(DietDTO dietDTO);
	int addMaterial(DietDTO dietDTO);
	int addDietComp(DietDTO dietDTO);

	ArrayList<DietDTO> getDietList(HashMap<String, Object> params);

	FoodDataDTO getAllNutri(HashMap<String, Object> params);
	FoodDataDTO getNutri(HashMap<String, Object> params);



}
