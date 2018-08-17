package com.Policy.PolicyManagement;
import java.sql.*;
import java.util.ArrayList;


public class SearchByAgentLogic {
	
	JDBC_Connection db = new JDBC_Connection();

	public ArrayList<String> getCustomersForAgent(String agentID) throws SQLException {
		
		PreparedStatement ps = db.getCon().prepareStatement("select customer_ID from PolicyMap where agent_ID = ?");
		
		ps.setString(1, agentID);
		
		ResultSet rs =  ps.executeQuery();
		
		ArrayList<String> arr = new ArrayList<String>;
		
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
		
		ArrayList<String> arr = new ArrayList<String>;
		
		while(rs.next())
		{
		    arr.add(rs.getString(1));
		}
		
		return arr;
		
	}
}
