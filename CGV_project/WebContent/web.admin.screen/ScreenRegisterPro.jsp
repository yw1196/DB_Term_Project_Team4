<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>
<%@ page import="user.LogonDBBean"%>



    

<%
	//�Ķ���� �� �о���̴� �κ�
	String id = request.getParameter("id");
	String seat_totalnum = request.getParameter("seat_totalnum");
	String seat_bookednum = "0";
	String movie_id = request.getParameter("movie_id");
	String cinema_name = request.getParameter("cinema_name");
	//DB�� ����
	Connection conn = null;
	PreparedStatement pstmt = null;
	int check = 0;
	
	try{
		LogonDBBean a = new LogonDBBean();
		
		conn = a.getConnection();
		//DB ��������
		String sql = "insert into cgv.screen values(?, ?, ?, ?, ?);";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, seat_totalnum);
		pstmt.setString(3, seat_bookednum);
		pstmt.setString(4, cinema_name);
		pstmt.setString(5, movie_id);
		pstmt.executeUpdate();
		pstmt.close();
		
		sql = "UPDATE cinema SET Screen_Num = Screen_Num + 1 WHERE nameV = ?;";
		pstmt = conn.prepareStatement(sql);
	
		pstmt.setString(1, cinema_name);
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
	alert("����� �Ϸ�Ǿ����ϴ�.");
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