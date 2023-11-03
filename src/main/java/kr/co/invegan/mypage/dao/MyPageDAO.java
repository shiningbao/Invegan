package kr.co.invegan.mypage.dao;

import java.util.ArrayList;

import kr.co.invegan.mypage.dto.MyPageDTO;

public interface MyPageDAO {

	ArrayList<MyPageDTO> userInfo(String userId);

	int overlay(String nickname);

	ArrayList<MyPageDTO> requestBoardList(int user_no);

	ArrayList<MyPageDTO> recipeBoardList(int user_no);

	ArrayList<MyPageDTO> freeBoardList(int user_no);

	ArrayList<MyPageDTO> feedList(Integer user_no);



}
