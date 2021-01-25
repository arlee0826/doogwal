package com.doogwal.coffee.dao;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.Meeting;

public class MeetingsDAO {
	public static Meeting selectDetailOne(int no) {
	
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("meetings.selectDetailOne",no);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}//insert end
	
}
