package com.doogwal.coffee.dao;
import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.MtpQuest;
import com.doogwal.coffee.vo.Question;

public class MtpQuestsDAO {

	/*
	 *	2021 01 14 주성호 start
	 * 	객관식 질문 넣기
	 * */
	public static int insertMtpQuests(MtpQuest mtpQuest) {
		int cnt = 0;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			cnt = session.insert("mtpquests.insertMtpQuests",mtpQuest);
			return cnt;
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return cnt;
	}
	
	/*
	 *	2021 01 14 주성호 start
	 * 	객관식 질문 넣기
	 * */
	// --------------------------------------------------

	
}// MtpQuestsDAO end
