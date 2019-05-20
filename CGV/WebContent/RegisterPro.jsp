
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>


<%
	//�Ķ���� �� �о���̴� �κ�
	String id = request.getParameter("ID");
	String passwd = request.getParameter("PW");
	String nameV = request.getParameter("NameV");
	String birth = request.getParameter("Birth");
	String address = request.getParameter("Address");
	String number = request.getParameter("Phonenumber");
	String point = "0";
	String admin = "0";
	
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
		str = "member ���ڵ� �߰� ����";
	}
	catch (Exception e){
		e.printStackTrace();
		str = "member ���ڵ� �߰� ����";
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
		<input type="submit" value="ok ������">
	</form>
</body>
</html>