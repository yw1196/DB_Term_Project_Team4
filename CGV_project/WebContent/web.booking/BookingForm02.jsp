<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
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
	
	String cinema = request.getParameter("cinema");
	
	
	ArrayList<String> screen = new ArrayList<String>();
	
	try {

		conn = a.getConnection();
		//DB 쿼리실행
		//예매율 순위 에트리뷰트를 집어넣고 그걸 정해서 n순위 까지만 메인 사이트에 보이게끔 데이터베이스 조작
		String sql = "select s.movie_id, m.title, s.cinema_name, s.id from screen as s join movie as m on s.movie_id = m.id where cinema_name = ?;";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cinema);
		rs = pstmt.executeQuery(); // 실제 쿼리 실행
		
		while(rs.next()){
			screen.add(rs.getString("title"));
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
	<form action="BookingForm03.jsp" method="post">
		<div>영화관<input type="text" name="cinema" readonly="readonly" value="<%=cinema%>"></div>
		<div>영화(상영관 자동결정)<select name="movie">
			<%
			while(!screen.isEmpty()){
			%><option><%=screen.get(0)%>
				
			<%
			screen.remove(0);
			}		
			%>
		</select></div>
		
		
  	 	<div><input type="submit" value="다음"><input type="button" value="취소" onclick="location.href='../web.main/MainForm.jsp'"></div>
	</form>
</body>
</html>