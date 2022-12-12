<%@page import="java.text.DecimalFormat"%>
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

<section style="position: fixed; top: 70px; left: 0px; width: 100%; height: 100%; background-color: lightgray;">
<h2 style="text-align: center">강사 매출 현황</h2>

<form style="display: flex; align-items: center; justify-content: center; text-align: center">
	<table border="1">
		<tr>
			<td style="width: 150px;">강사코드</td>
			<td style="width: 150px;">강의명</td>
			<td style="width: 150px;">강사명</td>
			<td style="width: 150px;">총매출</td>
		</tr>
		
		
		<%
			request.setCharacterEncoding("UTF-8");
		
			try{
				
				// group by절에 들어가는 항목은 select 절에 들어가는 항복과 반드시 일치
				String sql = "SELECT cl.teacher_code, class_name, teacher_name, SUM(tuition) salary " + 
						"FROM tbl_teacher_202201 te, tbl_class_202201 cl " + 
						"WHERE te.teacher_code = cl.teacher_code " +
						"GROUP BY cl.teacher_code, class_name, teacher_name " +
						"ORDER BY cl.teacher_code";
				
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()){
					
					int sumTuition = rs.getInt(4);
					DecimalFormat transFormat = new DecimalFormat("￦ ###,###,###");
					// 소숫점 2자리는 ".00" 추가해주기 new DecimalFormat("￦ ###,###,###.00");
					String salary2 = transFormat.format(sumTuition);
					
					%>
					<tr>
						<td style="width: 150px;"><%=rs.getString(1) %></td>
						<td style="width: 150px;"><%=rs.getString(2) %></td>
						<td style="width: 150px; text-align: right;"><%=rs.getString(3) %></td>
						<td style="width: 150px; text-align: right;"><%=salary2 %></td>
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