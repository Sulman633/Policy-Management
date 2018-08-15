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
                <form>
				  <div class="form-group">
				    <label for="PolicyName">Policy Name:</label>
				    <input type="text" class="form-control" id="PolicyName" placeholder="Policy Name">
				  </div>
				  <div class="form-group">
				    <label for="NumberNominees">Number of Nominees Required:</label>
				    <input type="number" min="1" max=10" class="form-control" id="NumberNominees" placeholder="1">
				  </div>
				  <div class="form-check form-check-inline">
				  	  <label for="Tenure">Tenure:</label></br>
					  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="tenure1" value="Quarterly">
					  <label class="form-check-label" for="inlineRadio1">1</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="tenure2" value="Halfway">
					  <label class="form-check-label" for="inlineRadio2">2</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="tenure3" value="Annually">
					  <label class="form-check-label" for="inlineRadio3">3</label>
					</div>
					<div class="form-group">
					    <label for="SunmAssured">Sum Assured (1 lakh to 50 lakh):</label>
					    <input type="number" min="1" max="50" class="form-control" id="SumAssured" placeholder="1">
					</div>
				  <div class="form-group">
				    <label for="Prerequisites">Pre-requisites:</label>
				    <textarea class="form-control" id="Prerequisites" rows="3"></textarea>
				  </div>
				</form>
                
            </div>
        </div>
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->
    
    
   
      
</t:genericpage>

 <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
</script>