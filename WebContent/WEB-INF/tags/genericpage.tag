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
<title>Fast Track Policy & Claims Service</title>
</head>
<body>
	<div id="wrapp">
		<!-- navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation">
			<!-- navbar header -->
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Fast Track Claim And Policy Service</a> 
			</div>
			
			<!-- navbar toplinks -->
			<ul class="nav navbar-top-links navbar-right"]>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
						<i class="fa fa-user fa-fw"></i>
						<i class="fa fa-caret-down"></i>
					</a>
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
						<i class="fa fa-gear fa-fw"></i>
						<i class="fa fa-caret-down"></i>
					</a>
				</li>
			</ul>
		</nav>
	</div>
	
	<jsp:doBody/>

    
	<!-- JQuery -->
	<script src="startbootstrap-sb-admin-2-gh-pages/vendor/jquery/jquery.min.js"></script>
	<!-- Bootstrap Core Java Script -->
	<script src="startbootstrap-sb-admin-2-gh-pages/vendor/bootstrap/js/bootstrap.min.js"></script>	
	<!-- Metis Menu Plugin Javascript -->	
	<script src="startbootstrap-sb-admin-2-gh-pages/vendor/metisMenu/metisMenu.min.js"></script>	

	
</body>
</html>