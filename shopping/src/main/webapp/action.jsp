<%@include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <% 
    	
    // 가장 위에 두기
    request.setCharacterEncoding("UTF-8");
    
    // ??? 어케 번호 가져오지
    String custno = request.getParameter("custno");
    String custname = request.getParameter("custname");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String joindate = request.getParameter("joindate");
    String grade = request.getParameter("grade");
    String city = request.getParameter("city");
    
    
    
    try {
    	
    	String sql = "INSERT INTO member_tbl_02 values (?,?,?,?,?,?,?)";
    	PreparedStatement pstmt = con.prepareStatement(sql);
    	
    	pstmt.setInt(1, Integer.parseInt(custno));
    	pstmt.setString(2, custname);
    	pstmt.setString(3, phone);
    	pstmt.setString(4, address);
    	pstmt.setString(5, joindate);
    	pstmt.setString(6, grade);
    	pstmt.setString(7, city);
    	
    	pstmt.executeUpdate();
    	
    	
    }catch(Exception e) {
    	e.printStackTrace();
    }
    
    %>