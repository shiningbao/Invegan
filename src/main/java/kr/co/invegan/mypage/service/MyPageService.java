package kr.co.invegan.mypage.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.invegan.mypage.dao.MyPageDAO;
import kr.co.invegan.mypage.dto.MyPageDTO;

@Service
public class MyPageService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MyPageDAO dao;
	
	public ArrayList<MyPageDTO> userInfo(String loginId) {
		
		return dao.userInfo(loginId);
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

	




}
