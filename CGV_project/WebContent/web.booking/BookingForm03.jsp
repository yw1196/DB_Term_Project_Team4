<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="user.LogonDBBean"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%
	request.setCharacterEncoding("euc-kr");
%>



<%
	//세션확인
	HttpSession hs = request.getSession();

	//logonDBBean
	LogonDBBean logon = LogonDBBean.getInstance();
	LogonDBBean a = new LogonDBBean();

	//DB기본세팅
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	//불러온값
	String cinema = request.getParameter("cinema");
	String movie = request.getParameter("movie");

	ArrayList<String> screen = new ArrayList<String>();

	//날짜 세팅
	SimpleDateFormat form = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
	Date currentTime = new Date();
	Calendar c = Calendar.getInstance();
	c.setTime(currentTime);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="BookingForm04.jsp" method="post">
		<div>
			영화관<input type="text" name="cinema" readonly="readonly"
				value="<%=cinema%>">
		</div>
		<div>
			영화(상영관)<input type="text" name="movie" readonly="readonly"
				value="<%=movie%>">
		</div>
		<div>
			인원 : <input type="text" name="seat_num"> (예약된 좌석수 / 총좌석수)
		</div>
		<div>
			날짜<select name="date">
				<%
					for (int i = 0; i < 7; i++) {
						c.add(c.DATE, 1);
						String mTime = form.format(c.getTime());
				%>
				<option><%=mTime%>
					<%
						}
					%>
				
			</select>
		</div>
		<div>
			시간<select name="time"><option>140000
				<option>160000
				<option>180000
				<option>200000</select>
		</div>
		<div>
			<input type="radio" name="group" value="nowP">바로결제<input
				type="radio" name="group" value="placeP">현장결제
		</div>
		<div>
			<input type="submit" value="다음"><input type="button"
				value="취소" onclick="location.href='../web.main/MainForm.jsp'">
		</div>
	</form>

</body>
</html>