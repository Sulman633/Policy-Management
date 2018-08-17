package com.Policy.PolicyManagement;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PolicyOperations {

	private JDBC_Connection con;
	private ResultSet rs;
	private PreparedStatement pstmt;
	
	public PolicyOperations(){
		con = new JDBC_Connection();
	}
	
	//Get all Policy names from policy table
	public void getAllPolicyNames() throws SQLException {
		try {
			con.connect();
			pstmt = con.getCon().prepareStatement("SELECT POLICY_NAME FROM POLICIES");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				System.out.println(rs.getString(1));
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			con.closeConnection();
		}
	}
	
	public void createPolicy(String ptype, String pname, int nNom, int pten, int sumA, String prereq) throws SQLException
    {
		try {
			con.connect();
			pstmt = con.getCon().prepareStatement("INSERT INTO POLICIES(policy_id, policy_type, policy_name, number_nominees, tenure, sum_assured, pre_reqs)"
	                + "VALUES(policy_seq.nextval,?,?,?,?,?,?)");
			pstmt.setString(1, ptype);
			pstmt.setString(2, pname);
			pstmt.setInt(3, nNom);
			pstmt.setInt(4, pten);
			pstmt.setInt(5, sumA);
			pstmt.setString(6, prereq);
			pstmt.executeQuery();
	        System.out.println("executed query"); 
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally {
			pstmt.close();
			con.closeConnection();
		}
    }
	
	public void deletePolicy(String pname) throws SQLException
    {
		try {
			con.connect();
			pstmt = con.getCon().prepareStatement("DELETE FROM POLICIES WHERE POLICY_NAME='?'");
			pstmt.setString(1, pname);
			pstmt.executeQuery();
	        System.out.println("executed query"); 
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally {
			pstmt.close();
			con.closeConnection();
		}
    }
	
	
	
	
}
