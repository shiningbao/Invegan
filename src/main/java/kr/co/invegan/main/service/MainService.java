package kr.co.invegan.main.service;

import java.io.IOException;
import java.util.ArrayList;

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

import kr.co.invegan.board.dao.RestaurantDAO;
import kr.co.invegan.board.dto.RestaurantDTO;
import kr.co.invegan.main.dao.MainDAO;
import kr.co.invegan.member.dto.MemberDTO;

@Service
public class MainService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MainDAO dao;

	public void aaa(double userLat, double userLng) {
			logger.info("lat :"+userLat+" / lng: "+userLng);
			ArrayList<RestaurantDTO> restaurantList = dao.prf();
			for (RestaurantDTO restaurant : restaurantList) {
				Float[] resLatLng = geoCoding(restaurant.getAddress());
				logger.info("resLatLng : "+resLatLng[0]+" / "+resLatLng[1]);
		        double theta = userLng - resLatLng[1];
		        double dist = Math.sin(deg2rad(userLat))* Math.sin(deg2rad(resLatLng[0])) + Math.cos(deg2rad(userLat))*Math.cos(deg2rad(resLatLng[0]))*Math.cos(deg2rad(theta));
		        dist = Math.acos(dist);
		        dist = rad2deg(dist);
		        dist = dist * 60*1.1515*1609.344; // m 단위
		        logger.info(restaurant.getPost_id()+" : "+dist);
		        
			}
			
	}

	
    // 두 좌표 사이의 거리를 구하는 함수
    // dsitance(첫번쨰 좌표의 위도, 첫번째 좌표의 경도, 두번째 좌표의 위도, 두번째 좌표의 경도)
    private static double distance(double lat1, double lon1, double lat2, double lon2){
        double theta = lon1 - lon2;
        double dist = Math.sin(deg2rad(lat1))* Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1))*Math.cos(deg2rad(lat2))*Math.cos(deg2rad(theta));
        dist = Math.acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60*1.1515*1609.344;

        return dist; //단위 meter
    }
    
    //10진수를 radian(라디안)으로 변환
    private static double deg2rad(double deg){
        return (deg * Math.PI/180.0);
    }
    //radian(라디안)을 10진수로 변환
    private static double rad2deg(double rad){
        return (rad * 180 / Math.PI);
    }
    
    
    public Float[] geoCoding(String location) {	 
        Geocoder geocoder = new Geocoder();
        logger.info(location);
        GeocoderRequest geocoderRequest = new GeocoderRequestBuilder().setAddress(location).setLanguage("UTF-8").getGeocoderRequest(); 
        GeocodeResponse geocoderResponse;
        try {
            geocoderResponse = geocoder.geocode(geocoderRequest);
            if (geocoderResponse.getStatus() == GeocoderStatus.OK & !geocoderResponse.getResults().isEmpty()) {
                GeocoderResult geocoderResult = geocoderResponse.getResults().iterator().next();
                LatLng latitudeLongitude = geocoderResult.getGeometry().getLocation();
                Float[] coords = new Float[2];
                coords[0] = latitudeLongitude.getLat().floatValue();
                coords[1] = latitudeLongitude.getLng().floatValue();
                return coords;
            }else {
            	logger.info("lf문 안들어가짐");
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    
    
    
    
}
