<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<link href="/PolicyManagement/sidebar.css" rel="stylesheet">

<t:genericpage userType="Admin">   
        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">                
               
				
				<form id="createPolicy">
				  <div class="form-group">
				    <label for="PolicyName">Policy Name:</label>

				    <input type="text" class="form-control" id="PolicyName" name="Pname" placeholder="Policy Name" required>
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
	    $("#createPolicy").submit(function(e){
	    	
	    	e.preventDefault();
	    	
	    	$.ajax(
	                {
	                    type: "get",
	                    url: "/PolicyManagement/Servlet", //Your full URL goes here
	                  	data: $("#createPolicy").serialize(),
	                  	
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