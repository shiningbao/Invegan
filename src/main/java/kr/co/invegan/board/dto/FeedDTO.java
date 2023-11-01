package kr.co.invegan.board.dto;

import java.sql.Date;

public class FeedDTO {
	
	private int post_id;
	private String title;
	private String content;
	private int views;
	private int is_hidden;
	private String category;
	private int user_no;
	private String feedTag;

	private Date date;
	public String getFeedTag() {
		return feedTag;
	}
	public void setFeedTag(String feedTag) {
		this.feedTag = feedTag;
	}
	

	
	public int getPost_id() {
		return post_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getIs_hidden() {
		return is_hidden;
	}
	public void setIs_hidden(int is_hidden) {
		this.is_hidden = is_hidden;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	
	
}
