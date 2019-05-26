<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="user.LogonDBBean"%>
<%
	request.setCharacterEncoding("euc-kr");
%>


<%
	//파라미터 값 읽어들이는 부분
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String callnum = request.getParameter("callnum");
	String screen_num = request.getParameter("screen_num");
	
	LogonDBBean a = new LogonDBBean();
	//DB와 연결
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int check = 0;
	
	try {
		
		conn = a.getConnection();
		
		//DB 쿼리실행
		String sql = "select * from cinema where nameV=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		rs = pstmt.executeQuery(); // 실제 쿼리 실행
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
	alert("영화관정보 수정이 완료되었습니다.");
	location.href = "../web.admin/Admin.jsp";
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