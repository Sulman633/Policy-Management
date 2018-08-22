<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Policy.PolicyManagement.PolicyOperations"%>

<% 

	session.getAttribute("number");
	session.getAttribute("policy");
	session.getAttribute("type");
%>

<t:genericpage userType="customer">   
               
               <div class="col-md-2"></div>
               
               <div class="col-md-8">
				
				   <form id="buyPolicy" style="border:1px solid black; padding:2em ; text-align:center; border-radius: 10px;">
					
						<h2>Buy Policy</h2><hr><br>
						  
						  <!-- Make tenure dropdown based on policy -->
						  
						  <div class="form-group">
						  	<c:forEach var = "i" begin = "1" end = "${number}">
						        <div class="row">
						            <div class=" col-md-4">
						                <label for="Nominee" class="control-label">Nominee <c:out value = "${i}"/>:</label>
						                <input type="text" class="form-control" name="nominee<c:out value = "${i}"/>" placeholder="Name" required>
						            </div>
						            <div class=" col-md-4">
						                <label for="Relationship" class="control-label">Relationship <c:out value = "${i}"/>:</label>
						                <input type="text" class="form-control" name="relationship<c:out value = "${i}"/>" placeholder="Relationship" required>
						            </div>
						            <div class=" col-md-4">
						                <label for="Percentage" class="control-label">Percentage <c:out value = "${i}"/>:</label>
						                <input type="text" class="form-control" name="percentage<c:out value = "${i}"/>" placeholder="Relationship" required>
						            </div>
						      </div>
						      <br>
						    </c:forEach>
							  
						  </div>	
						  <label for="PremiumType">Premium Rate:</label><br>		  
						  <div class="form-check form-check-inline">
							  <input class="form-check-input" type="radio" name="premiumRateRadio" id="premium1" value="4" checked="checked">
							  <label class="form-check-label" for="inlineRadio1">Quarterly</label>
						  </div>
						  <div class="form-check form-check-inline">
							  <input class="form-check-input" type="radio" name="premiumRateRadio" id="premium2" value="2">
							  <label class="form-check-label" for="inlineRadio2">Halfway</label>
						  </div>
						  <div class="form-check form-check-inline">
							  <input class="form-check-input" type="radio" name="premiumRateRadio" id="premium3" value="1">
							  <label class="form-check-label" for="inlineRadio3">Annually</label>
						  </div>
						  <br><br>
						  <div class="form-group">
						    <label for="amount">Premium Amount:</label>
						    <select class="form-control" id="amount" name="amount">
						    </select>
						  </div>
						    
						  <!-- Premium amount value dynamically shown -->
						  <div class="form-group">
				    		<label>Date Of Birth:</label>
				   		    <input name="birthDate" id="birthDate" type='date' class="form-control" min='1899-01-01' max='2000-13-13' required><br>
				   		    <label>Birth Certificate:</label><br>
				   		    <label class="custom-file">
								<input type="file" id="birthcertificate" name="birthcertificate" class="custom-file-input" required>
								<span class="custom-file-control"></span>
							</label>
					     </div>
				    	
				    	 <div class="form-group">
					    	<label>Pan card:</label><br>
					    	<label class="custom-file">
							  <input type="file" id="pancard" name="pancard" class="custom-file-input" required>
							  <span class="custom-file-control"></span>
							</label>
						</div>
						
						<div class="form-group">
						    <label for="CustomerID">Customer ID:</label>
						    <input type="number" class="form-control" id="CustomerID" name="customerID" placeholder="ID" required>
						</div>
										    	
				    	<div class="form-group">
						    <label for="AgentID">Agent ID:</label>
						    <input type="number" class="form-control" id="AgentID" name="agentID" placeholder="ID" required>
						</div>	
						
						<div class="form-group">
						    <label for="medDetails">Medical Details:</label>
						    <input type="text" class="form-control" id="medDetails" name="medDetails" placeholder="text..." required>
						</div>
				    		
				    	<div class="form-group">
				    		<label>Policy Initiation Date:</label>
							<input name="policyDate" id="policyDate" type='date' class="form-control" min='1899-01-01' max='2000-13-13'required>
				    	</div>
				    	
				    	<input type="hidden" name="policy" value="<c:out value = "${policy}"/>">
				    	
				    	<input type="hidden" name="type" value="<c:out value = "${type}"/>">
				    	
				    	<input type="hidden" name="numNominees" value="<c:out value = "${number}"/>">
				    	
				    	<input type="hidden" name="buyPolicySubmit" value="buyPolicySubmit">
				    	
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
				
				<div class="col-md-2"></div>

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
			
			$("#amount").append($('<option>', {
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
	                    url: "/PolicyManagement/MainServlet", //Your full URL goes here
	                  	data: $("#buyPolicy").serialize(),
	                  	
	                    success: function(data, textStatus, jqXHR){
	                    	$("#success").removeAttr("hidden");
	                    	$("#error").attr("hidden","hidden");             
	                    },
	                    error: function(jqXHR){
	                    	alert("hi");
	                   }
	                });

	    });
	});
</script>