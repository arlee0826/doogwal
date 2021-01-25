package com.doogwal.coffee.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.Gathering;
import com.doogwal.coffee.vo.Meeting;

public class SchedulesDAO {
	public static int insert(Gathering schedule) {
		int result = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.insert("schedules.insert",schedule);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return 0;
	}//insert end
	
	
	//박형우 start -----------------------------------------------------------------------
	//20210114 start
		// upcomming event를 가져오는
		public static Gathering selectUpcommingGathring(int no) {
			
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSession();
				
				return session.selectOne("schedules.selectUpcommingGathring", no);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			return null;
		}
		public static Meeting selectUpcommingMeeting(int no) {
			
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSession();
				
				return session.selectOne("schedules.selectUpcommingMeeting", no);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			return null;
		}
	//20210114 end
	//박형우 end -----------------------------------------------------------------------

	//20210124 밋팅히스토리(대결,친목) 카운트 이아림
	public static Map<String, Object> selectHistoryCount(int crewNo) {
		
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("schedules.selectHistoryCount",crewNo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}
	
	//송진현
	public static Gathering selectOne(int no) {
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			
			return session.selectOne("schedules.selectOne",no);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return null;
	}

	//end 송진현
	
}////SchedulesDAO end
