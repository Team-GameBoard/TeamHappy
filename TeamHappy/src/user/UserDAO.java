package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;


import util.DBUtil;

public class UserDAO {
   
   
   // 아이디 중복값 확인
//   public boolean confimId(User user) {
//      boolean result = false;
//      Connection con = null;
//      PreparedStatement pstmt = null;
//      ResultSet rset = null;
//      
//      try {
//    	 con = DBUtil.getConnection();
//         pstmt = con.prepareStatement("select user_id from user where user_id =?");
//         pstmt.setString(1, user.getUser_id());
//         rset = pstmt.executeQuery();
//         
//         if(rset.next()) {
//        	if(rset.getString(1).equals(user.getUser_id())) {
//        		System.out.println("중복된 아이디 입니다.");
//        	}else {
//        		System.out.println("아이디 생성 가능");
//        	}
//         }
//      }catch (Exception e) {
//         e.printStackTrace();
//      }finally {
//         DBUtil.close(con, pstmt, rset);
//      }
//      return result;
//   }
	
	public static void Loginck(User user) {
		   Connection con = null;
		   PreparedStatement pstmt = null;
		   ResultSet rset = null;
		   
		   try {
			   con = DBUtil.getConnection();
		       pstmt = con.prepareStatement("select user_id from user where user_id =?");
		       
		       pstmt.setString(1, user.getUser_id());
		       rset = pstmt.executeQuery();
		       if(rset.next()) {
		    	if(rset.getNString(1).equals(user.getUser_id())){
		    		System.out.println("중복된 아이디 값");
		    	} 
		      }else {
		    	  System.out.println("아이디 생성 가능");
		      }
		   } catch (SQLException e) {
			e.printStackTrace();
		}finally {
			   DBUtil.close(con, pstmt, rset);
		}
		   
	   }
	
	
	
   
   
   // 회원가입 등록
   // Query
   public static boolean writeUser(User user) throws SQLException {
      Connection con = null;
      PreparedStatement pstmt = null;
      
      boolean result = false;

      System.out.println(user);

      try {
         con = DBUtil.getConnection();
         pstmt = con.prepareStatement("insert into user (user_id, user_password, user_age) values (?,?,?)");

         pstmt.setString(1, user.getUser_id());
         pstmt.setString(2, user.getUser_password());
         pstmt.setInt(3, user.getUser_age());

         int count = pstmt.executeUpdate();

         if (count != 0) {
            result = true;
         }
      } finally {
         DBUtil.close(con, pstmt);
      }
      return result;
   }
   
   
   // 로그인 로직
   public static User Login(User user) {
	   Connection con = null;
	   PreparedStatement pstmt = null;
	   ResultSet rset = null;
	   User reUser = new User();
	   
	   try {
		   con = DBUtil.getConnection();
	       pstmt = con.prepareStatement("select * from user where user_id=? and user_password=?");
	       
	       pstmt.setString(1, user.getUser_id());
	       pstmt.setString(2, user.getUser_password());
	       rset = pstmt.executeQuery();
	       if(rset.next()) {
	    	if(rset.getNString(1).equals(user.getUser_password())){
	    		System.out.println("로그인 성공");
	    		reUser = new User(rset.getString(1),rset.getString(2));
	    		return reUser;
	    	} 
	      }else {
	    	  System.out.println("로그인 실패");
	      }
	   } catch (SQLException e) {
		e.printStackTrace();
	}finally {
		   DBUtil.close(con, pstmt, rset);
	}
	return null;
	   
   }
   
   
}