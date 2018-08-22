<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Policy.PolicyManagement.PolicyOperations"%>



<!-- Written by Sulman -->
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
		
    <div class="col-md-2"></div>
            	
            	<div class="col-md-8">
       
            <div id="noPolicyUI">
				<h2>No Policies to update. 
				Please create a policy before you update it.</h2>
		    </div>
		
		    
            
            <div  id="selectPolicyUI">
			<h3>Select policy to update:</h3>
			<br/>
			<form id="selectPolicyForm" class="form-group">
				
					<input type="hidden" value="selectPolicySubmit" name="SelectPolicySubmit">
					<select class="form-control" name="selectPolicyInput" id="selectPolicyInput">
						<c:forEach items="${policynames}" var="policy">
							<option value="${policy}">${policy}</option>
						</c:forEach>
					</select>
					<br/>
				<input type="submit" value="Enter" class="btn btn-primary">
				
			</form>
		    </div>
		</div>
	<div class="col-md-2"></div>			
         
       
</t:genericpage>

<script>

	$(document).ready(function(){
		
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