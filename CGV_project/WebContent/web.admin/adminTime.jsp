<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="user.LogonDBBean"%>
<%@ page import="user.Screen"%>

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
	ArrayList<String> screenList = new ArrayList<String>();
	Screen screen = null;

	try {

		conn = a.getConnection();
		//DB 孽府角青
		String sql = "select * from screen;";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery(); // 角力 孽府 角青

		while (rs.next()) {
			screenList.add(rs.getString("id"));
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
<select>
<%while(true) { %>
		
		<option><%= screenList.get(0) %>
				<%
				screenList.remove(0);
				if(screenList.isEmpty()){
					break;
				}
				%>
		
		<% }%>
		</select>
</body>
</html>