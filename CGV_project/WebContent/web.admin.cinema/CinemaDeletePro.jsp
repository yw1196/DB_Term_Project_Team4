<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="user.LogonDBBean"%>
<% request.setCharacterEncoding("euc-kr"); %>


<%
	//�Ķ���� �� �о���̴� �κ�
	String name = request.getParameter("name");
	
	//DB�� ����
	Connection conn = null;
	PreparedStatement pstmt = null;

	ResultSet rs = null;

	LogonDBBean a = new LogonDBBean();
	int check = 0;
	try{
		
		conn = a.getConnection();
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
				check = 1;
			}else{}
		}
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
	alert("��ȭ������ �Ϸ�Ǿ����ϴ�.");
	location.href = "../web.main/MainForm.jsp";
</script>
		<%
	}else{
		%>
<script>
	alert("������ �ùٸ��� �ʽ��ϴ�.");
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