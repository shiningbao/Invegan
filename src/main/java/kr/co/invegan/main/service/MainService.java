package kr.co.invegan.main.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.invegan.board.dto.FeedListDTO;
import kr.co.invegan.main.dao.MainDAO;
import kr.co.invegan.main.dto.distCntDTO;
import kr.co.invegan.main.dto.restaurantFilterListDTO;
import kr.co.invegan.member.dto.MemberDTO;

@Service
public class MainService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MainDAO dao;

	public ArrayList<restaurantFilterListDTO> restaurantFilterList(HttpSession session, double userLat, double userLng) {
		
		ArrayList<restaurantFilterListDTO> result = null;
		String vegan_type;
		List<String> vt = null;
		distCntDTO distCnt = null;
		int dist = 0;
		
		MemberDTO loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		// 로그인 여부 
		if(loginInfo != null) {
			// 회원 맞춤 정보 제공
			vegan_type = ""+dao.veganType(loginInfo.getUser_no());
			vt = Arrays.asList(vegan_type); //회원의 비건단계
			
			distCnt = dao.rangeCnt(vt, userLat, userLng);
			logger.info("distCnt : "+distCnt);
			if(distCnt != null) {
				logger.info("distCnt : "+distCnt.getCount5()+"/"+distCnt.getCount10()+"/"+distCnt.getCount15()+"/");
				if(distCnt.getCount5() >= 20) {
					dist = 5;
				}else if(distCnt.getCount10() >= 20) {
					dist = 10;
				}else if(distCnt.getCount15() >= 20) {
					dist = 15;
				}
			}
			if(dist == 0) {
				// 비건단계 확대
				vt = null;
				if(vegan_type.equals("1")) vt = Arrays.asList("1");
				if(vegan_type.equals("2")) vt = Arrays.asList("1","2");
				if(vegan_type.equals("3")) vt = Arrays.asList("1","2","3");
				if(vegan_type.equals("4")) vt = Arrays.asList("1","2","4");
				if(vegan_type.equals("5")) vt = Arrays.asList("1","2","3","4","5");
				if(vegan_type.equals("6")) vt = Arrays.asList("1","2","3","4","5","6");
				if(vegan_type.equals("7")) vt = Arrays.asList("1","2","3","4","5","7");
				if(vegan_type.equals("8")) vt = Arrays.asList("1","2","3","4","5","6","7","8");
				if(vegan_type.equals("9")) vt = Arrays.asList("1","2","3","4","5","6","7","8","9");
				logger.info("식당 수 부족, 비건 단계 확대 / vt: "+vt);
			}
		}else {
			logger.info("비로그인");
			vt = Arrays.asList("1","2","3","4","5","6","7","8","9");
		}
		
		if(dist == 0) {
			distCnt = dao.rangeCnt(vt, userLat, userLng);
			logger.info("rangeCnt : "+ distCnt.getCount5()+"/"+ distCnt.getCount10()+"/"+ distCnt.getCount15());
			if(distCnt.getCount5() >= 20) {
				dist = 5;
			}else if(distCnt.getCount10() >= 20) {
				dist = 10;
			}else if(distCnt.getCount15() >= 20) {
				dist = 15;
			}else {
				dist = 1000;
			}
		}
		logger.info("vt :"+vt+" / dist: "+dist);
		result = dao.restaurantFilterList(vt, userLat, userLng,dist);
		
		return result;

	}

	public ArrayList<FeedListDTO> feedFilterList(HttpSession session) {
		MemberDTO loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		
		if(loginInfo != null) {
			// 로그인 상태
			String interests = dao.interests(loginInfo.getUser_no());
			logger.info("interests: "+interests);
			String[] inteArr = interests.split(",");
			
		}else {
			// 비로그인 상태
			logger.info("비로그인");
		}
		ArrayList<FeedListDTO> result = dao.feedFilterList();
		return result;
	}
    
    
}
