<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	HttpSession hs = request.getSession();
	String id = (String) hs.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����</title>
</head>

<body>
	<div style="cursor:pointer;width:100px;height:100px;border:1px solid;"  onclick="location.href='../web.main/MainForm.jsp'">
		<img alt="" src="../home.jpg" style="width:100px; height:100px;">
	</div>
		<form method="post" action="DeletePro.jsp">
      ���̵� : <input type="text" name="ID" maxlength="12" value="<%=id %>" readonly="readonly"><br />
   	��й�ȣ : <input type="password" name="PW" maxlength="12"><br />
     <input type="submit" value="Ż��">
     <input type="button" value="���" onclick="location.href='../web.main/MainForm.jsp'">

</body>
</html>