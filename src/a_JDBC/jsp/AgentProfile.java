package a_JDBC.jsp;
import java.sql.*;
//import JDBC.jsp.*;
import java.sql.Connection;
//import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import JDBC.jsp.Connect;



public class AgentProfile {

public String[] agent_p(String u_name) {

				String [] tuple=new String[10];
				//String name = "";
				String sql;
				sql = "select agent_id,a_fname,a_lname,a_addr,a_phone,a_email from agent where a_uname=?;";

				try {
					int i=0;
					Connection conn = new Connect().myDBConnect();
					PreparedStatement stmt = conn.prepareStatement(sql);
					stmt.setString(1, u_name);
					ResultSet rs = stmt.executeQuery();
					while(rs.next()) {
						tuple[0]=rs.getString("a_fname");
					//	tuple[1]=rs.getString("a_mname");
						tuple[2]=rs.getString("a_lname");
						tuple[3]=rs.getString("a_addr");
						tuple[4]=rs.getString("a_phone");
						//tuple[5]=(String)rs.getString("c_dob");
						tuple[5]=rs.getString("a_email");
						
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
