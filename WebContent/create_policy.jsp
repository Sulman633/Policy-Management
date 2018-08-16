<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<link href="/PolicyManagement/sidebar.css" rel="stylesheet">

<t:genericpage userType="Admin">   

 <div id="wrapper">
        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="#">
                        Start Bootstrap
                    </a>
                </li>
                <li>
                    <a href="#">Dashboard</a>
                </li>
                <li>
                    <a href="#">Shortcuts</a>
                </li>
                <li>
                    <a href="#">Overview</a>
                </li>
                <li>
                    <a href="#">Events</a>
                </li>
                <li>
                    <a href="#">About</a>
                </li>
                <li>
                    <a href="#">Services</a>
                </li>
                <li>
                    <a href="#">Contact</a>
                </li>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <a href="#menu-toggle" class="btn btn-secondary" id="menu-toggle">Toggle Menu</a>
                
                <!-- Success/Error alerts -->
                <div id="success" class="alert alert-success" hidden>
				  Successfully created policy!
				</div>
				<div id="error" class="alert alert-danger" hidden>
				  Error in creating policy.
				</div>
				
				<form id="createPolicy">
				  <div class="form-group">
				    <label for="PolicyName">Policy Name:</label>
				    <input type="text" class="form-control" id="PolicyName" placeholder="Policy Name" required>
				  </div>			  
				  <div class="form-group">
				    <label for="NumberNominees">Number of Nominees Required:</label>
				    <input type="number" min="1" max="10" class="form-control" step="1" id="NumberNominees" placeholder="1" pattern="\d+" required>
				  </div>	  
				  
				    <div class="form-check form-check-inline">
				  	  <label for="Tenure">Type:</label></br>
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
					    <label for="SunmAssured">Sum Assured (1 lakh to 50 lakh):</label>
					    <input type="number" min="1" max="50" class="form-control" id="SumAssured" step="0.01" placeholder="1" required>
					</div>
				  <div class="form-group">
				    <label for="Prerequisites">Pre-requisites:</label>
				    <textarea class="form-control" id="Prerequisites" rows="3"></textarea>
				  </div>
				  <button type="submit" class="btn btn-primary">Submit</button>
				</form>
            </div>
        </div>
        <!-- /#page-content-wrapper -->
    </div>
    <!-- /#wrapper -->
    
    
   
      
</t:genericpage>

 <script>
   

    $(document).ready(function(){
    	// Logic on submit button must be implemented later!!!
        $("#createPolicy").submit(function(e){
        	e.preventDefault();
            $("#success").removeAttr("hidden");
            $("#error").attr("hidden","hidden");

        });
        
        $("#menu-toggle").click(function(e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
        });
        
    });
      
</script>

