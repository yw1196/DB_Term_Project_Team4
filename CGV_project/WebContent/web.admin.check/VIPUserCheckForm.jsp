<%@page import="user.Ticket"%>
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

	Ticket ticket = null;
	ArrayList<Ticket> tclist= new ArrayList<Ticket>();

	String id = (String) hs.getAttribute("id");

	try {
	
		conn = a.getConnection();
		//DB ��������
		//������ ���� ��Ʈ����Ʈ�� ����ְ� �װ� ���ؼ� n���� ������ ���� ����Ʈ�� ���̰Բ� �����ͺ��̽� ����
		String sql = "select *, sum(seat_num) from ticket where checkv = '1' and showing_date <= now() and showing_date >= date_add(now(), interval -1 month)  group by customer_id order by sum(seat_num) desc;";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery(); // ���� ���� ����
		int i = 0;
		while (rs.next()) {
			ticket = new Ticket();

			ticket.setCheckV(rs.getString("checkV"));
			ticket.setCinema_name(rs.getString("cinema_name"));
			ticket.setCustomer_id(rs.getString("customer_id"));
			ticket.setGross(rs.getString("gross"));
			ticket.setPay_how(rs.getString("pay_how"));
			ticket.setScreen_id(rs.getString("screen_id"));
			ticket.setSeat_num(rs.getString("sum(seat_num)"));
			ticket.setShowing_date(rs.getString("showing_date"));
			ticket.setShowing_time(rs.getString("showing_time"));
			tclist.add(ticket);
			i++;
			if(i == 3){
				break;
			}
			
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

	<table>VIP top3
	<tr>
				<td>1</td>
				<td>2</td>
				<td>�մԻ���� ���̵�</td>
				<td>4</td>
				<td>5</td>
				<td>6</td>
				<td>���� ����</td>

			</tr>

		<%
				while (true) {
			%>
		
			<tr>
				<%
					if (tclist.isEmpty()) {
							break;
						}
				%>
						<td><%=tclist.get(0).getCheckV()%></td>
						<td><%=tclist.get(0).getCinema_name()%></td>
						<td><%=tclist.get(0).getCustomer_id()%></td>
						<td><%=tclist.get(0).getGross()%></td>
						<td><%=tclist.get(0).getPay_how()%></td>
						<td><%=tclist.get(0).getScreen_id()%></td>
						<td><%=tclist.get(0).getSeat_num()%></td>
						
				

				<%
					tclist.remove(0);
				%>

			</tr>
			<br>
			<%
				}
			%>
		
		
	</table>
	
</body>
</html>