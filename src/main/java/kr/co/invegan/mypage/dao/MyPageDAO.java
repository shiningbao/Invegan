package kr.co.invegan.mypage.dao;

import java.util.ArrayList;

import kr.co.invegan.mypage.dto.MyPageDTO;

public interface MyPageDAO {

	ArrayList<MyPageDTO> userInfo(String userId);

	int overlay(String nickname);

	ArrayList<MyPageDTO> requestBoardList(int user_no);

	ArrayList<MyPageDTO> recipeBoardList(int user_no);

	ArrayList<MyPageDTO> freeBoardList(int user_no);

	ArrayList<MyPageDTO> feedList(int user_no);

	void delUser(int user_no);

	ArrayList<MyPageDTO> recipeComments(int user_no);

	ArrayList<MyPageDTO> recipeFavorite(int user_no);

	ArrayList<MyPageDTO> freeComments(Integer user_no);

	ArrayList<MyPageDTO> feedComments(int user_no);



}
