<%@page import="com.doogwal.coffee.servlet.ajax.GetSearchCrewList"%>
<%@page import="com.doogwal.coffee.vo.FellowshipCrew"%>
<%@page import="com.doogwal.coffee.dao.CrewsDAO"%>
<%@page import="com.doogwal.coffee.vo.MatchCrew"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.doogwal.coffee.dao.SchedulesDAO"%>
<%@page import="java.util.concurrent.ScheduledExecutorService"%>
<%@page import="com.doogwal.coffee.dao.FellowshipsDAO"%>
<%@page import="com.doogwal.coffee.vo.Fellowship"%>
<%@page import="com.doogwal.coffee.vo.Meeting"%>
<%@page import="com.doogwal.coffee.dao.RecordsDAO"%>
<%@page import="com.doogwal.coffee.vo.MatchRecord"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	
//밋팅디테일에 있는 크루번호를 얻어옴
//int crewNo = meeting.getCrewNo();
	int crewNo = 500;

	//밋팅을 주최한 크루의 승/무/패
	 MatchRecord matchRecord = RecordsDAO.selectMatchRecord(crewNo);
	 
	//밋팅히스토리 총 대결 수 
	Map<String,Object> map = SchedulesDAO.selectHistoryCount(crewNo);
	
	//System.out.println(map);
	
	//밋팅히스토리 대결 탭 크루 목록 코드
	List<MatchCrew> matchCrews = CrewsDAO.selectMatchHistoryList(crewNo);

	//밋팅히스토리 친목 탭 크루 목록 코드
	List<FellowshipCrew> fellowshipCrews = CrewsDAO.selectFellowshipHistoryList(crewNo);
	
	
%>
<div id="meetingRequestPop">
<div id="popWrap">
    <div id="popContainer"><!--popContainer-->
        <form>
            <div class="times"><i class="fas fa-times"></i></div>
            <div class="guide"><p>상대 크루에게 한 마디 해주세요</p></div>
            <textarea maxlength="30" cols="30" class="content_input_field" placeholder="내용을 꼭 입력해주세요.(최대30자)"></textarea>
            <div class="counting_characters">(0/30)자</div>
            <ul>
                <li>
                    <label class="box-radio-input" for="cp_item1">
                    <input type="radio" name="cp_item" id="cp_item1">
                    <div class="crew_box">
                        <div class="icon_check"><i class="fas fa-check"></i></div>
                        <img src="img/category1.jpg">
                        <p>용산 축구</p>
                    </div>
                </label></li>
                <li>
                    <label class="box-radio-input" for="cp_item2">
                        <input type="radio" name="cp_item" id="cp_item2">
                        <div class="crew_box">
                            <div class="icon_check"><i class="fas fa-check"></i></div>
                            <img src="img/category2.jpg">
                            <p>널 사랑해서 행복해</p>
                        </div>
                    </label>
                </li>
                <li>
                    <label class="box-radio-input" for="cp_item3">
                        <input type="radio" name="cp_item" id="cp_item3">
                        <div class="crew_box">
                            <div class="icon_check"><i class="fas fa-check"></i></div>
                            <img src="img/category3.jpg">
                            <p>보기만 해도 행복해</p>
                        </div>
                    </label>
                </li>
            </ul>
            <button class="meeting_request_confirm_btn" type="button">확인</button>
        </form>
    </div><!--//popContainer-->
</div>
</div><!--//meetingRequestPop end -->

<!--/////////////////////////////////////////////////////////  -->

