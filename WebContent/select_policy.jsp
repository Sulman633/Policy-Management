<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Policy.PolicyManagement.PolicyOperations"%>

<link href="/PolicyManagement/sidebar.css" rel="stylesheet">


<!-- Written by Khalid / Sulman -->
<%
	PolicyOperations p = new PolicyOperations();
	ArrayList<String> al = null;
	try{
		al = p.getAllPolicyNames();
	}catch(Exception e){
		
	}
	request.setAttribute("policynames", al);
%>

<t:genericpage userType="Admin"> 
		
        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">   
            
            
            <!-- UI 1/3 -->
            <div id="noPolicyUI">
				<h2>No Policies to update. 
				Please create a policy before you update it.</h2>
		    </div>
		
		    <!-- UI 2/3 -->
            
            <div id="selectPolicyUI">
			<h3>dynamically update form</h3>
			<form id="selectPolicyForm">
				<select name="selectPolicyInput" id="selectPolicyInput">
					<c:forEach items="${policynames}" var="policy">
						<option value="${policy}">${policy}</option>
					</c:forEach>
				</select>
				<input type="hidden" value="selectPolicySubmit" name="SelectPolicySubmit">
				<input type="submit" value="Enter" >
				
			</form>
		    </div>
		   					
            </div>
        </div>
        <!-- /#page-content-wrapper -->
</t:genericpage>

<script>
	// Logic on submit button must be implemented later!!!
	$(document).ready(function(){
		var queryCount = 1;//query 1, return all policies from DB
		
		if (queryCount <= 0){
			$("#noPolicyUI").show();
			$("#selectPolicyUI").hide();
			$("#updatePolicyUI").hide();			
		}
		else {
			$("#noPolicyUI").hide();
			$("#selectPolicyUI").show(); //update List dynamically 
			$("#updatePolicyUI").hide();			
		}
	    $("#selectPolicyForm").submit(function(e){
	    	$.ajax(
	                {
	                    type: "get",
	                    url: "/PolicyManagement/MainServlet", //Your full URL goes here
	                  	data: $("#selectPolicyForm").serialize(),
	               
	                    success: function(data, textStatus, jqXHR){	
	                    	console.log($("#selectPolicyForm").serialize());
	                    	$("#success").removeAttr("hidden");
	                     	window.location.replace("update_policy.jsp");
	                    },
	                    error: function(jqXHR){
	                    	
	                }
	        });
	    	e.preventDefault();
	
	    });
	        

	});
	
</script>