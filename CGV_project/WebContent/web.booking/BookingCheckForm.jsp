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
<title>���� �´��� Ȯ�� ������</title>
</head>
   
<body>

   <div style="cursor:pointer;width:100px;height:100px;border:1px solid;"  onclick="location.href='../web.main/MainForm.jsp'">
      <img alt="" src="../home.jpg" style="width:100px; height:100px;">
   </div>
   
   <form method="post" action="BookingCheckPro.jsp">
   
       ��ȭ�� : <br />
   
   ��ȭ: <br />
   
      �󿵰�  : <br />
  
       ��¥: <br />
      
      �ð� :<br />
     
      ���� ���� : <br />
      
      �¼� : <br />
    
    ������ �½��ϱ�?<br />
     <input type="submit" value="��" onclick="location.href='PaymentForm.jsp'">
     <input type="button" value="�ƴϿ�" onclick="location.href='BookingCheckForm.jsp'">
   </form>
</body>
</html>