<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="user.LogonDataBean"%>
<%@ page import="user.LogonDBBean"%>


<%
	request.setCharacterEncoding("euc-kr");
%>


<%
	//�Ķ���� �� �о���̴� �κ�   

	HttpSession hs = request.getSession();
	String passward = request.getParameter("PW");
	String nameV = request.getParameter("NameV");
	String birth = request.getParameter("Birth");;
	String address = request.getParameter("Address");
	String number = request.getParameter("Phonenumber");
	String point = "0";
	String admin = "0";
	String id = (String) hs.getAttribute("id");

	//DB�� ����
	Connection conn = null;
	PreparedStatement pstmt = null;
	int check = 0;

	LogonDBBean a = new LogonDBBean();
	try {
		conn = a.getConnection();

		//DB ��������
		String sql = "update cgv.customer set PW = ?, NameV = ?, Birth = ?, Address = ?, PhoneNumber = ? where ID = ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, passward);
		pstmt.setString(2, nameV);
		pstmt.setString(3, birth);
		pstmt.setString(4, address);
		pstmt.setString(5, number);
		pstmt.setString(6, id);
		pstmt.executeUpdate();
		check = 1;

	} catch (Exception e) {
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
		hs.setAttribute("passwd", passward);
		%>
<script>
	alert("������ �����Ǿ����ϴ�.");
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