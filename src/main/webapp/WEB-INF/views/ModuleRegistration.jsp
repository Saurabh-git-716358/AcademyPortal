<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Module Registration</title>

<style>
.button {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px;
  margin: 4px 2px;
  cursor: pointer;
}
</style>

</head>
<body>

<h2 align="center" style="color:blue;">Module Registration Page</h2>

<form action="Moduleregister" method="post">
<table border="0" align="center">
<tbody>

<tr>
<td><label for="mname">Module Name</label></td>
<td><input type="text" name="mname" placeholder="Enter Module's Name"/><br></td>
</tr>

<tr>
<td><label for="mid">Module Id</label></td>
<td><input type="number" name="mid" placeholder="Enter Module's ID"/><br></td>
</tr>



	<tr>
	<td><label for="skillFamily">Select Skill Family</label><br></td>
	<td><select name="skillFamily">
		<option value="Technical Skills">Technical Skills</option>
		<option value="Behavioural Skills">Behaviour Skills</option>				
		<option value="InterPersonal Skills">InterPersonal Skills</option>
	</select></td>
	</tr>


<tr>
<td><label for="proficiency">Proficiency</label></td>
<td><input type="number" name="proficiency" placeholder="Enter proficiency required"><br></td>
</tr>

<tr>
<td><label for="executionType">Select Execution Type</label></td>
	<td><select name="executionType">
			<option value="E-Learning">E-Learning</option>
		    <option value="ClassRoomTraining">Class Room Training</option>
	    </select><br>
	</td>
</tr>

<tr>
<td><label for="certificateName">Certification Name</label></td>
<td><input type="text" name="certificateName" placeholder="Enter Certificate Name for given Module"/><br></td>
</tr>

<tr>
<td><label for="certificateType">Select Certification Type</label></td>
	<td><select name="certificateType">
			<option value="Internal">Internal Type</option>
		    <option value="External">External Type</option>
	    </select><br>
	</td>
</tr>


<tr>
<td> <button type="submit" class="button" >Submit</button></td>
</tr>


</tbody>
</table>
</form>

 <h3 align="center" style="color:blue;">${message}</h3> 

<h4 align="center"><a href="ReturnAdmin">Admins Home Page</a></h4>


</body>
</html>