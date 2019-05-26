<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>
<%@ page import="user.LogonDBBean"%>

<%
	int check = 0;
	//�Ķ���� �� �о���̴� �κ�
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	
	//DB�� ����
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	ResultSet rs = null;
	
	LogonDBBean a = new LogonDBBean();
	
	try{
		conn = a.getConnection();
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
				check = 1;
			}
			else{
			}
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
	alert("��ȭ���Ű� �Ϸ�Ǿ����ϴ�.");
	location.href = "../web.admin/Admin.jsp";
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