<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>


<%@ page import="java.sql.*"%>
<%@ page import="user.LogonDBBean"%>

<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	HttpSession hs = request.getSession();
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	hs.setAttribute("id", id);
	hs.setAttribute("pw", passwd);
	

	LogonDBBean logon = LogonDBBean.getInstance();
	int check = logon.userCheck(id, passwd);
	int Acheck = logon.AdminCheck(id);

	hs.setAttribute("ac", Acheck);
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	String[] title = new String[3];
	String[] director = new String[3];
	String[] rating = new String[3];
	String[] running_time  = new String[3];
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/cgv?useSSL=false";
		String dbId = "root";
		String dbPass = "rlarnrgus1";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		String sql = "SELECT * FROM MOVIE";
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		for(int i = 0; i < 3; i++) {
		rs.next();
		title[i] = rs.getString("title");
		director[i] = rs.getString("director");
		rating[i] = rs.getString("rating");
		running_time[i] = rs.getString("running_time");
		}
		
		
	}
	catch(Exception e){
		
	}
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
<link rel="stylesheet" href="LoginPro.css">
<meta charset="EUC-KR">
<title>메인페이지</title>
</head>
<body>
	<div class="topbar">
		<div class="mypage" style="float: right">
			<!-- MyPage, 여러가지 정보를 확인할 수 있음 -->
			<form method="post" action="MyPage.jsp">
				<input type="submit" value="MyPage">
			</form>
		</div>

		<div class="admin" style="float: right">
			<!-- 관리자모드 버튼, AdminV 속성이 true라면 이버튼이 보이게 설정 -->
			<form method="post" action="AdminForm.jsp" id="admin">
				<input type="submit" value="admin" , <%if (Acheck == 0) {%>
					style="display: none" <%}%>>
			</form>
		</div>
	</div>
	<div class="main">

		<div class="info">
			<div>
				<!-- 적립포인트 -->
				? 포인트
			</div>
			<div>
				<!-- 'id'님 안녕하세요 -->

				<%=id%>님 어서오세요

			</div>
			<div>
				<!-- 로그아웃, 정보수정 -->
				<div style="float: left">
					<form method="post" action="Logout.jsp">
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

		</div>
		
			<!-- 본 페이지의 여러 기능들 -->
			영화
			<div class="mainmain" >
				<form method="post" action = "BookingForm.jsp">
					
					<div class="one">
					<input type="submit" value=<%= title[0] %> onclick="location.href='BookingForm.jsp'"></br>
					<%= director[0]%></br>
					<%= rating[0]%></br>
					<%= running_time[0]%>
					</div>
					
					<div class="two">
					<input type="submit" value=<%= title[1] %> onclick="location.href='BookingForm.jsp'"></br>
					<%= director[1]%></br>
					<%= rating[1]%></br>
					<%= running_time[1]%>
					</div>
					
					<div class="three">
					<input type="submit" value=<%= title[2] %> onclick="location.href='BookingForm.jsp'"></br>
					<%= director[2]%></br>
					<%= rating[2]%></br>
					<%= running_time[2]%>
					</div>
					
			</form>
			</div>
		





</body>
</html>
