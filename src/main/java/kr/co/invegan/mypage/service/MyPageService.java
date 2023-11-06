package kr.co.invegan.mypage.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.invegan.board.dto.PhotoDTO;
import kr.co.invegan.mypage.dao.MyPageDAO;
import kr.co.invegan.mypage.dto.MyPageDTO;

@Service
public class MyPageService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MyPageDAO dao;
	
	PhotoDTO photodto = new PhotoDTO();
	
	private String root = "C:/upload/";
	
	public ArrayList<MyPageDTO> userInfo(int user_no) {
		
		return dao.userInfo(user_no);
	}

	public boolean overlay(String nickname) {
		boolean use = false;
		int cnt = dao.overlay(nickname);
		if(cnt==0) {
			use = true;
		}
		return use;
	}

	public ArrayList<MyPageDTO> requestBoardList(int user_no) {
		return dao.requestBoardList(user_no);
	}

	public ArrayList<MyPageDTO> recipeBoardList(int user_no) {
		return dao.recipeBoardList(user_no);
	}
	
	public ArrayList<MyPageDTO> freeBoardList(int user_no) {
		return dao.freeBoardList(user_no);
	}

	public ArrayList<MyPageDTO> feedList(Integer user_no) {
		return dao.feedList(user_no);
	}

	public void delUser(int user_no) {
		dao.delUser(user_no);
	}

	public ArrayList<MyPageDTO> recipeComments(int user_no) {
		return dao.recipeComments(user_no);
	}

	public ArrayList<MyPageDTO> recipeFavorite(int user_no) {
		return dao.recipeFavorite(user_no);
	}

	public ArrayList<MyPageDTO> freeComments(int user_no) {
		return dao.freeComments(user_no);
	}

	public ArrayList<MyPageDTO> feedComments(int user_no) {
		return dao.feedComments(user_no);
	}

	public ArrayList<MyPageDTO> restaurantComments(Integer user_no) {
		return dao.restaurantComments(user_no);
	}

	public ArrayList<MyPageDTO> restaurantFavorite(Integer user_no) {
		return dao.restaurantFavorite(user_no);
	}

	public int updateNickname(String nickname, Integer user_no) {
		return dao.updateNickname(nickname,user_no);
	}

	public String pwConfirm(String pw, Integer user_no) {
		return dao.pwConfirm(pw,user_no);
	}

	public int completePw(Map<String, Object> params) {
		return dao.completePw(params);
	}

	public int save(Map<String, Object> params) {
		return dao.save(params);
	}

	/*
	 * public void imgUpload(MultipartFile photos, Integer user_no) throws
	 * IOException {
	 * 
	 * MyPageDTO dto = new MyPageDTO(); dto.setUser_no(user_no);
	 * dao.uploadProfile(dto);
	 * 
	 * int idx = dto.getUser_no();
	 * 
	 * 
	 * if(idx>0) { saveFile(photos,idx,user_no); }
	 * 
	 * }
	 * 
	 * private void saveFile(MultipartFile photos, int idx, Integer user_no) throws
	 * IOException { String oriFileName = photos.getOriginalFilename();
	 * logger.info(oriFileName);
	 * 
	 * if(!oriFileName.equals("")) { String ext =
	 * oriFileName.substring(oriFileName.lastIndexOf(".")); String server_file_name
	 * = System.currentTimeMillis()+ext;
	 * 
	 * // 파일 저장 byte[] arr = photos.getBytes(); Path path =
	 * Paths.get(root+server_file_name); Files.write(path, arr);
	 * 
	 * // 파일명, idx 를 Image 테이블에 추가
	 * dao.uploadProfileImg(idx,server_file_name,user_no); } }
	 */
	/*
	 * public HashMap<String, Object> list(String pagePerNum, String page) { int ppn
	 * = Integer.parseInt(pagePerNum); int p = Integer.parseInt(page);
	 * 
	 * int offset = (p-1)*ppn; ArrayList<MyPageDTO> list = dao.list(ppn,offset);
	 * 
	 * HashMap<String, Object> map = new HashMap<String, Object>();
	 * 
	 * int pages = dao.totalPage(ppn); logger.info("만들 수 있는 총 페이지 갯수 : "+pages);
	 * map.put("pages",pages); // 만들 페이지 수 map.put("list", list);
	 * 
	 * return map; }
	 */



	




}
