
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
	String str = "";
	
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
				str = "상영관 정보 삭제가 완료되었습니다.";
			}
			else{
				str = "해당하는 상영관과 영화관 이름이 없습니다.";
			}
		}
	}
	catch (Exception e){
		e.printStackTrace();
		str = "상영관정보 삭제 실패";
	}
	finally{
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%=str %>
	<form action="AdminForm.jsp">
		<input type="submit" value="확인">
	</form>
</body>
</html>