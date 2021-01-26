<%@page import="java.util.Map"%>
<%@page import="com.doogwal.coffee.vo.Crew"%>
<%@page import="java.util.List"%>
<%@page import="com.doogwal.coffee.dao.CrewsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
 
	<%@ include file="/WEB-INF/template/link.jsp" %>
	<link rel="stylesheet" href="/css/searchPage.css" />
</head>
<body>
<%@ include file="/WEB-INF/template/searchPageHeader.jsp" %>
    <div id="content"><!-- content start-->
        <div class="meeting_filters"><!-- meeting_filters start-->
            <ul class="search_specifics">
                <li class="category">
                	<button class="category_a">분류</button>
                    <ul class="category_box"><!-- category_box start-->
                        <li><a href="/searchPage.jsp?categoryNo=" class="game">게임</a></li>
                        <li><a href="/searchPage.jsp?categoryNo=" class="art">문화/예술</a></li>
                        <li><a href="/searchPage.jsp?categoryNo=" class="pet">반려동물</a></li>
                        <li><a href="/searchPage.jsp?categoryNo=" class="volunteer">봉사활동</a></li>
                        <li><a href="/searchPage.jsp?categoryNo=" class="social_gathering">사교모임</a></li>
                        <li><a href="/searchPage.jsp?categoryNo=" class="study">스터디</a></li>
                        <li><a href="/searchPage.jsp?categoryNo=" class="sports">스포츠/레저</a></li>
                        <li><a href="/searchPage.jsp?categoryNo=" class="music">음악/악기</a></li>
                        <li><a href="/searchPage.jsp?categoryNo=" class="outdoor">아웃도어</a></li>
                    </ul><!-- category_box end-->
                </li>

                <li class="ages"><button class="ages_a">연령대</button>
                    <ul class="age_box"><!-- age_box start -->
                        <li><a href="/searchPage.jsp?age=" class="twenties">20대</a></li>
                        <li><a href="/searchPage.jsp?age=" class="thirties">30대</a></li>
                        <li><a href="/searchPage.jsp?age=" class="forties">40대</a></li>
                        <li><a href="/searchPage.jsp?age=" class="fifties">50대</a></li>
                    </ul><!--age_box end -->
                </li>
                
                <li class="number_of_crew"><button class="number_of_crew_a">크루원 수</button>
                  	<ul class="number_of_crew_box"><!-- number_of_crew_box start-->
                        <li><a href="/searchPage.jsp?memberSize=" class="number_of_crew_descending">많은순</a></li>
                        <li><a href="/searchPage.jsp?memberSize=" class="number_of_crew_ascending">적은순</a></li>
                    </ul><!-- number_of_crew_box end-->
                </li>
            </ul>
        </div><!--//meeting_filters end-->

        <div class="crews_recruiting_new_members_box"><!-- crews_recruiting_new_members_box start-->
            <div class="crews_recruiting_new_members_box_top"><!-- crews_recruiting_new_members_box_top start-->
                <h2>모집 중인 크루</h2>
                <a href=""><h3 class="crew_all">더보기</h3></a>
            </div><!--// crews_recruiting_new_members_box_top end-->
            <div>
                <ul class="crews_recruiting_new_members_list">
                  
                </ul>
            </div>
        </div><!--// crews_recruiting_new_members_box end -->
    </div><!--// content end-->
    
<!-- 검색결과 크루 리스트 템플릿 -->
<script type="text/template" id="searchListTmpl">
<@ _.each(crew,function(c){@>
<li class="crews_recruiting_new_members_item"><a href="">
    <img class="crew_img" src="img/<@=c.crew_img @>" width="247.5" height="180"/>
    <p class="crew_name"><@=c.crew_name @></p>
    <p class="crew_introduction"><@=c.crew_introduction @></p></a>
</li>
<@})@>
</script>

<%@ include file="/WEB-INF/template/footer.jsp" %>


<script src="js/jquery.js"></script>
<script src="js/underscore-min.js"></script>

<script>
$(window).scroll(function (evt) {
    let y = $(this).scrollTop();
    if(y>200){
        $(".header_search").css({
            "display":"block"
        });
        $("#header").css({
            "position":"fixed"
        });
        $(".search_box").css({
            "display":"none"
        });
    }else{
        $(".header_search").css({
            "display":"none"
        });
        $("#header").css({
            "position":"relative"
        });
        $(".search_box").css({
            "display":"block"
        });
    }//if~else end
});//scroll() end


//검색결과 ajax 코드
_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};

const searchListTmpl = _.template($('#searchListTmpl').html());
const $crewsRecruitingNewMembersList = $('.crews_recruiting_new_members_list');


    //분류 드롭박스
    $('.category_box a').click(function(e){
        e.preventDefault();
        $('.category_a').text($(this).text()).css("color","#3D41B3").css("font-weight","900");
        $(".category_box").hide();
    });
    $(".category").mouseenter(function () {
        $(".category_box").show();
    });

    //연령대 드롭박스
    $(".age_box a").click(function (e) {
        e.preventDefault();
       $(".ages_a").text($(this).text()).css("color","#3D41B3").css("font-weight","900");
        $(".age_box").hide();
    });
    $(".ages").mouseenter(function (e) {
        $(".age_box").show();
    });

    //크루원수 드롭박스
    $(".number_of_crew_box a").click(function (e) {
        e.preventDefault();
        $(".number_of_crew_a").text($(this).text()).css("color","#3D41B3").css("font-weight","900");
        $(".number_of_crew_box").hide();
    });
    $(".number_of_crew").mouseenter(function () {
        $(".number_of_crew_box").show();
    });
    
    let categoryNo= null;
    let ages = null;
    let order = "desc";

    function getSearchCrewList() {
        $.ajax({
            url:"/ajax/getSearchCrewList.json",
            type : "GET",
            data:{
            	categoryNo:categoryNo,
            	ages:ages,
            	order:order
            },
            dataType : "json",
            error : function(xhr, error, code) {
                alert("에러:" + code);
            },
            success:function(json) {
                console.log(json);
                $crewsRecruitingNewMembersList.html(searchListTmpl({crew : json}));
            }
        });
    }// getSearchCrewList();
    
    getSearchCrewList();
    
</script>
</body>
</html>