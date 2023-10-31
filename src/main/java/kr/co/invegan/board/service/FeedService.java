package kr.co.invegan.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.invegan.board.dao.FeedDAO;

@Service
public class FeedService {
	@Autowired FeedDAO dao;
}
