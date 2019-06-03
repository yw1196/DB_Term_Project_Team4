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

	//DB����
	HttpSession hs = request.getSession();
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	//�ҷ��� ��
	String cinema = request.getParameter("cinema");
	String movie = request.getParameter("movie");
	String pay = request.getParameter("pay");
	String date = request.getParameter("date");
	String time = request.getParameter("time");
	String seat_num = request.getParameter("seat_num");
	String screen = null;

	
	//���ݾ�
	int num = (Integer) Integer.parseInt(seat_num);
	int price = 10000 * num;

	//��¥
	SimpleDateFormat form = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
	Date currentTime = new Date();
	Calendar c = Calendar.getInstance();

	c.setTime(currentTime);
	//��¥	

	//////////
	try {

		conn = a.getConnection();
		//DB ��������
		String sql = "select s.id, s.movie_id, m.title, m.StartDate from screen as s join movie as m on s.movie_id = m.id where m.title = ? and cinema_name = ?;";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, movie);
		pstmt.setString(2, cinema);
		rs = pstmt.executeQuery(); // ���� ���� ����
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
			��ȭ�� :<input type="text" name="cinema" readonly="readonly"
				value="<%=cinema%>">
		</div>
		<div>
			�󿵰�: <input type="text" name="screen" readonly="readonly"
				value="<%=screen%>">
		</div>
		<div>
			��ȭ:<input type="text" name="movie" readonly="readonly"
				value="<%=movie%>">
		</div>

		<div>
			��¥: <input type="text" name="date" readonly="readonly"
				value="<%=date%>">
		</div>
		<div>
			�ð� :<input type="text" name="time" readonly="readonly"
				value="<%=time%>">
		</div>


		<div>
			�ο� �� : <input type="text" name="seat_num" readonly="readonly"
				value="<%=seat_num%>">
		</div>

		

			<input type="radio" name="pay" value="card" checked="checked">ī��
			<input type="radio" name="pay" value="account">������ü <input
				type="radio" name="pay" value="kakao">īī������ <br />
				�ܿ�����Ʈ
			����Ʈ ��� : <input type="text" name="point" maxlength="20" value="0"><br />
			(����Ʈ�� ����Ͽ� �����ϸ� ����ص� ����Ʈ ȯ�� �ȵ˴ϴ�^^ ���� ������� ����Ʈ�� ȯ�����ֳ��䤾������)
			<div>���� �ݾ� : <%=price%></div>

		>>> �����Ұ̴ϱ�?? <br /> <input type="submit" value="����"> <input type="button"
				value="���" onclick="location.href='../web.main/MainForm.jsp'">
	</form>



</body>
</html>