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
<title>Insert title here</title>
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
			<form method="post" action="Admin.jsp" id="admin">
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
		<div>
			<!-- 본 페이지의 여러 기능들 -->
			<div class="mainmain" style="text-align:center">영화예매버튼</div>
		</div>
	</div>




</body>
</html>