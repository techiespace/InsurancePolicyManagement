package JDBC.jsp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Invoice {
		public void enter(int cust_id, int agent_id, Double total, int pol_no, int commision) {
			String sql1 = "insert into payment(cust_id,agent_id,date,amt,pol_no,commision) VALUES (?,?,curdate(),?,?,?)";

		try {
			Connection conn = new Connect().myDBConnect();
			PreparedStatement stmt = conn.prepareStatement(sql1);
			stmt.setInt(1,cust_id);
			stmt.setInt(2, agent_id);
			stmt.setDouble(3,total);
			stmt.setInt(4, pol_no);
			stmt.setInt(5, commision);
			stmt.execute();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
