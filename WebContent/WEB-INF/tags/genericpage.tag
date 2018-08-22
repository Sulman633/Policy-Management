<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>
<%@attribute name="userType" required="true"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<!-- BootStrap Core CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<!-- MetisMenu CSS -->
<link rel="stylesheet" href="startbootstrap-sb-admin-2-gh-pages/vendor/metisMenu/metisMenu.min.css"/>

<!-- Custom CSS -->
<link rel="stylesheet" href="startbootstrap-sb-admin-2-gh-pages/dist/css/sb-admin-2.css"/>

<!-- Morris Charts CSS -->
<link rel="stylesheet" href="startbootstrap-sb-admin-2-gh-pages/vendor/morrisjs/morris.css"/>

<!-- Custom Fonts -->
<link rel="stylesheet" href="startbootstrap-sb-admin-2-gh-pages/vendor/font-awesome/css/font-awesome.min.css"/>

<link href="/PolicyManagement/custom.css" rel="stylesheet">
<title>Fast Track Policy & Claims Service</title>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <a class="navbar-brand" href="/PolicyManagement/index.jsp">Fast Track Claim And Policy Service</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <%
        	if(userType =="default"){%>
        		<li class="nav-item active">
	        		<a class="nav-link" href="#">Please login <span class="sr-only">(current)</span></a>
	      		</li>
	      <%} else if(userType == "admin") {%>
	      		<li class="nav-item active">
	        		<a class="nav-link" href="#">Admin Portal <span class="sr-only">(current)</span></a>
	      		</li>
	      		<li class="nav-item dropdown">
	        		<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          			Menu
	        		</a>
	        		<div class="dropdown-menu" aria-labelledby="navbarDropdown">
			          <a class="dropdown-item" href="/PolicyManagement/create_policy.jsp">Create Policy</a>
			          <a class="dropdown-item" href="/PolicyManagement/update_policy.jsp">Update Policy</a>
			          <a class="dropdown-item" href="/PolicyManagement/delete_policy.jsp">Delete Policy</a>
			          <a class="dropdown-item" href="/PolicyManagement/search_policy.jsp">Search Policy Details by Agent</a>
			        </div>
			    </li>
		         <%} else if(userType == "manager") {%>
		         	<li class="nav-item active">
		        		<a class="nav-link" href="#">Manager Portal <span class="sr-only">(current)</span></a>
		      		</li>
		      		<li class="nav-item dropdown">
		        		<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		          			Menu
		        		</a>
		        		<div class="dropdown-menu" aria-labelledby="navbarDropdown">
				          <a class="dropdown-item" href="/PolicyManagement/generate_policy_certificate.jsp">Generate Policy Certificate</a>
				        </div>
				    </li>
		         <%} else if(userType == "customer"){%>
		         	<li class="nav-item active">
		        		<a class="nav-link" href="#">Customer Portal <span class="sr-only">(current)</span></a>
		      		</li>
		      		<li class="nav-item dropdown">
		        		<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		          			Menu
		        		</a>
		        		<div class="dropdown-menu" aria-labelledby="navbarDropdown">
				          <a class="dropdown-item" href="/PolicyManagement/buy_policy1.jsp">Buy Policy</a>
				          <a class="dropdown-item" href="/PolicyManagement/update_nominee.jsp">Update Nominee</a>
				          <a class="dropdown-item" href="/PolicyManagement/view_own_policy.jsp">View Own Policy</a>
				        </div>
				    </li>
		         <%}%>		 
	    </ul>
	  </div>
	</nav>
	<div class="container-fluid" style="margin-top:4em"> 
	
		<div class="row">
		
			<jsp:doBody/>
		    
		</div>
	
	</div>
	

    
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script><script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

<script>

//button functionality to show/hide map
function displayMap() {
	var b = document.getElementById('mapbutton');
	
	// create map if it doesn't already exist
	if (typeof maps == "undefined") {
		document.getElementById('map').style.display="block";
		var LatLng = {lat: 43.6539982, lng: -79.3879103};
	    var mapOptions = {
	        zoom: 15,
	        center: LatLng,
	        mapTypeId: google.maps.MapTypeId.ROADMAP
	    };
	    maps = new google.maps.Map(document.getElementById('map'), mapOptions);
	    var marker = new google.maps.Marker({
	          position: LatLng,
	          map: maps,
	          title: 'TCS'
	        });
		b.innerHTML = 'Hide Map';
	}
	
	// set to hidden or visible if map exists
	else {
		if (document.getElementById('map').style.display == "none"){
			b.innerHTML = 'Hide Map';
			document.getElementById('map').style.display = "block";
		}
		else {
			b.innerHTML = 'Show Map';
			document.getElementById('map').style.display = "none";
		}
	}
};

	$(document).ready(function(){
	    
		function show(data){
			return "<h3 >Today's weather forecast in " + data.name + " is " + data.weather[0].main +"</h3>"
		}
		
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
		
		
	    
	    
    });
	      
	</script>
	
	 <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBY5QEZfaHQluvIPZyx3Y--NZbF_Z3XLEM&callback=initMap"
    async defer></script>
	
</body>

</html>