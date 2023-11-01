package kr.co.invegan.diet.dao;

import java.util.ArrayList;

import kr.co.invegan.diet.dto.FoodDataDTO;


public interface DietDAO {


	ArrayList<FoodDataDTO> findFoodList(String keyword);

	FoodDataDTO showNutri(int foodId);


}
