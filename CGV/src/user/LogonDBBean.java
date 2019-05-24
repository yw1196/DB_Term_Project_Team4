package user;

import java.sql.*;

public class LogonDBBean {
   
   private static LogonDBBean instance = new LogonDBBean();
   
   public static LogonDBBean getInstance() {
      return instance;
   }
   
   private LogonDBBean() {}
   
   private Connection getConnection() throws Exception{
      Connection conn = null;
      
      String jdbcUrl = "jdbc:mysql://localhost:3306/CGV?useSSL=false";
      String dbId = "root";
      String dbPass = "rlarnrgus1";
      
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
      return conn;
   }
  
   public int userCheck(String id, String passwd) throws Exception{
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String dbpasswd = "";
      int x = -1;
      try {
         conn = getConnection();
         pstmt = conn.prepareStatement(
               "select pw from customer where id = ?");
         pstmt.setString(1, id);
         rs = pstmt.executeQuery();
         
         if(rs.next()) {
            dbpasswd = rs.getString(1);
            if(dbpasswd.equals(passwd))
               x = 1; // 인증 성공
            else
               x = 0; // 비밀번호 틀림
         }else
            x = -1;
      }catch(Exception ex) {
         ex.printStackTrace();
      }finally {
         if(rs != null) try {rs.close();}catch(SQLException ex) {}
         if(pstmt != null) try {pstmt.close();}catch(SQLException ex) {}
         if(conn != null) try {conn.close();}catch(SQLException ex) {}
      }
      return x;
   }
   
   public int AdminCheck(String id) throws Exception{
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String dbadminV = "";
	      int x = -1;
	      try {
	         conn = getConnection();
	         pstmt = conn.prepareStatement(
	               "select AdminV from customer where id = ?");
	         pstmt.setString(1, id);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            dbadminV = rs.getString(1);
	            if(dbadminV.equals("1"))
	                x = 1; // 인증 성공
	             else
	                x = 0; // 비밀번호 틀림
	         }else
	            x = -1;
	      }catch(Exception ex) {
	         ex.printStackTrace();
	      }finally {
	         if(rs != null) try {rs.close();}catch(SQLException ex) {}
	         if(pstmt != null) try {pstmt.close();}catch(SQLException ex) {}
	         if(conn != null) try {conn.close();}catch(SQLException ex) {}
	      }
	      return x;
	   }
   
   
}