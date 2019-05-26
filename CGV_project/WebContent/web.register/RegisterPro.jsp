
<%@page import="user.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<%@ page import="user.LogonDBBean" %>

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
	String admin = "1";
	
	//DB와 연결
	Connection conn = null;
	PreparedStatement pstmt = null;
	int check = 0;
	
	LogonDBBean a = new LogonDBBean();
	
	try{

		conn = a.getConnection();
		
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
	alert("회원가입이 완료되었습니다.");
	location.href = "../web.main/MainForm.jsp";
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