package JDBC.jsp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Invoice {
	public void enter(int pol_no) {
		int details[] = new int[3];
		String sql1 = "insert into payment()";

		try {
			Connection conn = new Connect().myDBConnect();
			Statement stmt;
			stmt = conn.createStatement();
			stmt.executeUpdate(sql1);
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
