package kr.co.invegan.board.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.invegan.board.dao.RestaurantDAO;
import kr.co.invegan.board.dto.MenuDTO;
import kr.co.invegan.board.dto.RestaurantDTO;

@Service
public class RestaurantService {
	
	@Autowired RestaurantDAO dao;

	Logger logger = LoggerFactory.getLogger(getClass());

	private String root = "C:/upload/";
	
	public void restaurantWrite(String user_no, MultipartFile[] uploadImages, HashMap<String, Object> param){
		logger.info("restaurantWrite");
		
		int intUser_no = Integer.parseInt(user_no);
		
		RestaurantDTO dto = new RestaurantDTO();
		dto.setUser_no(intUser_no);
		dto.setCategory("식당");
		dto.setTitle((String) param.get("title"));
		dto.setAddress((String) param.get("address"));
		dto.setContent((String) param.get("content"));
		dto.setPhone((String) param.get("phone"));
		dto.setHours((String) param.get("hours"));
		
		// Board 인서트
		dao.BoardWrite(dto);
		// Restaurant 인서트
		dao.restaurantWrite(dto);
		
		int post_id = dto.getPost_id();
		logger.info("post_id : "+post_id);

		String menu = (String) param.get("menu");	
		logger.info("menu : "+menu);
		
		menuWrite(post_id,menu);
		
		try {
			saveFile(post_id,uploadImages);
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
	
	private void menuWrite(int post_id, String menu) {
		String[] menuArr= menu.split(",");
		for (int i = 0; i < menuArr.length; i+=3) {
			MenuDTO dto = new MenuDTO();
			dto.setPost_id(post_id);
			dto.setMenu_name(menuArr[i]);
			dto.setPrice(menuArr[i+1]);
			String vt = menuArr[i+2];
			int i_vt = Integer.parseInt(vt);
			dto.setVegan_type(i_vt);
			dao.menuWrite(dto);
		}
	}

	private void saveFile(int post_id, MultipartFile[] uploadImages) throws Exception {
		
		String idx = ""+post_id;
		
		for (MultipartFile image : uploadImages) {
			String oriFileName = image.getOriginalFilename();
			if(!oriFileName.equals("")) {

				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				String server_file_name = System.currentTimeMillis()+ext;
				
				byte[] arr = image.getBytes();
				Path path = Paths.get(root+server_file_name);
				logger.info("arr : "+arr);
				logger.info("path : "+path);
				
				// 파일저장
				Files.write(path, arr);
				
				// DB저장
				dao.writePhoto(idx,server_file_name,"식당");
			}
		}
	}
	

	
	
}
