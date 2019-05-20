
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>


<%
	//�Ķ���� �� �о���̴� �κ�
	String Id = request.getParameter("ID");
	String Title = request.getParameter("Title");
	String Director = request.getParameter("Director");
	String Actors = request.getParameter("Actors");
	String Plot = request.getParameter("Plot");
	String Rating = request.getParameter("Rating");
	String StartDate = request.getParameter("StartDate");
	String Running_Time = request.getParameter("Running_Time");
	//DB�� ����
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/cgv?useSSL=false";
		String dbId = "root";
		String dbPass = "dyddns";
		
		Class.forName("com.mysql.jdbc.Driver"); // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass); // DiverManager ��ü�κ��� Connection ��ü�� ���´�.
		
		//DB ��������
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
		str = "movie ���ڵ� �߰� ����";
	}
	catch (Exception e){
		e.printStackTrace();
		str = "movie ���ڵ� �߰� ����";
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