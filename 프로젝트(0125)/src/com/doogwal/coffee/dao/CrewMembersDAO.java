package com.doogwal.coffee.dao;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.Crew;
import com.doogwal.coffee.vo.CrewMember;



public class CrewMembersDAO {
	/*
	2021 01 12 주성호 start
	header.jsp 크루 이미지
*/
//정진하 주성호 0112 09:02
//myPage.jsp에서 해당 유저가 속한 크루명 및 프로필 사진을 가져오기 위함
public static List<CrewMember> selectOwnList(int userNo) {
	SqlSession session = null;
	try {
		session = SqlSessionUtil.getSession();
		return session.selectList("crewMembers.selectOwnList",userNo);
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(session!=null) session.close();
	}//try~catch~finally end 
	return null;
}
/*
	2021 01 11 주성호 end
	header.jsp 크루 이미지
 */

public static int insertCrewMember(CrewMember crewMember) {
	int cnt = 0;
	SqlSession session = null;
	
	try {
		session = SqlSessionUtil.getSession();
		cnt = session.insert("crewMembers.insertCrewMemberByCaptin",crewMember);
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
 	크루 생성시 크루장 입력
 */

//-------------------------------------------------------------

//박형우 start -----------------------------------------------------------------------
//20210114 start
//가입 대기자들의 이미지를 가져오기 위한 
public static List<String> selectWatingCrewMemberImgs(int no) {
	SqlSession session = null;
	try {
		session = SqlSessionUtil.getSession();
		return session.selectList("crewMembers.selectWatingCrewMemberImgs", no);
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(session!=null) session.close();
	}//try~catch~finally end 
	return null;
}
//20210114 end
//박형우 end -----------------------------------------------------------------------

//송진현
public static List<CrewMember> selectList(int no) {
	
	List<CrewMember> crewmembers  = null;
	SqlSession session = null;
	
	try {
		session = SqlSessionUtil.getSession();
		crewmembers = session.selectList("crewMembers.selectList",no);
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(session!=null) {
			session.close();
		}//if end
	}//try~catch~finally end
	
	return crewmembers ;
}
//end 송진현
	
}//CrewMembersDAO end
