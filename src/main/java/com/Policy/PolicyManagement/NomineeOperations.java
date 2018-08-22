package com.Policy.PolicyManagement;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class NomineeOperations {
    //DB connection fields 
	private JDBC_Connection con;
	private ResultSet rs;
	private PreparedStatement pstmt;
	
	
	public NomineeOperations()
	{
		con = new JDBC_Connection();
	}
	
	
	public void insertNewNominee(Nominee n) throws SQLException
	{

		try {
			con.connect();
			pstmt = con.getCon().prepareStatement("INSERT INTO Nominees(nominee_ID, name, relationship_to_customer, purpose_of_changed, percentage) VALUES(nominee_seq.nextval,?,?,?,?)");
			//pstmt.setString(1, n.getNominee_ID());
			pstmt.setString(1, n.getnominee_name());
			pstmt.setString(2, n.getrelationship());
			pstmt.setString(3, n.getpurpose_of_changed());
			pstmt.setDouble(4, n.getpercentage());
			pstmt.executeQuery();
	        System.out.println("executed query"); 
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally {
			pstmt.close();
			con.closeConnection();
		}
	}
	
	public void insertNewNomineeMap(int nomineeID, int policyID) throws SQLException
	{

		try {
			con.connect();
			pstmt = con.getCon().prepareStatement("INSERT INTO NOMINEEMAP(NOMINEE_MAP_ID,POLICY_MAP_ID,NOMINEE_ID) VALUES(nomineeMap_seq.nextval,?,?)");
			//pstmt.setString(1, n.getNominee_ID());
			pstmt.setInt(1,nomineeID);
			pstmt.setInt(2,policyID);
			pstmt.executeQuery();
	        System.out.println("executed query"); 
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally {
			pstmt.close();
			con.closeConnection();
		}
	}	
	
	
	public int getNomineeID() throws SQLException
	{
		int nomineeID =0;
		try {
			con.connect();
			pstmt = con.getCon().prepareStatement("select MAX(NOMINEE_ID) from NOMINEES");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				nomineeID = rs.getInt(1);
			}
	        System.out.println("executed query"); 
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally {
			rs.close();
			pstmt.close();
			con.closeConnection();
		}
		return nomineeID;
	}		
}



