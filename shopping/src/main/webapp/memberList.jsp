
<%@page import="java.text.SimpleDateFormat"%>
<%@ include file="db.jsp" %>
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

<h2 style="justify-content: center; display: flex;">회원목록조회/수정</h2>

<form style="justify-content: center; display: flex; text-align: center;">
	<table border="1">
		<tr>
			<td>회원번호</td>
			<td>회원성명</td>
			<td>전화번호</td>
			<td>주소</td>
			<td>가입일자</td>
			<td>고객등급</td>
			<td>거주지역</td>
		</tr>
		
		<% 
			request.setCharacterEncoding("UTF-8");
		
			try{
				
				String sql = "SELECT * FROM member_tbl_02";
				
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				String custno = "";
				String grade = "";
				while(rs.next()){
					
					/*
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
					Date startDay = dateFormat.format(rs.getDate(5));
					
					*/
					custno = rs.getString(1);
				
					grade = rs.getString("grade");
					if(grade == "A"){
						grade = "VIP";
					} else if(grade == "B"){
						grade = "일반";
					} else if(grade == "C"){
						grade = "직원";
					}
					
					%>
					<tr>
						<td><a href="modi.jsp?custno=<%=custno %>"><%=custno %></a></td>
						<td><%=rs.getString(2) %></td>
						<td><%=rs.getString(3) %></td>
						<td><%=rs.getString(4) %></td>
						<td><%=rs.getDate("joindate") %></td>
						<td><%=grade %></td>
						<td><%=rs.getString(7) %></td>
					</tr>
					<%
					
				}	
			
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