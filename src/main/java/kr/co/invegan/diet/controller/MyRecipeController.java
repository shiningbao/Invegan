package kr.co.invegan.diet.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public HashMap<String, Object> mListdo(HttpSession session, @RequestParam String fname) {
		
		logger.info("food_name :"+fname);	
		ArrayList<HashMap<String, Object>> mlist = service.mlist(fname);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("mlist", mlist);
		result.put("size", mlist.size());
		
		return result;
	}
}
