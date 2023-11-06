package kr.co.invegan.member.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import kr.co.invegan.member.dto.MemberDTO;

public interface MemberDAO {

	MemberDTO login(HashMap<String, String> params);

	String findId(String email);

	int signup(HashMap<String, String> params);

//	int signup(String id, String pw, String nickname, String birthdate, String gender, int vegan_type,
//			String[] interests);


	//boolean login(Model model);

}
