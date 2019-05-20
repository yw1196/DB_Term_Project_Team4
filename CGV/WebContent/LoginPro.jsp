<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*"%>
<%@ page import="user.LogonDBBean"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");

	LogonDBBean logon = LogonDBBean.getInstance();
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/cgv?useSSL=false";
		String dbId = "root";
		String dbPass = "dyddns";
		
		Class.forName("com.mysql.jdbc.Driver"); // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass); // DiverManager 객체로부터 Connection 객체를 얻어온다.
		
		String sql = "select id, pw from customer where id=?";
		
	}
	catch (Exception e){
		e.printStackTrace();
		str = "member 레코드 추가 실패";
	}
	finally{
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
	int check = logon.userCheck(id, passwd);

	if (check == 1) {
%>
<%
	} else if (check == 0) {
%>
<script>
	alert("비밀번호가 맞지 않습니다.");
	history.go(-1);
</script>
<%
	} else {
%>
<script>
	alert("아이디가 맞지 않습니다.");
	history.go(-1);
</script>
<%
	}
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="MMain.css">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="topbar">
		<div class="admin" style="float: right">
			<!-- MyPage, 여러가지 정보를 확인할 수 있음 -->
			<form method="post" action="MyPage.jsp">
				<input type="submit" value="MyPage">
			</form>
		</div>

		<div class="admin" style="float: right">
			<!-- 관리자모드 버튼, AdminV 속성이 true라면 이버튼이 보이게 설정 -->
			<form method="post" action="AdminForm.jsp" id="admin">
				<input type="submit" value="admin">
			</form>
		</div>
	</div>

	<div>
		<!-- 적립포인트 -->
		<h1>? 포인트</h1>
	</div>
	<div>
		<!-- 'id'님 안녕하세요 -->
		<h1>
			<%=id%>님 어서오세요
		</h1>
	</div>
	<div>
		<!-- 로그아웃, 정보수정 -->
		<div style="float: left">
			<form method="post" action="LoginForm.jsp">
				<input type="submit" value="로그아웃">
			</form>
		</div>
		<div style="float: left">
			<form method="post" action="UpdateForm.jsp">
				<input type="submit" value="정보수정">
			</form>
		</div>
		<div style="float: left">
			<form method="post" action="DeleteForm.jsp">
				<input type="submit" value="탈퇴">
			</form>
		</div>
	</div>
	<div>
		<!-- 본 페이지의 여러 기능들 -->
		<div class="mainmain"></div>
	</div>

</body>
</html>