<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>


<%
	SimpleDateFormat form = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
	Date currentTime = new Date();
	Calendar c = Calendar.getInstance();
	
	c.setTime(currentTime);

	String mTime = form.format(c.getTime());
	c.add(c.DATE, 1);
	String mTime1 = form.format(c.getTime());

	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>test</title>
</head>
<body>
	<%=mTime %><br>
	<%=mTime1 %>
	
</body>
</html>