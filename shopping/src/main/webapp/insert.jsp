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
<script type="text/javascript" src="check.js"></script>
<jsp:include page="header.jsp"></jsp:include>

<section style="position: fixed; top: 80px; width: 100%; height: 100%; background-color: lightgray;">
<jsp:include page="header.jsp"></jsp:include>

<section style="position: fixed; top: 80px; width: 100%; height: 100%; background-color: lightgray;">
	<h2 style="justify-content: center; display: flex;">회원 등록</h2>
	<form method="post" action="action.jsp" name="frm" style="justify-content: center; display: flex;">
		<table border="1">
		
				<% 
					request.setCharacterEncoding("UTF-8");
				
					int custno = 0;
				
					try{
						String sql = "SELECT MAX(custno) + 1 FROM member_tbl_02";
						
						PreparedStatement pstmt = con.prepareStatement(sql);
						ResultSet rs = pstmt.executeQuery();
						// 그냥 rs.next로 한번 사용해주기
						rs.next();
						
						custno = rs.getInt(1);
						
						%>
				
				
			<tr>
				<td style="text-align: center;">회원번호(자동발생)</td>
				<td style="width: 400px"><input type="text" name="custno" value="<%=custno %>" readonly></td>
			</tr>
			<tr>
				<td style="text-align: center;">회원성명</td>
				<td><input type="text" name="custname"></td>
			</tr>
			<tr>
				<td style="text-align: center;">회원전화</td>
				<td><input type="text" name="phone"> </td>
			</tr>
			<tr>
				<td style="text-align: center;">회원주소</td>
				<td><input type="text" name="address"> </td>
			</tr>
			<tr>
				<td style="text-align: center;">가입일자 </td>
				<td><input type="text" name="joindate"> </td>
			</tr>
			<tr>
				<td style="text-align: center;">고객등급[A:VIP,B:일반,C:직원] grade</td>
				<td><input type="text" name="grade"></td>
			</tr>
			<tr>
				<td style="text-align: center;">도시코드</td>
				<td><input type="text" name="city"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center">
					<input type="button" value="등록" onclick="sub()">
					<input type="button" value="조회" onclick="re()">
				</td>
			</tr>
			
			
			<%
						
					}catch (Exception e){
						e.printStackTrace();
					}
				
				%>
				
				
		</table>
	</form>
</section>

<jsp:include page="footer.jsp"></jsp:include>

</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>