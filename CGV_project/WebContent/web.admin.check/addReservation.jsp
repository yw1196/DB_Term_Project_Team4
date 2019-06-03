<%@page import="user.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import = "user.LogonDataBean" %>

<% request.setCharacterEncoding("euc-kr"); %>


<%
	HttpSession hs = request.getSession();
	
	//파라미터 값 읽어들이는 부분
	String a = request.getParameter("a");//결제유무 a
	String b = request.getParameter("b");//스크린id b
	String c = request.getParameter("c");//자리수 c
	String d = request.getParameter("d");//손놈새기 아이디 d
	String e = request.getParameter("e");//시작 날짜 e
	String f = request.getParameter("f");//시작 시간 f
	String g = request.getParameter("g");//영화관 이름 g
	String usepoint = "0";
	if(request.getParameter("point")!=null){
		usepoint = request.getParameter("point");//써넣은 포인트
	}
	

	int check = 0;
	
	int num = Integer.parseInt(c);
	int point = 100*num;
	
	int gross = 10000*num;
	
	
	//DB와 연결
	Connection conn = null;
	PreparedStatement pstmt = null;
	LogonDBBean aa = new LogonDBBean();
	
	try{

		
		conn = aa.getConnection();
		
		//DB 쿼리실행
		String sql = "update ticket set checkv = '1', usepoint = ?, gross = ? where screen_id = ? and seat_num = ? and customer_id = ? and cinema_name = ? and showing_date = ? and showing_time = ?;";
		pstmt = conn.prepareStatement(sql);
		if(Integer.parseInt(usepoint) >= 1000){
			pstmt.setString(1, usepoint );
			pstmt.setString(2, Integer.toString(gross-(Integer.parseInt(usepoint))));
			
		}
		else{
			pstmt.setString(1, "0");
			pstmt.setString(2, Integer.toString(gross));
		}
		pstmt.setString(3, b);	
		pstmt.setString(4, c);
		pstmt.setString(5, d);
		pstmt.setString(6, g);
		pstmt.setString(7, e);
		pstmt.setString(8, f);
		pstmt.executeUpdate();
		pstmt.close();
		if(Integer.parseInt(usepoint) >= 1000){
			sql = "update customer set pointv = pointv - ? where id = ?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, usepoint);
			pstmt.setString(2, d);
			pstmt.executeUpdate();
			check = 1;
			pstmt.close();
		}
		
		
		
		
			
		
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
	alert("ㅇ결제됨 볼일없으면 저리가셈");
	location.href = "../web.admin/admin.jsp";
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