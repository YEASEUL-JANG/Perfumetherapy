package review.dto;

import java.sql.Date;

import items.itemsDTO;

public class ReviewDTO {
	private int num;//리뷰번호
	private String userid;//아이디
	private String age;//연령대
	private String gender;//성별
	private int idx;//상품번호
	private int review_star;//별점
	private String title;//제목
	private String content;//내용
	private int review_count;//조회수
	private String image_file;//이미지파일
	private Date reg_date;//작성일자
	private int comment_count;//답변갯수
	private itemsDTO itemsDTO;
	
	public itemsDTO getItemsDTO() {
		return itemsDTO;
	}
	public void setItemsDTO(itemsDTO itemsDTO) {
		this.itemsDTO = itemsDTO;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getReview_star() {
		return review_star;
	}
	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReview_count() {
		return review_count;
	}
	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}
	public String getImage_file() {
		return image_file;
	}
	public void setImage_file(String image_file) {
		this.image_file = image_file;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getComment_count() {
		return comment_count;
	}
	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}
	public ReviewDTO() {
		// TODO Auto-generated constructor stub
	}
}
