<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Policy.PolicyManagement.PolicyOperations"%>

<link href="/PolicyManagement/sidebar.css" rel="stylesheet">
<% 
	String cusID = "1";
	PolicyOperations p = new PolicyOperations();
	ArrayList<String> al = null;
	try{
		al = p.getPolicyByCustomer(cusID);
	}catch(Exception e){
		
	}
	request.setAttribute("policynames",al);
%>
<t:genericpage userType="customer">   


      <!-- 1/2 -->
		<div id="selectPolicyUI">
			<h2>View own Policy</h2>
			<h3>dynamically update form</h3>
			<form id="selectPolicy">
			<select>
				<c:forEach items="${policynames}" var="policy">
			<option value=<c:out value="${policy}"/>><c:out value="${policy}"/></option>
					</c:forEach>
				</select>
				<input type="submit" name="selectPolicySubmit" value="Enter">
			</form>
		</div>      

      <br>
      <br>
      
      
      <!-- 2/2 -->
      <div id="policyDetails">
	      <p>Policy ID: ></p>
	      <p>Policy Name:</p>
	      <p>Tenure:></p>
	      <p>Premium: </p>   
	      <p>Nominee:  %>></p>   
	      <p>Sum Assured:  %>></p>   
	      <p>Policy Expiry Date: %>></p>            
      </div>

<style>
#policyDetails{
	text-align: center;
}

</style>
</t:genericpage>


