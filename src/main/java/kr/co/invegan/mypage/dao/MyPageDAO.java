package kr.co.invegan.mypage.dao;

import java.util.ArrayList;

import kr.co.invegan.mypage.dto.MyPageDTO;

public interface MyPageDAO {

	ArrayList<MyPageDTO> userInfo();

	int overlay(String nickname);

	ArrayList<MyPageDTO> requestBoardList();

	ArrayList<MyPageDTO> recipeBoardList();

	ArrayList<MyPageDTO> freeBoardList();



}
