
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import = "user.LogonDataBean" %>

<% request.setCharacterEncoding("euc-kr"); %>


<%
	//�Ķ���� �� �о���̴� �κ�
	String ID = request.getParameter("ID");
	String id =" ";
	String PW = request.getParameter("PW");
	String pw =" ";
	
	//DB�� ����
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/cgv?useSSL=false";
		String dbId = "root";
		String dbPass = "rlarnrgus1";
		id = (String)session.getAttribute("id");
		pw = (String)session.getAttribute("pw");
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		//DB ��������
		if(id.equals(ID) && pw.equals(PW)){
		String sql = "delete from cgv.customer where ID = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, ID);
		pstmt.executeUpdate();
		
		str = "member ���ڵ� ���� ����";
		}
	}
	catch (Exception e){
		e.printStackTrace();
		str = "member ���ڵ� ���� ����";
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