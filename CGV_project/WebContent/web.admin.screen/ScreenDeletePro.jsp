
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="user.LogonDBBean"%>

<% request.setCharacterEncoding("euc-kr"); %>


<%
	//�Ķ���� �� �о���̴� �κ�
	String id = request.getParameter("id");
	String cinema_name = request.getParameter("cinema_name");
	
	//DB�� ����
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	
	ResultSet rs = null;
	
	try{
		
		LogonDBBean a = new LogonDBBean();
		
		conn = a.getConnection();
		//DB ��������
		String sql = "select * from screen where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery(); // ���� ���� ����
		
		if(rs.next()){
			String rId = rs.getString("id");
			String rCinema_name = rs.getString("cinema_name");
			pstmt.close();
			if(id.equals(rId)&&cinema_name.equals(rCinema_name)){
				sql = "delete from screen where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				str = "�󿵰� ���� ������ �Ϸ�Ǿ����ϴ�.";
			}
			else{
				str = "�ش��ϴ� �󿵰��� ��ȭ�� �̸��� �����ϴ�.";
			}
		}
	}
	catch (Exception e){
		e.printStackTrace();
		str = "�󿵰����� ���� ����";
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