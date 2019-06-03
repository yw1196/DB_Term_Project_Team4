<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="user.LogonDBBean"%>

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
	
	try {

		conn = a.getConnection();
		//DB 쿼리실행
		//예매율 순위 에트리뷰트를 집어넣고 그걸 정해서 n순위 까지만 메인 사이트에 보이게끔 데이터베이스 조작
		String sql = "select * from movie;";			
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery(); // 실제 쿼리 실행
		int i = 0;

		while(rs.next()){
			
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
	<form action="BookingForm02.jsp" method="post">

		<div>영화<select><option>1<option>2<option>3<option>4</select></div>
		<div>상영관 : ㅁㅁ</div>
		<div style="display:inline-block;"></div>
		<div>상영날짜<input type="password" name="PW" maxlength="12"></div>
		<div>상영시간<select><option>시간1<option>시간2<option>시간3<option>시간4</select></div>
		
		
		
		<input type="radio" name="group" checked="">인터넷결제
	    <input type="radio" name="group">현장결제
	    <div><input type="submit" value="선택완료"></div>
	</form>

</body>
</html>