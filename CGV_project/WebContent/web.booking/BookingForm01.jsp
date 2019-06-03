<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="user.LogonDBBean"%>
<%@ page import="java.util.ArrayList"%>

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
	
	ArrayList<String> cinema = new ArrayList<String>();
	
	try {

		conn = a.getConnection();
		//DB ��������
		//������ ���� ��Ʈ����Ʈ�� ����ְ� �װ� ���ؼ� n���� ������ ���� ����Ʈ�� ���̰Բ� �����ͺ��̽� ����
		String sql = "select * from cinema;";			
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery(); // ���� ���� ����
		
		while(rs.next()){
			cinema.add(rs.getString("nameV"));
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
		<div>��ȭ��<select name="cinema">
			<%
			while(!cinema.isEmpty()){
			%><option><%=cinema.get(0)%>
				
			<%
			cinema.remove(0);
			}		
			%>
		</select></div>
  	 	<div><input type="submit" value="����"><input type="button" value="���" onclick="location.href='../web.main/MainForm.jsp'"></div>
	</form>

</body>
</html>