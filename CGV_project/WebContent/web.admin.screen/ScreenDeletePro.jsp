<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="user.LogonDBBean"%>

<% request.setCharacterEncoding("euc-kr"); %>


<%
	//파라미터 값 읽어들이는 부분
	String id = request.getParameter("id");
	String cinema_name = request.getParameter("cinema_name");
	
	//DB와 연결
	Connection conn = null;
	PreparedStatement pstmt = null;
	int check = 0;	
	ResultSet rs = null;
	
	try{
		
		LogonDBBean a = new LogonDBBean();
		
		conn = a.getConnection();
		//DB 쿼리실행
		String sql = "select * from screen where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery(); // 실제 쿼리 실행
		
		if(rs.next()){
			String rId = rs.getString("id");
			String rCinema_name = rs.getString("cinema_name");
			pstmt.close();
			if(id.equals(rId)&&cinema_name.equals(rCinema_name)){
				sql = "delete from screen where id = ?";
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
	alert("삭제가 완료되었습니다.");
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