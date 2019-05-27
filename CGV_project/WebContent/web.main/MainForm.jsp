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
	HttpSession hs = request.getSession();
	LogonDBBean logon = LogonDBBean.getInstance();
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	LogonDBBean a = new LogonDBBean();
	
	
	Movie movie = null;
	ArrayList<Movie> movieList = new ArrayList<Movie>();
	

	String id = (String) hs.getAttribute("id");
	
	
	try {

		conn = a.getConnection();
		//DB 쿼리실행
		//예매율 순위 에트리뷰트를 집어넣고 그걸 정해서 n순위 까지만 메인 사이트에 보이게끔 데이터베이스 조작
		String sql = "select * from movie;";			
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery(); // 실제 쿼리 실행
		int i = 0;

		while(rs.next()){
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
			i++;
			if(i == 3){ break; }
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
<link rel="stylesheet" href="MainForm.css">

<meta charset="EUC-KR">
<title>메인사이트</title>
</head>
<body>
	<div style="cursor:pointer;width:100px;height:100px;border:1px solid;"  onclick="location.href='MainForm.jsp'">
		<img alt="" src="../home.jpg" style="width:100px; height:100px;">
	</div>
	<div class="top_bar" <%if (hs.getAttribute("id") != null) {%>
		style="display: none" <%}%>>
		<div class="login right">
			<input type=submit value=로그인
				onclick="location.href='../web.login/LoginForm.jsp'">
		</div>

	</div>


	<div <%if (hs.getAttribute("id") == null) {%> style="display: none"
		<%}%>>
		<div class="topbar">
			<div class="mypage" style="float: right">
				<!-- MyPage, 여러가지 정보를 확인할 수 있음 -->
				<input type="button" value="mypage" onclick="location.href='../web.mypage/MyPageForm.jsp'">
			</div>

			<div class="admin" style="float: right">
				<!-- 관리자모드 버튼, AdminV 속성이 true라면 이버튼이 보이게 설정 -->
					<input type="submit" value="admin" onclick="location.href='../web.admin/Admin.jsp'"
						,<%if (logon.AdminCheck(id) == 0) {%> style="display: none"
						<%}%>>

			</div>
		</div>
		<div class="main">

			<div class="info">
				<div>
					<!-- 적립포인트 -->
					? 포인트
				</div>
				<div>
					<!-- 'id'님 안녕하세요 -->

					<%=id%>님 어서오세요

				</div>
				<div>
					<!-- 로그아웃, 정보수정 -->
					<div style="float: left">
						<form method="post" action="../web.login/Logout.jsp">
							<input type="submit" value="로그아웃">
						</form>
					</div>
					<div style="float: left">
						<form method="post" action="../web.update/UpdateForm01.jsp">
							<input type="submit" value="정보수정">
						</form>
					</div>
					<div style="float: left">
						<form method="post" action="../web.delete/DeleteForm.jsp">
							<input type="submit" value="탈퇴">
						</form>
					</div>
				</div>

			</div>
			<div>
				<!-- 본 페이지의 여러 기능들 -->
			</div>
		</div>
		
		<br><br><br>
		영화 예매순위 top3
		<table>
		<tr>
			<td>제목</td>
			<td>감독</td>
			<td>출얀진</td>
			<td>줄거리</td>
			<td>등급</td>
			<td>개봉일</td>
			<td>상영시간</td>
			<td>예매율(%)</td>
			

		</tr>
		<%while(true) { %>
		<tr>
				<%
				if(movieList.isEmpty()){
					break;
				}
				%>
				<td><%= movieList.get(0).getTitle() %></td>
				<td><%= movieList.get(0).getDirector() %></td>
				<td><%= movieList.get(0).getActor() %></td>
				<td><%= movieList.get(0).getPlot() %></td>
				<td><%= movieList.get(0).getRating() %></td>
				<td><%= movieList.get(0).getStartDate() %></td>
				<td><%= movieList.get(0).getRunning_Time() %></td>
				
				<%
				movieList.remove(0);
				
				%>
			
		</tr><br>
		<% }%>
		
	</table>
	<input type="button" value="영화예매하러가기" onclick="location.href='../web.booking/BookingForm.jsp'">
	<br><br><br>
		
		
		
	</div>

</body>
</html>