<div id="meetingHistoryPopWrap">
	<!--meetingHistoryPopWrap start -->
	<div id="meetingHistoryPop">
		<button class="close_btn">
			<i class="fas fa-times"></i>
		</button>
		<div class="select_box"></div>
		<ul class="history_box_list">
			<li class="match_tab"><input type="radio" name="history_"
				id="match_connect" checked> <label for="match_connect">대결(<%=map.get("MATCHCOUNT") %>)</label>
				<div class="history_content">
					<!-- history_content start-->
					<div class="title">
						<!-- title start-->
						<h1>밋팅 히스토리</h1>
						<h2>
							대결<span class="record_total">
							<%=matchRecord.getWin() %>승
							<%=matchRecord.getDraw() %>무
							<%=matchRecord.getLose() %>패</span>
						</h2>
					</div>
					<!--// title end-->
					<div class="radar_chart_for_group_personality">
						<!-- radar_chart_for_group_personality start-->
						<div id="chart-area1"></div>
					</div>
					<!--// radar_chart_for_group_personality end-->

					<ul class="crew_match_list">
					<%for(MatchCrew matchCrew : matchCrews){ %>
						<li class="crew_detail_item"><!--crew_detail_box start -->
					        <div class="crew_image"><!--crew_image start -->
					            <a href=""><img src="img/<%=matchCrew.getCrewImg()%>"></a>
					        </div><!--// crew_image end -->
					        <div class="meeting_detail"><!-- meeting_detail start -->
					            <p><%=matchCrew.getCrewName() %></p>
					            <p><%=matchCrew.getMeetingName() %></p>
					            <p><%=matchCrew.getMeetingDate() %></p>
					        </div><!--// meeting_detail end -->
					        <p class="match_record"><%=matchCrew.getWin() %>승 
					        <%=matchCrew.getDraw() %>무 
					        <%=matchCrew.getLose() %>패</p>
					        <button class="write_match_review_btn">후기</button>
			    		</li>
					 <%} %>
					</ul>
				</div>
				<!--// history_content end--></li>

			<li class="community_gathering_tab"><input type="radio"
				name="history_" id="community_gathering_connect"> <label
				for="community_gathering_connect">친목(<%=map.get("FELLOWSHIPCOUNT") %>)</label>
				<div class="history_content">
					<!-- history_content start-->
					<div class="title">
						<!-- title start-->
						<h1>밋팅 히스토리</h1>
						<div class="radar_chart_for_group_personality">
							<!-- radar_chart_for_group_personality start-->
							<div id="chart-area2"></div>
						</div>
						<!--// radar_chart_for_group_personality end-->
					</div>
					<!--// title end -->

					<ul class="crew_gathering_list">
					<%for(FellowshipCrew fellowshipCrew : fellowshipCrews){ %>
						<li class="crew_detail_item"><!--crew_detail_box start -->
					       <div class="crew_image"><!--crew_image start -->
					       		<a href=""><img src="img/<%=fellowshipCrew.getCrewImg()%>"></a>
					       </div><!--// crew_image end -->
					       <div class="meeting_detail"><!-- meeting_detail start -->
					           <p><%=fellowshipCrew.getCrewName() %></p>
					           <p><%=fellowshipCrew.getMeetingName() %></p>
					           <p><%=fellowshipCrew.getMeetingDate() %></p>
					       </div><!--// meeting_detail end -->
					       <!-- <@if(c.meeting_name=="3:3 탁구대회"){@>
					       <button class="review_btn">후기읽기</button>
					       <@ }else{@>-->
					       <button class="write_fellowship_review_btn">후기</button>
					       <!--<@ } @>  -->
					     </li>
					      <%} %>
					</ul>
				</div>
				<!--// history_content end--></li>
		</ul>
	</div>
</div>
<!--// meetingHistoryPopWrap end -->

<script src="js/jquery.js"></script>
<script src="js/underscore-min.js"></script>
<script src="js/tui-chart-all.min.js"></script>

