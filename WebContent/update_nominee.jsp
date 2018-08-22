<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<link href="/PolicyManagement/sidebar.css" rel="stylesheet">

<t:genericpage userType="customer">   

            	<div class="col-md-2"></div>
            	
            	<div class="col-md-8">
           	            	 
                <form id = "createNominee" style="border:1px solid black; padding:2em ; text-align:center; border-radius: 10px;" >
                
                  <h2>Create Nominee</h2><hr>
                  
				  <div class="form-group">
				    <label for="NomineeName">Nominee Name:</label>
				    <input type="text" class="form-control" id="NomineeName" name = "NomineeName" placeholder="Nominee Name">
				  </div>
				  
				  
				  <div class="form-group">
				    <label for="RelationshipToCustomer">Relationship To Customer:</label>
				    <input type="text" class="form-control" id="RelationshipToCustomer" name = "RelationshipToCustomer" placeholder="Relationship To Customer">
				  </div>
				  
				  <div class="form-group">
				    <label for="PurposeOfChange">Purpose Of Change:</label>
				    <input type="text" class="form-control" id="Purpose Of Change" name = "PurposeOfChange" placeholder="Purpose Of Change">
				  </div>
				  
				  <div class="form-group">
				    <label for="Percentage">Percentage:</label>
				    <input type="text" class="form-control" type="number" id="Percentage" name = "Percentage" placeholder="Percentage">
				  </div>
				  				  				  
				  
	
				  <br/>
				  <input type="hidden" name="newNomineeSubmit" value="newNomineeSubmit">
				 <button type="submit" class="btn btn-primary"> Submit</button>
              
				</form>
				</div>
				<div class="col-md-2"></div>

</t:genericpage>


<script>
	// Logic on submit button must be implemented later!!!
	$(document).ready(function(){
		
 		$("#createNominee").submit(function(e){
	    	e.preventDefault();
	    	
	    	$.ajax(
	                {
	                    type: "get",
	                    url: "/PolicyManagement/MainServlet",
	                  	data: $("#createNominee").serialize(),
	                  	
	                    success: function(data, textStatus, jqXHR){
	            	    	$("#success").removeAttr("hidden");
	                    },
	                    error: function(jqXHR){
	                    	alert("error")
	                   	
	                  	}
	                });
	    	console.log('Submitted')
 		});
	});

</script>
