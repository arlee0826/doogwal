package com.doogwal.coffee.vo;

import java.sql.Timestamp;

public class Reply {
	
	private int no,postNo,seq,memberNo;
	private String reply;
	private Timestamp regdate;
	
	public Reply() {
		// TODO Auto-generated constructor stub
	}

	public Reply(int no, int postNo, int seq, int memberNo, String reply) {
		this.no = no;
		this.postNo = postNo;
		this.seq = seq;
		this.memberNo = memberNo;
		this.reply = reply;
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

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	
}
