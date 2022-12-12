<%@page import="java.text.DecimalFormat"%>
<%@ include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mlist</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<section style="position: fixed; top: 70px; left: 0px; width: 100%; height: 100%; background-color: lightgray;">
<h2 style="text-align: center">회원정보</h2>

<form style="display: flex; align-items: center; justify-content: center; text-align: center;">
<table border="1">
	<tr>
		<td style="width: 150px;"> 수강월 </td>
		<td style="width: 150px;"> 회원번호 </td>
		<td style="width: 150px;"> 회원명 </td>
		<td style="width: 150px;"> 강의명 </td>
		<td style="width: 150px;"> 강의장소 </td>
		<td style="width: 150px;"> 수강료 </td>
		<td style="width: 150px;"> 등급 </td>
	</tr>
	
	<% 
	request.setCharacterEncoding("UTF-8");
	
	try{
		
		String sql = "SELECT resist_month, cl.c_no , c_name, class_name, class_area, tuition, grade " + 
						"FROM tbl_teacher_202201 te, tbl_member_202201 me, tbl_class_202201 cl "
						+ "WHERE te.teacher_code = cl.teacher_code AND me.c_no = cl.c_no ORDER BY cl.c_no";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		// 결과 집합
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			
			String resistMonth = rs.getString(1);
			String date = resistMonth.substring(0,4) + "년 " + resistMonth.substring(4,6) + "월"; 
			
			// 수강료
			int tuition = rs.getInt(6);
			//10진수 형식 + 기호 넣어주기(형식 바꿔주기)
			DecimalFormat transFormat = new DecimalFormat("￦ ###,###,###");
			String price = transFormat.format(tuition);
			
			
			// html 넣어야해서 코드 끊어주기
			%>
			<tr>
				<td style="width: 150px;"><%=date %></td>
				<td style="width: 150px;"><%=rs.getString(2) %></td>
				<td style="width: 150px;"><%=rs.getString(3) %></td>
				<td style="width: 150px;"><%=rs.getString(4) %></td>
				<td style="width: 150px;"><%=rs.getString(5) %></td>
				<td style="width: 150px;"><%=price %></td>
				<td style="width: 150px;"><%=rs.getString(7) %></td>
			</tr>
			
			<%
		};
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	%>
	
	
</table>
</form>


</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>