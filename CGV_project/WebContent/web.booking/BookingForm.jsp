<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="user.LogonDBBean"%>

<%
	request.setCharacterEncoding("euc-kr");
%>	
<%
	HttpSession hs = request.getSession();
	LogonDBBean logon = LogonDBBean.getInstance();
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	LogonDBBean a = new LogonDBBean();
	
	try {

		conn = a.getConnection();
		//DB ��������
		//������ ���� ��Ʈ����Ʈ�� ����ְ� �װ� ���ؼ� n���� ������ ���� ����Ʈ�� ���̰Բ� �����ͺ��̽� ����
		String sql = "select * from movie;";			
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery(); // ���� ���� ����
		int i = 0;

		while(rs.next()){
			
		}
		rs.close();
		
	} catch (Exception e) {
		e.printStackTrace();

	} finally {
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException sqle) {
			}
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException sqle) {
			}
	}
	



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="BookingForm02.jsp" method="post">

		<div>��ȭ<select><option>1<option>2<option>3<option>4</select></div>
		<div>�󿵰� : ����</div>
		<div style="display:inline-block;"></div>
		<div>�󿵳�¥<input type="password" name="PW" maxlength="12"></div>
		<div>�󿵽ð�<select><option>�ð�1<option>�ð�2<option>�ð�3<option>�ð�4</select></div>
		
		
		
		<input type="radio" name="group" checked="">���ͳݰ���
	    <input type="radio" name="group">�������
	    <div><input type="submit" value="���ÿϷ�"></div>
	</form>

</body>
</html>