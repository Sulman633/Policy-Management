package com.Policy.PolicyManagement;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Servlet
 */
@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String policyName = request.getParameter("Pname");
		String nominees = request.getParameter("Nominees");
		String typePolicy = request.getParameter("typeRadio");
		String tenure = request.getParameter("tenureRadio");
		String sumAssured = request.getParameter("SumAssured");
		String prereq = request.getParameter("Prereq");
		
		System.out.println(policyName);
		System.out.println(nominees);
		System.out.println(typePolicy);
		System.out.println(tenure);
		System.out.println(sumAssured);
		System.out.println(prereq);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
