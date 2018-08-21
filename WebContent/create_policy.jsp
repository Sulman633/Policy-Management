<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

...

<link href="/PolicyManagement/sidebar.css" rel="stylesheet">

<t:genericpage userType="admin">   

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <a href="#menu-toggle" class="btn btn-secondary" id="menu-toggle">Toggle Menu</a>
                <form id = "createPolicy">
               
                
				  <div class="form-group">
				    <label for="PolicyName">Policy Name:</label>
				    <input type="text" class="form-control" id="PolicyName" name = "Policyname" placeholder="Policy Name">
				  </div>
				  
				   <div class="form-check form-check-inline">
				  	  <label for="Type">Type:</label></br>
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
					
				  <div class="form-group">
				    <label for="NumberNominees">Number of Nominees Required:</label>
				    <input type="number" min="1" max=10" class="form-control" id="NumberNominees" name = "Numbernominees" placeholder="1">
				  </div>
				  
			 <div class="form-check form-check-inline">
				  	  <label for="Tenure">Tenure:</label></br>
					  <input class="form-check-input" type="radio" name="tenureRadio" id="tenure1" value=4 checked="checked">
					  <label class="form-check-label" for="inlineRadio1">4</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" name="tenureRadio" type="radio" id="tenure2" value=2>
					  <label class="form-check-label" for="inlineRadio2">2</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" name="tenureRadio" type="radio" id="tenure3" value=1>
					  <label class="form-check-label" for="inlineRadio3">1</label>
					</div>
					
					<div class="form-group">
					    <label for="SunmAssured">Sum Assured (1 lakh to 50 lakh):</label>
					    <input type="number" min="1" max="50" class="form-control" id="SumAssured" name ="Sumassured" placeholder="1">
					</div>
				  <div class="form-group">
				    <label for="Prerequisites">Pre-requisites:</label>
				    <input type="text" class="form-control" id="Prerequisites" name = "Prerequ">
				  </div>
				  <br/>
				  <input type="hidden" name="createPolicySubmit" value="createPolicySubmit">
				 <button type="submit" class="btn btn-danger"> Submit</button>
              
				</form>
                
            </div>
        </div>
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->
    
      
      
</t:genericpage>

<script>
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
	                    	//alert("hi");
	            	    	$("#success").removeAttr("hidden");
	                    },
	                    error: function(jqXHR){
	                   	
	                  	}
	                });
 		});
	});

</script>
