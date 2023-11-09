package kr.co.invegan.diet.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.invegan.diet.dto.DailyNutriDTO;
import kr.co.invegan.diet.dto.DietDTO;
import kr.co.invegan.diet.dto.FoodDataDTO;
import kr.co.invegan.diet.service.DietService;
import kr.co.invegan.member.dto.MemberDTO;

@Controller
public class DietController {

	@Autowired
	DietService dietService;

	Logger logger = LoggerFactory.getLogger(getClass());

	MemberDTO loginInfo = null;
	
	// 캘린더 페이지로 이동
	@RequestMapping(value = "diet/tempCalander")
	public String tempCalander(HttpSession session, RedirectAttributes reAttr) {
		logger.info("식단 캘린더 페이지 이동 요청");
		String page = "redirect:/member/login.go";

		loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		if (loginInfo != null) {
			logger.info("로그인된 회원번호 : " + loginInfo.getUser_no());
			page = "diet/tempCalander";
		} else {
			logger.info("로그인 되어있지 않음");
			reAttr.addFlashAttribute("msg", "로그인 후 이용 가능한 서비스입니다.");
		}
		return page;
	}
	
	// 식단관리 페이지로 이동
	@RequestMapping(value = "diet/dietMgmt")
	public String dietMgmt(HttpSession session, @RequestParam String date, Model model) {
		logger.info("식단관리 페이지 이동 요청");
		loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		String page = "redirect:/member/login.go";
		if (loginInfo == null) {
			logger.info("로그인 되어있지 않음");
			model.addAttribute("msg", "로그인 후 이용 가능한 서비스입니다.");
		} else {
			page = "diet/dietMgmt";
			// 로그인 정보 체크
			logger.info("로그인된 회원번호 : " + loginInfo.getUser_no());
			logger.info("로그인된 아이디 : " + loginInfo.getId());
			ArrayList<DietDTO> dietList = dietService.getDietList(date, loginInfo.getUser_no());

			model.addAttribute("dietList", dietList);

			model.addAttribute("dietListSize", dietList.size());
			logger.info("리스트 개수 : " + dietList.size());
		}
		return page;
	}
	// 영양소 합계 불러오기
	@RequestMapping(value = "diet/getNutri")
	@ResponseBody
	public HashMap<String, Object> getNutri(HttpSession session, 
			@RequestParam String selectDate, @RequestParam String dietCate) {
		logger.info("영양소 정보 불러오기 요청");
		
		loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		int loginUser_no = loginInfo.getUser_no();
		// 회원이 섭취한 영양소 합 가져오기
		FoodDataDTO nutriInfo = dietService.getNutri(loginUser_no, selectDate, dietCate);
		// 회원별 권장 섭취량 가져오기
		DailyNutriDTO getDailyNutri = dietService.getDailyNutri(loginUser_no);
		logger.info("dailyNutri result check member's age : "+ getDailyNutri.getAge());
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("nutr", nutriInfo);
		result.put("daily", getDailyNutri);
		session.setAttribute("nutriInfo", nutriInfo);
        FoodDataDTO var =  (FoodDataDTO) result.get("nutriInfo");
        logger.info(" result kcal : "+var.getKcal());
		return result;
	}
	
	
	// 메뉴 추가 페이지 이동
	@RequestMapping(value = "diet/addMenu.go")
	public String addMenuGo(HttpSession session, Model model, @RequestParam String sort, @RequestParam String date) {
		logger.info("메뉴 추가 페이지 요청 || sort값 = " + sort + " / date : " + date);
		// chk = true 이면 메뉴 추가
		// chk = false 이면 메뉴 수정
		// 추후 페이지 접근 제한에도 chk 활용
		session.setAttribute("upsertSort", sort);
		model.addAttribute("date", date);
		return "diet/addMenu";
	}
	
	// 메뉴 추가 페이지에 기본메뉴 탭 페이지
	@RequestMapping(value = "diet/defaultMenu.go")
	public String defaultMenuGo() {
		logger.info("기본메뉴 페이지 요청 || ");
		return "diet/defaultMenu";
	}
	
	// 메뉴추가 하기
	@RequestMapping(value = "diet/addMenu.do")
	@ResponseBody
	public HashMap<String, Object> addMenuDo(HttpSession session, @RequestParam HashMap<String, Object> params) {
		logger.info("메뉴 추가 / 수정 요청 ");
		logger.info(" |||||| params : " + params);
		String upsertSort = (String) session.getAttribute("upsertSort");
		loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		HashMap<String, Object> result = new HashMap<String, Object>();

		DietDTO dietDTO = new DietDTO();
		dietDTO.setUser_no(loginInfo.getId());
		dietDTO.setDate((String) params.get("select_date"));
		dietDTO.setFood_id(Integer.parseInt(params.get("food_id").toString()));
		dietDTO.setDiet_category((String) params.get("diet_category"));
		dietDTO.setCategory((String) params.get("menu_category"));
		dietDTO.setRecipe_name((String) params.get("recipe_name"));
		dietDTO.setGrams(Integer.parseInt(params.get("gram").toString()));

		String successMsg = dietService.addMenuDo(upsertSort, dietDTO);
		logger.info(successMsg);
		return result;
	}
	
	// 메뉴추가 페이지에서 식품 검색
	@RequestMapping(value = "diet/searchFood")
	@ResponseBody
	public HashMap<String, Object> searchFood(String keyword) {
		logger.info("식품 검색 기능 요청  || keyword : " + keyword);
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<FoodDataDTO> searchFoodResult = dietService.findFoodList(keyword);
		if (searchFoodResult.size() == 0) {
			result.put("success", 0);
			result.put("msg", "검색 결과가 없습니다.");
		} else {
			result.put("success", 1);
			logger.info("findFoodList size : " + searchFoodResult.size());
			result.put("findFoodList", searchFoodResult);
			result.put("findFoodListSize", searchFoodResult.size());
		}

		return result;
	}
	
	// 검색한 식품 영양소 보기
	@RequestMapping(value = "diet/showNutri")
	@ResponseBody
	public HashMap<String, Object> showNutri(int foodId) {
		logger.info("식품 영양상세보기 요청 || foodId : " + foodId);
		HashMap<String, Object> result = new HashMap<String, Object>();
		FoodDataDTO showNutri = dietService.showNutri(foodId);
		result.put("showNutri", showNutri);
		return result;
	}

}
