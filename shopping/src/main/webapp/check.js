
function sub(){
	
	
	if(frm.custname.value==0){
		alert("이름이 입력되지 않았습니다.");
		frm.custname.focus();
		
		return false;
	} else if (frm.phone.value==0){
		alert("휴대전화 번호가 입력되지 않았습니다.");
		frm.phone.focus();
		
		return false;
	} else if(frm.address.value==0){
		alert("주소가 입력되지 않았습니다.");
		frm.address.focus();
		
		return false;
	} else if(frm.joindate.value==0){
		alert("가입일이 입력되지 않았습니다.");
		frm.joindate.focus();
		
		return false;
	} else if(frm.grade.value==0){
		alert("회원 등급이 입력되지 않았습니다.");
		frm.grade.focus();
		
		return false;
	}else if(frm.city.value==0){
		alert("도시 코드가 입력되지 않았습니다.");
		frm.grade.focus();
		
		return false;
	} else {
		alert("회원등록이 완료되었습니다.");
		document.frm.submit();
		location.href = '/shopping/memberList.jsp';
		return true;
	}
	
};



function re(){
	location.href = '/shopping/memberList.jsp';
};

function modify(){
	alert("수정이 완료되었습니다.");
	document.mod.submit();
	location.href = '/shopping/memberList.jsp';
}