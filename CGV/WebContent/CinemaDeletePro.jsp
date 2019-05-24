
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>


<%
	//�Ķ���� �� �о���̴� �κ�
	String name = request.getParameter("name");
	
	//DB�� ����
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	
	ResultSet rs = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/cgv?useSSL=false";
		String dbId = "root";
		String dbPass = "dyddns";
		
		Class.forName("com.mysql.jdbc.Driver"); // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass); // DiverManager ��ü�κ��� Connection ��ü�� ���´�.
		
		//DB ��������
		String sql = "select * from cinema where nameV=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		rs = pstmt.executeQuery(); // ���� ���� ����
		
		if(rs.next()){
			String rName = rs.getString("nameV");
			pstmt.close();
			if(name.equals(rName)){
				sql = "delete from cinema where nameV = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.executeUpdate();
				str = "��ȭ�� ���� ������ �Ϸ�Ǿ����ϴ�.";
			}
			else{
				str = "�ش��ϴ� ��ȭ�� �̸��� �����ϴ�.";
			}
		}
	}
	catch (Exception e){
		e.printStackTrace();
		str = "��ȭ������ ���� ����";
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