<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�󿵰� �������</title>
</head>
<body>
	<h2>�󿵰� ��� Form</h2>
	<h3>���� - ��ȭ ���̵�� ��ȭ�� �̸��� �ش� ���̺� ���� �־�� �մϴ�.</h3>
	<form method="post" action="ScreenRegisterPro.jsp">
		��ȭ�� �̸� : <input type="text" name="cinema_name" maxlength="20"><br />
		�󿵰� ���̵� : <input type="text" name="id" maxlength="12"><br />
		�� �¼� �� : <input type="text" name="seat_totalnum" maxlength="20"><br />
		��ȭ ���̵� : <input type="text" name="movie_id" maxlength="20"><br />
		<input type="submit" value="���"> <input type="reset"
			value="�ٽ��Է�"> <input type="button" value="�ڷΰ���"
			onclick="location.href='AdminForm.jsp'">
	</form>
</body>
</html>