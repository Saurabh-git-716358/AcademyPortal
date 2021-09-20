<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>RegistrationPage</title>

<s:url var="url_jqlib" value="/resources/js/jquery-3.6.0.min.js" />
<script src="${url_jqlib}"></script>

<script>
  
  $(document).ready(function(){
	 
	  $("#userid").change(function(){
		 
		  $.ajax(
			{
			   url:'validateUserIdforEmployee', 
			   data: {
				       userid:$("#userid").val()
				     },	
			   success:function(responseText){
				   $("#IdMessage").text(responseText);
				   if(responseText!="")
				   {
					   $("#userid").focus();
				   }
				   
			   }
			}  
		  );
		  
	  });
	  
  });
 
 
</script>

<style>
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

a {font-size: 20px;
   color:blue
  }
  
h2{
  color:blue
}

</style>


</head>
<body>

<h2 align="center" color="green">Employees Registration Page</h2>

<form action="Empregister" method="post">
<table border="0" align="center" >
<tbody>

<tr>
<td><label for="fname">First Name</label><br><br></td>
<td><input type="text" name="fname" id="fname" placeholder="Enter First Name" oninput="validateFirstName();" required/>
<span id='msg1' class="statusmsg"></span>
<br><br>
</td>
</tr>

<tr>
<td><label for="lname">Last Name</label><br><br></td>
<td><input type="text" name="lname" id="lname" placeholder="Enter Last Name" oninput="validateLastName();" required/>
<span id='msg2' class="statusmsg"></span>
<br><br>
</td>
</tr>

<tr>
<td><label for="dob">Date of Birth</label><br><br></td>
<td><input type="date" name="dob" required/><br><br></td>
</tr>

<tr>
<td><label for="gender">Gender</label><br><br></td>
<td><input type="radio" name="gender" value="Male" required/>Male
<input type="radio" name="gender" value="Female" />Female<br><br></td>
</tr>

<tr>
<td><label for="contactno">Contact No</label><br><br></td>
<td><input type="number" name="contactno" id="contactno" placeholder="Enter Contact Number" oninput="validateContact();" required/>
<span id='msg4' class="statusmsg"></span>
<br><br>
</td>
</tr>

<tr>
<td><label for="email">Enter your email</label><br><br></td>
<td><input type="email" name="email" id="email" placeholder="Enter your EmailId" oninput="validateEmail();" required/>
<span id='msg5' class="statusmsg"></span> 
<br><br>
</td>
</tr>



<tr>
<td><label for="userid">User Id</label><br><br></td>
<td><input type="number" name="userid" id="userid" placeholder="Enter User Id" required/><br><br>
<span id='IdMessage' class="statusmsg"></span>
</td>
</tr>

<tr>
<td><label for="password">Password</label><br><br></td>
<td><input type="password" name="password" id="password" placeholder="Enter Password" required/><br><br>
</td>
</tr>

<tr>
<td><label for="cpassword">Confirm Password</label><br><br></td>
<td><input type="password" name="cpassword" id="cpassword" placeholder="Confirm Password" oninput="checkPass();" required/><br><br>
<span id='mess' class="statusmsg"></span>
</td>

</tr>


<tr>
<td> <button class="button" type="submit" id="formSubmit">Submit</button></td>
</tr>


</tbody>
</table>
</form>

 <h3 align="center">${message}</h3> 

<h4 align="center"><a href="index.jsp">Home Page</a></h4>

<script>


function checkPass() {
	
    var pass1 = document.getElementById('password').value;
    var pass2 = document.getElementById('cpassword').value;
   
    if(pass1 === pass2) {
    	
        mess.textContent = "Matching";
        mess.style.color = "green";
        document.getElementById('formSubmit').disabled = false;
    }
    else {
        mess.textContent = "** Passwords not matching. Enter the above password again.";
        mess.style.color = "red";
        document.getElementById('formSubmit').disabled = true;
	}
}




function validateFirstName() {
		var nReg = /^([A-Za-z]+){2,}$/g;
		var firstname = document.getElementById('fname').value;
		
		if(firstname.match(nReg)) {
			
    	msg1.textContent = "Matching required format";
        msg1.style.color = "green";
        document.getElementById('formSubmit').disabled = false;
    }
    else {
    	msg1.textContent = "** Not Matching the required format Please enter first name in word format (minimum 2 letters)";
        msg1.style.color = "red";
        document.getElementById('formSubmit').disabled = true;
    }
	}
	
	
	
function validateLastName() {
	var nReg = /^([A-Za-z]+){2,}$/g;
	var lastname = document.getElementById('lname').value;
	
	if(lastname.match(nReg)) {
		
    	msg2.textContent = "Matching required format  ";
        msg2.style.color = "green";
        document.getElementById('formSubmit').disabled = false;
    }
    else {
    	msg2.textContent = "** Not Matching the required format  please enter last name in word format (minimum 2 letters)";
        msg2.style.color = "red";
        document.getElementById('formSubmit').disabled = true;
    }
	}



function validateContact() {
	var phnReg = /^[987][0-9]{8}$/g;
	var contact = document.getElementById('contactno').value;
	
	if(contact.match(phnReg)) {
		
    	msg4.textContent = "Matching required format ";
        msg4.style.color = "green";
        document.getElementById('formSubmit').disabled = false;
    }
    else {
    	msg4.textContent = "** Not Matching the required format Enter (10 digit number starting with 7/8/9)";
        msg4.style.color = "red";
        document.getElementById('formSubmit').disabled = true;
    }
	}



function validateEmail() {
	var eReg = /^(([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5}){1,25})+([;.](([a-zA-Z0-9_\-\.]+)@{[a-zA-Z0-9_\-\.]+0\.([a-zA-Z]{2,5}){1,25})+)*$/g;
	var mail = document.getElementById('email').value;
	
	if(mail.match(eReg)) {
		
    	msg5.textContent = "Matching required format ";
        msg5.style.color = "green";
        document.getElementById('formSubmit').disabled = false;
    }
    else {
    	msg5.textContent = "** Not Matching the required format please enter correct email ID. Example : example@example.com";
        msg5.style.color = "red";
        document.getElementById('formSubmit').disabled = true;
    }
	}


			
	
	

</script>


</body>
</html>