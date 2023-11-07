package kr.co.invegan.board.controller;

import java.lang.System.Logger;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.invegan.board.dto.FeedDTO;
import kr.co.invegan.board.dto.FeedListDTO;
import kr.co.invegan.board.dto.PhotoDTO;
import kr.co.invegan.board.service.FeedService;
import kr.co.invegan.member.dto.MemberDTO;

@Controller
@RequestMapping("/feed")
public class FeedController {
   @Autowired FeedService service;
   org.slf4j.Logger logger = LoggerFactory.getLogger(getClass());
   MemberDTO memberdto = new MemberDTO();

   
   
   @RequestMapping(value = "write.go") // feedWrite 페이지에 대한 URL 매핑을 추가
   public String feedWrite(Model model) {
      logger.info("feedWrite 접근");
      // 필요한 모델 데이터를 추가
      
      return "feed/feedWrite"; // feedWrite.jsp로 이동
   }
   
   
   
   @RequestMapping(value = "write")
   @ResponseBody
   public String write(HttpSession session, Model model,@RequestParam HashMap<String, String> params, @RequestParam("photos") MultipartFile[] uploadimages) throws Exception {
       logger.info("내용:" + params.get("content"));
       logger.info("태그:" + params.get("feedTag"));
       logger.info("이미지:" + uploadimages);
       memberdto =  (MemberDTO) session.getAttribute("loginInfo");
       
       int user_no = memberdto.getUser_no();
       session.setAttribute("user_no", user_no);
       
       
       // 나머지 로직
       logger.info("loginInfo:"+memberdto);
       if(memberdto!=null) {
    	   service.write(user_no,params,uploadimages);
       }
       
       
       return "success";
   }
   
   
   
   @RequestMapping(value="list.go")
   public String list() {
      logger.info("controller list 접근");
      return "feed/feedList";
   }
   
   @RequestMapping(value="feedListCall")
   @ResponseBody
   public HashMap<String, Object> feedListCall(HttpSession session, @RequestParam("limitcnt") int limitcnt){
      
      HashMap<String, Object> result = new HashMap<String, Object>();
      logger.info("controller feedListCall 접근");
      logger.info("limitcnt :"+limitcnt);
      
      
      ArrayList<FeedListDTO> list = service.list(limitcnt);
      
      result.put("list", list);
      result.put("listSize", list.size());
      result.put("limitcnt",limitcnt);
      result.put("loginInfo", session.getAttribute("loginInfo"));
      logger.info("list size:"+ list.size());
      return result;
   }
   
   
   @RequestMapping(value="detail.go")
   public String detail() {
      logger.info("controller detail list 접근");
      
      
      return "feed/feedDetail";
   }
   
   @RequestMapping(value="feedDetailCall")
   @ResponseBody
   public HashMap<String, Object> feedDetailCall(HttpSession session,
		   @RequestParam("post_id") int post_id
		   ){
		   
      logger.info("상세보기 접근");
      logger.info("post id:"+post_id);
      memberdto =  (MemberDTO) session.getAttribute("loginInfo");
      int user_no =0;
      if(memberdto != null) {
    	  user_no = memberdto.getUser_no();
          session.setAttribute("user_no", user_no);
          
      }
      
      HashMap<String, Object> result = new HashMap<String, Object>();
      ArrayList<FeedListDTO> detailList = service.detailList(post_id);
      ArrayList<FeedListDTO> commentList = service.commentList(post_id);
      int findBoardUserno =service.findBoardUserno(post_id);
//      ArrayList<FeedListDTO> comment_text = service.comment_text(post_id);
//      ArrayList<FeedListDTO> commentWrite = service.feedComment(feedComment ,session); 
//      String user_no = (String) session.getAttribute("user_no"); 
//      logger.info("현재세션:"+user_no);
//      String is_admin = (String) session.getAttribute("is_admin");
//      logger.info("현재관리자여부:"+ is_admin);
      logger.info("현재 로그인세션 :"+user_no);
      logger.info("게시물 로그인 세션 :"+findBoardUserno);
      result.put("loginInfo", session.getAttribute("loginInfo"));
      result.put("detailList", detailList);
      result.put("commentList", commentList);
      result.put("findBoardUserno", findBoardUserno);
      result.put("user_no", user_no);
      
      
      return result;
   }
   @RequestMapping(value="feedWriteComment")
   @ResponseBody
   public HashMap<String, Object> feedWriteComment(HttpSession session,@RequestParam HashMap<String, String> params ) {
	   HashMap<String, Object> result = new HashMap<String, Object>();
	   logger.info("feedWriteComment 컨트롤러 접근");
	   
	   // user_no 로그인 로직설정
	   
	   memberdto =  (MemberDTO) session.getAttribute("loginInfo");
	   
	   
	   int user_no =0;
	      if(memberdto != null) {
	    	  user_no = memberdto.getUser_no();
	          session.setAttribute("user_no", user_no);
	          service.feedWriteComment(user_no,params);
	          
	      }
          
	   
	   logger.info("params :"+params);
	   logger.info("user_no:"+user_no);
	   
	   String comment_user_nickname = service.findCommentUserNickName(user_no);
	   
	   result.put("user_no", user_no);
	   result.put("comment_text", params.get("comment_text"));
	   result.put("post_id", params.get("post_id"));
	   result.put("comment_user_nickname", comment_user_nickname); 
	   
	   return result;
   }
    
   
   @RequestMapping(value="feedDelPost/delete") 
   @ResponseBody
   public String feedDelPost(Model model, HttpSession session , @RequestParam int post_id) {
	   	   
	   service.feedDelPost(post_id);	   
	   return "success";
   }
   
   
   @RequestMapping(value="feedUpdatePost/update" ,method = RequestMethod.POST) 
   @ResponseBody
   public String feedUpdatePost(Model model, HttpSession session ,
		   @RequestParam HashMap<String, String> params) {
//	   FeedDTO dto = new FeedDTO();
//	   dto.setContent(feed_content);
	   logger.info("feed_content:"+params.get("feed_content"));
	   logger.info("post_id:"+params.get("post_id"));
	   service.feedUpdatePost(params);
	   return "success";
   }
   
   
   
   
   
   @RequestMapping(value="update.go")
   public String update() {
      logger.info("controller detail update 접근");
      
      
      return "feed/feedUpdate";
   }
   
   @RequestMapping(value = "searchByTag")
   @ResponseBody
   public HashMap<String, Object> searchByTag(@RequestParam("searchbt") String searchbt) {
       HashMap<String, Object> result = new HashMap<String, Object>();
       logger.info("Searching by tag: " + searchbt);

       // 검색어(searchbt)를 이용하여 게시물을 검색하고 결과를 가져옵니다.
       ArrayList<FeedListDTO> searchResult = service.searchByTag(searchbt);

       result.put("list", searchResult);
       return result;
   }
   
   

      
   
}