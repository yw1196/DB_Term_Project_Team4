<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ȭ ���� ����</title>
</head>
<body>

	<h2>��ȭ ���̵�� ���� ��ġ�ϰ� �Է��ϸ� �ش��ϴ� ��ȭ�� ������ �����˴ϴ�.</h2>
	<form method="post" action="MovieDeletePro.jsp">
		��ȭ���̵� : <input type="text" name="id" maxlength="12"><br />
		��ȭ���� : <input type="text" name="title" maxlength="12"><br />
		<input type="submit" value="��������"> <input type="reset"value="�ٽ��Է�"> <input type="button" value="�ڷΰ���"onclick="location.href='AdminForm.jsp'">
	</form>


</body>
</html>