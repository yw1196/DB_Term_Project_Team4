<%@page import="user.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
 <%@ page import= "java.util.ArrayList" %>   
    <% 
    LogonDBBean logon = LogonDBBean.getInstance();
    Connection conn = logon.getConnection();
    
    ArrayList<String> cinema = new ArrayList<String>(); 
    PreparedStatement pstmt = null;
    
    String sql = "SELECT * FROM cinema";
	pstmt = conn.prepareStatement(sql);
	ResultSet rs1 = pstmt.executeQuery();
	
	rs1.last();
	int rowCount = rs1.getRow();
	
	rs1.first(); 
	for(int i = 0; i < rowCount; i++){
	cinema.add(rs1.getString("NameV"));
	System.out.println(i);
	System.out.println(rowCount);
	System.out.println(cinema.get(i));
	rs1.next();
	}
	
    
    
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>bookingPage</title>
</head>
	
<body>
	<form method="post" action="DeletePro.jsp">
	
      ��ȭ�� : <select name="cinema">
      <% for(int i=0; i < rowCount; i++) { %>
    <option value=""><%= cinema.get(i) %></option>
    <% } %>
	</select><br />
	
   	�󿵳�¥: <select name="cinema">
      <% for(int i=0; i < rowCount; i++) { %>
    <option value=""><%= cinema.get(i) %></option>
    <% } %>
	</select><br />
   	
   	
   �󿵰�  : <input type="password" name="PW" maxlength="12"><br />
   �󿵽ð�	 : <input type="password" name="PW" maxlength="12"><br />
   	�¼� : <input type="password" name="PW" maxlength="12"><br />
     <input type="submit" value="���ͳ� ����" onclick="location.href='PaymentForm.jsp'">
     <input type="button" value="���� ����" onclick="location.href='LoginPro.jsp'">
	</form>
</body>
</html>