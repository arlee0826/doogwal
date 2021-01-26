package com.doogwal.coffee.vo;

import java.sql.Date;

public class Attendance {
	private int no,scheduleNo,memberNo;
	private char attendace;
	private Date regdate;
	public Attendance() {
		// TODO Auto-generated constructor stub
	}
	
	public Attendance(int no, int scheduleNo, int memberNo, char attendace) {
		this.no = no;
		this.scheduleNo = scheduleNo;
		this.memberNo = memberNo;
		this.attendace = attendace;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getScheduleNo() {
		return scheduleNo;
	}
	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public char getAttendace() {
		return attendace;
	}
	public void setAttendace(char attendace) {
		this.attendace = attendace;
	}
	
	
	
}
