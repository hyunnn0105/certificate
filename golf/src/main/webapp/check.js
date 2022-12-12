
function add(){
	
	if(frm.resist_month.value.length == 0){
		alert("수강월이 입력되지 않았습니다.");
		frm.resist_month.focus();
		
		return false;
	} else if(frm.c_name.value==0){
		alert("회원명이 선택되지 않았습니다.");
		frm.c_name.focus();
		
		return false;
	
	} else if(frm.class_area[0].checked==false 
		&& frm.class_area[1].checked==false
		&& frm.class_area[2].checked==false
		&& frm.class_area[3].checked==false
		&& frm.class_area[4].checked==false) {
		
		alert("강의 장소가 선택되지 않았습니다.");
		frm.class_area.focus();
		return false;
		
	} else if(frm.class_name.value==0){
		alert("강의명이 선택되지 않았습니다.");
		frm.class_name.focus();
		return false;
	} else {
		alert("수강신청이 완료되었습니다!");
		document.frm.submit();
		return true;
	}
	
	
}

function res(){
	alert("정보를 지우고 처음부터 다시 입력합니다.");
	document.frm.reset();
}

// 값을 가져오는 함수 c_no의 
/*
function getvalue(c_no){
	document.getElementById("c_no").value = c_no;
}
*/

// select에서 선택된 value 값을 c_no로 가져옴
function getvalue(c_no){
	document.getElementById("c_no").value = c_no; // c_no에 데이터 입력해줌
	// 새롭게 선언해서 이용하기
	c_no2 = c_no;
}

// select에서 선택된 value값을 tuition에서 가져옴
function getvalueName(tuition){
	// 회원번호가 20000 이상이면 50% 할인
	if(c_no2 >= 20000){
		document.getElementById("tuition").value = tuition / 2;
	} else {
		document.getElementById("tuition").value = tuition;
	}
}
