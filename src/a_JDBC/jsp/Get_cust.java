package a_JDBC.jsp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Get_cust {
	public int get_id(int agent_id,int pol_no) {
		int cust_id=101;
		String sql1 = "select cust_id from customer_agent_policy where agent_id=? AND pol_no=?";
		try {
			Connection conn = new Connect().myDBConnect();
			PreparedStatement stmt1 = conn.prepareStatement(sql1);
			stmt1.setInt(1, agent_id);
			stmt1.setInt(2, pol_no);
			ResultSet rs1 = stmt1.executeQuery();
			rs1.next();
			cust_id = rs1.getInt(1);
		} catch (Exception e) {
			System.out.println(e);
		}
		return cust_id;
}
}