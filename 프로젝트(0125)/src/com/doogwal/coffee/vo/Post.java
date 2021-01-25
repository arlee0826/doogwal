package com.doogwal.coffee.vo;

import java.sql.Timestamp;

public class Post {

	private int no,memberNo,likeCnt,boardNo;
	private char imageApplicable;
	private String contents;
	private Timestamp regdate;
	
	public Post() {
		// TODO Auto-generated constructor stub
	}
	

	public Post(int no, int memberNo, int likeCnt, int boardNo, char imageApplicable, String contents) {
		this.no = no;
		this.memberNo = memberNo;
		this.likeCnt = likeCnt;
		this.boardNo = boardNo;
		this.imageApplicable = imageApplicable;
		this.contents = contents;
	}


	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public char getImageApplicable() {
		return imageApplicable;
	}

	public void setImageApplicable(char imageApplicable) {
		this.imageApplicable = imageApplicable;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}
	
	
	
}
