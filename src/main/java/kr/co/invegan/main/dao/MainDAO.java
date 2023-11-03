package kr.co.invegan.main.dao;

import kr.co.invegan.member.dto.MemberDTO;

public interface MainDAO {

	MemberDTO memberInfo(String user_no);

}
