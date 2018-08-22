<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Policy.PolicyManagement.PolicyOperations"%>

<link href="/PolicyManagement/sidebar.css" rel="stylesheet">


<!-- Written by Khalid -->
<% 
	PolicyOperations p = new PolicyOperations();
	ArrayList<String> al = null;
	try{
		al = p.getAllPolicyNames();
	}catch(Exception e){
		
	}
	request.setAttribute("policynames",al);
%>
<t:genericpage userType="admin"> 
		
        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">   
            
            
            <!-- UI 1/3 -->
            <div id="noPolicyUI">
                <h2>Update Policy</h2>
				<h2>No Policies to update. 
				Please create a policy before you update it.</h2>
		    </div>
		
		    <!-- UI 2/3 -->
            
            <div id="selectPolicyUI">
            <h2>Update Policy</h2>
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
		    
		    <!-- UI 3/3 -->
            
            <div id="updatePolicyUI">
                 <h2>Update Policy</h2>
               	 <h3>Set placeholder values in form based on requested policy</h3>
				<form id="updatePolicyForm">
				  <div class="form-group">
				    <label for="PolicyName">Policy Name:</label>

				    <input type="text" class="form-control" id="PolicyName" name="Pname" placeholder="Policy Name" onblur="checkValidation()" required>
				  </div>			  
				  <div class="form-group">
				    <label for="NumberNominees">Number of Nominees Required:</label>
				    <input type="number" min="1" max="10" class="form-control" name="Nominees" step="1" id="NumberNominees" pattern="\d+" required>
				  </div>	  
				  
				    <div class="form-check form-check-inline">
				  	  <label for="Tenure">Type of Policy:</label></br>

					  <input class="form-check-input" type="radio" name="typeRadio" id="type1" value="Accidental" checked="checked">
					  <label class="form-check-label" for="inlineRadio1">Accidental</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="typeRadio" id="type2" value="Whole Life">
					  <label class="form-check-label" for="inlineRadio2">Whole Life</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="typeRadio" id="type3" value="Term">
					  <label class="form-check-label" for="inlineRadio3">Term</label>
					</div>			  
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="typeRadio" id="type4" value="Pension">
					  <label class="form-check-label" for="inlineRadio3">Pension</label>
					</div>			  
				    <div class="form-check form-check-inline">
				  	  <label for="Tenure">Tenure:</label></br>
					  <input class="form-check-input" type="radio" name="tenureRadio" id="tenure1" value="Quarterly" checked="checked">
					  <label class="form-check-label" for="inlineRadio1">Quarterly</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="tenureRadio" id="tenure2" value="Halfway">
					  <label class="form-check-label" for="inlineRadio2">Halfway</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="tenureRadio" id="tenure3" value="Annually">
					  <label class="form-check-label" for="inlineRadio3">Annually</label>
					</div>
					<div class="form-group">
					    <label for="SumAssured">Sum Assured (1 lakh to 50 lakh):</label>

					    <input type="number" min="1" max="50" class="form-control" id="SumAssured" name="SumAssured" step="0.01" required>
					</div>
				  <div class="form-group">
				    <label for="Prerequisites">Pre-requisites:</label>
				    <textarea class="form-control" id="Prerequisites" name="Prerequisites" rows="3"></textarea>
				  </div>
				  <button id="submitForm" type="submit" name="updateSubmit" class="btn btn-primary" onclick="checkValidation()">Submit</button>
				</form>
            </div>
            
			 <!-- Success Notification -->
             <div id="success" class="alert alert-success alert-dismissible" role="alert" hidden>
			  Successfully created policy!
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
        </div>
        <!-- /#page-content-wrapper -->
</t:genericpage>

<script>
	//Validation
	function checkValidation(){
	    var name = document.getElementById('PolicyName').value;
	
	    if(/[^a-zA-Z0-9]/.test(name)){
	    	alert('Policy Name cannot contain special characters');
	    	document.getElementById("submitForm").disabled = true;
	    }
	    
	    else {
	    	document.getElementById("submitForm").disabled = false;
	    }
	}
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
		
	    $("#selectPolicyUI").submit(function(e){
	    	$.ajax(
	                {
	                    type: "get",
	                    url: "/PolicyManagement/Servlet", //Your full URL goes here
	                  	data: $("#updatePolicyForm").serialize(),
	                  	
	                    success: function(data, textStatus, jqXHR){
	                    	$("#success").removeAttr("hidden");
	                    	$("#error").attr("hidden","hidden");             
	                    },
	                    error: function(jqXHR){
	                    	
	                }
	        });
	    	$("#selectPolicyUI").hide();
	    	//Query 2 get policy details from DB with policy selected
	    	$("#updatePolicyUI").show(); 
	    	$("#PolicyName").attr("value","Car Insurance Policy");
	    	e.preventDefault();
	    	//fill new form here
	    	//TODO dynamically update the form values
	    	$("#PolicyName").attr("value","Car Insurance Policy");
	    	$("#NumberNominees").attr("value","5");
	    	$("#type4").attr("checked","checked");
	    	$("#tenure2").attr("checked","checked");
	    	$("#SumAssured").attr("value","17");
	    	$("#Prerequisites").attr("value","None");
	  
	    });
	    
		//query 3
		/*
		take data from filled form
		update Policy DB call
		success nofication 
		*/
		
		
	    $("#selectPolicy").submit(function(e){
	    	
		    
	    	e.preventDefault();
	    	$.ajax(
	                {
	                    type: "get",
	                    url: "/PolicyManagement/Servlet", //Your full URL goes here
	                  	data: $("#selectPolicy").serialize(),
	                  	
	                    success: function(data, textStatus, jqXHR){
	                    	$("#success").removeAttr("hidden");
	                    	$("#error").attr("hidden","hidden");             
	                    },
	                    error: function(jqXHR){
	                    	
	                }
	       	});

	    });
	    
	    

	});
</script>