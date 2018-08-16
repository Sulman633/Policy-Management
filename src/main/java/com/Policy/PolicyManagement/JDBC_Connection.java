package com.Policy.PolicyManagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBC_Connection {

	private Connection con = null;
	
	public void connect(String querystatmnt) throws ClassNotFoundException, SQLException
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@192.168.1.59:1521:xe";
		String uname = "system";
		String pwd = "tcs12345";
		con = DriverManager.getConnection(url, uname, pwd);	
		System.out.println("registered driver");
	}

	public void closeConnection() throws SQLException {
		 con.close();
	}

	public Connection getCon() {
		return con;
	}
}