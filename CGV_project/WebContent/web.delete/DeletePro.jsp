<%@page import="user.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import = "user.LogonDataBean" %>

<% request.setCharacterEncoding("euc-kr"); %>


<%
	HttpSession hs = request.getSession();
	//�Ķ���� �� �о���̴� �κ�
	String ID = request.getParameter("ID");
	String id = (String) hs.getAttribute("id");
	String PW = request.getParameter("PW");
	String pw = (String) hs.getAttribute("passwd");
	
	int check = 0;
	
	//DB�� ����
	Connection conn = null;
	PreparedStatement pstmt = null;
	LogonDBBean a = new LogonDBBean();
	
	try{

		
		conn = a.getConnection();
		
		//DB ��������
		if(pw.equals(PW)){
			String sql = "delete from cgv.customer where ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ID);
			pstmt.executeUpdate();
			
			check = 1;
			
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
		hs.invalidate();
%>
<script>
	alert("ȸ��Ż��Ǿ����ϴ�. �̿����ּż� �����մϴ�.");
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