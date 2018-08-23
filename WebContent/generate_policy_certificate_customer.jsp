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
	pid = p.getAllPolicyIDCustomer();
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


%>

<t:genericpage userType="customer">   
 	 <!-- Page Content -->
      
            <div class="col-md-2"></div>
            
            <div class="col-md-8">
            
            	<form id="generateCertificate" style="border:1px solid black; padding:2em ; text-align:center; border-radius: 10px;">
					<h2>Generate Certificate</h2>
					<div class="form-group">
					    <label for="exampleFormControlSelect1">Policy</label>
					    <select class="form-control" id="policyIdCus" name="policyIdCus">
					      <c:forEach items="${policyid}" var="policyId">
							<option value=<c:out value="${policyId}"/>><c:out value="${policyId}"/></option>
						 </c:forEach>
					    </select>
					     </div>
					 <input type="hidden" name="generateCertificateCustomerSubmit" value="generateCertificateCustomerSubmit">
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
