<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>

<style>
.button {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 9px;
  margin: 4px 2px;
  cursor: pointer;
}

a {font-size: 20px;
   color:blue
  }
  
h2{
  color:blue
}

label {
    width:180px;
    clear:left;
    text-align:right;
    padding-right:15px;
}

select{
position: relative;
top: 8px;

}

input{
position: relative;
top: 8px;

}

</style>




</head>


<script type="text/javascript">
  function  preback() {window.history.forward();}
  setTimeout("preback()",0);
  window.onunload = function(){null};
</script>

<body>

<h2 align="center">Login Page</h2>

<form action="loginEntity" method="post">
<table border="0" align="center">
<tbody>

<tr>
<td><label for="category">Select Category</label><br></td>
<td><select id="category" name="category" required="true">
      <option value="Employee">Employee</option>
      <option value="Faculty">Faculty</option>
      <option value="Admin">Admin</option>
    </select><br><br>
</td>
</tr>



<tr>
<td><label for="userid">User Id</label></td>
<td>
<input type="number" name="userid" placeholder="Enter User Id" required="true" /><br><br>
</td>
</tr>



<tr>
<td><label for="password">Password</label></td>
<td>
<input type="password" name="password" placeholder="Enter Password" required="true"/><br><br>
</td>
</tr>



<tr>
<td align="right"> <button class="button" type="submit">Login</button></td>
</tr>


</tbody>
</table>
</form>

<br>
<h4 align="center"><a href="index.jsp">Back To Home Page</a></h4>
<br>
<div align="center">
${ErrorSessionMsg}
${LogoutstatusMsg}
</div>

</body>
</html>