<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Policy.PolicyManagement.PolicyOperations"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<% 
session.getAttribute("polid");
session.getAttribute("polname");
session.getAttribute("cusid");
session.getAttribute("sumass");
session.getAttribute("prem");
session.getAttribute("ten");
%>

<t:genericpage userType="Manager"> 

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid"> 
           
           <div class="row">
            	
            	<div class="col-xs-2"></div>
            	
            	<div class="col-xs-8">

<h1>Policy ID: <c:out value="${polid}"/></h1>
<h1>Policy Name: <c:out value="${polname}"/></h1>
<h1>Customer ID: <c:out value="${cusid}"/></h1>
<h1>Sum Assured: <c:out value="${sumass}"/></h1>
<h1>Premium Amount: <c:out value="${prem}"/></h1>
<h1>Tenure: <c:out value="${ten}"/></h1>
</t:genericpage>