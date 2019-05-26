<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*"%>
<%@ page import="user.LogonDBBean"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	HttpSession hs = request.getSession();
	LogonDBBean logon = LogonDBBean.getInstance();
	
	

	String id = (String) hs.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="MainForm.css">

<meta charset="EUC-KR">
<title>메인사이트</title>
</head>
<body>
	<div style="cursor:pointer;width:100px;height:100px;border:1px solid;"  onclick="location.href='MainForm.jsp'">
		<img alt="" src="../home.jpg" style="width:100px; height:100px;">
	</div>
	<div class="top_bar" <%if (hs.getAttribute("id") != null) {%>
		style="display: none" <%}%>>
		<div class="login right">
			<input type=submit value=로그인
				onclick="location.href='../web.login/LoginForm.jsp'">
		</div>

	</div>


	<div <%if (hs.getAttribute("id") == null) {%> style="display: none"
		<%}%>>
		<div class="topbar">
			<div class="mypage" style="float: right">
				<!-- MyPage, 여러가지 정보를 확인할 수 있음 -->
				<input type="button" value="mypage" onclick="location.href='../web.mypage/MyPageForm.jsp'">
			</div>

			<div class="admin" style="float: right">
				<!-- 관리자모드 버튼, AdminV 속성이 true라면 이버튼이 보이게 설정 -->
					<input type="submit" value="admin" onclick="location.href='../web.admin/Admin.jsp'"
						,<%if (logon.AdminCheck(id) == 0) {%> style="display: none"
						<%}%>>

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
						<form method="post" action="../web.login/Logout.jsp">
							<input type="submit" value="로그아웃">
						</form>
					</div>
					<div style="float: left">
						<form method="post" action="../web.update/UpdateForm01.jsp">
							<input type="submit" value="정보수정">
						</form>
					</div>
					<div style="float: left">
						<form method="post" action="../web.delete/DeleteForm.jsp">
							<input type="submit" value="탈퇴">
						</form>
					</div>
				</div>

			</div>
			<div>
				<!-- 본 페이지의 여러 기능들 -->
				<div class="mainmain" style="text-align: center">영화예매버튼</div>
			</div>
		</div>
	</div>

</body>
</html>