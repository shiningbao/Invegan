package kr.co.invegan.board.dao;

import java.util.ArrayList;

import kr.co.invegan.board.dto.MenuDTO;
import kr.co.invegan.board.dto.RestaurantDTO;
import kr.co.invegan.member.dto.MemberDTO;

public interface RestaurantDAO {

	void boardWrite(RestaurantDTO dto);

	void restaurantWrite(RestaurantDTO dto);

	void menuWrite(MenuDTO dto);

	void photoWrite(String post_id, String server_file_name, String category);

	RestaurantDTO restaurantDetail(int post_id);

	ArrayList<MemberDTO> menuDetail(int post_id);

	ArrayList<String> photoList(int post_id);

	ArrayList<RestaurantDTO> restaurantList();


}
