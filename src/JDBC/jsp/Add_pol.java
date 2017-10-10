package JDBC.jsp;

import java.sql.*;
import java.text.SimpleDateFormat;


public class Add_pol {
	public void addNewPolicy(String pname, String pno, String dur, String lfee, String prem, String comm) {
		String sql = "INSERT INTO policy(p_name,pol_no,duration,late_fee,premium,commision) VALUES (?,?,?,?,?,?)";
		//get prem_pdate
		
		try {
			Connection conn = new Connect().myDBConnect();
			PreparedStatement prep = conn.prepareStatement(sql);
			prep.setString(1, pname);
			prep.setString(2, pno);
			prep.setString(3, dur);
			prep.setString(4, lfee);
			prep.setString(5, prem);
			prep.setString(6, comm);
			prep.execute();
			
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
	
	/*public static void main(String args[]) {
		Add_cust c = new Add_cust();
		//c.addCustInfo(aid, fname, mname, lname, email, phone, add, dob, uname, passwd, desig, policy);
		c.addCustInfo(1, "w", "e", "r", "t", "y", "ed", "1/2/1993", "u", "i", "o","1");
		
	}*/
	
	

	}
