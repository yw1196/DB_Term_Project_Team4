<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>영화정보등록</title>
</head>
<body>
	<div style="cursor:pointer;width:100px;height:100px;border:1px solid;"  onclick="location.href='../web.main/MainForm.jsp'">
		<img alt="" src="../home.jpg" style="width:100px; height:100px;">
	</div>
	<h2>영화등록 Form</h2>
	  <form method="post" action="MovieRegisterPro.jsp">
	  영화ID :	<input type="text" name="ID" maxlength="12"><br />
	  제목 :	<input type="text" name="Title" maxlength="30"><br />
	  감독 :	<input type="text" name="Director" maxlength="20"><br />
	  출연진 :	<input type="text" name="Actors" maxlength="255"><br />
	  줄거리 :	<input type="text" name="Plot" maxlength="255"><br />
	  영화등급 :	<input type="text" name="Rating" maxlength="15"><br />
	  개봉일 :	<input type="date" name="StartDate" maxlength="15"><br />
	  러닝타임 :	<input type="text" name="Running_Time" maxlength="15"><br />
    	<input type="submit" value="등록">
      	<input type="reset" value="다시입력">
      	<input type="button" value="뒤로가기" onclick="location.href='../web.admin/Admin.jsp'">
   </form>
</body>
</html>