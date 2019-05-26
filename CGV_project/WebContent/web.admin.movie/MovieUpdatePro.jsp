<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="user.LogonDBBean"%>
<% request.setCharacterEncoding("euc-kr"); %>


<%
	//�Ķ���� �� �о���̴� �κ�
	String Id = request.getParameter("id");
	String Title = request.getParameter("title");
	String Director = request.getParameter("director");
	String Actors = request.getParameter("actors");
	String Plot = request.getParameter("plot");
	String Rating = request.getParameter("rating");
	String StartDate = request.getParameter("startdate");
	String Running_Time = request.getParameter("running_time");
	int check = 0;
	LogonDBBean a = new LogonDBBean();
	//DB�� ����
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	ResultSet rs = null;
	
	try{
		conn = a.getConnection();
		//DB ��������
		String sql = "select id, title from movie where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, Id);
		rs = pstmt.executeQuery(); // ���� ���� ����
		
		if(rs.next()){
			String rId = rs.getString("id");
			String rTitle = rs.getString("title");
			pstmt.close();
			if(Id.equals(rId) && Title.equals(rTitle)){
				sql = "update movie set director = ?, actors = ?, plot = ?, rating = ?, startdate = ?, running_time = ? where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, Director);
				pstmt.setString(2, Actors);
				pstmt.setString(3, Plot);
				pstmt.setString(4, Rating);
				pstmt.setString(5, StartDate);
				pstmt.setString(6, Running_Time);
				pstmt.setString(7, Id);
				pstmt.executeUpdate();
			}
			else{
			}
		}
	}
	catch (Exception e){
		e.printStackTrace();
	}
	finally{
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
	if(check == 1){
		%>
<script>
	alert("��ȭ������ �Ϸ�Ǿ����ϴ�.");
	location.href = "../web.admin/Admin.jsp";
</script>
		<%
	}else{
		%>
<script>
	alert("������ �ùٸ��� �ʽ��ϴ�.");
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
<body>

</body>
</html>