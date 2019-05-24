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

	정보수정
	<form method="post" action="UpdateForm02.jsp">
		아이디 : <input type="text" name="ID" maxlength="12" value=<%=id %> readonly><br />
		패스워드 : <input type="password" name="PW" maxlength="12"><br />
		<input	type="submit" value="본인확인">

	</form>
</body>
</html>