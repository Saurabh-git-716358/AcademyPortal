<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Not Regsitered</title>
</head>
<body>

   <div align="center">
   <c:choose>
       
       <c:when test="${message == 'Data Not Present Register Again'}">
         <h3 style="color:blue;" >${message}</h3>
       </c:when>
       
       
       <c:otherwise>
         <h3 style="color:blue;" 
         >${message}</h3>
       </c:otherwise>
       
   </c:choose>
   
   <h4 align="center"><a href="index.jsp">Home Page</a></h4>
   
   </div>
</body>
</html>