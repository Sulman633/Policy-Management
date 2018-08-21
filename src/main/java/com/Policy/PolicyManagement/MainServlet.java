package com.Policy.PolicyManagement;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * MainServlet implementation class MainServlet
 */
@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PolicyOperations p = new PolicyOperations();
		
		//create policy logic
		
		if(request.getParameter("createPolicySubmit") != null)
		{
			
	        String pName = request.getParameter("Policyname");
	        String ptype = request.getParameter("typeRadio");
	        String nNominees = request.getParameter("Numbernominees");
	        int nNom = Integer.parseInt(nNominees);
	        String tPeriod = request.getParameter("tenureRadio");
	        int tPer = Integer.parseInt(tPeriod);
	        String sumAss = request.getParameter("Sumassured");
	        int sumA = Integer.parseInt(sumAss);
	        String prereq = request.getParameter("Prerequ");
     
	        
	        try {
	        	
	        	p.createPolicy(ptype, pName, nNom, tPer, sumA, prereq);
	        	response.sendRedirect("create_policy.jsp");
	        } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } /*catch (ClassNotFoundException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }*/
	       
		}
		
		//delete policy logic
		else if(request.getParameter("deletePolicySubmit") != null)
		{
			try
			{							
				p.deletePolicy(request.getParameter("policyName"));
				
				response.sendRedirect("delete_policy.jsp");
			}
			catch (SQLException e)
			{
				
			}
		}
		else if (request.getParameter("buyPolicySubmit") != null)
		{
			
			try
			{
				if(request.getParameter("nominee") == null)
				{
					ArrayList<String> pnames = null;
					
					try{
						pnames = p.getPoliciesByType(request.getParameter("policyType"));
						
					}catch(Exception e){
						
					}
					
					request.setAttribute("policynames",pnames);
				}
				else
				{
					String policyName = request.getParameter("policyName");
					String nominee = request.getParameter("nominee");
			        String relationship = request.getParameter("relationship");
			        String premium = request.getParameter("premiumRadio");
			        String sumAss = request.getParameter("sumAssured");
			        String birthCert = request.getParameter("birthcertificate");
			        String pancard = request.getParameter("pancard");
			        int agentID = Integer.parseInt(request.getParameter("agentID"));
			        String date = request.getParameter("policyDate");
			        
			        p.buyPolicy(policyName,nominee,relationship,premium,sumAss,birthCert,pancard,agentID,date);
				
			        response.sendRedirect("buy_policy.jsp");
				}
			}
			catch (SQLException e)
			{
				
			}
		}
		
		
		
		/*
		//view agent logic
		
		SearchByAgentLogic sa = new SearchByAgentLogic();
		
		String agentID = ""; // should be request.getparameter(agentID) from jsp
		
		try {
			ArrayList<String> customers = sa.getCustomersForAgent(agentID);
			
			Iterator<String> c_iterator = customers.iterator();
			
			Map<String,ArrayList<String>> policiesPerCustomer = new HashMap<>();

			while(c_iterator.hasNext())
			{
				String customerID = c_iterator.next();
				policiesPerCustomer.put(customerID, sa.getPoliciesForCustomer(customerID));
			}
			
			//logic to send response back to search_by_agent jsp to be implemented
		}
		
		catch(SQLException e) {
			
		}
		
		
		*/
		//Create object to run policy operations
		
		
		if(request.getParameter("selectPolicySubmit") != null) {
			/*
			 * 			try {
				ArrayList<String> policyNames = p.getAllPolicyNames();
				request.setAttribute("policynames", arg1);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			 */
		}

		if(request.getParameter("createSubmit") != null) {
			String policyName = request.getParameter("Pname");
			String nominees = request.getParameter("Nominees");
			String typePolicy = request.getParameter("typeRadio");
			String tenure = request.getParameter("tenureRadio");
			String sumAssured = request.getParameter("SumAssured");
			String prereq = request.getParameter("Prerequisites");
			//p.createPolicy(typePolicy, typePolicy, nominees, tenure, sumAssured, prereq);
		}
	}



}
