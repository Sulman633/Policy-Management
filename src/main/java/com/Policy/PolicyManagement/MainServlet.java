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
			catch( SQLException e)
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
			catch(SQLException e)
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
			catch ( SQLException e)
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


	           } catch (SQLException e) {
	               // TODO Auto-generated catch block
	               e.printStackTrace();
	           }

	           response.sendRedirect("generate_policy_certificate.jsp");
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