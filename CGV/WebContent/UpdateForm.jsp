<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="user.LogonDBBean"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	HttpSession hs = request.getSession();

	String id =	(String)hs.getAttribute("id");

	String passwd = request.getParameter("passwd");

	LogonDBBean logon = LogonDBBean.getInstance();
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	��������
	<form method="post" action="UpdateForm02.jsp">
		���̵� : <input type="text" name="ID" maxlength="12" value=<%=id %> readonly><br />
		�н����� : <input type="password" name="PW" maxlength="12"><br />
		<input	type="submit" value="����Ȯ��">

	</form>
</body>
</html>