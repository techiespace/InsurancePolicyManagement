package JDBC.jsp;

import java.sql.*;
import java.text.SimpleDateFormat;


public class Add_cust {
	public void addCustInfo(String fname, String mname, String lname, String email, String phone, String add, String dob, String uname, String passwd, String desig) {
		String sql = "INSERT INTO customer(c_uname,c_passwd,c_email,c_phone,c_dob,c_addr,c_fname,c_mname,c_lname,desig) VALUES (?,?,?,?,?,?,?,?,?,?)";
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		 
		
		
		try {
			Connection conn = new Connect().myDBConnect();
			PreparedStatement prep = conn.prepareStatement(sql);
			prep.setString(1, uname);
			prep.setString(2, passwd);
			prep.setString(3, email);
			prep.setString(4, phone);
			java.util.Date utildate= sdf.parse(dob);
			java.sql.Date sqldate= new java.sql.Date( utildate.getTime()); 
			System.out.println(sqldate);
			prep.setDate(5, sqldate);
			prep.setString(6, add);
			prep.setString(7, fname);
			prep.setString(8, mname);
			prep.setString(9, lname);
			prep.setString(10, desig);
			prep.execute();
			//rs.next();
			if (prep != null) {
				try {
					prep.close();
				} catch (SQLException e) {
					System.out.println(e);
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					System.out.println(e);
				}
			}
		} catch (Exception e) {
			System.out.println("Exception Occured: "+e);
		}
		//return 1;
	}
	
	/*public static void main(String args[]) {
		Add_cust.addCustInfo("a","b","c","d","e","f","12/12/1990","h","i","j");
		
	}*/
	
	

}
