<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ȭ�� ���� ����</title>
</head>
<body>
	<div style="cursor:pointer;width:100px;height:100px;border:1px solid;"  onclick="location.href='../web.main/MainForm.jsp'">
		<img alt="" src="../home.jpg" style="width:100px; height:100px;">
	</div>

	<h2>��ȭ�� �̸��� ��Ȯ�� �Է��ؾ� ��ȭ�� ���������� �����մϴ�.</h2>
	<form method="post" action="CinemaUpdatePro.jsp">
		��ȭ�� �̸� : <input type="text" name="name" maxlength="12"><br />
		��ȭ�� �ּ� : <input type="text" name="address" maxlength="50"><br />
		��ȭ�� ��ȭ��ȣ : <input type="text" name="callnum" maxlength="20"><br />
		�󿵰� ���� : <input type="text" name="screen_num" maxlength="20"><br />
		<input type="submit" value="��������"> <input type="reset"
			value="�ٽ��Է�"> <input type="button" value="�ڷΰ���"
			onclick="location.href='../web.admin/Admin.jsp'">
	</form>

</body>
</html>
