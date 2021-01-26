package com.doogwal.coffee.vo;

import java.sql.Timestamp;

public class Report {
	private int no,postNo,memberNo,reporter;
	private char type;
	private Timestamp regdate;
	
	public Report() {
		// TODO Auto-generated constructor stub
	}

	public Report(int no, int postNo, int memberNo, int reporter, char type) {
		this.no = no;
		this.postNo = postNo;
		this.memberNo = memberNo;
		this.reporter = reporter;
		this.type = type;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getReporter() {
		return reporter;
	}

	public void setReporter(int reporter) {
		this.reporter = reporter;
	}

	public char getType() {
		return type;
	}

	public void setType(char type) {
		this.type = type;
	}

	
	
}
