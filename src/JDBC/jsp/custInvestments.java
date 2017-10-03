package JDBC.jsp;
import JDBC.jsp.*;
import java.sql.*;

public class custInvestments {
	
	 int total;
	public int myInvestments(String pol,int id) {
	
		int pol_no = Integer.parseInt(pol);
	
		try {
			Connection conn = new Connect().myDBConnect();
		
			String sql;
			sql = "select sum(amt) from payment where pol_no = ? and cust_id= ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, pol_no);
			stmt.setInt(2, id);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			total =rs.getInt(1);		
			
			
		} catch (Exception e) {
			System.out.println(e);
		}

		return total;

		
	}

}
