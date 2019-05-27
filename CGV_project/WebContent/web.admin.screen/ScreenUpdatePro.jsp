
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="user.LogonDBBean"%>

<%
	request.setCharacterEncoding("euc-kr");
%>




<%
	//�Ķ���� �� �о���̴� �κ�
	String id = request.getParameter("id");
	String seat_totalnum = request.getParameter("seat_totalnum");
	String seat_bookednum = request.getParameter("seat_bookednum");
	String movie_id = request.getParameter("movie_id");
	String cinema_name = request.getParameter("cinema_name");
	//DB�� ����
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";

	ResultSet rs = null;

	try {
		LogonDBBean a = new LogonDBBean();
		conn = a.getConnection();
		//DB ��������
		String sql = "select * from screen where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery(); // ���� ���� ����

		if (rs.next()) {
			String rId = rs.getString("id");
			String rCinema_name = rs.getString("cinema_name");
			pstmt.close();
			if (id.equals(rId)&&cinema_name.equals(rCinema_name)) {
				sql = "update screen set seat_totalnum = ?, seat_bookednum = ?, movie_id = ? where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, seat_totalnum);
				pstmt.setString(2, seat_bookednum);
				pstmt.setString(3, movie_id);
				pstmt.setString(4, id);
				pstmt.executeUpdate();
				str = "�󿵰� ���� ������ �Ϸ�Ǿ����ϴ�.";
			} else {
				str = "�󿵰� �̸��� �ùٸ��� �ʽ��ϴ�.";
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
		str = "�󿵰����� ���� ����";
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