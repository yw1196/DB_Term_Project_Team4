
<%@page import="user.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<%@ page import="user.LogonDBBean" %>

<% request.setCharacterEncoding("euc-kr"); %>


<%
	//�Ķ���� �� �о���̴� �κ�
	String id = request.getParameter("ID");
	String passwd = request.getParameter("PW");
	String nameV = request.getParameter("NameV");
	String birth = request.getParameter("Birth");;
	String address = request.getParameter("Address");
	String number = request.getParameter("Phonenumber");
	String point = "0";
	String admin = "1";
	
	//DB�� ����
	Connection conn = null;
	PreparedStatement pstmt = null;
	int check = 0;
	
	LogonDBBean a = new LogonDBBean();
	
	try{

		conn = a.getConnection();
		
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
	alert("ȸ�������� �Ϸ�Ǿ����ϴ�.");
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