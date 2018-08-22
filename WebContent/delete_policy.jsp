<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Policy.PolicyManagement.PolicyOperations"%>


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


<t:genericpage userType="admin"> 
        	
            	<div class="col-md-2"></div>
            	
            	<div class="col-md-8">
	            	<c:if test = "${noPolicies == 1}">
						<h2>No Policies to delete</h2>
				    </c:if>
				              
					<form id="deletePolicy" style="border:1px solid black; padding:2em ; text-align:center; border-radius: 10px;">
						<h2>Delete Policy</h2><hr>
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
					<!-- Success Notification -->
			        <div id="success" class="alert alert-success alert-dismissible" role="alert" hidden>
					  Successfully deleted policy!
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			   				<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<!-- Error Notification -->
					<div id="error" class="alert alert-danger alert-dismissible" role="alert" hidden>
						Cannot delete policy.
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
						
 		$("#deletePolicy").submit(function(e){
	    	
	    	e.preventDefault();
	    	
	    	$.ajax(
	                {
	                    type: "get",
	                    url: "/PolicyManagement/MainServlet",
	                  	data: $("#deletePolicy").serialize(),
	                  	
	                    success: function(data, textStatus, jqXHR){
	                    	$("#error").attr("hidden");
	            	    	$("#success").removeAttr("hidden","hidden");
	                    },
	                    error: function(jqXHR){
	                    	alert("error");
	                    	$("#error").removeAttr("hidden");
	                    	$("#success").attr("hidden","hidden");
	                  	}
	                });
 		});
	});

</script>


		
