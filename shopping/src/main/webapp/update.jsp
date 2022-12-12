<%@include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    
    
    request.setCharacterEncoding("UTF-8");
    String custno = request.getParameter("custno");
    
    //
    
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	// input type text로 text와 date 타입간의 오류가 발생했음
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
    
    try {
    	
    	String sql = "UPDATE member_tbl_02 " 
    					+ "set custname = '" + custname
    					+ "', phone = '" + phone
    					+ "', address = '" + address
    					+ "', joindate = '" + joindate
    					+ "', grade = '" + grade
    					+ "', city = '" + city
    					+ "' WHERE custno = " + custno ;
    	
    	PreparedStatement pstmt = con.prepareStatement(sql);
    	
    	pstmt.executeUpdate();
    	
    	
    	
    }catch(Exception e){
    	
    	e.printStackTrace();
    
    }
    
    	
    %>