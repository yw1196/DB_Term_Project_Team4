<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="user.LogonDBBean"%>
<%@ page import="user.User"%>
<%@page import="java.util.ArrayList" %>

<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	LogonDBBean a = new LogonDBBean();

	ArrayList<User> userList = new ArrayList<User>();
	User user = null;
	
	try {

		conn = a.getConnection();
		//DB ��������
		String sql = "select * from customer;";			
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery(); // ���� ���� ����

		while(rs.next()){
			user = new User();
			user.setId(rs.getString("ID"));
			user.setPw(rs.getString("PW"));
			user.setName(rs.getString("NameV"));
			user.setBirth(rs.getString("Birth").toString());
			user.setAddress(rs.getString("Address"));
			user.setNumber(rs.getString("PhoneNumber").toString());
			user.setAdmin(rs.getString("AdminV").toString());
			user.setPoint(rs.getString("PointV").toString());
			userList.add(user);
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
	<div
		style="cursor: pointer; width: 100px; height: 100px; border: 1px solid;"
		onclick="location.href='../web.main/MainForm.jsp'">
		<img alt="" src="../home.jpg" style="width: 100px; height: 100px;">
	</div>
	
	<table>
		<tr>
			<td>���̵�</td>
			<td>��й�ȣ</td>
			<td>�̸�</td>
			<td>�ּ�</td>
			<td>��ȣ</td>
			<td>����</td>
			<td>����Ʈ</td>
			<td>�����ڱ���</td>
			

		</tr>
		<%while(true) { %>
		<tr>
			
				<td><%= userList.get(0).getId() %></td>
				<td><%= userList.get(0).getPw() %></td>
				<td><%= userList.get(0).getName() %></td>
				<td><%= userList.get(0).getAddress() %></td>
				<td><%= userList.get(0).getNumber() %></td>
				<td><%= userList.get(0).getBirth() %></td>
				<td><%= userList.get(0).getPoint() %></td>
				<td><%= userList.get(0).getAdmin() %></td>
				
				<%
				userList.remove(0);
				if(userList.isEmpty()){
					break;
				}
				%>
			
		</tr><br>
		<% }%>
		
	</table>
	
</body>
</html>