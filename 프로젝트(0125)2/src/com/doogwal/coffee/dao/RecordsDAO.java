package com.doogwal.coffee.dao;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.MatchRecord;

public class RecordsDAO {

	public static MatchRecord selectMatchRecord(int crewNo) {
		
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("records.selectMatchRecord",crewNo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}
	
}
