<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="user.LogonDBBean"%>

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
	
	LogonDBBean a = new LogonDBBean();
	//DB와 연결
	Connection conn = null;
	PreparedStatement pstmt = null;

	int check = 0;
	
	try{
		conn = a.getConnection();
		//DB 쿼리실행
		String sql = "insert into cgv.movie values(?, ?, ?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, Id);
		pstmt.setString(2, Title);
		pstmt.setString(3, Director);
		pstmt.setString(4, Actors);
		pstmt.setString(5, Plot);
		pstmt.setString(6, Rating);
		pstmt.setString(7, StartDate);
		pstmt.setString(8, Running_Time);
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
	alert("영화등록이 완료되었습니다.");
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