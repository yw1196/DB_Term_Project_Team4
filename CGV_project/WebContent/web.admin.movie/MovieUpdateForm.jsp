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

	<h2>��ȭ ���̵�� ������ ��ġ�ؾ��� ��ȭ ���������� �����մϴ�.</h2>
	<form method="post" action="MovieUpdatePro.jsp">
		��ȭ���̵� : <input type="text" name="id" maxlength="12"><br />
		��ȭ���� : <input type="text" name="title" maxlength="12"><br />
		���� : <input type="text" name="director" maxlength="20"><br />
		�⿬�� : <input type="text" name="actors" maxlength="255"><br />
		�ٰŸ� : <input type="text" name="plot" maxlength="255"><br />
		��ȭ��� : <input type="text" name="rating" maxlength="15"><br />
		������ : <input type="date" name="startdate" maxlength="15"><br />
		����Ÿ�� : <input type="text" name="running_time" maxlength="15"><br />
		<input type="submit" value="��������"> <input type="reset"
			value="�ٽ��Է�"> <input type="button" value="�ڷΰ���"
			onclick="location.href='../web.admin/Admin.jsp'">
	</form>

</body>
</html>