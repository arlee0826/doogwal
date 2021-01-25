package com.doogwal.coffee.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.Rule;

public class RulesDAO {
	//송진현
	public static List<Rule> selectList(int no) {
		
		List<Rule> rules = null;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			rules = session.selectList("rules.selectList",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) {
				session.close();
			}//if end
		}//try~catch~finally end
		
		return rules;
	}
	
	//end 송진현
}
