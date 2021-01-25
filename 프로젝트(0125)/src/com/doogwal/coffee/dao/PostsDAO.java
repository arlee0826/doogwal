package com.doogwal.coffee.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;

public class PostsDAO {

	//박형우 start -----------------------------------------------------------------------
	//20210114 start
		
		//상위 고정 게시글을 가져오는
		public static List<String> selectTopContents(int no) {
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSession();
				
				return session.selectList("boards.selectTopContents",no);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			return null;
		}
		
	//20210114 end
	//박형우 end -----------------------------------------------------------------------

	
}//PostsDAO end
