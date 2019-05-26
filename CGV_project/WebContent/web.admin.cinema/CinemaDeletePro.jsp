<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="user.LogonDBBean"%>
<% request.setCharacterEncoding("euc-kr"); %>


<%
	//파라미터 값 읽어들이는 부분
	String name = request.getParameter("name");
	
	//DB와 연결
	Connection conn = null;
	PreparedStatement pstmt = null;

	ResultSet rs = null;

	LogonDBBean a = new LogonDBBean();
	int check = 0;
	try{
		
		conn = a.getConnection();
		//DB 쿼리실행
		String sql = "select * from cinema where nameV=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		rs = pstmt.executeQuery(); // 실제 쿼리 실행
		
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
	alert("영화삭제가 완료되었습니다.");
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