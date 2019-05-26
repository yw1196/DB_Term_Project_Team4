
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>
<%@ page import="user.LogonDBBean"%>


<%
	//�Ķ���� �� �о���̴� �κ�
	String id = request.getParameter("id");
	String seat_totalnum = request.getParameter("seat_totalnum");
	String seat_bookednum = request.getParameter("seat_bookednum");
	String movie_id = request.getParameter("movie_id");
	String cinema_name = request.getParameter("cinema_name");
	//DB�� ����
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	
	try{
		LogonDBBean a = new LogonDBBean();
		
		conn = a.getConnection();
		
		
		//String jdbcUrl = "jdbc:mysql://localhost:3306/cgv?useSSL=false";
		//String dbId = "root";
		//String dbPass = "dyddns";
		
		//Class.forName("com.mysql.jdbc.Driver"); // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
		//conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass); // DiverManager ��ü�κ��� Connection ��ü�� ���´�.
		
		//DB ��������
		String sql = "insert into cgv.screen values(?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, seat_totalnum);
		pstmt.setString(3, seat_bookednum);
		pstmt.setString(4, movie_id);
		pstmt.setString(5, cinema_name);
		pstmt.executeUpdate();
		str = "screen ���ڵ� �߰� ����";
	}
	catch (Exception e){
		e.printStackTrace();
		str = "screen ���ڵ� �߰� ����";
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
		<input type="submit" value="Ȯ��">
	</form>
</body>
</html>