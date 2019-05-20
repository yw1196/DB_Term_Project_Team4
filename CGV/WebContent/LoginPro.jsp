<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*"%>
<%@ page import="user.LogonDBBean"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");

	LogonDBBean logon = LogonDBBean.getInstance();
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/cgv?useSSL=false";
		String dbId = "root";
		String dbPass = "dyddns";
		
		Class.forName("com.mysql.jdbc.Driver"); // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass); // DiverManager ��ü�κ��� Connection ��ü�� ���´�.
		
		String sql = "select id, pw from customer where id=?";
		
	}
	catch (Exception e){
		e.printStackTrace();
		str = "member ���ڵ� �߰� ����";
	}
	finally{
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
	int check = logon.userCheck(id, passwd);

	if (check == 1) {
%>
<%
	} else if (check == 0) {
%>
<script>
	alert("��й�ȣ�� ���� �ʽ��ϴ�.");
	history.go(-1);
</script>
<%
	} else {
%>
<script>
	alert("���̵� ���� �ʽ��ϴ�.");
	history.go(-1);
</script>
<%
	}
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="MMain.css">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="topbar">
		<div class="admin" style="float: right">
			<!-- MyPage, �������� ������ Ȯ���� �� ���� -->
			<form method="post" action="MyPage.jsp">
				<input type="submit" value="MyPage">
			</form>
		</div>

		<div class="admin" style="float: right">
			<!-- �����ڸ�� ��ư, AdminV �Ӽ��� true��� �̹�ư�� ���̰� ���� -->
			<form method="post" action="AdminForm.jsp" id="admin">
				<input type="submit" value="admin">
			</form>
		</div>
	</div>

	<div>
		<!-- ��������Ʈ -->
		<h1>? ����Ʈ</h1>
	</div>
	<div>
		<!-- 'id'�� �ȳ��ϼ��� -->
		<h1>
			<%=id%>�� �������
		</h1>
	</div>
	<div>
		<!-- �α׾ƿ�, �������� -->
		<div style="float: left">
			<form method="post" action="LoginForm.jsp">
				<input type="submit" value="�α׾ƿ�">
			</form>
		</div>
		<div style="float: left">
			<form method="post" action="UpdateForm.jsp">
				<input type="submit" value="��������">
			</form>
		</div>
		<div style="float: left">
			<form method="post" action="DeleteForm.jsp">
				<input type="submit" value="Ż��">
			</form>
		</div>
	</div>
	<div>
		<!-- �� �������� ���� ��ɵ� -->
		<div class="mainmain"></div>
	</div>

</body>
</html>