<script type="text/template" id="historyTmpl">
    <div id="meetingHistoryPopWrap"><!--meetingHistoryPopWrap start -->
        <button class="close_btn"><i class="fas fa-times"></i></button>
        <div class="select_box">
        </div>
        <ul class="history_list_box">
            <li class="match_tab">
                <input type="radio" name="history_" id="match_connect" checked>
                <label for="match_connect">대결(21)</label>
                <div class="history_content"><!-- history_content start-->
                    <div class="title"><!-- title start-->
                        <h1>밋팅 히스토리</h1>
                        <h2>대결<span class="record_total">12승 3무 6패</span></h2>
                    </div><!--// title end-->
                    <div class="radar_chart_for_group_personality"><!-- radar_chart_for_group_personality start-->
                        <div id="chart-area1"></div>
                    </div><!--// radar_chart_for_group_personality end-->

                    <ul class="crew_match_list">
                    </ul>
                </div><!--// history_content end-->
            </li>

            <li class="community_gathering_tab">
                <input type="radio" name="history_" id="community_gathering_connect">
                <label for="community_gathering_connect">친목(14)</label>
                <div class="history_content"><!-- history_content start-->
                    <div class="title"><!-- title start-->
                        <h1>밋팅 히스토리</h1>
                        <div class="radar_chart_for_group_personality"><!-- radar_chart_for_group_personality start-->
                            <div id="chart-area2"></div>
                        </div><!--// radar_chart_for_group_personality end-->
                    </div><!--// title end -->

                    <ul class="crew_gathering_list">
                    </ul>
                </div><!--// history_content end-->
            </li>
        </ul>

    </div><!--// meetingHistoryPopWrap end -->
</script>

<!--대결tab 템플릿 -->
<script type="text/template" id="matchTmpl">
    <@ _.each(crew,function(c){@>
    <li class="crew_detail_item"><!--crew_detail_box start -->
        <div class="crew_image"><!--crew_image start -->
            <a href=""><img src="img/<@=c.crew_img @>"></a>
        </div><!--// crew_image end -->
        <div class="meeting_detail"><!-- meeting_detail start -->
            <p><@= c.meeting_name@></p>
            <p><@= c.meeting_desc@></p>
            <p><@= c.meeting_date@></p>
        </div><!--// meeting_detail end -->
        <p class="match_record">5승 12무 8패</p>
        <button class="write_match_review_btn">후기</button>
    </li>
    <@})@>
</script>
<!--친목tab 템플릿 -->
<script type="text/template" id="fellowshipTmpl">
    <@ _.each(crew,function(c){@>
    <li class="crew_detail_item"><!--crew_detail_box start -->
        <div class="crew_image"><!--crew_image start -->
            <a href=""><img src="img/<@=c.crew_img @>"></a>
        </div><!--// crew_image end -->
        <div class="meeting_detail"><!-- meeting_detail start -->
            <p><@= c.meeting_name@></p>
            <p><@= c.meeting_desc@></p>
            <p><@= c.meeting_date@></p>
        </div><!--// meeting_detail end -->
        <@if(c.meeting_name=="3:3 탁구대회"){@>
        <button class="review_btn">후기읽기</button>
        <@ }else{@>
        <button class="write_fellowship_review_btn">후기</button>
        <@ } @>
    </li>
    <@})@>
</script>

<!--친목후기읽기 템플릿 -->
<script type="text/template" id="readFellowshipReviewTmpl">
    <div class="community_gathering_review_box"><!--community_gathering_review_box start-->
        <span class="prev_btn"><i class="fas fa-arrow-left"></i></span>
        <h1 class="review_box_title">후기</h1>
        <span class="time_crew_wrote_the_review"><@=review.regdate@>작성</span>
        <form class="community_gathering_review_form">
            <div class="crew_profile"><!-- crew_profile start-->
                <img src="img/<@= review.crew_img@>">
                <p><@= review.crew_name@></p>
            </div><!--//crew_profile end-->
            <div class="fellowship_write_review_check_list"><!-- check_list start-->
                <label><input type="checkbox" checked="checked" disabled="disabled">상대팀의 매너가 좋았나요?</label>
                <label><input type="checkbox" checked="checked" disabled="disabled">상대팀의 실력이 좋았나요?</label>
                <label><input type="checkbox" checked="checked" disabled="disabled">상대팀은 화목했나요?</label>
                <label><input type="checkbox">상대팀은 의욕적이었나요?</label>
                <label><input type="checkbox">상대팀은 단합이 좋았나요?</label>
            </div><!--// check_list end-->
            <div class="fellowship_review_message_box"><!-- send_message_box start -->
                <p class="fellowship_review_message_box_title">상대 크루에게 한 마디 해주세요</p>
                <textarea class="type_comment" disabled><@= review.review@></textarea>
            </div><!--// send_message_box end -->
        </form>
    </div><!--// community_gathering_review_box end-->
