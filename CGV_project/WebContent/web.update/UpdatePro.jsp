<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="user.LogonDataBean"%>
<%@ page import="user.LogonDBBean"%>


<%
	request.setCharacterEncoding("euc-kr");
%>


<%
	//파라미터 값 읽어들이는 부분   

	HttpSession hs = request.getSession();
	String passward = request.getParameter("PW");
	String nameV = request.getParameter("NameV");
	String birth = request.getParameter("Birth");;
	String address = request.getParameter("Address");
	String number = request.getParameter("Phonenumber");
	String point = "0";
	String admin = "0";
	String id = (String) hs.getAttribute("id");

	//DB와 연결
	Connection conn = null;
	PreparedStatement pstmt = null;
	int check = 0;

	LogonDBBean a = new LogonDBBean();
	try {
		conn = a.getConnection();

		//DB 쿼리실행
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
	alert("정보가 수정되었습니다.");
	location.href = "../web.main/MainForm.jsp";
</script>
		<%
	}else{
		%>
<script>
	alert("정보가 올바르지 않습니다.");
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