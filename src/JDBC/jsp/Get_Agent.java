package JDBC.jsp;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Get_Agent {
	public int agent_no(int cust_id, int pol_no) {
		int agent_id=101;
		String sql1 = "select agent_id from customer_agent_policy where cust_id=? AND pol_no=?";
		try {
			Connection conn = new Connect().myDBConnect();
			PreparedStatement stmt1 = conn.prepareStatement(sql1);
			stmt1.setInt(1, cust_id);
			stmt1.setInt(2, pol_no);
			ResultSet rs1 = stmt1.executeQuery();
			rs1.next();
			agent_id = rs1.getInt(1);
			// System.out.println("Date:"+p_date);
			// return p_date;
		} catch (Exception e) {
			System.out.println(e);
		}
		return agent_id;
	}
	
	
}