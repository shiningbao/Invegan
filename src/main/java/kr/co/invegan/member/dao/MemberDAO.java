package kr.co.invegan.member.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import kr.co.invegan.member.dto.MemberDTO;

public interface MemberDAO {

	MemberDTO login(HashMap<String, String> params);

	String findId(String email);

	int signup(HashMap<String, String> params);

	//boolean login(Model model);

}
