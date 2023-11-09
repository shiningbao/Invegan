package kr.co.invegan.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.invegan.board.service.RequestService;

@Controller
public class RequestController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired RequestService serivce;
}
