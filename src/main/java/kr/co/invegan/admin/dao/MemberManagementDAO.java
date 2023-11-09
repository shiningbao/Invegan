package kr.co.invegan.admin.dao;

import java.util.ArrayList;

import kr.co.invegan.member.dto.MemberDTO;

public interface MemberManagementDAO {

	ArrayList<MemberDTO> memberList(int offset);

	int totalPage();

}
