<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>


<%@ page import="java.sql.*"%>
<%@ page import="user.LogonDBBean"%>
<%
   request.setCharacterEncoding("euc-kr");
%>
<%
	String passward = request.getParameter("PW");

	HttpSession hs = request.getSession();
	String passcheck = (String) hs.getAttribute("passwd");
	if (passcheck.equals(passward)) {

	} else {
%>
<script>
	alert("��й�ȣ�� Ʋ�Ƚ��ϴ�.");
	history.go(-1);
</script>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��������</title>
</head>
<body>
	<div style="cursor:pointer;width:100px;height:100px;border:1px solid;"  onclick="location.href='../web.main/MainForm.jsp'">
		<img alt="" src="../home.jpg" style="width:100px; height:100px;">
	</div>
	<h2>����������</h2>

	<form method="post" action="UpdatePro.jsp">
		�н����� : <input type="password" name="PW" maxlength="12"><br />
		�̸� : <input type="text" name="NameV" maxlength="12"><br /> ����
		: <input type="text" name="Birth" maxlength="12"><br /> �ּ� :
		<input type="text" name="Address" maxlength="40"><br /> ��ȣ :
		<input type="text" name="Phonenumber" maxlength="15"><br /> <input
			type="submit" value="��������">
		<input type="reset" value="�ٽ��Է�"> <input type="button"
			value="���" onclick="location.href='../web.main/MainForm.jsp'">

	</form>
</body>
</html>