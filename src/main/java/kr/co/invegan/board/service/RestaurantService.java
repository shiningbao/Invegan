package kr.co.invegan.board.service;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.invegan.board.dao.RestaurantDAO;
import kr.co.invegan.board.dto.MenuDTO;
import kr.co.invegan.board.dto.RestaurantDTO;
import kr.co.invegan.member.dto.MemberDTO;

@Service
public class RestaurantService {
	
	@Autowired RestaurantDAO dao;

	Logger logger = LoggerFactory.getLogger(getClass());

	private String root = "C:/upload/";
	
	// 작성 메서드
	public void restaurantWrite(int user_no, MultipartFile[] uploadImages, HashMap<String, Object> param){
		logger.info("restaurantWrite");
		
		RestaurantDTO dto = insert_RestaurantDTO(user_no, param);
		
		// Board 인서트
		dao.boardWrite(dto);
		// Restaurant 인서트
		dao.restaurantWrite(dto);
		
		int post_id = dto.getPost_id();
		logger.info("post_id : "+post_id);
		
		boolean menuChk = menuWrite(post_id, param.get("menu"));
		
		try {
			saveFile(post_id,uploadImages);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	// 수정 메서드
	public String restaurantUpdate(int user_no, MultipartFile[] uploadImages, HashMap<String, Object> param) {
		String msg = "수정 실패";
		// 업데이트
		logger.info("restaurantUpdate");
		// 1. RestaurantDTO에 담기
		RestaurantDTO dto = insert_RestaurantDTO(user_no, param);
		int post_id = Integer.parseInt(""+param.get("post_id"));
		logger.info("post_id 형변환");
		dto.setPost_id(post_id);
		// 2. 보드테이블, 레스토랑 테이블 업데이트
		int result_board = dao.boardUpdate(dto);
		logger.info("result_board: "+result_board);
		int result_restaurant = dao.restaurantUpdate(dto);
		logger.info("result_restaurant: "+result_restaurant);
		// 3. 기존 메뉴 삭제 -> 새로운 메뉴 인서트
		dao.menuDel(post_id);
		boolean menuChk = menuWrite(post_id, param.get("menu"));
		logger.info("menuChk: "+menuChk);
		// 4. imgDelList 의 사진 삭제
		boolean imgChk = delFile(post_id, param.get("imgDelList"));
		logger.info("imgChk: "+imgChk);
		try {
			saveFile(post_id,uploadImages);
		} catch (Exception e) {
			logger.info("saveFile 에러");
			e.printStackTrace();
		}
		if(result_board == 1 && result_restaurant == 1 && menuChk && imgChk) {
			msg = "수정 완료";
		}else {
			logger.info("수정 중 문제 발생 : "+result_board+result_restaurant+menuChk+imgChk);
		}
		return msg;
	}
	
	// 수정하는 과정에서 이미지를 DB와 로컬에서 삭제하는 메서드
	private boolean delFile(int post_id, Object object_imgDel) {
		String idx = ""+post_id;
		String imgDel = ""+object_imgDel;
		String[] imgDelArr = imgDel.split(",");
		int len = imgDelArr.length;
		int delImgChk = 0;
		if(len > 0 && !imgDelArr[0].equals("")) {
			for (String img : imgDelArr) {
				int delChk = dao.photoDel(idx, img);
				boolean delFileChk = false;
				File delFile = new File(root+img);
				if(delFile.exists()) {
					delFileChk = delFile.delete();
				}
				if(delFileChk && delChk == 1) {
					delImgChk ++;
				}else {
					logger.info("이미지 삭제 실패 : "+img);
				}
			}
		}
		return len == delImgChk;	
	}
	
	
	// 메뉴를 DB에 인서트하는 메서드	
	private boolean menuWrite(int post_id, Object object_menu) {
		String menu = (String) object_menu;	
		String[] menuArr= menu.split(",");
		int len = menuArr.length;
		logger.info("menuArr : "+menuArr+" / len : "+len);
		int chk = 0;
		if(len > 0) {
			for (int i = 0; i < len; i+=3) {
				MenuDTO dto = new MenuDTO();
				dto.setPost_id(post_id);
				dto.setMenu_name(menuArr[i]);
				dto.setPrice(menuArr[i+1]);
				String vt = menuArr[i+2];
				int i_vt = Integer.parseInt(vt);
				dto.setVegan_type(i_vt);
				int result = dao.menuWrite(dto);
				chk += result;
			}
		}
		return (len/3) == chk;
	
	}

	
	// 서버에 파일 저장하고 DB에 인서트하는 메서드
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
				dao.photoWrite(idx,server_file_name,"식당");
			}
		}
	}
	
	//상세보기 메서드 들
	public RestaurantDTO restaurantDetail(int post_id) {
		logger.info("rD");
		return dao.restaurantDetail(post_id);		
	}

	public ArrayList<MemberDTO> menuDetail(int post_id) {
		return dao.menuDetail(post_id);
	}

	public ArrayList<String> photoList(int post_id) {
		return dao.photoList(post_id);
	}

	public ArrayList<RestaurantDTO> restaurantList() {
		return dao.restaurantList();
	}
	
	
	// param 의 값을 RestaurantDTO 에 담아주는 메서드
	private RestaurantDTO insert_RestaurantDTO(int user_no, HashMap<String, Object> param) {
		RestaurantDTO dto = new RestaurantDTO();
		dto.setUser_no(user_no);
		dto.setCategory("식당");
		dto.setTitle((String) param.get("title"));
		dto.setAddress((String) param.get("address"));
		dto.setContent((String) param.get("content"));
		dto.setPhone((String) param.get("phone"));
		dto.setHours((String) param.get("hours"));
		return dto;
	}

	public int reviewWrite(HashMap<String, String> param) {
		
		
		
		return 0;
	}
	

	
	
}
