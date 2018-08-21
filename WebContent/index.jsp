<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
      	display: none;
        height: 500px;
        width: 500px;
        margin-left: auto;
  		margin-right: auto;
  		margin-top:10px;
  		margin-bottom:10px;
      }
      #wrapper{
      	text-align: center;
      }
</style>

<t:genericpage userType="default">   

					
				<div id = "show" class = "show"></div>
				
				<br>
					
					 <div style="text-align:center;" >
	    
		                <p><a href="/PolicyManagement/customer_index.jsp">Login as Customer</a>	</p>				
		                <p><a href="/PolicyManagement/manager_index.jsp">Login as Manager</a></p>				
		                <p><a href="/PolicyManagement/admin_index.jsp">Login as Admin</a></p>				
	         	         
	    			</div>
	    			
	    			<br>
	    
				    <div id="wrapper">
				    	<button id="mapbutton" onclick="displayMap()" type="button" class="btn btn-outline-primary">Show Map</button>
				    </div>
				    
				    <br>
				    
				    <div id="map"></div> 
	
	    
	    
  
</t:genericpage>

<script>
    
    
	function show(data){
		return "<h3 >Today's weather forecast in " + data.name + " is " + data.weather[0].main +"</h3>"
	}
	
    // button functionality to show/hide map
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
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBY5QEZfaHQluvIPZyx3Y--NZbF_Z3XLEM&callback=initMap"
    async defer></script>