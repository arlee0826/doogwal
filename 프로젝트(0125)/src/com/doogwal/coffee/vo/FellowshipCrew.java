package com.doogwal.coffee.vo;

import java.sql.Timestamp;

//밋팅히스토리 대결 탭 크루 목록 vo
public class FellowshipCrew {
	private String meetingName,crewName,crewImg;
	private Timestamp meetingDate;

	public FellowshipCrew() {
	// TODO Auto-generated constructor stub
}

	//세터, 게터 설정
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
	
	
}
