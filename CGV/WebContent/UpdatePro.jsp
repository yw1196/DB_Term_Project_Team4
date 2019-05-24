
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import = "user.LogonDataBean" %>

<% request.setCharacterEncoding("euc-kr"); %>


<%
	//파라미터 값 읽어들이는 부분
	String passward = request.getParameter("PW");
	String nameV = request.getParameter("NameV");
	String birth = request.getParameter("Birth");;
	String address = request.getParameter("Address");
	String number = request.getParameter("Phonenumber");
	String point = "0";
	String admin = "0";
	String id =" ";
	
	//DB와 연결
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/cgv?useSSL=false";
		String dbId = "root";
		String dbPass = "rlarnrgus1";
		id = (String)session.getAttribute("id");
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		//DB 쿼리실행
		String sql = "update cgv.customer set PW = ?, NameV = ?, Birth = ?, Address = ?, PhoneNumber = ? where ID = ? " ;
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, passward);
		pstmt.setString(2, nameV);
		pstmt.setString(3, birth);
		pstmt.setString(4, address);
		pstmt.setString(5, number);
		pstmt.setString(6, id);
		pstmt.executeUpdate();
		
		str = "member 레코드 변경 성공";
	}
	catch (Exception e){
		e.printStackTrace();
		str = "member 레코드 변경 실패";
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