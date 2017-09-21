package JDBC.jsp;

import java.sql.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import JDBC.jsp.Connect;
public class cust_profile {



		public String[] cust_p(String u_name) {

			String [] tuple=new String[10];
			//String name = "";
			String sql;
			sql = "select cust_id,c_fname,c_mname,c_lname,c_addr,c_phone,c_dob,c_email from customer where c_uname=?;";

			try {
				int i=0;
				Connection conn = new Connect().myDBConnect();
				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString(1, u_name);
				ResultSet rs = stmt.executeQuery();
				while(rs.next()) {
					tuple[0]=rs.getString("c_fname");
					tuple[1]=rs.getString("c_mname");
					tuple[2]=rs.getString("c_lname");
					tuple[3]=rs.getString("c_addr");
					tuple[4]=rs.getString("c_phone");
					tuple[5]=(String)rs.getString("c_dob");
					tuple[6]=rs.getString("c_email");
					
				}
				// System.out.println(rs.getInt(1) + " " + rs.getString(2));
				// String name=rs.getString(1);
				// cust_id=rs.getInt(2);
				// System.out.println("\nName="+name+"ID="+cust_id);
				//return cust_id;
			} catch (Exception e) {
				System.out.println(e);
			}

			return tuple;

		

	}

	
}
