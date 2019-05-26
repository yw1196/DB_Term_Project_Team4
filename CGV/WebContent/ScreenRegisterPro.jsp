
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>
<%@ page import="user.LogonDBBean"%>


<%
	//파라미터 값 읽어들이는 부분
	String id = request.getParameter("id");
	String seat_totalnum = request.getParameter("seat_totalnum");
	String seat_bookednum = request.getParameter("seat_bookednum");
	String movie_id = request.getParameter("movie_id");
	String cinema_name = request.getParameter("cinema_name");
	//DB와 연결
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	
	try{
		LogonDBBean a = new LogonDBBean();
		
		conn = a.getConnection();
		
		
		//String jdbcUrl = "jdbc:mysql://localhost:3306/cgv?useSSL=false";
		//String dbId = "root";
		//String dbPass = "dyddns";
		
		//Class.forName("com.mysql.jdbc.Driver"); // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
		//conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass); // DiverManager 객체로부터 Connection 객체를 얻어온다.
		
		//DB 쿼리실행
		String sql = "insert into cgv.screen values(?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, seat_totalnum);
		pstmt.setString(3, seat_bookednum);
		pstmt.setString(4, movie_id);
		pstmt.setString(5, cinema_name);
		pstmt.executeUpdate();
		str = "screen 레코드 추가 성공";
	}
	catch (Exception e){
		e.printStackTrace();
		str = "screen 레코드 추가 실패";
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