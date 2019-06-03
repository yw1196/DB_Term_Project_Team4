<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="user.LogonDBBean"%>
<%@ page import="user.Movie"%>
<%@page import="java.util.ArrayList" %>

<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	LogonDBBean a = new LogonDBBean();
	
	ArrayList<Movie> movieList = new ArrayList<Movie>();
	Movie movie = null;
	
	try {

		conn = a.getConnection();
		//DB ��������
		String sql = "select * from movie;";			
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery(); // ���� ���� ����

		while(rs.next()){
			movie = new Movie();

			movie.setActor(rs.getString("Actors"));
			movie.setDirector(rs.getString("Director"));
			movie.setID(rs.getString("ID"));
			movie.setPlot(rs.getString("Plot"));
			movie.setRunning_Time(rs.getString("Running_Time"));
			movie.setStartDate(rs.getString("StartDate"));
			movie.setTitle(rs.getString("Title"));
			movie.setRating(rs.getString("Rating"));
			movieList.add(movie);
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
			<td>����</td>
			<td>����</td>
			<td>�⿬��</td>
			<td>�ٰŸ�</td>
			<td>���</td>
			<td>������</td>
			<td>�󿵽ð�</td>
		</tr>
		<%
				while (true) {
			%>
			<tr>
				<%
					if (movieList.isEmpty()) {
							break;
						}
				%>
				<td><%=movieList.get(0).getTitle()%></td>
				<td><%=movieList.get(0).getDirector()%></td>
				<td><%=movieList.get(0).getActor()%></td>
				<td><%=movieList.get(0).getPlot()%></td>
				<td><%=movieList.get(0).getRating()%></td>
				<td><%=movieList.get(0).getStartDate()%></td>
				<td><%=movieList.get(0).getRunning_Time()%></td>

				<%
					movieList.remove(0);
				%>

			</tr>
			<br>
			<%
				}
			%>
		
		
	</table>
	
</body>
</html>