<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.academy.Models.Modules" %>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Batch Registration</title>

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

<h2 align="center" style="color:blue;">Batch Registration Page</h2>

<form action="addBatch" method="post">
<table border="0" align="center">
<tbody>

<tr>
<td><label for="mname">Module Name</label></td>
<td><input type="text" name="mname" value="${currentModule.mname}"/><br></td>
</tr>

<tr>
<td><label for="mid">Module Id</label></td>
<td><input type="number" name="mid" value="${currentModule.mid}"/><br></td>
</tr>

<tr>
<td><label for="userid">Faculty Id</label></td>
<td><input type="number" name="userid" value="${currentModule.fid}"/><br></td>
</tr>

<tr>
<td><label for="skillFamily">Technology</label></td>
<td><input type="text" name="skillFamily" value="${currentModule.skillFamily}"/><br></td>
</tr>

<tr>
<td><label for="classRoomName">Class Room Name</label></td>
<td><input type="text" name="classRoomName" placeholder="Enter Class Room name"><br></td>
</tr>

<tr>
<td><label for="startDate">Batch Start Date</label></td>
<td><input type="date" name="startDate"><br></td>
</tr>

<tr>
<td><label for="endDate">Batch End Date</label></td>
<td><input type="date" name="endDate"><br></td>
</tr>

<tr>
<td><label for="BatchCapacity">Batch Capacity</label></td>
<td><input type="number" name="batchCapacity" placeholder="Enter Batch Capacity"><br></td>
</tr>

<tr>
<td> <button type="submit" class="button">Submit</button></td>
</tr>


</tbody>
</table>
</form>

<h3 align="center" style="color:blue;">${BatchMessage}</h3> 

<h4 align="center"><a href="ReturnAdmin">Admins Home Page</a></h4>


</body>
</html>

