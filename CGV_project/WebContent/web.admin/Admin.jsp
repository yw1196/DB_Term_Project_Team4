<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div style="cursor:pointer;width:100px;height:100px;border:1px solid;"  onclick="location.href='../web.main/MainForm.jsp'">
		<img alt="" src="../home.jpg" style="width:100px; height:100px;">
	</div>
	Admin Page
	<form action="">

	
	��ȭ��
	<input type="button" value="���" onclick="location.href='../web.admin.cinema/CinemaRegisterForm.jsp'">
	<input type="button" value="����" onclick="location.href='../web.admin.cinema/CinemaUpdateForm.jsp'">
	<input type="button" value="����" onclick="location.href='../web.admin.cinema/CinemaDeleteForm.jsp'">
	<br>
	
	��ȭ
	<input type="button" value="���" onclick="location.href='../web.admin.movie/MovieRegisterForm.jsp'">
	<input type="button" value="����" onclick="location.href='../web.admin.movie/MovieUpdateForm.jsp'">
	<input type="button" value="����" onclick="location.href='../web.admin.movie/MovieDeleteForm.jsp'">
	<br>
	
	�󿵰�
	<input type="button" value="���" onclick="location.href='../web.admin.screen/ScreenRegisterForm.jsp'">
	<input type="button" value="����" onclick="location.href='../web.admin.screen/ScreenUpdateForm.jsp'">
	<input type="button" value="����" onclick="location.href='../web.admin.screen/ScreenDeleteForm.jsp'">
	<br>	
	
	ȸ������
	<input type="button" value="ȸ������" onclick="location.href='../web.admin.check/UserListCheckForm.jsp'">
	<input type="button" value="vip����" onclick="location.href='../web.admin.check/VIPUserCheckForm.jsp'">
	<br>
	
	
	
	</form>

	<input type="button" value="��ȭ���Ȯ��" onclick="location.href='../web.admin.check/MovieListCheckForm.jsp'">
	<input type="button" value="��������Ȯ��" onclick="location.href='../web.admin.check/ReservationCheckForm.jsp'">
	<br>
	
	
</body>
</html>