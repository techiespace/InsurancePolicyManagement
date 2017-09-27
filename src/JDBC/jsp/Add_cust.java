package JDBC.jsp;

import java.sql.*;

public class Add_cust {
	public int addCustInfo(String fname, String mname, String lname, String email, String phone, String add, String dob, String uname, String passwd) {
		String sql = "INSERT INTO customer VALUES (?,?,?,?,?,?,?,?,?)";
		try {
			Connection conn = new Connect().myDBConnect();
			PreparedStatement prep = conn.prepareStatement(sql);
			prep.setString(1, fname);
			prep.setString(2, mname);
			prep.setString(3, lname);
			prep.setString(4, email);
			prep.setString(5, phone);
			prep.setString(6, add);
			prep.setString(7, dob);
			prep.setString(8, uname);
			prep.setString(9, passwd);
			prep.executeUpdate();
			//rs.next();
		} catch (Exception e) {
			System.out.println(e);
		}
		return 1;
	}

}
