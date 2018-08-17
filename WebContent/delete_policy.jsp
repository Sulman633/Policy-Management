<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<link href="/PolicyManagement/sidebar.css" rel="stylesheet">

<t:genericpage userType="Admin"> 

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">   
            
            
            <!-- UI 1/2 -->
            <div id="noPolicyUI">
				<h2>No Policies to delete. 
				Please create a policy before you delete it.</h2>
		    </div>
		
		    <!-- UI 2/2 -->
            
            <div id="deletePolicyUI">
            <h2>Delete Policy</h2>
			<h3>dynamically update form</h3>
			<form id="selectPolicyForm">
				<input list="policies" name="policies">
				<datalist id="policies">
					<option value="Policy Name 1">
					<option value="Policy Name 2">
					<option value="Policy Name 3">
					<option value="Policy Name 4">
				</datalist>
				<input type="submit" value="Enter">
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
		
	    $("#selectPolicyForm").submit(function(e){
	    	e.preventDefault();
	    	//default show success
	    	$("#success").removeAttr("hidden");
	    });
	});
</script>