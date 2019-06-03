<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>
<%@ page import="user.LogonDBBean"%>



    

<%
	//파라미터 값 읽어들이는 부분
	String id = request.getParameter("id");
	String seat_totalnum = request.getParameter("seat_totalnum");
	String seat_bookednum = "0";
	String movie_id = request.getParameter("movie_id");
	String cinema_name = request.getParameter("cinema_name");
	//DB와 연결
	Connection conn = null;
	PreparedStatement pstmt = null;
	int check = 0;
	
	try{
		LogonDBBean a = new LogonDBBean();
		
		conn = a.getConnection();
		//DB 쿼리실행
		String sql = "insert into cgv.screen values(?, ?, ?, ?, ?);";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, seat_totalnum);
		pstmt.setString(3, seat_bookednum);
		pstmt.setString(4, cinema_name);
		pstmt.setString(5, movie_id);
		pstmt.executeUpdate();
		pstmt.close();
		
		sql = "UPDATE cinema SET Screen_Num = Screen_Num + 1 WHERE nameV = ?;";
		pstmt = conn.prepareStatement(sql);
	
		pstmt.setString(1, cinema_name);
		pstmt.executeUpdate();
		check = 1;
	}
	catch (Exception e){
		e.printStackTrace();
	}
	

	
	finally{
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
	if(check == 1){
		%>
<script>
	alert("등록이 완료되었습니다.");
	location.href = "../web.admin/Admin.jsp";
</script>
		<%
	}else{
		%>
<script>
	alert("정보가 올바르지 않습니다.");
	history.go(-1);
	
</script>
		<%
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>