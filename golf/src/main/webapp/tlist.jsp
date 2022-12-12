<%@page import="java.text.DecimalFormat"%>
<%@ include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tlist</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<section style="position: fixed; top: 70px; left: 0px; width: 100%; height: 100%; background-color: lightgray;">
<h2 style="text-align: center">강사조회</h2>
<form style="display: flex; align-items: center; justify-content: center; text-align: center;">
<table border="1">
	<tr>
		<td>강사코드</td>
		<td>강사명</td>
		<td>강의명</td>
		<td>수강료</td>
		<td>강사자격취득일</td>
	</tr>
	<%
	
	request.setCharacterEncoding("UTF-8"); 
	
	try{
		
		String sql = "SELECT * FROM tbl_teacher_202201 ORDER BY teacher_code";
		PreparedStatement pstmt = con.prepareStatement(sql);
		// 결과 집합
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			// 형식 바꿔서 출력하기
			
			int class_price = rs.getInt(4);
			// 10진법 - ￦(ㄹ한자)
			DecimalFormat transformat = new DecimalFormat("￦ ###,###,###");
			String price = transformat.format(class_price);
			
			
			String teach_resist_date = rs.getString(5);
			// 일자로 바꿔주기
			String date = teach_resist_date.substring(0,4)+" 년" + teach_resist_date.substring(4,6)+" 월" + teach_resist_date.substring(6,8)+" 일"  ;
			// html 사용
			%>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=price %></td>
				<td><%=date %></td>
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