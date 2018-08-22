package com.Policy.PolicyManagement;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * MainServlet implementation class MainServlet
 */
@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession sess;


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

		sess = request.getSession(true);
		response.setContentType("text/html;charset=UTF-8");
	    PolicyOperations p = new PolicyOperations();
	    
	   
	    
		//update policy logic 
		// by Sulman
		if(request.getParameter("SelectPolicySubmit") != null) {
			
			try {
				System.out.println(request.getParameter("selectPolicyInput"));
				ArrayList<String> policyDetails = p.getPolicyDetails(request.getParameter("selectPolicyInput"));
				
				for(int i=0; i< policyDetails.size(); i++) {
					System.out.println(policyDetails.get(i));
				}
				sess.setAttribute("policyDetails", policyDetails);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(request.getParameter("UpdatePolicySubmit") != null) {
			ArrayList<String> arr = (ArrayList<String>) sess.getAttribute("policyDetails"); 
			
			try {
				p.updatePolicy(arr.get(0), request.getParameter("Pname"), Integer.parseInt(request.getParameter("Nominees")), request.getParameter("typeRadio"), 
						Double.parseDouble(request.getParameter("tenureRadio")), 
						Double.parseDouble(request.getParameter("SumAssured")), request.getParameter("Prerequisites"));
				
			} catch (NumberFormatException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

		
		sess = request.getSession(true);
		
		
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
	        } catch (SQLException e1) {
	            // TODO Auto-generated catch block
	            e1.printStackTrace();
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
			catch (SQLException e1)
			{
				
			}
		}
		else if (request.getParameter("buyPolicy1Submit") != null)
		{
			
			try
			{
				ArrayList<String> pnames = null;
				
				pnames = p.getPoliciesByType(request.getParameter("policyType"));
				
				sess.setAttribute("policynames", pnames);
				
				sess.setAttribute("policyType", request.getParameter("policyType"));
								
				response.sendRedirect("buy_policy2.jsp");
			}
			catch( SQLException e1)
			{
			}
		}
		else if (request.getParameter("buyPolicy2Submit") != null)
		{
			try 
			{
				int number = p.getNumNomineesOfPolicy(request.getParameter("policyName"));
				
				sess.setAttribute("number", number);
				
				sess.setAttribute("policy", request.getParameter("policyName"));
				
				sess.setAttribute("type", request.getAttribute("policy_type"));
				
				response.sendRedirect("buy_policy.jsp");

			}
			catch(SQLException e1)
			{
			}
		}
		else if (request.getParameter("buyPolicySubmit") != null)
		{
			try
			{
				String policyName = request.getParameter("policy");
				
				int number = Integer.parseInt(request.getParameter("numNominees"));
				
				String[] nominees = new String[number];
				String[] relationship = new String[number];
				String[] percentage = new String[number];
				
				for(int i=0; i< number; i++)
				{
					nominees[i] = request.getParameter("nominee" + Integer.toString(i+1));
				}
				
				for(int i=0; i< number; i++)
				{
					relationship[i] = request.getParameter("relationship" + Integer.toString(i+1));
				}
				
				for(int i=0; i< number; i++)
				{
					percentage[i] = request.getParameter("percentage" + Integer.toString(i+1));
				}
				
		        int premium_rate = Integer.parseInt( request.getParameter("premiumRateRadio"));
		        int premium_amount = Integer.parseInt( request.getParameter("amount"));
		        String birthCert = request.getParameter("birthcertificate");
		        String pancard = request.getParameter("pancard");
		        int agentID = Integer.parseInt(request.getParameter("agentID"));
		        int customerID = Integer.parseInt(request.getParameter("customerID"));
		        String date = request.getParameter("policyDate");
		        String medical_details = request.getParameter("medDetails");
		        String type = request.getParameter("type");
		        
		        p.buyPolicy(policyName, customerID, agentID, date, premium_rate,premium_amount,medical_details);
		        

			}
			catch ( SQLException e1)
			{

			}
		}
				/*
				
				if(request.getParameter("nominee") == null)
				{
					
					
					try{
						
						
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
				}*/
		else if(request.getParameter("generateCertificateSubmit")!=null)
	       {
	           HttpSession session = request.getSession();
	           System.out.println("in generate certificate");

	           try {
	           ArrayList<String> pd =    p.generateCertificate(request.getParameter("policyId"), request.getParameter("customerId"));
	           System.out.println(pd);

	           String polid = pd.get(0);
	           String polname = pd.get(1);
	           String cusid = pd.get(2);
	           String sumass = pd.get(3);
	           String prem = pd.get(4);
	           String ten = pd.get(5);

	           session.setAttribute("polid", polid);
	           session.setAttribute("polname", polname);
	           session.setAttribute("cusid", cusid);
	           session.setAttribute("sumass", sumass);
	           session.setAttribute("prem", prem);
	           session.setAttribute("ten", ten);
	           
	           } catch (SQLException e1) {
	               // TODO Auto-generated catch block
	               e1.printStackTrace();
	           }

	           response.sendRedirect("generate_policy_certificate.jsp");
	       }
		
		
		String route = request.getParameter("formName");
		
		//delete policy logic
//		if(route.equals("deletePolicy"))
//		{
//			try
//			{
//				PolicyOperations po = new PolicyOperations();
//				
//				System.out.println(request.getParameter("policyID"));
//				
//				po.deletePolicy(request.getParameter("policyID"));
//				
//				response.sendRedirect("delete_policy.jsp");
//			}
//			catch (SQLException e)
//			{
//				
//			}
//		}
		
		
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
	}
}
}	
}	