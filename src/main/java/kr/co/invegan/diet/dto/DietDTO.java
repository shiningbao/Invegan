package kr.co.invegan.diet.dto;

public class DietDTO {
	
	private String user_id;
	
	private int diet_id;
	private String date;
	private String diet_category;
	
	private int menu_id;
	private String recipe_name;
	private String category;
	
	private int food_id;
	private int gram;
	
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getDiet_id() {
		return diet_id;
	}
	public void setDiet_id(int diet_id) {
		this.diet_id = diet_id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDiet_category() {
		return diet_category;
	}
	public void setDiet_category(String diet_category) {
		this.diet_category = diet_category;
	}
	public int getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(int menu_id) {
		this.menu_id = menu_id;
	}
	public String getRecipe_name() {
		return recipe_name;
	}
	public void setRecipe_name(String recipe_name) {
		this.recipe_name = recipe_name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getFood_id() {
		return food_id;
	}
	public void setFood_id(int food_id) {
		this.food_id = food_id;
	}
	public float getGram() {
		return gram;
	}
	public void setGram(int gram) {
		this.gram = gram;
	}
	
	
	
}
