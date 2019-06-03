<%@page import="user.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
 <%@ page import= "java.util.ArrayList" %>   
     
     
<%





%>
     
     
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>예매 맞는지 확인 페이지</title>
</head>
   
<body>

   <div style="cursor:pointer;width:100px;height:100px;border:1px solid;"  onclick="location.href='../web.main/MainForm.jsp'">
      <img alt="" src="../home.jpg" style="width:100px; height:100px;">
   </div>
   
   <form method="post" action="BookingCheckPro.jsp">
   
       영화관 : <br />
   
   영화: <br />
   
      상영관  : <br />
  
       날짜: <br />
      
      시간 :<br />
     
      결제 유무 : <br />
      
      좌석 : <br />
    
    내용이 맞습니까?<br />
     <input type="submit" value="예" onclick="location.href='PaymentForm.jsp'">
     <input type="button" value="아니오" onclick="location.href='BookingCheckForm.jsp'">
   </form>
</body>
</html>