package com.Policy.PolicyManagement;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class PolicyOperations {

	private JDBC_Connection con;
	private ResultSet rs;
	private PreparedStatement pstmt;
	
	//Get all Policy names from policy table
	public void getAllPolicyNames() throws SQLException {
		con = new JDBC_Connection();
		try {
			con.connect();
			pstmt = con.getCon().prepareStatement("SELECT POLICY_NAME FROM POLICIES");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				System.out.println(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			con.closeConnection();
		}
	}
	
	
	/*Update Policy
	public void updatePolicy(String policyID, String policyName, int numOfNominees, String typeOfPolicy, 
			String tenure, int sumAssured, String prerequistes) {
	
		
		
	}*/
}
