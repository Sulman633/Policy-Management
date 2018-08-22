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
	
	public ArrayList<String> getPoliciesByType(String type) throws SQLException {
		ArrayList<String> policyNames = new ArrayList<String>();
		try {
			
			System.out.println(type);
			con.connect();
			pstmt = con.getCon().prepareStatement("SELECT POLICY_NAME FROM POLICIES WHERE POLICY_TYPE=?");
			pstmt.setString(1, type);
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
	
	public ArrayList<Integer> getAllPolicyID() throws SQLException{
        ArrayList<Integer> policyId = new ArrayList<Integer>();
        try {
            con.connect();
            pstmt = con.getCon().prepareStatement("SELECT POLICY_ID FROM POLICIES");
            rs = pstmt.executeQuery();
            while(rs.next())
            {
                policyId.add(rs.getInt(1));
            }
        }catch (Exception e) {
            e.printStackTrace();
        } finally {
            rs.close();
            pstmt.close();
            con.closeConnection();
        }
        return policyId;
    }
	
	public ArrayList<Integer> getAllCustomerID() throws SQLException
    {
        ArrayList<Integer> customerId = new ArrayList<Integer>();
        try {
            con.connect();
            pstmt = con.getCon().prepareStatement("SELECT customer_ID FROM CUSTOMERS");
            rs = pstmt.executeQuery();
            while(rs.next())
            {
                customerId.add(rs.getInt(1));
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        } finally {
            rs.close();
            pstmt.close();
            con.closeConnection();
        }
        return customerId;
    }
	
	public ArrayList<String> generateCertificate(String polId, String colId) throws SQLException {
        ArrayList<String> results = new ArrayList<String>();
        //int ipid  = Integer.parseInt(polId);
        try {
            Connection dbcon = con.connect();
            pstmt = dbcon.prepareStatement("select POLICYMAP.policy_id, POLICIES.POLICY_NAME, POLICIES.TENURE, POLICYMAP.PREMIUM_AMOUNT, POLICIES.SUM_ASSURED, NOMINEEMAP.NOMINEE_ID "
                    + "FROM ((POLICYMAP INNER JOIN POLICIES ON POLICYMAP.policy_id = ? AND POLICYMAP.customer_id = ? AND POLICYMAP.policy_id = POLICIES.policy_id)"
                    + "    INNER JOIN NOMINEEMAP ON POLICYMAP.policy_map_id = NOMINEEMAP.policy_map_id)");
            pstmt.setString(1, polId);
            pstmt.setString(2, colId);
            rs = pstmt.executeQuery();
            
//            select POLICYMAP.policy_id, POLICIES.POLICY_NAME, POLICIES.TENURE, POLICYMAP.PREMIUM_AMOUNT, POLICIES.SUM_ASSURED, NOMINEEMAP.NOMINEE_ID
//            FROM ((POLICYMAP
//            INNER JOIN POLICIES ON POLICYMAP.policy_id = 1 AND POLICYMAP.customer_id = 1 AND POLICYMAP.policy_id = POLICIES.policy_id)
//            INNER JOIN NOMINEEMAP ON POLICYMAP.policy_map_id = NOMINEEMAP.policy_map_id)
            
            while(rs.next())
            {
                results.add(rs.getString(1));
                results.add(rs.getString(2));
                results.add(rs.getString(3));
                results.add(rs.getString(4));
                results.add(rs.getString(5));
                results.add(rs.getString(6));
                
            }
            
            System.out.println("generated certificate");
            //System.out.println(results.toString());            
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }finally {
            pstmt.close();
            con.closeConnection();
        }
        return results;
        
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
	
	public void buyPolicy(String policyName,String nominee,String relationship,String premium,String sumAss,String birthCert,String pancard,int agentID,String date) throws SQLException
    {
		try {
			con.connect();
			pstmt = con.getCon().prepareStatement("INSERT INTO POLICIES(policy_id, policy_type, policy_name, number_nominees, tenure, sum_assured, pre_reqs)"
                    + "VALUES(policy_seq.nextval,?,?,?,?,?,?)");
			/*pstmt.setString(1, ptype);
			pstmt.setString(2, pname);
			pstmt.setInt(3, nNom);
			pstmt.setInt(4, pten);
			pstmt.setInt(5, sumA);
			pstmt.setString(6, prereq);*/
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
	
	
	
	public ArrayList<String> getPolicyByCustomer(String cusID) throws SQLException {
		ArrayList<String> policyNames = new ArrayList<String>();
		try {
			con.connect();
			pstmt = con.getCon().prepareStatement("select policies.policy_name from policies inner join policymap on policies.policy_id = policymap.policy_id where policymap.customer_id = '"+cusID+"'");
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
	
	
}
