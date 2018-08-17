<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<link href="/PolicyManagement/sidebar.css" rel="stylesheet">

<t:genericpage userType="Admin">   
        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">                
               
				
				<form id="buyPolicy">
				<div class="form-group">
				    <label for="InsuranceType">Type of Insurance:</label>
				    <select class="form-control" id="InsuranceType">
				      <option>Accidental</option>
				      <option>Whole Life</option>
				      <option>Term</option>
				      <option>Pension Scheme</option>
				    </select>
				  </div>
				  
				  <!-- Make list of policies based on type of insurance -->
				  <!-- Make tenure dropdown based on policy -->
				  
				  <div class="form-group">
					  <div class="row">
				            <div class=" col-xs-6">
				                <label for="Nominee" class="control-label">Nominee:</label>
				                <input type="text" class="form-control" id="Nominee" placeholder="Name" required>
				            </div>
				            <div class=" col-xs-6">
				                <label for="Relationship" class="control-label">Relationship:</label>
				                <input type="text" class="form-control" id="Relationship" placeholder="Relationship" required>
				            </div>
				        </div>
				  </div>				  
				  <div class="form-check form-check-inline">
				  	  <label for="PremiumType">Premium Type:</label><br>
					  <input class="form-check-input" type="radio" name="PremiumRadio" id="premium1" value="Quarterly" checked="checked">
					  <label class="form-check-label" for="inlineRadio1">Quarterly</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="premiumRadio" id="premium2" value="Halfway">
					  <label class="form-check-label" for="inlineRadio2">Halfway</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="premiumRadio" id="premium3" value="Annually">
					  <label class="form-check-label" for="inlineRadio3">Annually</label>
					</div>
					
				  <div class="form-group">
				    <label for="SumAssured">Sum Assured:</label>
				    <select class="form-control" id="SumAssured">
				    </select>
				  </div>
				    
				    <!-- Premium amount value dynamically shown -->
				    <div class="form-group">
		    			<label>Date Of Birth:</label>
		    		    <input id="birthDate" type='date' class="form-control" min='1899-01-01' max='2000-13-13' required><br>
		    		    <label>Birth Certificate:</label><br>
		    		    <label class="custom-file">
							<input type="file" id="birthcertificate" class="custom-file-input" required>
							<span class="custom-file-control"></span>
						</label>
		    		</div>
		    		
		    		<div class="form-group">
			    		<label>Pan card:</label><br>
			    		<label class="custom-file">
						  <input type="file" id="pancard" class="custom-file-input" required>
						  <span class="custom-file-control"></span>
						</label>
					</div>
					
					<!-- Medical details -->
		    		
		    		<div class="form-group">
					    <label for="AgentID">Agent ID:</label>
					    <input type="number" class="form-control" id="AgentID" name="aName" placeholder="ID" required>
					</div>	
		    		
		    		<div class="form-group">
		    			<label>Policy Initiation Date:</label>
						<input id="policyDate" type='date' class="form-control" min='1899-01-01' max='2000-13-13'required>
		    		</div>
				  <button type="submit" class="btn btn-primary">Submit</button>
				</form>
				 <!-- Success/Error alerts -->
                <div id="success" class="alert alert-success alert-dismissible" role="alert" hidden>
				  Successfully created policy!
				  	<button type="button" class="close" data-dismiss="alert" aria-label="Close">
    					<span aria-hidden="true">&times;</span>
 					</button>
				</div>
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
	// Logic on submit button must be implemented later!!!
	
	
	$(document).ready(function(){
		
		// Date script
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear();
		 if(dd<10){
		        dd='0'+dd
		    } 
		    if(mm<10){
		        mm='0'+mm
		    } 

		today = yyyy+'-'+mm+'-'+dd;
		document.getElementById("birthDate").setAttribute("max", today);
		document.getElementById("policyDate").setAttribute("max", today);
		
		
		// Select options 1 to 50
		for (var i = 1; i <= 50; i++) {
			var selectItem = document.createElement("option");
			selectItem.textContext = i;
			
			$("#SumAssured").append($('<option>', {
			    value: i,
			    text: i
			}));
		}
		
		// Submit functionality
	    $("#buyPolicy").submit(function(e){
	    	
	    	e.preventDefault();
	    	
	    	$.ajax(
	                {
	                    type: "get",
	                    url: "/PolicyManagement/Servlet", //Your full URL goes here
	                  	data: $("#buyPolicy").serialize(),
	                  	
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