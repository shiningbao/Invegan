package kr.co.invegan.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import kr.co.invegan.board.dto.FeedDTO;
import kr.co.invegan.board.dto.FeedListDTO;
import kr.co.invegan.board.dto.PhotoDTO;

public interface FeedDAO {
	
	
	void feedWrite(FeedDTO dto);

	void tagWrite(FeedDTO dto);


	void feedtagWrite(FeedDTO dto);


	
	
	void feedWritePhoto(@Param("postidx") int postidx, @Param("server_file_name") String server_file_name);

	ArrayList<FeedListDTO> list();

	
	


	
	


	
	

}
