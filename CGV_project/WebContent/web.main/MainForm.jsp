<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*"%>
<%@ page import="user.Movie"%>
<%@ page import="user.LogonDBBean"%>
<%@ page import="java.util.ArrayList"%>


<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	LogonDBBean logon = LogonDBBean.getInstance();
	LogonDBBean a = new LogonDBBean();

	HttpSession hs = request.getSession();
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	Movie movie = null;
	ArrayList<Movie> movieList = new ArrayList<Movie>();

	String id = (String) hs.getAttribute("id");
	String point = null;

	try {

		conn = a.getConnection();
		//DB ��������
		//������ ���� ��Ʈ����Ʈ�� ����ְ� �װ� ���ؼ� n���� ������ ���� ����Ʈ�� ���̰Բ� �����ͺ��̽� ����
		String sql = "select* from movie where startdate < now();";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery(); // ���� ���� ����

		while (rs.next()) {
			movie = new Movie();

			movie.setActor(rs.getString("Actors"));
			movie.setID("0");

			movie.setDirector(rs.getString("Director"));
			movie.setPlot(rs.getString("Plot"));
			movie.setRunning_Time(rs.getString("Running_Time"));
			movie.setStartDate(rs.getString("StartDate"));
			movie.setTitle(rs.getString("Title"));
			movie.setRating(rs.getString("Rating"));
			movieList.add(movie);
	
		}
		rs.close();
		
		pstmt.close();
		sql = "select *from customer where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		rs.next();
		point = rs.getString("pointV");
		
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
<link rel="stylesheet" href="MainForm.css">

<meta charset="EUC-KR">
<title>���λ���Ʈ</title>
</head>
<body>
	<div
		style="cursor: pointer; width: 100px; height: 100px; border: 1px solid;"
		onclick="location.href='MainForm.jsp'">
		<img alt="" src="../home.jpg" style="width: 100px; height: 100px;">
	</div>
	<div class="top_bar" <%if (hs.getAttribute("id") != null) {%>
		style="display: none" <%}%>>
		<div class="login right">
			<input type=submit value=�α���
				onclick="location.href='../web.login/LoginForm.jsp'">
		</div>

	</div>


	<div <%if (hs.getAttribute("id") == null) {%> style="display: none"
		<%}%>>
		<div class="topbar">
			<div class="mypage" style="float: right">
				<!-- MyPage, �������� ������ Ȯ���� �� ���� -->
				<input type="button" value="mypage"
					onclick="location.href='../web.mypage/MyPageForm.jsp'">
			</div>

			<div class="admin" style="float: right">
				<!-- �����ڸ�� ��ư, AdminV �Ӽ��� true��� �̹�ư�� ���̰� ���� -->
				<input type="submit" value="admin"
					onclick="location.href='../web.admin/Admin.jsp'"
					,<%if (logon.AdminCheck(id) == 0) {%> style="display: none" <%}%>>

			</div>
		</div>
		<div class="main">

			<div class="info">
				<div>
					<!-- ��������Ʈ -->
					<%=point %>����Ʈ
				</div>
				<div>
					<!-- 'id'�� �ȳ��ϼ��� -->

					<%=id%>�� �������

				</div>
				<div>
					<!-- �α׾ƿ�, �������� -->
					<div style="float: left">
						<form method="post" action="../web.login/Logout.jsp">
							<input type="submit" value="�α׾ƿ�">
						</form>
					</div>
					<div style="float: left">
						<form method="post" action="../web.update/UpdateForm01.jsp">
							<input type="submit" value="��������">
						</form>
					</div>
					<div style="float: left">
						<form method="post" action="../web.delete/DeleteForm.jsp">
							<input type="submit" value="Ż��">
						</form>
					</div>
				</div>

			</div>
			<div>
				<!-- �� �������� ���� ��ɵ� -->
			</div>
		</div>

		<br> <br> <br> ��ȭ ���ż��� top3
		<table>
			<tr>
				<td>����</td>
				<td>����</td>
				<td>�����</td>
				<td>�ٰŸ�</td>
				<td>���</td>
				<td>������</td>
				<td>�󿵽ð�</td>
				<td>������(%)</td>


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
		<input type="button" value="��ȭ�����Ϸ�����"
			onclick="location.href='../web.booking/BookingForm01.jsp'"> <br>

		<br> <br>



	</div>

</body>
</html>