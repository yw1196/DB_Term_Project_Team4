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
	//����Ȯ��
	HttpSession hs = request.getSession();

	//logonDBBean
	LogonDBBean logon = LogonDBBean.getInstance();
	LogonDBBean a = new LogonDBBean();

	//DB�⺻����
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	//�ҷ��°�
	String cinema = request.getParameter("cinema");
	String movie = request.getParameter("movie");

	ArrayList<String> screen = new ArrayList<String>();

	//��¥ ����
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
			��ȭ��<input type="text" name="cinema" readonly="readonly"
				value="<%=cinema%>">
		</div>
		<div>
			��ȭ(�󿵰�)<input type="text" name="movie" readonly="readonly"
				value="<%=movie%>">
		</div>
		<div>
			�ο� : <input type="text" name="seat_num"> (����� �¼��� / ���¼���)
		</div>
		<div>
			��¥<select name="date">
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
			�ð�<select name="time"><option>140000
				<option>160000
				<option>180000
				<option>200000</select>
		</div>
		<div>
			<input type="radio" name="group" value="nowP">�ٷΰ���<input
				type="radio" name="group" value="placeP">�������
		</div>
		<div>
			<input type="submit" value="����"><input type="button"
				value="���" onclick="location.href='../web.main/MainForm.jsp'">
		</div>
	</form>

</body>
</html>