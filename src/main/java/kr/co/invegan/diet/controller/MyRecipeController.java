package kr.co.invegan.diet.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.invegan.diet.service.MyRecipeService;

@Controller
public class MyRecipeController {

	@Autowired MyRecipeService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value="/myRecipe/MyRecipeList.go")
	public String MyRecipelist() {
		
		return "/myRecipe/MyRecipeList";
	}
	
	@RequestMapping(value="/myRecipe/mlist.go")
	public String Mlistgo() {
		return "/myRecipe/addRecipeMaterial";
	}
	
	@RequestMapping(value="/myRecipe/mlist.do")
	@ResponseBody
	public HashMap<String, Object> mListdo (@RequestParam String fname) {
		
		logger.info("food_name :"+fname);	
		ArrayList<HashMap<String, Object>> mlist = service.mlist(fname);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("mlist", mlist);
		result.put("size", mlist.size());
		
		return result;
	}
	
	@RequestMapping(value="/myRecipe/mMaterial")
	public HashMap<String, Object> mMaterial(@RequestParam String mName, @RequestParam int gram) {
		
		logger.info("mName : " + mName);
		logger.info("gram : "+gram);
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> mMaterial = service.mMaterial(mName, gram);
		
		return result;
	}
	
	@RequestMapping(value="/myRecipe/rlistUpdate.do", method = RequestMethod.POST)
	public HashMap<String, Object> rListUpdate(@RequestParam HashMap<String, Object> params) {
		
		logger.info("params : "+params);
		
		String category = (String) params.get("category");
		logger.info("category : "+category);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		service.rListUpdate(params);
		return result;
	}
}
