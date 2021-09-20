<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.academy.Models.Modules" %>
<%@ page import="com.academy.Models.Batch" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Faculty</title>

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
	<h3 align="center" style="color:blue;">Facultys Dashboard</h3>
	<h4 align="center" style="color:blue;">${message}</h4>
	<div align = "right">
	<a href="logout"><input type="button" class="button" value="Log Out"></a>
    </div> 
	
	<hr class="new1">
	
<div align="center">
    <br>
	<c:choose>
	<c:when test="${newModules==999}">
    <a href="showModules"><input type="button" class="button" value="Show Modules Assigned"></a>
    <img width="29" height="29" src="<%=request.getContextPath()%>/resources/image/blink.gif">
    </c:when>
    <c:otherwise>
    <a href="showModules"><input type="button" class="button" value="Show Modules Assigned"></a>
    </c:otherwise>
    </c:choose>
     <br>
     <c:if test = "${ModuleList.size()>0}">
	 <h4>Modules Assignes by Admin</h4>
	<table id="StyleTable" align="center">
	 <tr>
	 <th>Module Id</th>
	 <th>Module Name</th>
	 <th>Skill Family</th>
	 <th>Execution Type</th>
	 <th>Certification Name</th>
	 <th>Certification Type</th>
	 <th>Faculty Id</th>
     <th>Status Approve </th>
	 <th>Status Reject </th>
 	 </tr>	
 	  <c:forEach items="${ModuleList}" var="module">
	   <tr>
	     <td>${module.mid}</td>
	     <td>${module.mname}</td>
	     <td>${module.skillFamily}</td>
	     <td>${module.executionType}</td>
	     <td>${module.certificateName}</td>
	     <td>${module.certificateType}</td>
	     <td>${module.fid}</td>
 	      <td>
 	       
 	       <c:if test="${module.facApproval==0}">
 	       <a href="Mapprove/${module.mid}" >
	
	       <c:if test = "${id==module.mid}">
	       ${statusMsg}
	       </c:if>
	  
           <c:if test = "${id!=module.mid || id==null}">
           Approve Module
           </c:if>
           </a>
           </c:if>
           
            <c:if test="${module.facApproval==1}">
            Approved
            </c:if>
            
            <c:if test="${module.facApproval==-1}">
            -
            </c:if>
 	      </td>
 	      
 	      <td>
 	      <c:if test="${module.facApproval==0}">
 	      <a href="Mreject/${module.mid}">
	  
	      <c:if test = "${Eid==module.mid}">
	      ${StatusMsg}
	      </c:if>
	  
          <c:if test = "${Eid!=module.mid || Eid==null}">
          Reject Module
          </c:if>
	  
	      </a>
	      </c:if>
	      
	       <c:if test="${module.facApproval==1}">
            -
            </c:if>
            
            <c:if test="${module.facApproval==-1}">
            Rejected
            </c:if>
	      
 	      </td>
 	   </tr>
 	   </c:forEach>  
    </table>	 
    </c:if>
    ${Mname}
    ${RMname}
    <br>
    
    <c:if test = "${ModuleList.size()==0}">
    No Modules Assigned by Admin (Check after sometimes)
    </c:if>
    <br>
    
    
    
    
 <c:choose>
	<c:when test="${newBatches==999}">
     <a href="showBatch"><input type="button" class="button" value="Show Batch Assigned for Module"></a>
    <img width="29" height="29" src="<%=request.getContextPath()%>/resources/image/blink.gif">
    </c:when>
    <c:otherwise>
     <a href="showBatch"><input type="button" class="button" value="Show Batch Assigned for Module"></a>
    </c:otherwise>
 </c:choose> 
  
 <br>
 
  <c:if test = "${BatchList.size()>0}">
	 <h4>Batches Assigned by Admin for accepted Modules</h4>
	 <h5>Batches will be appeared to Employees</h5>
	<table id="StyleTable" align="center">
	 <tr>
	 <th>ClassRoom Name</th>
	 <th>Module Name</th>
	 <th>Module Id</th>
	 <th>Skill Family</th>
	 <th>Course Start Date</th>
	 <th>Course End Date</th>
	 <th>Batch Capacity</th>
     <th>Student Registered </th>
	
 	 </tr>	
 	  <c:forEach items="${BatchList}" var="batch">
	   <tr>
	     <td>${batch.classRoomName}</td>
	     <td>${batch.mname}</td>
	     <td>${batch.mid}</td>
	     <td>${batch.skillFamily}</td>
	     <td>${batch.startDate}</td>
	     <td>${batch.endDate}</td>
	     <td>${batch.batchCapacity}</td>
	     <td>${batch.studentRegistered}</td>
 	   </tr>
 	   </c:forEach>  
    </table>	 
    </c:if>
    
    
    <c:if test = "${BatchList.size()==0}">
    No Batches Assigned by Admin (Check after sometimes)
    </c:if>   
</div>
	
	
	
<br>	
<hr class="new1">
<h4 align="center"><a href="index.jsp">Back To Home Page</a></h4>

</body>
</html>