</script>

<!--대결후기쓰기 템플릿 -->
<script type="text/template" id="writeMatchReviewTmpl">
<div class="match_review_box"><!--match_review_box start -->
    <span class="match_review_prev_btn"><i class="fas fa-arrow-left"></i></span>
    <form class="match_review_form">
        <div class="venue"><!--venue start-->
        <@= write_match_review.venue@>
        </div><!--//venue end-->
        <div class="check_box_for_match_result"><!--check_box_for_match_result start-->
            <input type="radio" name="match_result" id="win">
            <label for="win" class="result_option">승</label>
            <input type="radio" name="match_result" id="draw">
            <label for="draw"  class="result_option">무</label>
            <input type="radio" name="match_result" id="lose">
            <label for="lose" class="result_option">패</label>
            <!-- label을 input 앞에다 사용하면 적용이 안됨..-->
        </div><!--// check_box_for_match_result end -->
        <div class="crew_profile"><!-- crew_profile start-->
            <img src="img/<@= write_match_review.crew_img@>">
            <p><@= write_match_review.crew_name@></p>
        </div><!--// crew_profile end -->
        <div class="match_check_list"><!-- check_list start-->
        <label><input type="checkbox">상대팀 매너가 좋았나요?</label>
        <label><input type="checkbox">상대팀 실력이 좋았나요?</label>
        <label><input type="checkbox">상대팀 화목했나요?</label>
        <label><input type="checkbox">상대팀은 의욕적이었나요?</label>
        <label><input type="checkbox">상대팀은 단합이 좋았나요?</label>
        </div><!--// check_list end -->
        <button class="confirm_btn" type="submit">확인</button>
    </form>
</div><!--//match_review_box end -->
</script>

<!--친목후기쓰기 템플릿 -->
<script type="text/template" id="writeFellowshipReviewTmpl">
<div class="community_gathering_review_box">
    <span class="fellowship_review_prev_btn"><i class="fas fa-arrow-left"></i></span>
    <form class="community_gathering_review_form">
        <div class="crew_profile"><!-- crew_profile start-->
        <img src="img/<@= write_match_review.crew_img@>">
        <p><@= write_match_review.crew_name@></p>
        </div><!--//crew_profile end-->
        <div class="check_list"><!-- check_list start-->
        <label><input type="checkbox">상대팀의 매너가 좋았나요?</label>
        <label><input type="checkbox">상대팀의 실력이 좋았나요?</label>
        <label><input type="checkbox">상대팀은 화목했나요?</label>
        <label><input type="checkbox">상대팀은 의욕적이었나요?</label>
        <label><input type="checkbox">상대팀은 단합이 좋았나요?</label>
        </div><!--// check_list end-->
        <div class="fellowship_send_message_box"><!-- fellowship_send_message_box start -->
            <p class="send_message_box_title">상대 크루에게 한 마디 해주세요</p>
             <textarea class="type_comment" placeholder="내용을 입력해주세요.(최대 20자)"></textarea>
             <p class="word_counter">(0/30자)</p>
        </div><!--// fellowship_send_message_box end -->
         <button class="confirm_btn" type="submit">확인</button>
    </form>
</div><!--community_gathering_review_box end-->
</script>


