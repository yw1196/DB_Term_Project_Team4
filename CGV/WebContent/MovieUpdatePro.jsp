
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>


<%
	//파라미터 값 읽어들이는 부분
	String Id = request.getParameter("ID");
	String Title = request.getParameter("Title");
	String Director = request.getParameter("Director");
	String Actors = request.getParameter("Actors");
	String Plot = request.getParameter("Plot");
	String Rating = request.getParameter("Rating");
	String StartDate = request.getParameter("StartDate");
	String Running_Time = request.getParameter("Running_Time");
	
	// 현재 날짜와 시간을 가져옴
	Timestamp register = new Timestamp(System.currentTimeMillis());
	
	
	//DB와 연결
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	
	ResultSet rs = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/cgv?useSSL=false";
		String dbId = "root";
		String dbPass = "dyddns";
		
		Class.forName("com.mysql.jdbc.Driver"); // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass); // DiverManager 객체로부터 Connection 객체를 얻어온다.
		
		//DB 쿼리실행
		String sql = "select id, title from movie where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, Id);
		rs = pstmt.executeQuery(); // 실제 쿼리 실행
		
		if(rs.next()){
			String rId = rs.getString("id");
			String rTitle = rs.getString("title");
			pstmt.close();
			if(Id.equals(rId) && Title.equals(rTitle)){
				sql = "update movie set director = ?, actors = ?, plot = ?, rating = ?, startdate = ?, running_time = ? where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, Director);
				pstmt.setString(2, Actors);
				pstmt.setString(3, Plot);
				pstmt.setString(4, Rating);
				pstmt.setString(5, StartDate);
				pstmt.setString(6, Running_Time);
				pstmt.setString(7, Id);
				pstmt.executeUpdate();
				str = "영화 정보 수정이 완료되었습니다.";
			}
			else{
				str = "아이디와 제목이 일치하지 않습니다.";
			}
		}
	}
	catch (Exception e){
		e.printStackTrace();
		str = "영화정보 수정 실패";
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