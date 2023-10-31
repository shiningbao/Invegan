package kr.co.invegan.board.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import kr.co.invegan.board.dao.FeedDAO;
import kr.co.invegan.board.dto.FeedDTO;
import kr.co.invegan.board.dto.PhotoDTO;

@Service
public class FeedService {
	@Autowired FeedDAO dao;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	

	public void writeFeed(FeedDTO dto) {
		logger.info("WriteFeed 접근");
		logger.info("content:"+dto.getContent());
		
		dao.writeFeed(dto);
		
	}

	public void writeTag(FeedDTO dto) {
		logger.info("WriteTag 접근");
		
		String FeedTag = dto.getFeedTag();
		String[] tags = FeedTag.replaceAll("\\s", "").split("#");
		for (String tag : tags) {
	        if (!tag.isEmpty()) {
	            // 데이터베이스에 태그 저장 또는 원하는 작업 수행
	            dao.writeTag("#"+tag);
	        }
	    }
	
	}



	
}
