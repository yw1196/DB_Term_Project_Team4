
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>


<%
	//파라미터 값 읽어들이는 부분
	String id = request.getParameter("ID");
	String passwd = request.getParameter("PW");
	String nameV = request.getParameter("NameV");
	String birth = request.getParameter("Birth");;
	String address = request.getParameter("Address");
	String number = request.getParameter("Phonenumber");
	String point = "0";
	String admin = "0";
	
	//DB와 연결
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/CGV?useSSL=false";
		String dbId = "root";
		String dbPass = "rlarnrgus1";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		//DB 쿼리실행
		String sql = "insert into cgv.customer values(?, ?, ?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, passwd);
		pstmt.setString(3, nameV);
		pstmt.setString(4, birth);
		pstmt.setString(5, address);
		pstmt.setString(6, number);
		pstmt.setString(7, admin);
		pstmt.setString(8, point);
		pstmt.executeUpdate();
		str = "member 레코드 추가 성공";
	}
	catch (Exception e){
		e.printStackTrace();
		str = "member 레코드 추가 실패";
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
	<form action="LoginForm.jsp">
		<input type="submit" value="ok 집가자">
	</form>
</body>
</html>