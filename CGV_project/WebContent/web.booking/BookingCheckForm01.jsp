<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>결제 진행</title>
</head>
<body>
   <div style="cursor:pointer;width:100px;height:100px;border:1px solid;"  onclick="location.href='../web.main/MainForm.jsp'">
      <img alt="" src="../home.jpg" style="width:100px; height:100px;">
   </div>
   
   <form method="post" action="PaymentPro.jsp">
   <input type="radio" name="check" value="card" checked="checked">카드
   <input type="radio" name="check" value="account">계좌이체
   <input type="radio" name="check" value="kakao">카카오페이
   <br/>
   
   잔여포인트 
   포인트 사용 : <input type="text" type="number" name="point" maxlength="20"><br/>
   
   결제 금액 :
   
   <input type="submit" value="결제">
   <input type="button"value="취소" onclick="location.href='../web.main/MainForm.jsp'">
   
   </form>
</body>
</html>