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
	
	public ArrayList<MyPageDTO> userInfo() {
		
		return dao.userInfo();
	}

	public boolean overlay(String nickname) {
		boolean use = false;
		int cnt = dao.overlay(nickname);
		if(cnt==0) {
			use = true;
		}
		return use;
	}

	public ArrayList<MyPageDTO> requestBoardList() {
		return dao.requestBoardList();
	}

	public ArrayList<MyPageDTO> recipeBoardList() {
		return dao.recipeBoardList();
	}
	
	public ArrayList<MyPageDTO> freeBoardList() {
		return dao.freeBoardList();
	}




}
