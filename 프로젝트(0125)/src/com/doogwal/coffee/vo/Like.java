package com.doogwal.coffee.vo;

import java.sql.Timestamp;

public class Like {

	private int no,likerNo,postNo;
	private Timestamp regdate;
	public Like() {
		// TODO Auto-generated constructor stub
	}
	public Like(int no, int likerNo, int postNo) {
		this.no = no;
		this.likerNo = likerNo;
		this.postNo = postNo;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getLikerNo() {
		return likerNo;
	}
	public void setLikerNo(int likerNo) {
		this.likerNo = likerNo;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	
}
