<%@include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<section style="position: fixed; top: 80px; width: 100%; height: 100%; background-color: lightgray;">
	<h2 style="justify-content: center; display: flex;">회원매출조회</h2>
	
	
<form style="justify-content: center; display: flex; text-align: center;">
	<table border="1">
		<tr>
			<td>회원번호</td>
			<td>회원성명</td>
			<td>고객등급</td>
			<td style="width: 100px;">매출</td>
		</tr>

	<% 
		// group by절은 select와 동일하게 만들어주기 
		request.setCharacterEncoding("UTF-8");
		String sql = "SELECT me.custno, me.custname, me.grade, SUM(mo.price) price " +
				"FROM member_tbl_02 me, money_tbl_02 mo " +
				"where me.custno = mo.custno " +
				"group by me.custno,me.custno, me.custname, me.grade ORDER BY SUM(mo.price) desc";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		String grade;
		while(rs.next()){
			
			grade = rs.getString(3);
			if(grade == "A"){
				grade = "VIP";
			} else if(grade == "B"){
				grade = "일반";
			} else if(grade == "C"){
				grade = "직원";
			}
			
			%>
			
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=grade %></td>
				<td><%=rs.getString(4) %></td>
			</tr>
			
			<%
			
		}
		

	
	%>

	</table>
	</form>
</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>