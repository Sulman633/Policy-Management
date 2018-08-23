<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:genericpage userType="admin">   
            	
            	<div class="col-md-2"></div>
            	
            	<div class="col-md-8">
           	            	 
	                <form id = "createPolicy" style="border:1px solid black; padding:2em ; text-align:center; border-radius: 10px;" >
	                
	                  <h2>Create Policy</h2><hr>
	                  
					  <div class="form-group">
					    <label for="PolicyName">Policy Name:</label>
					    <input type="text" class="form-control" id="PolicyName" name = "Policyname" placeholder="Policy Name" onblur="checkValidation()" required>
					  </div>
					  
					  <label for="Type">Type:</label><br>
					  
					   <div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="typeRadio" id="type1" value="Accidental" checked="checked">
						  <label class="form-check-label" for="inlineRadio1">Accidental</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="typeRadio" id="type2" value="Whole Life">
						  <label class="form-check-label" for="inlineRadio2">Whole Life</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" name="typeRadio" type="radio" id="type3" value="Term">
						  <label class="form-check-label" for="inlineRadio3">Term</label>
						</div>			  
						<div class="form-check form-check-inline">
						  <input class="form-check-input" name="typeRadio" type="radio" id="type4" value="Pension">
						  <label class="form-check-label" for="inlineRadio3">Pension</label>
						</div>		
						<br><br>
					  <div class="form-group">
					    <label for="NumberNominees">Number of Nominees Required:</label>
					    <input type="number" min="1" max="10" class="form-control" id="NumberNominees" name = "Numbernominees" placeholder="1">
					  </div>
					  
					  <label for="Tenure">Tenure:</label><br>
					  
				 	  <div class="form-check form-check-inline">	  
						  <input class="form-check-input" type="radio" name="tenureRadio" id="tenure1" value=1 checked="checked">
						  <label class="form-check-label" for="inlineRadio1">1</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" name="tenureRadio" type="radio" id="tenure2" value=2>
						  <label class="form-check-label" for="inlineRadio2">2</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" name="tenureRadio" type="radio" id="tenure3" value=4>
						  <label class="form-check-label" for="inlineRadio3">4</label>
						</div>
						<br>
						<br>
						<div class="form-group">
						    <label for="SunmAssured">Sum Assured (1 lakh to 50 lakh):</label>
						    <input type="number" min="1" max="50" class="form-control" id="SumAssured" name ="Sumassured" placeholder="1">
						</div>
					  <div class="form-group">
					    <label for="Prerequisites">Pre-requisites:</label>
					    <input type="text" class="form-control" id="Prerequisites" name = "Prerequ" onblur="checkValidation()">
					  </div>
					  <br/>
					  <input type="hidden" name="createPolicySubmit" value="createPolicySubmit">
					 <button id="submitForm" type="submit" class="btn btn-primary"> Submit</button>
					</form>
					<!-- Success Notification -->
				        <div id="success" class="alert alert-success alert-dismissible" role="alert" hidden>
						  Successfully created policy!
							<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				   				<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<!-- Error Notification -->
						<div id="error" class="alert alert-danger alert-dismissible" role="alert" hidden>
							Cannot create policy.
							<button type="button" class="close" data-dismiss="alert" aria-label="Close">
							    <span aria-hidden="true">&times;</span>
							</button>
						</div>
				</div>
				<div class="col-md-2"></div>
      
</t:genericpage>

<script>
//Validation
	function checkValidation(){
	    var name = document.getElementById('PolicyName').value;
	    var prereq = document.getElementById('Prerequisites').value;
	
	    if (/[^a-zA-Z0-9 ]/.test(name)){
	    	alert('Policy Name cannot contain special characters');
	    	document.getElementById("submitForm").disabled = true;
	    }
	    
	    else if (/[^a-zA-Z0-9 ]/.test(prereq)) {
	    	alert('Pre-requisites cannot contain special characters');
	    	document.getElementById("submitForm").disabled = true;
	    }
	    
	    else {
	    	document.getElementById("submitForm").disabled = false;
	    }
	}
	// Logic on submit button must be implemented later!!!
	$(document).ready(function(){
		
 		$("#createPolicy").submit(function(e){		    
	    	e.preventDefault();
	    	
	    	$.ajax(
	                {
	                    type: "get",
	                    url: "/PolicyManagement/MainServlet",
	                  	data: $("#createPolicy").serialize(),
	                  	
	                    success: function(data, textStatus, jqXHR){
	            	    	$("#success").removeAttr("hidden");
	                    },
	                    error: function(jqXHR){
	                    	$("#error").removeAttr("hidden");
	                  	}
	                });
 		});
	});

	                    	    
</script>


