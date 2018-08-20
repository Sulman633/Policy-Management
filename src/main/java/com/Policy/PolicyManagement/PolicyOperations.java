package com.Policy.PolicyManagement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PolicyOperations {

	private JDBC_Connection con;
	private ResultSet rs;
	private PreparedStatement pstmt;
	
	public PolicyOperations(){
		con = new JDBC_Connection();
	}
	
	//Get all Policy names from policy table
	public ArrayList<String> getAllPolicyNames() throws SQLException {
		ArrayList<String> policyNames = new ArrayList<String>();
		try {
			con.connect();
			pstmt = con.getCon().prepareStatement("SELECT POLICY_NAME FROM POLICIES");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				policyNames.add(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			con.closeConnection();
		}
		return policyNames;
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
	
	public void updatePolicy(String policyType, String policyName, int numberOfNominees, int tenure, int sumAssured, String prerequisites) throws SQLException {
			try {
				con.connect();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			pstmt = con.getCon().prepareStatement("UPDATE INTO POLICIES(policy_type, policy_name, number_nominees, tenure, sum_assured, pre_reqs)"
					+ "VALUES(?,?,?,?,?,?)");
			pstmt.setString(1, policyType);
			pstmt.setString(2, policyName);
			pstmt.setInt(3, numberOfNominees);
			pstmt.setInt(4, tenure);
			pstmt.setInt(5, sumAssured);
			pstmt.setString(6, prerequisites);			
	}
	
	public void deletePolicy(String p_name) throws SQLException
    {
		try {
			Connection dbcon = con.connect();
			pstmt = dbcon.prepareStatement("DELETE FROM POLICIES WHERE POLICY_NAME=?");
			pstmt.setString(1, p_name);
			pstmt.execute();
			System.out.println("deleted policy");
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally {
			pstmt.close();
			con.closeConnection();
		}
    }
}
