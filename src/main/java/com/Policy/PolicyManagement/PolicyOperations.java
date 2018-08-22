package com.Policy.PolicyManagement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
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

	
	public int getPolicyID(String name) throws SQLException {
		int policy_id = 0;

		try {
			con.connect();
			pstmt = con.getCon().prepareStatement("SELECT POLICY_ID FROM POLICIES WHERE POLICY_NAME=?");
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				policy_id = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			con.closeConnection();
		}
		return policy_id;
	}
	
	public int getNumNomineesOfPolicy(String name) throws SQLException {
		int number = 0 ;
		try {
			con.connect();
			pstmt = con.getCon().prepareStatement("SELECT NUMBER_NOMINEES FROM POLICIES WHERE POLICY_NAME=?");
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				number = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			con.closeConnection();
		}
		return number;
	}
	
	public ArrayList<String> getPoliciesByType(String type) throws SQLException {
		
		System.out.println("getting policies by type " + type);
		ArrayList<String> policyNames = new ArrayList<String>();
		try {
			
			con.connect();
			pstmt = con.getCon().prepareStatement("SELECT POLICY_NAME FROM POLICIES WHERE POLICY_TYPE=?");
			pstmt.setString(1, type);
			rs = pstmt.executeQuery();
			System.out.println("executed query");
			while(rs.next()) {
				policyNames.add(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			con.closeConnection();
			System.out.println("closed connection");
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
			rs = pstmt.executeQuery();
	        System.out.println("executed query"); 
	        
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally {
			pstmt.close();
			con.closeConnection();
		}
    }
	
	public void buyPolicy(String policyName, int customerID, int agentID, Date date, int premium_rate,double premium_amount, String medical_details) throws SQLException
    {
		try {
			
			System.out.println("im here");
			int policy_id = getPolicyID(policyName);
			
			con.connect();
			System.out.println("connected");
			pstmt = con.getCon().prepareStatement("INSERT INTO POLICYMAP(policy_map_id,customer_id,policy_id, "
					+ "agent_id, start_date, payments_per_year, premium_amount, medical_details, is_active,approved)"
                    + "VALUES(policymap_seq.nextval,?,?,?,?,?,?,?,?,?)");
			pstmt.setInt(2, policy_id);
			pstmt.setInt(1, customerID);
			pstmt.setInt(3, agentID);
			pstmt.setDate(4,date);
			pstmt.setInt(5,premium_rate);
			pstmt.setDouble(6,premium_amount);
			pstmt.setString(7, medical_details);
			pstmt.setInt(8, 1);
			pstmt.setInt(9, 1);
			try {
				pstmt.executeQuery();
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
			
			System.out.println("xcuted qry");
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
