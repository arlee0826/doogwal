package com.doogwal.coffee.servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.doogwal.coffee.dao.CrewsDAO;
import com.doogwal.coffee.vo.Crew;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/ajax/getSearchCrewList.json")
public class GetSearchCrewList extends HttpServlet{

	//20210114 이아림 start
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String categoryNo = req.getParameter("categoryNo");
		String agesStr = req.getParameter("ages"); 
		String order = req.getParameter("order");
		
		Map<String, Object> datas = new ConcurrentHashMap<String, Object>();
		
		if(categoryNo!=null) {
			datas.put("categoryNo", Integer.parseInt(categoryNo));
		}
		if(agesStr!=null) {
			int ages = Integer.parseInt(agesStr);
			datas.put("minAge", ages);
			datas.put("maxAge", ages+10);
		}
		
		datas.put("order", "DESC");
		
		List<Crew> list =  CrewsDAO.selectSearchList(datas);
		
		ObjectMapper mapper = new ObjectMapper();
		
		String json = mapper.writeValueAsString(list);
		
		resp.setContentType("application/json;charset=UTF-8");
		
		PrintWriter  out = resp.getWriter();
		
		out.print(json);
		//20210114 이아림 end
		
		
	}//doGet() end
	
}//CategoryClassify end
