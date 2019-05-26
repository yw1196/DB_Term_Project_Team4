<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="user.LogonDBBean"%>
<%
	request.setCharacterEncoding("euc-kr");
%>


<%
	//�Ķ���� �� �о���̴� �κ�
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String callnum = request.getParameter("callnum");
	String screen_num = request.getParameter("screen_num");
	
	LogonDBBean a = new LogonDBBean();
	//DB�� ����
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int check = 0;
	
	try {
		
		conn = a.getConnection();
		
		//DB ��������
		String sql = "select * from cinema where nameV=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		rs = pstmt.executeQuery(); // ���� ���� ����
		if (rs.next()) {
			String rName = rs.getString("nameV");
			pstmt.close();
			if (name.equals(rName)) {
				sql = "update cinema set address = ?, callnum = ?, screen_num = ? where nameV = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, address);
				pstmt.setString(2, callnum);
				pstmt.setString(3, screen_num);
				pstmt.setString(4, name);
				pstmt.executeUpdate();
				check = 1;
			}
		}}	 catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException sqle) {
			}
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException sqle) {
			}
	}
	if(check == 1){
		%>
<script>
	alert("��ȭ������ ������ �Ϸ�Ǿ����ϴ�.");
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