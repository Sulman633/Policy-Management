package com.Policy.PolicyManagement;
import java.io.IOException;
import java.io.PrintWriter;
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
import javax.servlet.http.HttpSession;


/**
 * MainServlet implementation class MainServlet
 */
@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession sess ;
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
			}
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
		//Create object to run policy operations
		
	

		if(request.getParameter("createSubmit") != null) {
			System.out.println("here");
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
