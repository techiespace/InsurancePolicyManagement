package JDBC.jsp;

import java.sql.*;
import java.text.SimpleDateFormat;


public class Add_cust {
	public void addCustInfo(int aid, String fname, String mname, String lname, String email, String phone, String add, String dob, String uname, String passwd, String desig, String policy) {
		String sql = "INSERT INTO customer(c_uname,c_passwd,c_email,c_phone,c_dob,c_addr,c_fname,c_mname,c_lname,desig) VALUES (?,?,?,?,?,?,?,?,?,?)";
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		String cusAgPolsql = "INSERT INTO customer_agent_policy(cust_id,agent_id,pol_no) VALUES (?,?,?)";
		String getCusIdsql = "SELECT cust_id from customer where c_uname='"+uname+"'";
		
		
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
			
			Statement prepgetCusId = conn.createStatement();
			ResultSet rsCusId = prepgetCusId.executeQuery(getCusIdsql);
			rsCusId.next();
			int custId= rsCusId.getInt("cust_id");
			
			PreparedStatement prepcusAgPolsql = conn.prepareStatement(cusAgPolsql);
			int polint = Integer.parseInt(policy);
			prepcusAgPolsql.setInt(1, custId);
			prepcusAgPolsql.setInt(2, aid);
			prepcusAgPolsql.setInt(3, polint);
			prepcusAgPolsql.execute();
			
			//rs.next();
		} catch (Exception e) {
			System.out.println("Exception Occured: "+e);
		}
		//return 1;
	}
	
	/*public static void main(String args[]) {
		Add_cust.addCustInfo("a","b","c","d","e","f","12/12/1990","h","i","j");
		
	}*/
	
	

}
