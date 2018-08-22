<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>


<link href="/PolicyManagement/sidebar.css" rel="stylesheet">


<!-- Written by Khalid / Sulman -->
<%
	session.getAttribute("policyDetails"); 
%>

<t:genericpage userType="Admin"> 
		
        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">   
            
            
	            <div id="updatePolicyUI">
	                 <h1>Update Policy</h1>
	               	 <h3>Set placeholder values in form based on requested policy</h3>
					<form id="updatePolicyForm">
					  <div class="form-group">
					    <label for="PolicyName">Policy Name:</label>
	
					    <input required type="text" class="form-control" id="PolicyName" name="Pname" 
					    value="${policyDetails[0]}">
					  </div>			  
					  <div class="form-group">
					    <label for="NumberNominees">Number of Nominees Required:</label>
					    <input value="${policyDetails[1]}" type="number" min="1" max="10" class="form-control" name="Nominees" step="1" id="NumberNominees" pattern="\d+" required>
					  </div>	  
					  
					    <div class="form-check form-check-inline">
					  	  <label for="Tenure">Type of Policy:</label></br>
	
						  <input class="form-check-input" type="radio" name="typeRadio" id="type1" value="Accidental" ${policyDetails[2] == 'Accidental' ? 'checked' : ''}>
						  <label class="form-check-label" for="inlineRadio1">Accidental</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="typeRadio" id="type2" value="Whole Life" ${policyDetails[2] == 'Whole Life' ? 'checked' : ''}>
						  <label class="form-check-label" for="inlineRadio2">Whole Life</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="typeRadio" id="type3" value="Term" ${policyDetails[2] == 'Term' ? 'checked' : ''}>
						  <label class="form-check-label" for="inlineRadio3">Term</label>
						</div>			  
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="typeRadio" id="type4" value="Pension" ${policyDetails[2] == 'Pension' ? 'checked' : ''}>
						  <label class="form-check-label" for="inlineRadio3">Pension</label>
						</div>			  
					    <div class="form-check form-check-inline">
					  	  <label for="Tenure">Tenure:</label></br>
						  <input class="form-check-input" type="radio" name="tenureRadio" id="tenure1" value="4" ${policyDetails[3] == '4' ? 'checked' : ''}>
						  <label class="form-check-label" for="inlineRadio1">Quarterly</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="tenureRadio" id="tenure2" value="2" ${policyDetails[3] == '2' ? 'checked' : ''}>
						  <label class="form-check-label" for="inlineRadio2">Halfway</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="tenureRadio" id="tenure3" value="1" ${policyDetails[3] == '1' ? 'checked' : ''}>
						  <label class="form-check-label" for="inlineRadio3">Annually</label>
						</div>
						<div class="form-group">
						    <label for="SumAssured">Sum Assured (1 lakh to 50 lakh):</label>
	
						    <input value="${policyDetails[4]}" type="number" min="1" max="50" class="form-control" id="SumAssured" name="SumAssured" step="0.01" required>
						</div>
					  <div class="form-group">
						    <label for="Prerequisites">Pre-requisites:</label>
						    <textarea class="form-control" id="Prerequisites" name="Prerequisites" rows="3" > ${policyDetails[5]} </textarea>
					  </div>
					  <button type="submit" name="updateSubmit" class="btn btn-primary">Submit</button>
					  <input type="hidden" value="updatePolicySubmit" name="UpdatePolicySubmit">
					  
					</form>
	            </div>
	            
				 <!-- Success Notification -->
	             <div id="success" class="alert alert-success alert-dismissible" role="alert" hidden>
				  Successfully updated policy!
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

	$(document).ready(function(){

	    $("#updatePolicyForm").submit(function(e){
	    	$.ajax(
	                {
	                    type: "get",
	                    url: "/PolicyManagement/MainServlet", //Your full URL goes here
	                  	data: $("#updatePolicyForm").serialize(),
	               
	                    success: function(data, textStatus, jqXHR){	
	                    	console.log($("#updatePolicyForm").serialize());
	                    	$("#error").attr("hidden","hidden");
	                    	$("#success").removeAttr("hidden");	   
	                    	},
	                    error: function(jqXHR){
	                    	
	                }
	        });
	    	
	    	//Query 2 get policy details from DB with policy selected
	    	e.preventDefault();
	   
	    });
	    
	});
</script>