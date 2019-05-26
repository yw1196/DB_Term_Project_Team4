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
<title>���λ���Ʈ</title>
</head>
<body>
	<div style="cursor:pointer;width:100px;height:100px;border:1px solid;"  onclick="location.href='MainForm.jsp'">
		<img alt="" src="../home.jpg" style="width:100px; height:100px;">
	</div>
	<div class="top_bar" <%if (hs.getAttribute("id") != null) {%>
		style="display: none" <%}%>>
		<div class="login right">
			<input type=submit value=�α���
				onclick="location.href='../web.login/LoginForm.jsp'">
		</div>

	</div>


	<div <%if (hs.getAttribute("id") == null) {%> style="display: none"
		<%}%>>
		<div class="topbar">
			<div class="mypage" style="float: right">
				<!-- MyPage, �������� ������ Ȯ���� �� ���� -->
				<input type="button" value="mypage" onclick="location.href='../web.mypage/MyPageForm.jsp'">
			</div>

			<div class="admin" style="float: right">
				<!-- �����ڸ�� ��ư, AdminV �Ӽ��� true��� �̹�ư�� ���̰� ���� -->
					<input type="submit" value="admin" onclick="location.href='../web.admin/Admin.jsp'"
						,<%if (logon.AdminCheck(id) == 0) {%> style="display: none"
						<%}%>>

			</div>
		</div>
		<div class="main">

			<div class="info">
				<div>
					<!-- ��������Ʈ -->
					? ����Ʈ
				</div>
				<div>
					<!-- 'id'�� �ȳ��ϼ��� -->

					<%=id%>�� �������

				</div>
				<div>
					<!-- �α׾ƿ�, �������� -->
					<div style="float: left">
						<form method="post" action="../web.login/Logout.jsp">
							<input type="submit" value="�α׾ƿ�">
						</form>
					</div>
					<div style="float: left">
						<form method="post" action="../web.update/UpdateForm01.jsp">
							<input type="submit" value="��������">
						</form>
					</div>
					<div style="float: left">
						<form method="post" action="../web.delete/DeleteForm.jsp">
							<input type="submit" value="Ż��">
						</form>
					</div>
				</div>

			</div>
			<div>
				<!-- �� �������� ���� ��ɵ� -->
				<div class="mainmain" style="text-align: center">��ȭ���Ź�ư</div>
			</div>
		</div>
	</div>

</body>
</html>