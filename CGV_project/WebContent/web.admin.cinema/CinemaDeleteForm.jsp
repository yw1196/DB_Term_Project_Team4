<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ȭ ���� ����</title>
</head>
<body>
	<div style="cursor:pointer;width:100px;height:100px;border:1px solid;"  onclick="location.href='../web.main/MainForm.jsp'">
		<img alt="" src="../home.jpg" style="width:100px; height:100px;">
	</div>

	<h2>��ȭ�� �̸��� ��Ȯ�ϰ� �Է��ϸ� �ش��ϴ� ��ȭ���� ������ �����˴ϴ�.</h2>
	<form method="post" action="CinemaDeletePro.jsp">
		��ȭ�� �̸� : <input type="text" name="name" maxlength="12"><br />
		<input type="submit" value="��������"> <input type="reset"value="�ٽ��Է�"> <input type="button" value="�ڷΰ���"onclick="location.href='../web.admin/Admin.jsp'">
	</form>


</body>
</html>