<script>
/*밋팅 신청하기 자바스크립트 시작*/
 //textarea 내에 글자수 세기
    $('.content_input_field').keyup(function (e) {

        let val = $('.content_input_field').val();
        val = val.substr(0, 30);
        $('.content_input_field').val(val);
        $('.counting_characters').text("(" + val.length + " / 30자)").css("color","black");
        if(val.length>1){
        	if($("input:radio[name=cp_item]:checked").length==1){
                $(".meeting_request_confirm_btn").css("background-color","rgb(255, 91, 51)");
            }
        
        } else{
        	$(".meeting_request_confirm_btn").css("background-color","#424242");
        }
    
    });
    
    //end textarea 내에 글자수 세기
    $('.content_input_field').blur(function (e) {
        let val = $('.content_input_field').val();
        if(val.length>1){
            $(".content_input_field").css("border-color","rgb(190, 190, 190)")
            if($("input:radio[name=cp_item]:checked").length==1){
                $(".meeting_request_confirm_btn").css("background-color","rgb(255, 91, 51)");
            }
        }
        else{
            $(".content_input_field").css("border-color","rgb(255, 91, 51)")
        }
    });

    $(".box-radio-input").click(function () {
        let val = $('.content_input_field').val();
        if(val.length>1){
            $(".meeting_request_confirm_btn").css("background-color","rgb(255, 91, 51)");
        }
        else{
            $(".meeting_request_confirm_btn").css("background-color","#424242");
        }
    })


    $(".meeting_request_confirm_btn").click(function () {
        let val = $('.content_input_field').val();
        if(val.length<1){
            $(".content_input_field").css("border-color","rgb(255, 91, 51)")
            $('.counting_characters').text("입력해주세요!!").css("color","rgb(255, 91, 51)");
        }

        if($("input:radio[name=cp_item]:checked").length<1){
            alert("신청할 크루를 선택하세요");
        }

        if ((val.length>1)&&($("input:radio[name=cp_item]:checked").length==1)){
            $(".meeting_request_confirm_btn").attr("type","submit");
        }
    })
/*밋팅 신청하기 자바스크립트 끝*/





/*템플릿 시작*/
// % -> @ 으로
_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};

const matchTmpl = _.template($('#matchTmpl').html());
const fellowshipTmpl = _.template($('#fellowshipTmpl').html());
const readFellowshipReviewTmpl = _.template($('#readFellowshipReviewTmpl').html());
const writeMatchReviewTmpl = _.template($('#writeMatchReviewTmpl').html());
const writeFellowshipReviewTmpl = _.template($('#writeFellowshipReviewTmpl').html());

const $crewMatchList = $('.crew_match_list');
const $crewGatheringList = $('.crew_gathering_list');
const $readFellowshipReviewPopWrap = $('.read_fellowship_review_pop_wrap');
const $writeReviewPopWrap = $('.write_match_review_wrap');
const $writeReviewPopWrap1 = $('.write_community_gathering_review_wrap');
const $closeBtn = $(".close_btn");
const $battleViewMoreBtn = $(".battle_view_more");
const $html = $("html");
/*친목후기 읽기 start*/
let review;
const $meetingHistoryPopWrap = $('#meetingHistoryPopWrap');


//더보기 버튼 눌렀을 때 팝업 뜨게 하기

