package kr.co.invegan.main.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.invegan.main.dao.MainDAO;
import kr.co.invegan.member.dto.MemberDTO;

@Service
public class MainService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MainDAO dao;

	public MemberDTO merberInfo(String user_no) {
		MemberDTO meberInfo = dao.memberInfo(user_no);
		logger.info("meberInfo : "+meberInfo);
		return meberInfo;
	}

}
