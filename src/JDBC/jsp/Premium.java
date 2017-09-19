package JDBC.jsp;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Premium {
	public int date(int cust_id, int pol_no) {
		//cust_id = 2;
		//pol_no = 897456124;
		int date_diff = 100;
		String sql1 = "select date from payment where cust_id=? AND pol_no=? order by(trans_no) desc LIMIT 1";
		String sql2= "select datediff(curdate(),?)";
		try {
			Connection conn = new Connect().myDBConnect();
			PreparedStatement stmt1 = conn.prepareStatement(sql1);
			PreparedStatement stmt2 = conn.prepareStatement(sql2);
			stmt1.setInt(1, cust_id);
			stmt1.setInt(2, pol_no);
			ResultSet rs1 = stmt1.executeQuery();
			rs1.next();
			// select datediff(curdate(),"2017-09-01");
			// System.out.println(rs.getInt(1) + " " + rs.getString(2));
			Date p_date= rs1.getDate("date");
			System.out.println("Date:"+p_date);
			stmt2.setDate(1, p_date);
			ResultSet rs2= stmt2.executeQuery();
			rs2.next();
			date_diff=rs2.getInt(1);
			//name = rs.getString("c_fname");
			// String name=rs.getString(1);
			// cust_id=rs.getInt(2);
			// System.out.println("\nName="+name+"ID="+cust_id);
		} catch (Exception e) {
			System.out.println(e);
		}

		return date_diff;

	}
	
	public static void main(String args[])
	{
		int key=new Premium().date(2,897456124);
		System.out.println("Key="+key);
	}
	
}
