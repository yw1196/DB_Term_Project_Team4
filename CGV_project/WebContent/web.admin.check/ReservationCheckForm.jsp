<%@page import="user.Reservation_check"%>
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

	Reservation_check rc = null;
	ArrayList<Reservation_check> rclist= new ArrayList<Reservation_check>();

	String id = (String) hs.getAttribute("id");

	try {

		conn = a.getConnection();
		//DB 쿼리실행
		//예매율 순위 에트리뷰트를 집어넣고 그걸 정해서 n순위 까지만 메인 사이트에 보이게끔 데이터베이스 조작
		String sql = "select t.checkv, t.screen_id, t.seat_num, t.customer_id, t.showing_date, t.showing_time, s.cinema_name, m.title from ticket t				join screen s	on s.id = t.screen_id		join movie m		on s.movie_id = m.id		;";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery(); // 실제 쿼리 실행
		
		while (rs.next()) {
			rc = new Reservation_check();

			rc.setCheckv(rs.getString("checkv"));
			rc.setCinema_name(rs.getString("cinema_name"));
			rc.setCustomer(rs.getString("customer_id"));
			rc.setScreen_id(rs.getString("screen_id"));
			rc.setSeat_num(rs.getString("seat_num"));
			rc.setShowing_date(rs.getString("showing_date"));
			rc.setShowing_time(rs.getString("showing_time"));
			rc.setTitle(rs.getString("title"));
			
			rclist.add(rc);
			
		}
		rs.close();
		
		pstmt.close();
		
		
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
	<div style="cursor:pointer;width:100px;height:100px;border:1px solid;"  onclick="location.href='../web.main/MainForm.jsp'">
		<img alt="" src="../home.jpg" style="width:100px; height:100px;">
	</div>
	
	결제취소는 자신의 아이디로 로그인후 mypage가서 결제취소누르시면되요~~~
	제가 안해드려용 알아서 하세요~
	
	<table>
		<tr>
			<td>결제유무</td>
			<td>상영관</td>
			<td>인원</td>
			<td>손놈아이디</td>
			<td>상영날짜</td>
			<td>상영시간</td>
			<td>영화관이름</td>
			<td>영화이름</td>
			<td>버튼</td>
		</tr>
		<%
				while (true) {
			%>
		
			<tr>
				<%
					if (rclist.isEmpty()) {
							break;
						}
				%>
				<form action="addReservation.jsp" method="post">
					<td><input type="text" name="a" value="<%=rclist.get(0).getCheckv()%>" readonly="readonly"></td>
					<td><input type="text" name="b" value="<%=rclist.get(0).getScreen_id()%>" readonly="readonly"></td>
					<td><input type="text" name="c" value="<%=rclist.get(0).getSeat_num()%>" readonly="readonly"></td>
					<td><input type="text" name="d" value="<%=rclist.get(0).getCustomer()%>" readonly="readonly"></td>
					<td><input type="text" name="e" value="<%=rclist.get(0).getShowing_date()%>" readonly="readonly"></td>
					<td><input type="text" name="f" value="<%=rclist.get(0).getShowing_time()%>" readonly="readonly"></td>
					<td><input type="text" name="g" value="<%=rclist.get(0).getCinema_name()%>" readonly="readonly"></td>
					<td><input type="text" name="h" value="<%=rclist.get(0).getTitle()%>" readonly="readonly"></td>
					<td><%if((rclist.get(0).getCheckv()).equals("0")){ %><input type="text" placeholder="point(1000이상만써라)" name="point"><input type="submit" value="결제"><%} %>
				</form>
						
				

				<%
					rclist.remove(0);
				%>

			</tr>
			<br>
			<%
				}
			%>
		
		
	</table>
	
</body>
</html>