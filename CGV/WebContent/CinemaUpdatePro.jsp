
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("euc-kr");
%>


<%
	//�Ķ���� �� �о���̴� �κ�
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String callnum = request.getParameter("callnum");
	String screen_num = request.getParameter("screen_num");
	//DB�� ����
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";

	ResultSet rs = null;

	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/cgv?useSSL=false";
		String dbId = "root";
		String dbPass = "dyddns";

		Class.forName("com.mysql.jdbc.Driver"); // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass); // DiverManager ��ü�κ��� Connection ��ü�� ���´�.

		//DB ��������
		String sql = "select * from cinema where nameV=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		rs = pstmt.executeQuery(); // ���� ���� ����

		if (rs.next()) {
			String rName = rs.getString("nameV");
			pstmt.close();
			if (name.equals(rName)) {
				sql = "update cinema set address = ?, callnum = ?, screen_num = ? where nameV = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, address);
				pstmt.setString(2, callnum);
				pstmt.setString(3, screen_num);
				pstmt.setString(4, name);
				pstmt.executeUpdate();
				str = "��ȭ�� ���� ������ �Ϸ�Ǿ����ϴ�.";
			} else {
				str = "��ȭ�� �̸��� �ùٸ��� �ʽ��ϴ�.";
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
		str = "��ȭ������ ���� ����";
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
	<%=str%>
	<form action="AdminForm.jsp">
		<input type="submit" value="Ȯ��">
	</form>
</body>
</html>