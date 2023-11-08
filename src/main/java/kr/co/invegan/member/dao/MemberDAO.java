package kr.co.invegan.member.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import kr.co.invegan.member.dto.MemberDTO;

public interface MemberDAO {

	MemberDTO login(HashMap<String, String> params);

	int signup(HashMap<String, String> params);
	
	String findId(String email2);
	
	String findPw(String id, String email);
	
	//String findPw(@Param("id") String id, @Param("email") String email);

	//String findId(@Param("nickname") String nickname, @Param("birthdate") String birthdate);


}
