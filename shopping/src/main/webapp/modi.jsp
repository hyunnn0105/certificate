<%@page import="java.text.*"%>
<%@page import="org.apache.tomcat.websocket.Transformation"%>
<%@include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="check.js"></script>
<body>
	<jsp:include page="header.jsp"></jsp:include>

<section style="position: fixed; top: 80px; width: 100%; height: 100%; background-color: lightgray;">
<h2 style="justify-content: center; display: flex;">수정</h2>
<form method="post" action="update.jsp" name="mod" style="justify-content: center; display: flex;">
		<table border="1">	
		
		
		<%
			request.setCharacterEncoding("UTF-8");
		
			String custno = request.getParameter("custno");
			String custname = "";
			String phone = "";
			String address = "";
			// input type text로 text와 date 타입간의 오류가 발생했음
			Date joindate;
			String strDate = "";
			String grade = "";
			String city = "";
		
			try{
				
				String sql = "SELECT * FROM member_tbl_02 WHERE custno = " + custno;
				
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				
				custno = rs.getString("custno");
				custname = rs.getString(2);
				phone = rs.getString("phone");
				address = rs.getString("address");
				joindate = rs.getDate("joindate");
				grade = rs.getString("grade");
				city = rs.getString("city");
				
				// 날짜 형식 text로 바꿔주기!!!
				SimpleDateFormat transformat = new SimpleDateFormat("yyyy-MM-dd");
				strDate = transformat.format(joindate);
				
		
			}catch(Exception e){
				e.printStackTrace();
			}
		
		%>
			

			<tr>
				<td style="text-align: center;">회원번호(자동발생)</td>
				<td style="width: 400px"><input type="text" name="custno" value="<%=custno %>" readonly></td>
			</tr>
			<tr>
				<td style="text-align: center;">회원성명</td>
				<td><input type="text" name="custname" value="<%=custname %>"></td>
			</tr>
			<tr>
				<td style="text-align: center;">회원전화</td>
				<td><input type="text" name="phone" value="<%=phone %>"> </td>
			</tr>
			<tr>
				<td style="text-align: center;">회원주소</td>
				<td><input type="text" name="address" value="<%=address %>"> </td>
			</tr>
			<tr>
				<td style="text-align: center;">가입일자 </td>
				<td><input type="text" name="joindate" value="<%=strDate %>"></td>
			</tr>
			<tr>
				<td style="text-align: center;">고객등급[A:VIP,B:일반,C:직원]</td>
				<td><input type="text" name="grade" value="<%=grade %>"></td>
			</tr>
			<tr>
				<td style="text-align: center;">도시코드</td>
				<td><input type="text" name="city" value="<%=city %>"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center">
					<input type="button" value="수정" onclick="modify()">
					<input type="button" value="조회" onclick="re()">
				</td>
			</tr>
							
		</table>
		

		
	</form>
</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>