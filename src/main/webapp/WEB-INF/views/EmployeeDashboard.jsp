<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee</title>

<script type="text/javascript">
  function  preback() {window.history.forward();}
  setTimeout("preback()",0);
  window.onunload = function(){null};
</script>

</head>


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


#StyleTable1 {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 20%;
}


#StyleTable1 td, #StyleTable1 th {
  border: 1px solid #ddd;
  padding: 8px;
}

#StyleTable1 tr:nth-child(even){background-color: #f2f2f2;}

#StyleTable1 tr:hover {background-color: #ddd;}

#StyleTable1 th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #04AA6D;
  color: white;
}



#StyleTable {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#StyleTable td, #StyleTable th {
  border: 1px solid #ddd;
  padding: 8px;
}

#StyleTable tr:nth-child(even){background-color: #f2f2f2;}

#StyleTable tr:hover {background-color: #ddd;}

#StyleTable th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #04AA6D;
  color: white;
}





</style>


<body>
     
	<h3 align="center" style="color:blue;">Employees Dashboard</h3>
	<div align = "right">
	<a href="logout"><input type="button" class="button" value="Log Out"></a>
    </div> 
 	
    <hr>
    
    <h3 align="center" style="color:blue;">${message}</h3>
    
    <div align="center"> 
    <a href="searchModule"><input type="button" class="button" value="Search Modules" ></a>
    
     <c:if test = "${ModuleListPage.size()>0}">
	 <h4>Modules Available</h4>
	<table id="StyleTable"  align="center">
	 <tr>
	 <th>Module Id</th>
	 <th>Module Name</th>
	 <th>Skill Family</th>
	 <th>Execution Type</th>
	 <th>Certification Name</th>
	 <th>Certification Type</th>
	 <th>Faculty Id</th>
 	 </tr>	
 	  <c:forEach items="${ModuleListPage}" var="module">
	   <tr>
	     <td>${module.mid}</td>
	     <td>${module.mname}</td>
	     <td>${module.skillFamily}</td>
	     <td>${module.executionType}</td>
	     <td>${module.certificateName}</td>
	     <td>${module.certificateType}</td>
	     <td>${module.fid}</td>
       </tr>
       </c:forEach>
       </table>
  

    <br/>    
  
     Pages
     <a href="/AcademyPortal/searchModule/999" style="text-decoration: none;">1
     </a> 
    
     <c:forEach var = "i" begin = "2" end = "${lastPage}">
       <a href="/AcademyPortal/searchModule/${i}" style="text-decoration: none;">${i}</a> 
     </c:forEach>
   
     </c:if>
    
     <br>
     <br>
     
     <a href="searchBatch"><input type="button" class="button" value="Search Batches"></a>
     <c:if test="${batchlist.size()>0}">
     <h4>Batches Available</h4>
	<table id="StyleTable" align="center">
	 <tr>
	 <th>Class Room Name</th>
	 <th>Module Id</th>
	 <th>Module Name</th>
	 <th>Faculty Id</th>
	 <th>Skill Family</th>
	 <th>Student Registered</th>
	 <th>Batch Start Date</th>
	 <th>Batch End Date</th>
	 <th>Regsiter</th>
 	 </tr>	
 	  <c:forEach items="${batchlist}" var="batch">
	   <tr>
	     <td>${batch.classRoomName}</td>
	     <td>${batch.mid}</td>
	     <td>${batch.mname}</td>
	     <td>${batch.userid}</td>
	     <td>${batch.skillFamily}</td>
	     <td>${batch.studentRegistered}</td>
	     <td>${batch.startDate}</td>
	     <td>${batch.endDate}</td>
	     <td>
<a href="EnrollBatch/${batch.mid}"><input type="button" class="button" value="Enroll to Batch"></a>
          
          <c:if test="${mid==batch.mid}">
          ${mes}
          </c:if>
          
          <c:if test="${batchRepeat=='yes'}">
           <c:if test="${mid==batch.mid}">
            Batch Already Registered
           </c:if>
          </c:if>
          
           <c:if test="${batchCapacity=='full'}">
           <c:if test="${mid==batch.mid}">
            Batch Capacity Full
           </c:if>
          </c:if>
          	       
	     </td>
       </tr>
       </c:forEach>
       </table>
     </c:if>
    
    <br>
    <br>
    
    <a href="Learnings"><input type="button" class="button" value="My Learnings"></a>
     <c:if test="${batchList.size()>0}">
     <h4>Batches Registered</h4>
	  <table align="center" id="StyleTable1">
	  <tr>
	  <th>Class Room Name</th>
      </tr>
       <c:forEach items="${batchList}" var="batch">
	   <tr>
      <td align="center">${batch.classRoomName}</td>
       </tr>
       </c:forEach>
      </table>
      </c:if>
      
      <c:if test="${batchList.size()==0}">
        ${batchMsg}
      </c:if>
      
    </div>
    <br>
    <hr>
    <h4 align="center"><a href="index.jsp">Back To Home Page</a></h4>
</body>
</html>