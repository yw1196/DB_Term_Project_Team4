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
	alert("��й�ȣ�� ���� �ʽ��ϴ�.");
	history.go(-1);
</script>
<%
	} else {
%>
<script>
	alert("���̵� ���� �ʽ��ϴ�.");
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
			<!-- MyPage, �������� ������ Ȯ���� �� ���� -->
			<form method="post" action="MyPage.jsp">
				<input type="submit" value="MyPage">
			</form>
		</div>

		<div class="admin" style="float: right">
			<!-- �����ڸ�� ��ư, AdminV �Ӽ��� true��� �̹�ư�� ���̰� ���� -->
			<form method="post" action="Admin.jsp" id="admin">
				<input type="submit" value="admin" , <%if (Acheck == 0) {%>
					style="display: none" <%}%>>
			</form>
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
					<form method="post" action="Logout.jsp">
						<input type="submit" value="�α׾ƿ�">
					</form>
				</div>
				<div style="float: left">
					<form method="post" action="UpdateForm.jsp">
						<input type="submit" value="��������">
					</form>
				</div>
				<div style="float: left">
					<form method="post" action="DeleteForm.jsp">
						<input type="submit" value="Ż��">
					</form>
				</div>
			</div>

		</div>
		<div>
			<!-- �� �������� ���� ��ɵ� -->
			<div class="mainmain" style="text-align:center">��ȭ���Ź�ư</div>
		</div>
	</div>




</body>
</html>