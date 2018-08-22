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
	
		//Get all Policy information 
		//created by Sulman
		public ArrayList<String> getPolicyDetails(String policyName) throws SQLException {
			ArrayList<String> policyDetails = new ArrayList<String>();
			
			try {
				con.connect();
				pstmt = con.getCon().prepareStatement("SELECT policy_name, number_nominees, policy_type, tenure, sum_assured, pre_reqs FROM POLICIES WHERE policy_name=?");
				pstmt.setString(1, policyName);
				
				rs = pstmt.executeQuery();
				while(rs.next()) {
					 policyDetails.add(rs.getString("policy_name"));
					 policyDetails.add(rs.getString("number_nominees"));
					 policyDetails.add(rs.getString("policy_type"));
					 policyDetails.add(rs.getString("tenure"));
					 policyDetails.add(rs.getString("sum_assured"));
					 policyDetails.add(rs.getString("pre_reqs"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				rs.close();
				pstmt.close();
				con.closeConnection();
			}
			return policyDetails;
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
			rs = pstmt.executeQuery();
	        System.out.println("executed query"); 
	        
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally {
			pstmt.close();
			con.closeConnection();
		}
    }	
	
	public void updatePolicy( String oldPolicyName, String policyName, int numberOfNominees, String policyType, double tenure, double sumAssured, String prerequisites) throws SQLException {
		if(!policyName.equals("")) {
			try {
					con.connect();
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
				pstmt = con.getCon().prepareStatement("UPDATE POLICIES SET policy_name=?, number_nominees=?, policy_type=?, tenure=?, sum_assured=?, pre_reqs=? WHERE policy_name=?");
				pstmt.setString(1, policyName);
				pstmt.setInt(2, numberOfNominees);
				pstmt.setString(3, policyType);
				pstmt.setDouble(4, tenure);
				pstmt.setDouble(5, sumAssured);
				pstmt.setString(6, prerequisites);		
				pstmt.setString(7, oldPolicyName);
				pstmt.executeUpdate();
				System.out.println("Updated row!");
		}	
			
	}
	
	public void deletePolicy(String p_id) throws SQLException
    {
		try {
			Connection dbcon = con.connect();
			pstmt = dbcon.prepareStatement("DELETE FROM POLICIES WHERE POLICY_ID=?");
			
			pstmt.setString(1, p_id);
			pstmt.execute();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally {
			pstmt.close();
			con.closeConnection();
		}
    }
}
