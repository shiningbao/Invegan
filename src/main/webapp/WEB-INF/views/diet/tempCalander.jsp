<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<title>Calander</title>
    <style>
        td {
            width: 50px;
            height: 50px;
        }
        #yearMonth{
        	text-align: center;
        }
        
        #day{
        	text-align: center;
        }

        .Calendar { 
            text-align: left; 
            margin: 0 auto; 
            width: 1200px;
            height: 700px;
        }

        .Calendar>thead>tr:first-child>td { font-weight: bold; }

        .Calendar>thead>tr:last-child>td {
            background-color: gray;
            color: white;
        }        

        .pastDay{ color: lightgray; }

        .today{   
       	 	background-color: aquamarine;                   
            cursor: pointer;
           	border: aquamarine;
            font-size: 20px;
            
        }

        .futureDay{            
            background-color: white;
            cursor: pointer;
        }

        .futureDay.choiceDay{            
           	background-color:transparent;           
            cursor: pointer;
            border : 2px solid aquamarine;
        }
    </style>

    <script>
        window.onload = function () { buildCalendar(); }   

        let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
        let today = new Date();    
        today.setHours(0,0,0,0);   


        function buildCalendar() {

            let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);     // 이번달 1일
            let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);  // 이번달 마지막날

            let tbody_Calendar = document.querySelector(".Calendar > tbody");
            document.getElementById("calYear").innerText = nowMonth.getFullYear();             // 연도 숫자 갱신
            document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);  // 월 숫자 갱신

            while (tbody_Calendar.rows.length > 0) {                        // 이전 출력결과가 남아있는 경우 초기화
                tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
            }

            let nowRow = tbody_Calendar.insertRow();        // 첫번째 행 추가           

            for (let j = 0; j < firstDate.getDay(); j++) {  // 이번달 1일의 요일만큼
                let nowColumn = nowRow.insertCell();        // 열 추가
            }

            for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  

                let nowColumn = nowRow.insertCell();        // 새 열을 추가하고
                nowColumn.innerText = leftPad(nowDay.getDate());      // 추가한 열에 날짜 입력

            
                if (nowDay.getDay() == 0) {                
                    nowColumn.style.color = "red";
                }
                if (nowDay.getDay() == 6) {                 
                    nowRow = tbody_Calendar.insertRow();    // 새로운 행 추가
                }


                if (nowDay < today) {                       // 지난날인 경우
                    nowColumn.className = "pastDay";
                }
                else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우           
                    nowColumn.className = "today";
                    nowColumn.onclick = function () { choiceDate(this); }
                }
                else {                                      // 미래인 경우
                    nowColumn.className = "futureDay";
                    nowColumn.onclick = function () { choiceDate(this); }
                }
            }
        }

        // 날짜 선택
        function choiceDate(nowColumn) {
            if (document.getElementsByClassName("choiceDay")[0]) {                              
                document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay"); 
            }
            nowColumn.classList.add("choiceDay");           
        }
        
        // 이전달 버튼 클릭
        function prevCalendar() {
            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
            buildCalendar();    // 달력 다시 생성
        }
        // 다음달 버튼 클릭
        function nextCalendar() {
            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
            buildCalendar();    // 달력 다시 생성
        }


        function leftPad(value) {
            if (value < 10) {
                value = "0" + value;
                return value;
            }
            return value;
        }
    </script>
</head>
<body>
<table class="Calendar">
        <thead>
            <tr>
                <td onClick="prevCalendar();" style="cursor:pointer;">&#60;</td>
                <td colspan="5" id= "yearMonth">
                    <span id="calYear"></span>년
                    <span id="calMonth"></span>월
                </td>
                
                <td onClick="nextCalendar();" style="cursor:pointer;">&#62;</td>
            </tr>
            <tr id="day">
                <td>일</td>
                <td>월</td>
                <td>화</td>
                <td>수</td>
                <td>목</td>
                <td>금</td>
                <td>토</td>
            </tr>
        </thead>

        <tbody>
        </tbody>
    </table>

	<h2>식단관리 페이지</h2>
	도훈이 테스트 영역
		<input id="loginId" name=loginId type="text" placeholder="임시 로그인 영역" value="admin01"/>
		<input id="selectDate" name="selectDate" type="date" value="2023-10-31"/>
		<input type="button" onclick="chkData('add')"  value="메뉴 추가 페이지" />
		<input type="button" onclick="chkData('update')"  value="메뉴 수정 페이지" />
	 
</body>
<script>
	//도훈이 테스트 영역
	
 	function chkData(chk) {
		var loginId = $('#loginId').val();
		var chk = chk;
		var selectDate = $('#selectDate').val(); 
		alert(loginId+"님 안녕하세요\n선택한 날짜는 "+$('#selectDate').val()+" 입니다");
		
		windo w.open("addMenu.go?chk="+chk+"&loginId="+loginId, "pop", "width=1200,height=700,top=100,left=300,scrollbals=no")
		
	}

</script>

</html>