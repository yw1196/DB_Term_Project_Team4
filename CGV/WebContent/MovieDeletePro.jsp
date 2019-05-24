
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>


<%
	//�Ķ���� �� �о���̴� �κ�
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	
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
		String sql = "select id, title from movie where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery(); // ���� ���� ����
		
		if(rs.next()){
			String rId = rs.getString("id");
			String rTitle = rs.getString("title");
			pstmt.close();
			if(id.equals(rId) && title.equals(rTitle)){
				sql = "delete from movie where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				str = "��ȭ ���� ������ �Ϸ�Ǿ����ϴ�.";
			}
			else{
				str = "���̵�� ������ ��ġ���� �ʽ��ϴ�.";
			}
		}
	}
	catch (Exception e){
		e.printStackTrace();
		str = "��ȭ���� ���� ����";
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