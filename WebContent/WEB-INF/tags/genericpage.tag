<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>
<%@attribute name="userType" required="true"%>
<%@attribute name="sidebar_admin" fragment="true"%>

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

<!-- Custom CSS -->
<link href="/PolicyManagement/sidebar.css" rel="stylesheet">

<title>Fast Track Policy & Claims Service</title>
</head>
<body>
	<div id="wrapp">
		<nav class="navbar navbar-default navbar-static-top" role="navigation">
			<!-- navbar header Created by: Khalid-->
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Fast Track Claim And Policy Service</a> 
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

	 <div id="wrapper">
	        <!-- Sidebar -->
	        <div id="sidebar-wrapper">
				<ul class="sidebar-nav">
				    <li class="sidebar-brand">
				        <a href="#">
				            Menu
				        </a>
				    </li>
					<jsp:invoke fragment="sidebar_admin"/>	
				</ul>
			</div>
	       <!-- /#sidebar-wrapper -->
	
	        <!-- Page Content -->
	        <div id="page-content-wrapper">
	            <div class="container-fluid">
	                <h1>Simple Sidebar</h1>
	                <p>This template has a responsive menu toggling system. The menu will appear collapsed on smaller screens, and will appear non-collapsed on larger screens. When toggled using the button below, the menu will appear/disappear. On small screens, the page content will be pushed off canvas.</p>
	                <p>Make sure to keep all page content within the <code>#page-content-wrapper</code>.</p>
	                <a href="#menu-toggle" class="btn btn-secondary" id="menu-toggle">Toggle Menu</a>
	            </div>
	        </div>
	        <!-- /#page-content-wrapper -->
	
	</div>
    <!-- /#wrapper -->
    
	<!-- JQuery -->
	<script src="startbootstrap-sb-admin-2-gh-pages/vendor/jquery/jquery.min.js"></script>
	<!-- Bootstrap Core Java Script -->
	<script src="startbootstrap-sb-admin-2-gh-pages/vendor/bootstrap/js/bootstrap.min.js"></script>	
	<!-- Metis Menu Plugin Javascript -->	
	<script src="startbootstrap-sb-admin-2-gh-pages/vendor/metisMenu/metisMenu.min.js"></script>	

	<script>
	    $("#menu-toggle").click(function(e) {
	        e.preventDefault();
	        $("#wrapper").toggleClass("toggled");
	    });
	</script>
	
</body>
</html>