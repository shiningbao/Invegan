package kr.co.invegan.diet.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface MyRecipeDAO {
	ArrayList<HashMap<String, Object>> mlist(String fname);

	ArrayList<HashMap<String, Object>> mMaterial(String mName);

	int rListUpdate(HashMap<String, Object> params);

	ArrayList<HashMap<String, Object>> mrlist(int user_no);

	ArrayList<HashMap<String, Object>> rMaterial(int menu_id);

	boolean mdelete(int food_id, int menu_id);

	boolean rdelete(int menu_id);

	boolean rmdelete(int menu_id);

}
