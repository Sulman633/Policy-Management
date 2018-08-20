package com.Policy.PolicyManagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBC_Connection {

	private Connection con = null;
	
	public Connection connect() throws ClassNotFoundException, SQLException
	{
		try
		{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@192.168.1.214:1521:xe";
		String uname = "system";
		String pwd = "tcs12345";
		con = DriverManager.getConnection(url, uname, pwd);	
		return con;
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return con;
	}

	public void closeConnection() throws SQLException {
		 con.close();
	}

	public Connection getCon() {
		return con;
	}
}
