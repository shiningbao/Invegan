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
}
