package kr.co.invegan.member.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface MemberDAO {

	HashMap<String, Object> login(HashMap<String, String> params);

	String findId(String email);

	//boolean login(Model model);

}
