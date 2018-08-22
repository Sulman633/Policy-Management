<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Policy.PolicyManagement.PolicyOperations"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="/PolicyManagement/sidebar.css" rel="stylesheet">

<%
PolicyOperations p = new PolicyOperations();
ArrayList<Integer> pid = null;
try{
	pid = p.getAllPolicyID();
	if(pid.isEmpty())
	{
		request.setAttribute("noPolicies",1);
	}
	else
	{
		request.setAttribute("noPolicies",0);
	}
	
}catch(Exception e){
	
}
request.setAttribute("policyid",pid);

ArrayList<Integer> cid = null;
{
	try{
	cid = p.getAllCustomerID();
	if(cid.isEmpty())
	{
		request.setAttribute("noCustomer",1);
	}
	else
	{
		request.setAttribute("noCustomer",0);
	}
	
}catch(Exception e){
	
}
request.setAttribute("customerid",cid);
	
}

%>

<t:genericpage userType="manager">   
 	 <!-- Page Content -->
      
            <div class="col-md-2"></div>
            
            <div class="col-md-8">
            
            	<form id="generateCertificate" style="border:1px solid black; padding:2em ; text-align:center; border-radius: 10px;">
					<h2>Generate Certificate</h2>
					<div class="form-group">
					    <label for="exampleFormControlSelect1">Policy</label>
					    <select class="form-control" id="policyId" name="policyId">
					      <c:forEach items="${policyid}" var="policyID">
							<option value=<c:out value="${policyID}"/>><c:out value="${policyID}"/></option>
						 </c:forEach>
					    </select>
					     <label for="exampleFormControlSelect1">Customers</label>
					    <select class="form-control" id="customerId" name="customerId">
					      <c:forEach items="${customerid}" var="customerID">
							<option value=<c:out value="${customerID}"/>><c:out value="${customerID}"/></option>
						 </c:forEach>
					    </select>
					 </div>
					 <input type="hidden" name="generateCertificateSubmit" value="generateCertificateSubmit">
					 <button type="submit" class="btn btn-primary"> Submit</button>
				</form>   
            </div>
            
            <div class="col-md-2"></div>
	                   
</t:genericpage>



<style>

.inline
    {
    display: inline;

    }
</style>


<script>
	// Logic on submit button must be implemented later!!!
	$(document).ready(function(){
				
		if (0){
			$("#noPolicyUI").show();
			$("#generateCertificateUI").hide();			
		}
		else {
			$("#noPolicyUI").hide();
			$("#generateCertificateUI").show(); //update List dynamically 		
		}
		
		
 		$("#generateCertificate").submit(function(e){
	    	
	    	e.preventDefault();
	    	
	    	$.ajax(
	                {
	                    type: "get",
	                    url: "/PolicyManagement/MainServlet",
	                  	data: $("#generateCertificate").serialize(),
	                  	
	                    success: function(data, textStatus, jqXHR){
	                    	window.location.replace("getDataForCertificate.jsp");
	                    	//alert("hi");
	            	    	$("#success").removeAttr("hidden");
	                    },
	                    error: function(jqXHR){
	                   	
	                  	}
	                });
 		});
	});

</script>
