<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	Admin Page
	<form action="">
		��ȭ�� ������� ���� ����, ��ȭ������� ���� ����, vip����, ������ Ȯ��, ��ȭ��� Ȯ��, ��������Ȯ�� �� Ƽ�Ϲ߸� 
	</form>
	<input type="button" value="��ȭ���Ȯ��" onclick="location.href='MovieListCheckForm.jsp'">
	<input type="button" value="��������Ȯ��" onclick="location.href='ReservationCheckForm.jsp'">
	<br>
	
	��ȭ��
	<input type="button" value="���" onclick="location.href='ScreenInsertForm.jsp'">
	<input type="button" value="����" onclick="location.href='ScreenUpdateForm.jsp'">
	<input type="button" value="����" onclick="location.href='ScreenDeleteForm.jsp'">
	<br>
	
	��ȭ
	<input type="button" value="���" onclick="location.href='MovieInsertForm.jsp'">
	<input type="button" value="����" onclick="location.href='MovieUpdateForm.jsp'">
	<input type="button" value="����" onclick="location.href='MovieDeleteForm.jsp'">
	<br>
	
	ȸ������
	<input type="button" value="ȸ������" onclick="location.href='UserCheckForm.jsp'">
	<input type="button" value="vip����" onclick="location.href='VIPCheckForm.jsp'">
	
	
</body>
</html>