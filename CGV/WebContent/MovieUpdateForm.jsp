<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ȭ ���� ����</title>
</head>
<body>

	<h2>��ȭ ���̵�� ������ ��ġ�ؾ��� ��ȭ ���������� �����մϴ�.</h2>
	<form method="post" action="MovieUpdatePro.jsp">
		��ȭ���̵� : <input type="text" name="id" maxlength="12"><br />
		��ȭ���� : <input type="text" name="title" maxlength="12"><br />
		���� : <input type="text" name="Director" maxlength="20"><br />
		�⿬�� : <input type="text" name="Actors" maxlength="255"><br />
		�ٰŸ� : <input type="text" name="Plot" maxlength="255"><br />
		��ȭ��� : <input type="text" name="Rating" maxlength="15"><br />
		������ : <input type="date" name="StartDate" maxlength="15"><br />
		����Ÿ�� : <input type="text" name="Running_Time" maxlength="15"><br />
		<input type="submit" value="��������"> <input type="reset"
			value="�ٽ��Է�"> <input type="button" value="�ڷΰ���"
			onclick="location.href='AdminForm.jsp'">
	</form>

</body>
</html>