$battleViewMoreBtn.click(function(e) {
	e.preventDefault();
	
	$meetingHistoryPopWrap.addClass("appear");
	$html.addClass("on");
	
});



    //팝업 닫기버튼
    $closeBtn.click(function () {
    	
    	$meetingHistoryPopWrap.removeClass("appear");
    	$html.removeClass("on");

    });//click() end


    //시간 차이 보여줌 1초마다 차이가 줄어듦
    //let meetingDue = 미팅시간-3일
    let tomorrow = moment('2021/1/6');
    function displaytime(){
        //  Date객체 생성
        let now = moment();

        //  역사 1900년대 사람들은 2000년대를 고려하지 않고 getYear라는 함수를 만들었었음
        let tmp = moment.duration(tomorrow.diff(now)).asMinutes();

        //시분초 차이 구하기
        let seconds = moment.duration(tomorrow.diff(now)).seconds();
        let minute = moment.duration(tomorrow.diff(now)).minutes();
        let hour = moment.duration(tomorrow.diff(now)).hours();

        let fullTime;
        //00:00:00으로 보이게 하기
        if(minute<10 && seconds<10){
            fullTime =  hour+":0" + minute+":0" + seconds;
        }else if(minute<10){
            fullTime =  hour+":0" + minute+":" + seconds;
        }else if(seconds<10){
            fullTime =  hour+":" + minute+":0" + seconds;
        }else{
            fullTime =  hour+":" + minute+":" + seconds;
        }

        // text 표시
        $(".remain_time").text(fullTime);

    }//displayTime() end
    setInterval(function (){
        displaytime();
    },1000); // 신청까지 남은시간 end



    //밋팅 history chart 시작
    var container = document.getElementById('chart-area');
    var container1 = document.getElementById('chart-area1');
    var container2 = document.getElementById('chart-area2');
    var data = {
        categories: ["매너", "실력", "화목", "의욕", "단합"],
        series: [
            {
                // name: 'Budget',
                data: [25/50, 23/50, 22/50, 11/50, 20/50]
            },
        ]
    };
    var options = {
        chart: {
            title: '',
            width: 500,
            height: 480
        },
        series: {
            showDot: false,
            showArea: false
        },
        plot: {
            type: 'circle',
            hideLine: true// whether hide line or not

        },
        legend: {
            visible: false
        },
        chartExportMenu: {
            visible: false
        },
        yAxis:{
            min:0,
            max:1
        }
    };
    var options1 = {
        chart: {
            title: '',
            width: 400,
            height: 300
        },
        series: {
            showDot: false,
            showArea: false
        },
        plot: {
            type: 'circle',
            hideLine: true// whether hide line or not

        },
        legend: {
            visible: false
        },
        chartExportMenu: {
            visible: false
        },
        yAxis:{
            min:0,
            max:1
        }
    };

    var theme = {
        series: {
            colors: [
                '#424242'
            ]
        }
    };// For apply theme

    tui.chart.registerTheme('myTheme', theme);
    options.theme = 'myTheme';
    // 생성자()
    const chart = tui.chart.radialChart(container, data, options);
    const chart1 = tui.chart.radialChart(container1, data, options1);
    const chart2 = tui.chart.radialChart(container2, data, options1);
    chart.on('afterShowTooltip', function(params) {
        chart.hideTooltip();
    });
    chart.on('beforeHideTooltip', function(params) { /* 3 */
        chart.hideTooltip();
    });
    chart1.on('afterShowTooltip', function(params) {
        chart1.hideTooltip();
    });
    chart1.on('beforeHideTooltip', function(params) { /* 3 */
        chart1.hideTooltip();
    });
    chart2.on('afterShowTooltip', function(params) {
        chart2.hideTooltip();
    });

    chart2.on('beforeHideTooltip', function(params) { /* 3 */
        chart2.hideTooltip();
    });//밋팅 history chart end


  

  
    $(document).on("click", '.review_btn',function (e) {
        //클릭시 페이지가 안바뀜
        e.preventDefault();
        console.log($readFellowshipReviewPopWrap.hasClass("appear"));
        if(!$readFellowshipReviewPopWrap.hasClass("appear")){
            $readFellowshipReviewPopWrap.addClass("appear");
            $meetingHistoryPopWrap.addClass("disappear");
            
            /* $.ajax({
                url:"data/review.json",
                type : 'POST',
                dataType : "json",
                error : function(xhr, error, code) {
                    alert("에러:" + code);
                },
                success:function(json) {
                    console.log(json.crew_name);
                    review = json
                    $readFellowshipReviewPopWrap.html(readFellowshipReviewTmpl({review:json}));
                }
            }); */
        }else{
            $readFellowshipReviewPopWrap.removeClass("appear");
            $meetingHistoryPopWrap.removeClass("disappear");
        
        }
    });
    
    
    $(document).on("click", '.prev_btn',function (e) {
        if(!$readFellowshipReviewPopWrap.hasClass("appear")){
            $readFellowshipReviewPopWrap.addClass("appear");
            $meetingHistoryPopWrap.addClass("disappear");
        }else{
            $readFellowshipReviewPopWrap.removeClass("appear");
            $meetingHistoryPopWrap.removeClass("disappear");
        }
    });/*친목후기 읽기 end*/

    /*대결후기쓰기 start*/
    let writeMatchReview;
    $(document).on("click", '.write_match_review_btn',function (e) {
        console.log($writeReviewPopWrap.hasClass("appear"));
        if(!$writeReviewPopWrap.hasClass("appear")){
            $writeReviewPopWrap.addClass("appear");
            $meetingHistoryPopWrap.addClass("disappear");
            /* $.ajax({
                url:"data/write_match_review.json",
                type : 'POST',
                dataType : "json",
                error : function(xhr, error, code) {
                    alert("에러:" + code);
                },
                success:function(json) {
                    console.log(json.crew_name);
                    writeMatchReview = json
                    $writeReviewPopWrap.html(writeMatchReviewTmpl({write_match_review:json}));
                }
            }); */
        }else{
            $writeReviewPopWrap.removeClass("appear");
            $meetingHistoryPopWrap.removeClass("disappear");
        }
    });
    $(document).on("click", '.match_review_prev_btn',function (e) {
        if(!$writeReviewPopWrap.hasClass("appear")){
            $writeReviewPopWrap.addClass("appear");
            $meetingHistoryPopWrap.addClass("disappear");
        }else{
            $writeReviewPopWrap.removeClass("appear");
            $meetingHistoryPopWrap.removeClass("disappear");
        }
    });
    /*대결후기쓰기 end*/


    /*친목후기 쓰기 start*/
    let writeFellowshipReview;
    $(document).on("click", '.write_fellowship_review_btn',function (e) {
        console.log($writeReviewPopWrap1.hasClass("appear"));
        if(!$writeReviewPopWrap1.hasClass("appear")){
            $writeReviewPopWrap1.addClass("appear");
            $meetingHistoryPopWrap.addClass("disappear") ;
            
            /* $.ajax({
                url:"data/write_match_review.json",
                type : 'POST',
                dataType : "json",
                error : function(xhr, error, code) {
                    alert("에러:" + code);
                },
                success:function(json) {
                    console.log(json.crew_name);
                    writeFellowshipReview = json
                    $writeReviewPopWrap1.html(writeFellowshipReviewTmpl({write_match_review:json}));
                }
            }); */
        }else{
            $writeReviewPopWrap1.removeClass("appear");
            $meetingHistoryPopWrap.removeClass("disappear");
        }
    });
    $(document).on("click", '.fellowship_review_prev_btn',function (e) {
        if(!$writeReviewPopWrap1.hasClass("appear")){
            $writeReviewPopWrap1.addClass("appear");
            $meetingHistoryPopWrap.addClass("disappear");
        }else{
            $writeReviewPopWrap1.removeClass("appear");
            $meetingHistoryPopWrap.removeClass("disappear");
        }
    });/*친목후기 쓰기 end*/

    
  //친목 후기 textarea 카운트
    $(document).on("keyup",".type_comment",function(e) {
        let val = $('.type_comment').val();
        val = val.substr(0, 30);
        $('.type_comment').val(val);
        $('.word_counter').text(val.length + "자/최대30자");

    });//on() end
    

</script>