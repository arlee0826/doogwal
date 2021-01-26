package com.doogwal.coffee.vo;

import java.sql.Timestamp;

//밋팅히스토리 대결 탭 크루 목록 vo
public class MatchCrew {
	private String meetingName,crewName,crewImg;
	private Timestamp meetingDate;
	private int no,win,lose,draw;
	
	public MatchCrew() {
		// TODO Auto-generated constructor stub
	}

	public String getMeetingName() {
		return meetingName;
	}

	public void setMeetingName(String meetingName) {
		this.meetingName = meetingName;
	}

	public String getCrewName() {
		return crewName;
	}

	public void setCrewName(String crewName) {
		this.crewName = crewName;
	}

	public String getCrewImg() {
		return crewImg;
	}

	public void setCrewImg(String crewImg) {
		this.crewImg = crewImg;
	}

	public Timestamp getMeetingDate() {
		return meetingDate;
	}

	public void setMeetingDate(Timestamp meetingDate) {
		this.meetingDate = meetingDate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getWin() {
		return win;
	}

	public void setWin(int win) {
		this.win = win;
	}

	public int getLose() {
		return lose;
	}

	public void setLose(int lose) {
		this.lose = lose;
	}

	public int getDraw() {
		return draw;
	}

	public void setDraw(int draw) {
		this.draw = draw;
	}
	
	
}
