
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>


<%
	//파라미터 값 읽어들이는 부분
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String callnum = request.getParameter("callnum");
	String screen_num = request.getParameter("screen_num");
	//DB와 연결
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/cgv?useSSL=false";
		String dbId = "root";
		String dbPass = "dyddns";
		
		Class.forName("com.mysql.jdbc.Driver"); // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass); // DiverManager 객체로부터 Connection 객체를 얻어온다.
		
		//DB 쿼리실행
		String sql = "insert into cgv.cinema values(?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, address);
		pstmt.setString(3, callnum);
		pstmt.setString(4, screen_num);
		pstmt.executeUpdate();
		str = "cinema 레코드 추가 성공";
	}
	catch (Exception e){
		e.printStackTrace();
		str = "cinema 레코드 추가 실패";
	}
	finally{
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%=str %>
	<form action="AdminForm.jsp">
		<input type="submit" value="확인">
	</form>
</body>
</html>