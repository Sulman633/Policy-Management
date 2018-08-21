<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>
<%@attribute name="userType" required="true"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- BootStrap Core CSS -->
<link rel="stylesheet" href="startbootstrap-sb-admin-2-gh-pages/vendor/bootstrap/css/bootstrap.min.css"/>

<!-- MetisMenu CSS -->
<link rel="stylesheet" href="startbootstrap-sb-admin-2-gh-pages/vendor/metisMenu/metisMenu.min.css"/>

<!-- Custom CSS -->
<link rel="stylesheet" href="startbootstrap-sb-admin-2-gh-pages/dist/css/sb-admin-2.css"/>

<!-- Morris Charts CSS -->
<link rel="stylesheet" href="startbootstrap-sb-admin-2-gh-pages/vendor/morrisjs/morris.css"/>

<!-- Custom Fonts -->
<link rel="stylesheet" href="startbootstrap-sb-admin-2-gh-pages/vendor/font-awesome/css/font-awesome.min.css"/>

<link href="/PolicyManagement/sidebar.css" rel="stylesheet">
<title>Fast Track Policy & Claims Service</title>
</head>
<body>
	<div id="wrapp">
		<nav class="navbar navbar-default navbar-static-top" role="navigation">
			<!-- navbar header Created by: Khalid-->
			<div class="navbar-header">
				<a class="navbar-brand" href="index.jsp">Fast Track Claim And Policy Service</a> 
			</div>
			
			<!-- navbar toplinks Created by: Khalid-->
			<ul class="nav navbar-top-links navbar-right"]>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
						<i class="fa fa-gear fa-fw"></i>
						<i class="fa fa-caret-down"></i>
					</a>
					<ul class="dropdown-menu dropdown-user">
						<li>
							<a href="#">
								<i class="fa fa-puzzle-piece fa-fw">Preferences</i>
							</a>
						</li>
					</ul>
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
						<i class="fa fa-user fa-fw"></i>
						<i class="fa fa-caret-down"></i>
					</a>
					<ul class="dropdown-menu dropdown-user">
						<li>
							<a href="#">
								<i class="fa fa-user fa-fw">User Profile</i>								
							</a>
						</li>
						<li>
							<a href="#">
								<i class="fa fa-sign-out fa-fw">Logout</i>
							</a>
						</li>
					</ul>
				</li>
			</ul>
		</nav>
	</div>
	
 	<div id="wrapper" class="toggled">	
	    <!-- Sidebar -->
	    <div id="sidebar-wrapper" class="toggled">
	        	<%
        		//String typeOfUser = (String)session.getAttribute("userType");
        		if(userType =="default"){%>
        			 <ul class="sidebar-nav">
			            <li class="sidebar-brand" style="color:white">
							 Please log in.
					</ul>  
		         <%} else if(userType == "admin") {%>
	        		<ul class="sidebar-nav">
			            <li class="sidebar-brand" style="color:white">
							 Admin Portal
						</li>
						<li>
			                <a href="/PolicyManagement/create_policy.jsp">Create Policy</a>					
						</li>
						<li>
			                <a href="/PolicyManagement/update_policy.jsp">Update Policy</a>					
						</li>
						<li>
			                <a href="/PolicyManagement/delete_policy.jsp">Delete Policy</a>					
						</li>
						<li>
			                <a href="/PolicyManagement/search_policy.jsp">Search Policy Details by Agent</a>					
						</li>
					</ul>	
		         <%} else if(userType == "manager") {%>
	        		<ul class="sidebar-nav">
			            <li class="sidebar-brand" style="color:white">
							 Manager Portal
						</li>
						<li>
			                <a href="/PolicyManagement/generate_policy_certificate.jsp">Generate Policy Certificate</a>					
						</li>
					</ul>		         
		         <%} else if(userType == "customer"){%>
		            <ul class="sidebar-nav">
			            <li class="sidebar-brand" style="color:white">
							 Customer Portal
						</li>
						<li>
			                <a href="/PolicyManagement/buy_policy.jsp">Buy Policy</a>					
						</li>
						<li>
			                <a href="/PolicyManagement/update_nominee.jsp">Update Nominee</a>					
						</li>
						<li>
			                <a href="/PolicyManagement/view_own_policy.jsp">View Own Policy</a>					
						</li>
					</ul>     
		         <%}%>		         
	    </div>
	    <div id = "show" class = "show"></div>
	    
	    <jsp:doBody/>
	</div>
    
	<!-- JQuery -->
	<script src="startbootstrap-sb-admin-2-gh-pages/vendor/jquery/jquery.min.js"></script>
	<!-- Bootstrap Core Java Script -->
	<script src="startbootstrap-sb-admin-2-gh-pages/vendor/bootstrap/js/bootstrap.min.js"></script>	
	<!-- Metis Menu Plugin Javascript -->	
	<script src="startbootstrap-sb-admin-2-gh-pages/vendor/metisMenu/metisMenu.min.js"></script>	
	
	<script>
	$(document).ready(function(){
	    $("#menu-toggle").click(function(e) {
	        e.preventDefault();
	        $("#wrapper").toggleClass("toggled");
	    });
	    
$.ajax({
            
            url:'http://api.openweathermap.org/data/2.5/weather?q=toronto&units=metric&APPID=81eb2655a3e0141a9be2eee5cc400a7b',
                type:"GET",
                    dataType:"jsonp",
                    success: function(data)
                    {
                        var widget = show(data);
                        $("#show").html(widget);
                        $("#city").val('');
                        console.log(data);
                    }
            
            
        });
		
    	function show(data){
    		return   "<h2 style = 'font-size:40px; font-weight: bold;'>Welcome to " + data.name +"</h2>"+
    	    "<h3 >Today's weather forecast: "+data.weather[0].main +"</h3>"
    	}
    });
	      
	</script>
	
	<style>
.show{
   position: relative;
   right: 0;
   border: 3px solid #73AD21;
}
</style>	
</body>
</html>