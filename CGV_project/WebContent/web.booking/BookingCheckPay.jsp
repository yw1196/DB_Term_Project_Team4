<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="org.apache.catalina.util.ToStringUtil"%>

<%@ page import="java.sql.*"%>
<%@ page import="user.LogonDBBean"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@page import="java.lang.Integer"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	//logonDBBean
	LogonDBBean logon = LogonDBBean.getInstance();
	LogonDBBean a = new LogonDBBean();

	//DB세팅
	HttpSession hs = request.getSession();
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	//불러온 값
	String cinema = request.getParameter("cinema");
	String movie = request.getParameter("movie");
	String pay = request.getParameter("pay");
	String date = request.getParameter("date");
	String time = request.getParameter("time");
	String seat_num = request.getParameter("seat_num");
	String screen = null;

	
	//가격쓰
	int num = (Integer) Integer.parseInt(seat_num);
	int price = 10000 * num;

	//날짜
	SimpleDateFormat form = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
	Date currentTime = new Date();
	Calendar c = Calendar.getInstance();

	c.setTime(currentTime);
	//날짜	

	//////////
	try {

		conn = a.getConnection();
		//DB 쿼리실행
		String sql = "select s.id, s.movie_id, m.title, m.StartDate from screen as s join movie as m on s.movie_id = m.id where m.title = ? and cinema_name = ?;";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, movie);
		pstmt.setString(2, cinema);
		rs = pstmt.executeQuery(); // 실제 쿼리 실행
		rs.next();
		screen = rs.getString("id");
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

	<form method="post" action="BookingCheckPro.jsp">

		<div>
			영화관 :<input type="text" name="cinema" readonly="readonly"
				value="<%=cinema%>">
		</div>
		<div>
			상영관: <input type="text" name="screen" readonly="readonly"
				value="<%=screen%>">
		</div>
		<div>
			영화:<input type="text" name="movie" readonly="readonly"
				value="<%=movie%>">
		</div>

		<div>
			날짜: <input type="text" name="date" readonly="readonly"
				value="<%=date%>">
		</div>
		<div>
			시간 :<input type="text" name="time" readonly="readonly"
				value="<%=time%>">
		</div>


		<div>
			인원 수 : <input type="text" name="seat_num" readonly="readonly"
				value="<%=seat_num%>">
		</div>

		

			<input type="radio" name="pay" value="card" checked="checked">카드
			<input type="radio" name="pay" value="account">계좌이체 <input
				type="radio" name="pay" value="kakao">카카오페이 <br />
				잔여포인트
			포인트 사용 : <input type="text" name="point" maxlength="20" value="0"><br />
			(포인트를 사용하여 결제하면 취소해도 포인트 환불 안됩니다^^ 요즘 어느집이 포인트도 환불해주나요ㅎㅎㅎㅎ)
			<div>결제 금액 : <%=price%></div>

		>>> 결제할겁니까?? <br /> <input type="submit" value="결제"> <input type="button"
				value="취소" onclick="location.href='../web.main/MainForm.jsp'">
	</form>



</body>
</html>