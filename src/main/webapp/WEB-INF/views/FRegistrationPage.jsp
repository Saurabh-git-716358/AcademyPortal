<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Faculty Registration Page</title>

<s:url var="url_jqlib" value="/resources/js/jquery-3.6.0.min.js" />
<script src="${url_jqlib}"></script>


<script>
  
  $(document).ready(function(){
	 
	  $("#userid").change(function(){
		 
		  $.ajax(
			{
			   url:'validateUserIdforFaculty', 
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



</head>

<style>

#skills{
   width: 150px;
}

a {font-size: 20px;
   color:blue
  }
  
h2{
  color:blue
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

</style>

<body>

	<h2 align="center">Faculty's Registration Page</h2>

	<form action="Facultyregister" method = "post"> 
		<table border="0" align="center">
			<tbody>

				<tr>
					<td><label for="fname">First Name</label><br><br></td>
					<td><input type="text" name="fname" id="fname"
						placeholder="Enter First Name" oninput="validateFirstName();" required/>
				        <span id='msg1' class="statusmsg"></span>
				        <br><br>
					</td>
				</tr>

				<tr>
					<td><label for="lname">Last Name</label><br><br></td>
					<td><input type="text" name="lname" id="lname"
						placeholder="Enter Last Name" oninput="validateLastName();" required/>
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
					<input type="radio" name="gender" value="Female"/>Female<br><br></td>
				</tr>

				<tr>
					<td><label for="contactno">Contact No</label><br><br></td>
					<td><input type="number" name="contactno" id="contactno"
						placeholder="Enter Contact Number" oninput="validateContact();" required/>
					<span id='msg4' class="statusmsg"></span>
					<br><br>
					</td>
				</tr> 

				<tr>
					<td><label for="email">Enter your email:</label><br><br></td>
					<td><input type="email" name="email" id="email"
						placeholder="Enter your EmailId" oninput="validateEmail();" required/>
				    <span id='msg5' class="statusmsg"></span>
				    <br><br>
				    </td>
				</tr>



				<tr>
					<td><label for="userid">User Id</label><br><br></td>
					<td><input type="number" name="userid" id="userid"
						placeholder="Enter User Id" required/><br><br>
						<span id='IdMessage' class="statusmsg"></span>
					</td>
				</tr>

				<tr>
					<td><label for="password">Password</label><br><br></td>
					<td><input type="password" name="password" id="password"
						placeholder="Enter Password" required/><br><br>			
					</td>
				</tr>
				
				

				<tr>
					<td><label for="cpassword">Confirm Password</label><br><br></td>
					<td><input type="password" name="cpassword" id="cpassword"
						placeholder="Confirm Password" oninput="checkPass();" required/><br><br>
					    <span id='mess' class="statusmsg"></span>
					</td>
				</tr>
				
				<tr>
					<td><label for="skillFamily">Select Skill Family</label><br><br></td>
					<td><select id="skillFamily" name="skillFamily" onChange="getSkillList()" required>
							<option value="Technical Skills">Technical Skills</option>
							<option value="Behavioural Skills">Behaviour Skills</option>
							<option value="InterPersonal Skills">InterPersonal
								Skills</option>
							<option></option>
			     		</select><br><br>
					</td>
				</tr>


				<tr>
					<td><label for="skills">Select skills</label><br><br></td>
					<td><select  id="skills" name="skills" multiple required>
					<option value="select">-- Skills --</option>
					<option value="select1">-- Skill 1 --</option>
					<option value="select2">-- Skill 2 --</option>
					<option value="select3">-- Skill 3 --</option>
					</select><br><br>
					</td>
				</tr>

				<tr>
					<td><label for="thours">Select Skills Teaching Hours</label><br><br></td>
					<td><input type="text" id="thours" name="thours"  size="40"
						placeholder="Enter teaching hours (Comma(,) Seperated)"  oninput="checkHours();" onchange="checkHours1();" required/>
			            Format as 5,8,9 of Proficiency level for 3 skills
				    <br><br>	
				       <span id='messageHours' class="statusmsg"></span>
				    </td>
				</tr>

				<tr>
					<td><label for="proficiency">Skills Proficiency</label><br><br></td>
					<td><input type="text" id="proficiency" name="proficiency" size="40"
						placeholder="Enter Proficiency for Skills (Comma(,) Seperated)" oninput="checkProf();" onchange="checkProf1();" required/>
						Format as 5,8,9 of Proficiency level for 3 skills
					<br><br>
					   <span id='messageProf' class="statusmsg"></span>
					</td>
					
				</tr>


				<tr>
					<td>
						<button class="button" type="submit" id="formSubmit">Submit</button>
					</td>
				</tr>


			</tbody>
		</table>
	</form>

<h3 align="center">${message}</h3> 
<h4 align="center">${message2}</h3> 
<h4 align="center"><a href="index.jsp">Home Page</a></h4>




	<script>
		function getSkillList() {
			var list1 = document.getElementById('skillFamily');
			var list2 = document.getElementById("skills");
			var list1SelectedValue = list1.options[list1.selectedIndex].value;

			if (list1SelectedValue == 'Technical Skills') {

				list2.options.length = 0;
				list2.options[0] = new Option('--Select--', '');
				list2.options[1] = new Option('Programming', 'Programming');
				list2.options[2] = new Option('Data Structures',
						'Data Structures');
				list2.options[3] = new Option('ADS', 'ADS');
				list2.options[4] = new Option('Databases', 'Databases');
				list2.options[5] = new Option('Networking', 'Networking');
				list2.append.op
         
			} else if (list1SelectedValue == 'Behavioural Skills') {

				list2.options.length = 0;
				list2.options[0] = new Option('--Select--', '');
				list2.options[1] = new Option('Communication', 'Communication');
				list2.options[2] = new Option('Behaviour', 'Behaviour');
				list2.options[3] = new Option('Speaking', 'Speaking');
				list2.options[4] = new Option('Office GuideLines',
						'Office GuideLines');

			} else if (list1SelectedValue == 'InterPersonal Skills') {
				list2.options.length = 0;
				list2.options[0] = new Option('--Select--', '');
				list2.options[1] = new Option('Motivation', 'Motivation');
				list2.options[2] = new Option('Health', 'Health');
				list2.options[3] = new Option('Lifestyle', 'Lifestyle');
				list2.options[4] = new Option('Grooming', 'Grooming');

			}
			
		}
		
		
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
	       			
	            	msg1.textContent = "Matching required format ";
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
					
	            	msg2.textContent = "Matching required format ";
	                msg2.style.color = "green";
	                document.getElementById('formSubmit').disabled = false;
	            }
	            else {
	            	msg2.textContent = "** Not Matching the required format please enter last name in word format (minimum 2 letters)";
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
			    	msg4.textContent = "** Not Matching the required format enter (10 digit number starting with 7/8/9)";
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
			    	msg5.textContent = "** Not Matching the required format Enter ex email ID. Example : example@example.com";
			        msg5.style.color = "red";
			        document.getElementById('formSubmit').disabled = true;
			    }
				}

				
				
			function checkHours(){
				
				var stringFormatReg = /^([0-9\,0-9]){1,5}$/g;
			   
				var noOfHours = document.getElementById('thours').value;
				
				if(noOfHours.match(stringFormatReg)) {
					
					messageHours.textContent = "Matching required format";
					messageHours.style.color = "green";
	             
	            }
	            else {
	            	messageHours.textContent = "** Not Matching the required formats";
	            	messageHours.style.color = "red";
	      
	            }
			
			
			}
			
			
			function checkHours1(){
				
				var options = document.getElementById('skills').options, count = 0;
				for (var i=0; i < options.length; i++) {
				  if (options[i].selected) count++;
				}
				
				var noOfHours = document.getElementById('thours').value;
				const split = noOfHours.split(",");
				var len = split.length;
				
				if(len==count)
					{
					messageHours.textContent = "Matching required format";
					messageHours.style.color = "green";
	                document.getElementById('formSubmit').disabled = false;
					}
				else{
					messageHours.textContent = "** Enter Hours equal to selected above";
	            	messageHours.style.color = "red";
	                document.getElementById('formSubmit').disabled = true;
					}
				
			}
              
			

			function checkProf(){
				
				var stringFormatReg = /^([0-9\,0-9]){1,5}$/g;
			   
				var noOfHours = document.getElementById('proficiency').value;
				
				if(noOfHours.match(stringFormatReg)) {
					
					messageProf.textContent = "Matching required format";
					messageProf.style.color = "green";
	               
	            }
	            else {
	            	messageProf.textContent = "** Not Matching the required formats";
	            	messageProf.style.color = "red";
	            
	            }
			
			
			}
	   			
			
                function checkProf1(){
				
				var options = document.getElementById('skills').options, count = 0;
				for (var i=0; i < options.length; i++) {
				  if (options[i].selected) count++;
				}
				
				var noOfHours = document.getElementById('proficiency').value;
				const split = noOfHours.split(",");
				var len = split.length;
				
				if(len==count)
					{
					messageProf.textContent = "Matching required format";
					messageProf.style.color = "green";
	                document.getElementById('formSubmit').disabled = false;
					}
				else{
					messageProf.textContent = "** Enter Hours equal to selected above";
					messageProf.style.color = "red";
	                document.getElementById('formSubmit').disabled = true;
					}
				
			}
				
		
	</script>


</body>
</html>