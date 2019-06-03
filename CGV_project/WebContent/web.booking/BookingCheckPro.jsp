<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="user.LogonDBBean"%>

<%
	request.setCharacterEncoding("euc-kr");
%>

<%
	
	//logonDBBean
	LogonDBBean logon = LogonDBBean.getInstance();
	LogonDBBean a = new LogonDBBean();

	//DB 세팅
	HttpSession hs = request.getSession();
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	//불러온값
	String cinema = request.getParameter("cinema");
	String movie = request.getParameter("movie");
	String pay = request.getParameter("pay");
	String date = request.getParameter("date");
	String time = request.getParameter("time");
	String screen = request.getParameter("screen");
	String seat_num = request.getParameter("seat_num");
	String customor = (String) hs.getAttribute("id");
	String point = request.getParameter("point");
	int ipoint = 0;
	if(point != null){
		ipoint = Integer.parseInt(point);	
			
	}
	int point1 = 100;	
	
	int check = 0;
	int pgross = 10000;
	int test = Integer.parseInt(seat_num);
	String str_seat_num = Integer.toString(test);
	int groo = (pgross*test);
	String gross = Integer.toString(groo);
	if(point != null){
		groo = (pgross*test)-Integer.parseInt(point);
		if(ipoint >= 1000){
			groo = groo-ipoint;
		}
		gross = Integer.toString(groo);
	}
	
	
	
	int ppoint = point1 * test;
	String pppoint = Integer.toString(ppoint);
%>

<!--결제칸에 올리기 -->
<%
	try {
		conn = a.getConnection();
		
		
		
		String sql = "select *from screen where id = ?;";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, screen);
		rs = pstmt.executeQuery();
		int seatnum = 0;
		int seatcheck = 0;
		rs.next();
		seatnum = Integer.parseInt(rs.getString("Seat_TotalNum"));
		seatcheck = Integer.parseInt(rs.getString("Seat_BookedNum")) + test;
		rs.close();
		pstmt.close();
		if(seatnum < seatcheck){
			%>
			<script>
				alert("자리가 많지않네 저리로 가라.");
				history.go(-2);
			</script>
			<%
			return;
		}
		
		
		
		
		

		sql = "insert into ticket values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, screen);	
		pstmt.setString(2, seat_num);
		pstmt.setString(3, customor);
		pstmt.setString(4, cinema);
		pstmt.setString(5, date);
		pstmt.setString(6, time);
		pstmt.setString(7, pay);
		pstmt.setString(8, gross);
		if(pay.equals("placeP")){
			pstmt.setString(10, "0");
		}else{
			pstmt.setString(10,"1");
		}
		if(point == null){
			pstmt.setString(9, "0");
		}else{
			pstmt.setString(9, point);
			
		}
		pstmt.executeUpdate();
		pstmt.close();
		check = 1;
		sql = "update screen set Seat_BookedNum = Seat_BookedNum + ? where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, str_seat_num);
		pstmt.setString(2, screen);
		pstmt.executeUpdate();
		pstmt.close();
		
		
		if(ipoint>=1000){
			sql = "update customer set pointv = pointv - ? where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, point);
			pstmt.setString(2, customor);
			pstmt.executeUpdate();
			pstmt.close();
			
		}

		if(!pay.equals("placeP")){
			try {
				
				
				sql = "update customer set pointv = pointv+? where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, pppoint);
				pstmt.setString(2, customor);
				pstmt.executeUpdate();
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
		}

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
	if (check == 1) {
		
		
%>
<script>
	alert("완료되었습니다.");
	location.href = "../web.main/MainForm.jsp";
</script>
<%
	} else {
%>
<script>
	alert("정보가 올바르지 않습니다.");
	history.go(-1);
</script>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>test

</body>
</html>