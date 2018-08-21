package com.Policy.PolicyManagement;
import java.sql.*;
import java.util.ArrayList;


public class SearchByAgentLogic {
	
	JDBC_Connection db = new JDBC_Connection();

	public ArrayList<String> getCustomersForAgent(String agentID) throws SQLException {
		
		PreparedStatement ps = db.getCon().prepareStatement("select customer_ID from PolicyMap where agent_ID = ?");
		
		ps.setString(1, agentID);
		
		ResultSet rs =  ps.executeQuery();
		
		ArrayList<String> arr = new ArrayList<String>();
		
		while(rs.next())
		{
		    arr.add(rs.getString(1));
		}
		
		return arr;
		
	}
	
	public ArrayList<String> getPoliciesForCustomer(String cusID) throws SQLException {
		
		PreparedStatement ps = db.getCon().prepareStatement("select policy_ID from PolicyMap where customer_ID = ?");
		
		ps.setString(1, cusID);
		
		ResultSet rs =  ps.executeQuery();
		
		ArrayList<String> arr = new ArrayList<String>();
		
		while(rs.next())
		{
		    arr.add(rs.getString(1));
		}
		
		return arr;
		
	}
	
	public ArrayList<String> showPolicyDetails(String cusID, String policyID) throws SQLException, ClassNotFoundException{
		ArrayList<String> policydetails = new ArrayList<String>();
		
		/* Connect to database */
		
		db.connect();
		policydetails.add(policyID);
		
		PreparedStatement ps1 = db.getCon().prepareStatement("select FIRSTNAME, LASTNAME WHERE CUSTOMER_ID = '"+cusID+"'");
		ResultSet rs = ps1.executeQuery();
		
		String name = rs.getString(1) + rs.getString(2);
		policydetails.add(name);
		
		PreparedStatement ps2 = db.getCon().prepareStatement("select tenure, sum_assured WHERE policy_id = '"+policyID+"'");
		ResultSet rs1 = ps2.executeQuery();
		
		policydetails.add(rs1.getString(1));
		policydetails.add(rs1.getString(2));
		
		PreparedStatement ps3 = db.getCon().prepareStatement("select premium_amount, start_date WHERE policy_id = '"+policyID+"' and customer_id  = '"+cusID+"'");
		ResultSet rs2 = ps3.executeQuery();
		
		policydetails.add(rs2.getString(1));
		policydetails.add(rs2.getString(2)); /* have to add tenure to start date to make it expiry date*/
		
		
		PreparedStatement ps4 = db.getCon().prepareStatement("select nomineemap.nominee_id from nomineemap inner join policymap on nominee.policy_map_id = policymap.policy_map_id WHERE policymap.policy_id = '"+policyID+"' and policymap.customer_id  = '"+cusID+"'");
		ResultSet rs3 = ps4.executeQuery();
		
		policydetails.add(rs3.getString(1));
		
		
		return policydetails;
		
		
		
		
	}
}
