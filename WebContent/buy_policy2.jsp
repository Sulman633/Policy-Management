<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Policy.PolicyManagement.PolicyOperations"%>

<% 

	session.getAttribute("policynames");
	session.getAttribute("policyType");
	
%>

<t:genericpage userType="customer">   
               
               <div class="col-md-2"></div>
               
               <div class="col-md-8">
				
				   <form id="buyPolicy" style="border:1px solid black; padding:2em ; text-align:center; border-radius: 10px;" method="get" action="/PolicyManagement/MainServlet">
					
						<h2>Buy Policy</h2><hr>
						  
						  <!-- Make list of policies based on type of insurance -->
						  
						  <div class="form-group" id="policies">
						  	<label for="policyName">Policy</label>
						  	<select class="form-control" id="policyName" name="policyName">
							  	<c:forEach items="${policynames}" var="policy">
									<option value=<c:out value="${policy}"/>><c:out value="${policy}"/></option>
							 	</c:forEach>
						  	</select>
						  </div>

				    	<input type="hidden" name="buyPolicy2Submit" value="buyPolicy2Submit">
				    	
				    	<input type="hidden" name="policy_type" value="<c:out value="${policyType}"/>">
				    	
						<button type="submit" class="btn btn-primary">Submit</button>
					</form>
				
				</div>
				
				<div class="col-md-2"></div>

</t:genericpage>

<script>
</script>