package kr.co.invegan.main.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.code.geocoder.Geocoder;
import com.google.code.geocoder.GeocoderRequestBuilder;
import com.google.code.geocoder.model.GeocodeResponse;
import com.google.code.geocoder.model.GeocoderRequest;
import com.google.code.geocoder.model.GeocoderResult;
import com.google.code.geocoder.model.GeocoderStatus;
import com.google.code.geocoder.model.LatLng;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.maps.GeoApiContext;
import com.google.maps.GeocodingApi;
import com.google.maps.GeocodingApiRequest;
import com.google.maps.errors.ApiException;
import com.google.maps.model.GeocodingResult;

import kr.co.invegan.board.dao.RestaurantDAO;
import kr.co.invegan.board.dto.RestaurantDTO;
import kr.co.invegan.main.dao.MainDAO;
import kr.co.invegan.main.dto.restaurantFilterListDTO;
import kr.co.invegan.member.dto.MemberDTO;

@Service
public class MainService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MainDAO dao;
/*
	public ArrayList<restaurantFilterListDTO> restaurantFilterList(HttpSession session, double userLat, double userLng) {
		
		ArrayList<restaurantFilterListDTO> result = null;
		String vegan_type;
		List<String> vt = null;
		HashMap<String, Integer> rangeCnt = null;
		int dist = 0;
		
		MemberDTO loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		// 로그인 여부 
		if(loginInfo != null) {
			// 회원 맞춤 정보 제공
			vegan_type = ""+dao.veganType(loginInfo.getUser_no());
			vt = Arrays.asList(vegan_type); //회원의 비건단계
			
			rangeCnt = dao.rangeCnt(vt, userLat, userLng);
			logger.info("rangeCnt : "+rangeCnt.get("5km")+"/"+rangeCnt.get("10km")+"/"+rangeCnt.get("15km")+"/");
			// 해당하는 비건단계
			
			if(rangeCnt.get("5km") >= 20) {
				dist = 5;
			}else if(rangeCnt.get("10km") >= 20) {
				dist = 10;
			}else if(rangeCnt.get("15km") >= 20) {
				dist = 15;
			}else {
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
		rangeCnt = dao.rangeCnt(vt, userLat, userLng);
		int dist5 = rangeCnt.get("5km");
		int dist10 = rangeCnt.get("10km");
		int dist15 = rangeCnt.get("15km");
		logger.info("rangeCnt : "+ rangeCnt.get("5km")+"/"+ rangeCnt.get("10km")+"/"+ rangeCnt.get("15km"));
		if(dist5 >= 20) {
			dist = 5;
		}else if(dist10 >= 20) {
			dist = 10;
		}else if(dist15 >= 20) {
			dist = 15;
		}else {
			dist = 1000;
		}
		
		logger.info("vt :"+vt+" / dist: "+dist);
		result = dao.restaurantFilterList(vt, userLat, userLng,dist);
		
		return result;

	}
    
   */
    
}
