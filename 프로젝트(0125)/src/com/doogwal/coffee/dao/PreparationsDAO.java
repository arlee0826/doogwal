package com.doogwal.coffee.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.Preparation;

public class PreparationsDAO {
	//송진현
	public static int insert(Preparation preparation) {
		int result = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.insert("preparations.insert",preparation);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return 0;
	}
	
	public static List<Preparation> selectList(int no) {
		
		List<Preparation> preparations = null;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			preparations = session.selectList("preparations.selectList",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) {
				session.close();
			}//if end
		}//try~catch~finally end
		
		return preparations;
	}
	//end 송진현
}
