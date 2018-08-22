<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Policy.PolicyManagement.PolicyOperations"%>


<t:genericpage userType="customer">   
                              
               <div class="col-md-2"></div>
               
               <div class="col-md-8">
               
				
					<form id="buyPolicy1" style="border:1px solid black; padding:2em ; text-align:center; border-radius: 10px;" method="get" action="/PolicyManagement/MainServlet">
					
						<h2>Buy Policy</h2><hr>
						
						<div class="form-group">
						    <label for="policyType">Type of Insurance:</label>
						    <select class="form-control" id="policyType" name="policyType">
						      <option value="Accidental">Accidental</option>
						      <option value="Whole Life">Whole Life</option>
						      <option value="Term">Term</option>
						      <option value="Pension Scheme">Pension Scheme</option>
						    </select>
						  </div>
			
				    	
				    	<input type="hidden" name="buyPolicy1Submit" value="buyPolicy1Submit">
				    	
						<button type="submit" class="btn btn-primary">Submit</button>
					</form>
					
									 <!-- Success/Error alerts -->
	                <div id="success" class="alert alert-success alert-dismissible" role="alert" hidden>
					  Successfully created policy!
					  	<button type="button" class="close" data-dismiss="alert" aria-label="Close">
	    					<span aria-hidden="true">&times;</span>
	 					</button>
					</div>
					<div id="error" class="alert alert-danger alert-dismissible" role="alert" hidden>
					  Error in creating policy.
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
						    <span aria-hidden="true">&times;</span>
					  </button>
					</div>
				
				</div>
				
				<div class="col-md-2"></div>
				
</t:genericpage>

<script>
	// Logic on submit button must be implemented later!!!
	
	
	$(document).ready(function(){	
		// Submit functionality
	 /*   $("#buyPolicy1").submit(function(e){
	    		    	
	    	$.ajax(
	                {
	                    type: "get",
	                    url: "/PolicyManagement/MainServlet", //Your full URL goes here
	                  	data: $("#buyPolicy1").serialize(),
	                  	
	                    success: function(data, textStatus, jqXHR){
	                    	window.location.replace("buy_policy.jsp");      
	                    },
	                    error: function(jqXHR,textStatus, thrownError){
	                    	window.location.replace("buy_policy.jsp");
	                   }
	                });

	    });		*/

	});
</script>