package com.doogwal.coffee.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.Crew;
import com.doogwal.coffee.vo.FellowshipCrew;
import com.doogwal.coffee.vo.MatchCrew;

public class CrewsDAO {
	
	//20210114 이아림 검색결과에 크루 목록 보여주기 start 
		public static List<Crew> selectSearchList(Map<String, Object> data) {
			
			List<Crew> list = null;
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSession();
				list = session.selectList("crews.selectSearchList",data);
							
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session!=null) {
					session.close();
			}//if end
			}//try~catch~finally end

			return list;
			}//selectList() end
		//20210114 이아림 end
		
		/* 2021 01 11 주성호 start
		가입된 크루 3개 보여주기*/
		public static List<Crew> selectOwnList(int no) {

			SqlSession session = null;
			try {
				session = SqlSessionUtil.getSession();
				return session.selectList("crews.selectOwnList",no);
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}//try~catch~finally end
			
			return null;
		}
		/*크루이름 겹치는지 확인 */
		public static int selectCheckCrewname(String name) {
			int cnt = 0;
			
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSession();
				cnt = session.selectOne("crews.selectCheckName",name);
				
			}catch(Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}//try~catch~finally end
			
			return cnt;
		}//selectCheckNickname() end
	/*2021 01 11 주성호 end*/

	/* 2021 01 14 주성호 start 크루 생성 */
		public static int insertCrew(Crew crew) {
			int cnt = 0;
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSession();
				cnt = session.insert("crews.insertCrew",crew);
				return cnt;
			}catch(Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}//try~catch~finally end
			
			return cnt;
		}
		/* 2021 01 14 주성호 end 크루 생성 */
		
		/*
	 	2021 01 14 주성호 start
	 	크루 이름으로 번호 받기
		 */
		public static int selectCrewByName(String name) {
			int cnt = 0;
			SqlSession session = null;
			try {
				session = SqlSessionUtil.getSession();
				cnt = session.selectOne("crews.selectCrewByName",name);
				return cnt;
			}catch(Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}//try~catch~finally end
			
			return cnt;
		}
		/*
	 	2021 01 14 주성호 end
	 	크루 이름으로 번호 받기*/
		
	
	//박형우 start -----------------------------------------------------------------------
	//20210114 start
	// 해당 크루의 모든 정보를 가져오는
		public static Crew selectCrewAllInformation(int no) {
			
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSession();
				
				return session.selectOne("crews.selectCrewAllInformation", no);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			return null;
		}
	//20210114 end
	//박형우 end -----------------------------------------------------------------------


		//밋팅 히스토리 대결 탭 크루 리스트 20210125 이아림  start
		public static List<MatchCrew> selectMatchHistoryList(int crewNo) {
			SqlSession session = null;
			try {
				session = SqlSessionUtil.getSession();
				return session.selectList("crews.selectMatchHistoryList",crewNo);
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}//try~catch~finally end
			
			return null;
		}//밋팅 히스토리 대결 탭 크루 리스트 20210125 이아림  end
		
	
		//밋팅 히스토리 친목 탭 크루 리스트 20210125 이아림  start
		public static List<FellowshipCrew> selectFellowshipHistoryList(int crewNo) {
			SqlSession session = null;
			try {
				session = SqlSessionUtil.getSession();
				return session.selectList("crews.selectFellowshipHistoryList",crewNo);
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}//try~catch~finally end
			
			return null;
		}//밋팅 히스토리 대결 탭 크루 리스트 20210125 이아림  end
		
		//송진현
public static Crew select(int no) {
			
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSession();
				
				return session.selectOne("crews.select", no);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			return null;
		}
//end 송진현
		
}//CrewsDAO end
