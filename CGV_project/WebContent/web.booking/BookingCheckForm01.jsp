<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ����</title>
</head>
<body>
   <div style="cursor:pointer;width:100px;height:100px;border:1px solid;"  onclick="location.href='../web.main/MainForm.jsp'">
      <img alt="" src="../home.jpg" style="width:100px; height:100px;">
   </div>
   
   <form method="post" action="PaymentPro.jsp">
   <input type="radio" name="check" value="card" checked="checked">ī��
   <input type="radio" name="check" value="account">������ü
   <input type="radio" name="check" value="kakao">īī������
   <br/>
   
   �ܿ�����Ʈ 
   ����Ʈ ��� : <input type="text" type="number" name="point" maxlength="20"><br/>
   
   ���� �ݾ� :
   
   <input type="submit" value="����">
   <input type="button"value="���" onclick="location.href='../web.main/MainForm.jsp'">
   
   </form>
</body>
</html>