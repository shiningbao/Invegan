package kr.co.invegan.board.dao;

import kr.co.invegan.board.dto.MenuDTO;
import kr.co.invegan.board.dto.RestaurantDTO;

public interface RestaurantDAO {

	void BoardWrite(RestaurantDTO dto);

	void restaurantWrite(RestaurantDTO dto);

	void writePhoto(String post_id, String server_file_name, String category);

	void menuWrite(MenuDTO dto);

}
