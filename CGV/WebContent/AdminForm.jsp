<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<p>��ȭ ���� ���/����/����</p>
	<p>��ȭ�� ���� ���/����/����</p>
	
	<form action="AdminPro.jsp" method="post">
		<input type="button" value="��ȭ�������" onclick="location.href='MovieRegisterForm.jsp'">
		<input type="button" value="��ȭ��������" onclick="location.href='MovieUpdateForm.jsp'">
		<input type="button" value="��ȭ��������" onclick="location.href='MovieDeleteForm.jsp'">		
	</form>
	<br />
	<br />
	<form action="AdminPro.jsp" method="post">
		<input type="button" value="��ȭ���������" onclick="location.href='CinemaRegisterForm.jsp'">
		<input type="button" value="��ȭ����������" onclick="location.href='CinemaUpdateForm.jsp'">
		<input type="button" value="��ȭ����������" onclick="location.href='CinemaDeleteForm.jsp'">		
	</form>
</body>
</html>
