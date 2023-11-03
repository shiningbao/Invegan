package kr.co.invegan.board.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import kr.co.invegan.board.dao.FeedDAO;
import kr.co.invegan.board.dto.FeedDTO;
import kr.co.invegan.board.dto.FeedListDTO;
import kr.co.invegan.board.dto.PhotoDTO;

@Service
public class FeedService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired FeedDAO dao;
	PhotoDTO photodto = new PhotoDTO();

	private String root = "C:/upload/";
	
	public void write(int userno, HashMap<String, String> params, MultipartFile[] uploadimages) throws Exception {
		
		FeedDTO dto = new FeedDTO();
		dto.setContent(params.get("content"));
		dto.setUser_no(userno);
//		dto.setTag_content(params.get("feedTag"));
		dao.feedWrite(dto);
		
		int feedidx = dto.getTag_id();
		int postidx = dto.getPost_id();
		dto.setTag_id(feedidx);
		dto.setPost_id(postidx);
		logger.info("feedidx:"+feedidx);
		logger.info("postidx:"+postidx);
		
		String[] tags = params.get("feedTag").split("[,\\s]+"); 
		for (String tag : tags) {
			if(!tag.startsWith("#")) {
				tag = "#" +tag;
			}
				
				dto.setTag_content(tag);
				dao.tagWrite(dto);
				
				dao.feedtagWrite(dto);
				
			
		}
		
		if(postidx>0) {
			saveFile(postidx, uploadimages);
				
		
		}
		
	}
	private void saveFile(int postidx, MultipartFile[] uploadimages) throws Exception {
		
		
		for(MultipartFile photo : uploadimages) {
			String oriFileName = photo.getOriginalFilename();
			logger.info("oriFileName :" +oriFileName);
			
			if(!oriFileName.equals("")) {
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				logger.info("ext:"+ext);
				
				String server_file_name = System.currentTimeMillis()+ext;
				logger.info("서버파일이름: "+server_file_name);
				
				photodto.setServer_file_name(server_file_name);
				
				byte[] arr = photo.getBytes();
				Path path = Paths.get(root+server_file_name);
				Files.write(path, arr);
				
				String server_file_name1 = photodto.getServer_file_name();
				dao.feedWritePhoto(postidx,server_file_name1) ;
				
				
				
				
			}
		}
		
	}
	public ArrayList<FeedListDTO> list() {
		
		
		
		return dao.list();
	}
	
	public ArrayList<FeedListDTO> detailList(int post_id) {
		
		return dao.detailList(post_id);
	}
	
}

	
	
	



	

