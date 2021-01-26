package com.doogwal.coffee.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.Board;

public class BoardsDAO {

	//박형우 start -----------------------------------------------------------------------
	//20210114 start
		//크루 게시판을 가져오는
		public static List<Board> selectBoards(int no){
			
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSession();
				
				return session.selectList("boards.selectBoards",no);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			return null;
		}
	//20210114 end
	//박형우 end -----------------------------------------------------------------------

	
	
}//BoardsDAO end
