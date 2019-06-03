<%@page import="user.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import = "user.LogonDataBean" %>

<% request.setCharacterEncoding("euc-kr"); %>


<%
	HttpSession hs = request.getSession();
	
	//파라미터 값 읽어들이는 부분
	String a = request.getParameter("a");
	String b = request.getParameter("b");
	String c = request.getParameter("c");
	String d = request.getParameter("d");
	String e = request.getParameter("e");
	String f = request.getParameter("f");
	String g = request.getParameter("g");

	int check = 0;
	
	int num = Integer.parseInt(c);
	int point = 100*num;
	
	//DB와 연결
	Connection conn = null;
	PreparedStatement pstmt = null;
	LogonDBBean aa = new LogonDBBean();
	
	try{

		
		conn = aa.getConnection();	
		
		//DB 쿼리실행\
		String sql = "delete from ticket where checkv = ? and screen_id = ? and seat_num = ? and customer_id = ? and showing_date = ? and showing_time = ? and cinema_name = ?;";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, a);
		pstmt.setString(2, b);
		pstmt.setString(3, c);
		pstmt.setString(4, d);
		pstmt.setString(5, e);
		pstmt.setString(6, f);
		pstmt.setString(7, g);
		pstmt.executeUpdate();
		pstmt.close();
		sql = "update screen set seat_bookednum = seat_bookednum - ? where id = ?;";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, c);
		pstmt.setString(2, b);
		pstmt.executeUpdate();
		pstmt.close();
		if(a.equals("1")){
			sql = "update customer set pointv = pointv-? where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, Integer.toString(point));
			pstmt.setString(2, hs.getAttribute("id").toString());
			pstmt.executeUpdate();
			pstmt.close();
		}
		
		check = 1;
			
		
	}
	catch (Exception ee){
		ee.printStackTrace();
	}
	finally{
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
	if(check == 1){
%>
<script>
	alert("예매취소띠````.");
	location.href = "MyPageForm.jsp";
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