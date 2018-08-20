<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Policy.PolicyManagement.PolicyOperations"%>

<link href="/PolicyManagement/sidebar.css" rel="stylesheet">

<% 
	PolicyOperations p = new PolicyOperations();
	ArrayList<String> pnames = null;
	try{
		pnames = p.getAllPolicyNames();
		if(pnames.isEmpty())
		{
			request.setAttribute("noPolicies",1);
		}
		else
		{
			request.setAttribute("noPolicies",0);
		}
		
	}catch(Exception e){
		
	}
	request.setAttribute("policynames",pnames);
%>


<t:genericpage userType="Admin"> 

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid"> 
            
            <div id ="show" class = "show"></div>	
            </div>  
            
            <div id="deletePolicyUI">
            <h2>Delete Policy</h2>
            
            <div id="noPolicyUI" hidden>
				<h2>No Policies to delete. 
				Please create a policy before you delete it.</h2>
		    </div>
	                    
			<form id="deletePolicy">
				<div class="form-group">
				    <label for="exampleFormControlSelect1">Policy</label>
				    <select class="form-control" id="policyName" name="policyName">
				      <c:forEach items="${policynames}" var="policy">
						<option value=<c:out value="${policy}"/>><c:out value="${policy}"/></option>
					 </c:forEach>
				    </select>
				 </div>
				 <input type="hidden" name="deletePolicySubmit" value="deletePolicySubmit">
				 <button type="submit" class="btn btn-danger"> Submit</button>
			</form>
		    </div>

			 <!-- Success Notification -->
             <div id="success" class="alert alert-success alert-dismissible" role="alert" hidden>
			  Successfully deleted policy!
			  	<button type="button" class="close" data-dismiss="alert" aria-label="Close">
   					<span aria-hidden="true">&times;</span>
					</button>
			 </div>
			 <!-- Error Notification -->
			 <div id="error" class="alert alert-danger alert-dismissible" role="alert" hidden>
			  Error in creating policy.
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    <span aria-hidden="true">&times;</span>
			  </button>
			 </div>
				
			
        </div>
        <!-- /#page-content-wrapper -->
</t:genericpage>

<script>
	// Logic on submit button must be implemented later!!!
	$(document).ready(function(){
				
		if (0){
			$("#noPolicyUI").show();
			$("#deletePolicyUI").hide();			
		}
		else {
			$("#noPolicyUI").hide();
			$("#deletePolicyUI").show(); //update List dynamically 		
		}
		
		
 		$("#deletePolicy").submit(function(e){
	    	
	    	e.preventDefault();
	    	
	    	$.ajax(
	                {
	                    type: "get",
	                    url: "/PolicyManagement/MainServlet",
	                  	data: $("#deletePolicy").serialize(),
	                  	
	                    success: function(data, textStatus, jqXHR){
	            	    	$("#success").removeAttr("hidden");
	                    },
	                    error: function(jqXHR){
	                   	
	                  	}
	                });
 		});
	});

</script>


		
