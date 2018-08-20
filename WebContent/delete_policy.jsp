<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<link href="/PolicyManagement/sidebar.css" rel="stylesheet">

<t:genericpage userType="Admin"> 

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">   
            
            <div id="deletePolicyUI">
            <h2>Delete Policy</h2>
            
            <div id="noPolicyUI" hidden>
				<h2>No Policies to delete. 
				Please create a policy before you delete it.</h2>
		    </div>
	                    
			<form id="deletePolicy">
				<div class="form-group">
				    <label for="exampleFormControlSelect1">Policy</label>
				    <select class="form-control" id="policyID" name="policyID">
				      <option value="1">Policy Name 1</option>
				      <option value="2">Policy Name 2</option>
				      <option value="3">Policy Name 3</option>
				      <option value="4">Policy Name 4</option>
				      <option value="5">Policy Name 5</option>
				    </select>
				 </div>
				 <input type="hidden" value="deletePolicy" name="formName">
				<button type="submit" class="btn btn-danger">Delete Policy</button>
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
	// Logic on submit button must be implemented later!!!
	$(document).ready(function(){
		
		var queryCount = 1;//query 1, return all policies from DB
		
		if (queryCount <= 0){
			$("#noPolicyUI").show();
			$("#deletePolicyUI").hide();			
		}
		else {
			$("#noPolicyUI").hide();
			$("#deletePolicyUI").show(); //update List dynamically 		
		}
		
		
 		$("#deletePolicy").submit(function(e){
	    	
	    	e.preventDefault();
	    	
	    	$.ajax(
	                {
	                    type: "get",
	                    url: "/PolicyManagement/MainServlet",
	                  	data: $("#deletePolicy").serialize(),
	                  	
	                    success: function(data, textStatus, jqXHR){
	            	    	$("#success").removeAttr("hidden");
	                    },
	                    error: function(jqXHR){
	                   	
	                  	}
	                });

	    });
		
	});
</script>