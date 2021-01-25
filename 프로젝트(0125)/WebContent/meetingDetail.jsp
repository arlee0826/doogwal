<%@page import="com.doogwal.coffee.vo.Meeting"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


	//밋팅 no 파라미터로 받아오기
	//String noStr = request.getParameter("no");
	//자료형 int형으로 형 변환
	//int no = Integer.parseInt(noStr);
	
	//Meeting meeting = MeetingsDAO.selectOne(no);
	
%>  
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>밋팅 디테일</title>
   	<%@ include file="/WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="css/tui-chart.min.css"/>
    <%--20210124 meetingHistory css 이아림 추가 --%>
    <link rel="stylesheet" href="css/meetinghistory.css"/>
    <%--// 20210124 meetingHistory css 이아림 추가 --%>
 
</head>
<body>

<%@ include file="/WEB-INF/template/header.jsp"  %>

    <div id="content"> <!-- content -->
        <div class="classificationl_box"><!--classificationl_box-->
            <i class="fas fa-arrow-left"></i>
            <div>대결</div>
            <div>스포츠/레저</div>
            <div>축구</div>
            <div>태양보다 더 뜨겁게</div>
        </div><!--//classificationl_box-->
        <div class="description_box">
            <h2 class="meeting_name">강남배 조기축구</h2>
            <div class="description_contents">
                <div class="description_contents_img_box">
                    <h3 class="description_meeting_time">12월 17일 오전 09:00</h3>
                    <img src="img/category9.jpg" width="400" height="200">
                </div><!--//sdescription_contents_child1-->
                <div class="description_contents_child2">
                    <h3 class="description_meeting_address">서울시 동작구 사당로 13길 31</h3>
                    <div class="map_wrap">
                        <div id="map" class="local_map"></div>
                        <div class="custom_zoomcontrol radius_border">
                            <span onclick="zoomIn()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>
                            <span onclick="zoomOut()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
                        </div>
                    </div>

                </div><!--//description_contents_child2-->
                <div class="description_contents_apply">
                    <img src="img/category4.jpg" width="100" height="100">
                    <div>축구왕 슛돌이</div>
                    <div class="btn_apply">-7000P 신청하기</div>
                    <div>수락까지 남은 시간 <span class="remain_time"></span></div>
                </div><!--//description_contents_child3-->
            </div><!--//description_contents-->
        </div><!--//description-->

        <div class="section_second">
            <div class="rule_box">
                <div class="section_second_subtitle">규칙</div>
                <ul>
                    <li>
                        <i class="far fa-check-square"></i>
                        <span class="">준비시간 내에 정확히 와주세요</span>
                    </li>
                    <li>
                        <i class="far fa-check-square"></i>
                        <span class="">오프사이드 있습니다.</span>
                    </li>
                    <li>
                        <i class="far fa-check-square"></i>
                        <span class="">전후반 30분</span>
                    </li>
                    <li>
                        <i class="far fa-check-square"></i>
                        <span class="">패널티 2번 받을 시 퇴장</span>
                    </li>
                </ul>
            </div><!--//rule_box-->
            <div class="materials_box">
                <div class="section_second_subtitle">준비물</div>
                <ul>
                    <li>
                        <i class="far fa-check-square"></i>
                        <span class="">여분의 옷</span>
                    </li>
                    <li>
                        <i class="far fa-check-square"></i>
                        <span class="">재밌게 즐기고 가겠다는 마음</span>
                    </li>
                    <li>
                        <i class="far fa-check-square"></i>
                        <span class="">수건</span>
                    </li>
                    <li>
                        <i class="far fa-check-square"></i>
                        <span class="">축구공</span>
                    </li>
                    <li>
                        <i class="far fa-check-square"></i>
                        <span class="">보호대</span>
                    </li>
                    <li>
                        <i class="far fa-check-square"></i>
                        <span class="">약</span>
                    </li>
                </ul>
            </div><!--//materials_box-->
        </div><!--//section_second-->

        <div class="section_third">
            <div class="section_third_title">신청한 크루</div>
            <ul>
                <li>
                    <input type="radio" id="checkCrew_c1" name="check_crew">
                    <label for="checkCrew_c1">
                        <div>
                            <img src="img/category8.jpg">
                            <p>FC 최강</p>
                        </div>
                        <div>
                            <p>13명이며 준프로급 실력을 가지고 있습니다.</p>
                            <p>13승 2무 2패</p>
                        </div>
                    </label>
                </li>
                <li>
                    <input type="radio" id="checkCrew_c2" name="check_crew">
                    <label for="checkCrew_c2">
                        <div>
                            <img src="img/category7.jpg">
                            <p>서울 원탑 축구가자</p>
                        </div>
                        <div>
                            <p>서울 원탑이랑 한판 하실래예?</p>
                            <p>22승 0무 55패</p>
                        </div>
                    </label>
                </li>
                <li>
                    <input type="radio" id="checkCrew_c3" name="check_crew">
                    <label for="checkCrew_c3">
                        <div>
                            <img src="img/category6.jpg">
                            <p>축구는 인생이다</p>
                        </div>
                        <div>
                            <p>인생을 배우고 싶다면 같이 축구를!</p>
                            <p>0승 0무 2패</p>
                        </div>
                    </label>
                </li>
            </ul>
            <div class="choosing_btn">고르기</div>
        </div><!--//section_third-->

        <div class="section_fourth">
            <div class="history_crew_name">축구왕 슛돌이</div><span> 히스토리</span>
            <div class="history_box">
                <div class="battle_history">
                    <div class="battle_total">대결 12승 3무 6패</div>
                    <a href="" class="battle_view_more">대결 더 보기</a>
                    <ul>
                        <li class="crew_battle_history_content">
                            <img src="img/category5.jpg">
                            <div>
                                <p>5:5 풋살 대회</p>
                                <p>날아라 슛돌이</p>
                                <p>12월 17일 오전 09:00</p>
                            </div>
                            <div class="waiting_for_the_review">후기 기다리는 중</div>
                        </li>
                        <li class="crew_battle_history_content">
                            <img src="img/category1.jpg">
                            <div>
                                <p>3:3 풋살 대회</p>
                                <p>날아라 슛돌이 가자</p>
                                <p>12월 15일 오전 19:50</p>
                            </div>
                            <div class="match_result">승</div>
                        </li>
                        <li class="crew_battle_history_content">
                            <img src="img/category2.jpg">
                            <div>
                                <p>5:5 풋살 대회</p>
                                <p>날아라 슛돌이 고</p>
                                <p>12월 14일 오전 09:30</p>
                            </div>
                            <div class="match_result">패</div>
                        </li>
                    </ul>
                </div><!--//battle_history-->
                <div class="amity_history">
                    <div class="amity_total">친목</div>
                   
                    <div id="chart-area"></div>
                </div>
            </div><!--//history_box-->
        </div><!--//section_fourth-->
    </div><!--//content -->
      
<%@ include file="/WEB-INF/template/footer.jsp" %>

<%-- 20210124 meetingHistory 팝업 include 이아림 추가 --%>     
<%@ include file="/WEB-INF/template/meetingHistory.jsp" %>
<%--// 20210124 meetingHistory 팝업 include 이아림 추가 --%>  




</body>
</html>