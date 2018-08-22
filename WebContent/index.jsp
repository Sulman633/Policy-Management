<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:genericpage userType="default">   

<div class="col-md-3"></div>

<div class="col-md-7">

	<div id = "show" class = "weather"></div>
	
	<br>

	<div style="text-align:center;" >
	    
		<p><a href="/PolicyManagement/customer_index.jsp">Login as Customer</a>	</p>				
		<p><a href="/PolicyManagement/manager_index.jsp">Login as Manager</a></p>				
		<p><a href="/PolicyManagement/admin_index.jsp">Login as Admin</a></p>				
	         	         
	</div>
	
	<div id="wrapper">
		<button id="mapbutton" onclick="displayMap()" type="button" class="btn btn-outline-primary">Show Map</button>
	</div>
	
	<br>
				    
	<div id="map"></div> 

</div>

<div class="col-md-2"></div>
						
</t:genericpage>   