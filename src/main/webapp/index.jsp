<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>


<style>
a {
	font-size: 18px;
	color: blue
}

.button {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

.center {
	margin: auto;
	width: 50%;
	background-color: powderblue;
	padding: 5px;
	padding-top: 0px;
	
}

ul {
  display: table;
  margin: 0 auto;
}




</style>



</head>


<body>
	<div>
		<h2 align="center">Welcome to Academy Portal</h2>
	</div>


	<h4 align="center">Select a Role and get started on Academy Portal
		and Register</h4>

	<hr>


	<br>
	
  
	
	
	
	<div class="center">
	  
		<p class="p1">
			Find the right Faculty for you. Choose from many topics, skill
			levels, and languages. Enroll to high-quality on-demand online
			courses. Get Certified. Start learning today. 30-day guarantee.
			Real-world experts. Lifetime access.<br>
		 <ul style="list-style-type: disc" >
		 <li>Skilled Faculty</li>
         <li>Technical Modules</li>
         <li>Interpersonal Modules</li>
         <li>Behavioural Modules</li>
         <li>Certifications</li>
        </ul>	
	</div>
	

	
	
    <br>
    
	<div align="center">
	
		<a href="showregisterFaculty"><input class="button"
		 type="button" value="Register as Faculty"></a> 
			
			&nbsp;
			&nbsp;
			
	    <a href="showregisterEmployee"><input class="button"
			type="button" value="Register as Employee"></a>
	</div>

	<hr>

	<h4 align="center">
		<a href="login">Sign Up</a>
	</h4>
        
</body>
</html>
