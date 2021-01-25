package com.doogwal.coffee.vo;

import java.sql.Timestamp;

public class SubjFileAns {
	private int no,qNo,crewApplyNo;
	private String ans;
	private Timestamp regdate;
	
	public SubjFileAns() {
		// TODO Auto-generated constructor stub
	}

	public SubjFileAns(int no, int qNo, int crewApplyNo, String ans) {
		this.no = no;
		this.qNo = qNo;
		this.crewApplyNo = crewApplyNo;
		this.ans = ans;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public int getCrewApplyNo() {
		return crewApplyNo;
	}

	public void setCrewApplyNo(int crewApplyNo) {
		this.crewApplyNo = crewApplyNo;
	}

	public String getAns() {
		return ans;
	}

	public void setAns(String ans) {
		this.ans = ans;
	}
	
}
