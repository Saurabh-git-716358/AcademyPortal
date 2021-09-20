<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.academy.Models.Employee" %>
<%@ page import="com.academy.Models.Faculty" %>

 	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>

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

	<h3 align="center" style="color:blue;">Admins Dashboard</h3>
	<h4 align="center" style="color:blue;">${message}</h4>
	<div align = "right">
	<a href="logout"><input type="button" class="button" value="Log Out"></a>
    </div> 
	<hr class="new1">


	<div align="center">
	
	
	<c:choose>
	<c:when test="${newFacStatus==999}">
	<a href="showFacultyRequests"><input type="button" class="button" value="Show Faculty Requests"></a>
	<img width="29" height="29" src="<%=request.getContextPath()%>/resources/image/blink.gif">
    </c:when>
    <c:otherwise>
    <a href="showFacultyRequests"><input type="button" class="button" value="Show Faculty Requests"></a>
	</c:otherwise>
	</c:choose>
    <c:if test = "${Flist.size()==0}">
      <h4>No Faculties Registered</h4>
    </c:if>
    
	<c:if test = "${Flist.size()>0}">
	 <h4>Faculty Registered</h4>
	<table id="StyleTable" align="center">
	 <tr>
	 <th>User Id</th>
	 <th>First Name</th>
	 <th>Last Name</th>
	 <th>Date of Birth</th>
	 <th>Gender</th>
	 <th>Contact No</th>
	 <th>Email Id</th>
	 <th>Skill Family</th>
     <th colspan="2">Skill List</th>
     <th> Status Approve </th>
	 <th> Status Reject </th>
	 </tr>
	 <c:forEach items="${Flist}" var="faculty">
	   <tr>
	     <td>${faculty.userid}</td>
	     <td>${faculty.fname}</td>
	     <td>${faculty.lname}</td>
	     <td>${faculty.dob}</td>
	     <td>${faculty.gender}</td>
	     <td>${faculty.contactno}</td>
	     <td>${faculty.email}</td>
	     <td>${faculty.skillFamily}</td>
	     <td><a  href="getSkills/${faculty.userid}" >Get List</td>
	     <td>
	     
	     <c:if test = "${fid==faculty.userid}">
	     ${skillStringList}
	     </c:if>
 
	     </td> 
	   
	  <td>
	  
	  <c:if test="${faculty.status==0}">
	  <a  href="Fapprove/${faculty.userid}" >
	  <c:if test = "${facid==faculty.userid}">
	  ${statusMsg}
	  </c:if>
	  
      <c:if test = "${facid!=faculty.userid || facid==null}">
      Approve Request
      </c:if>
  
	  </a>
	  </c:if>  
	  
	  <c:if test="${faculty.status==1}">
            Approved
      </c:if>
            
      <c:if test="${faculty.status==-1}">
            -
      </c:if>
	  </td>
	  
	  <td>
	  <c:if test="${faculty.status==0}">
	  <a href="Freject/${faculty.userid}">
	  
	  <c:if test = "${Facid==faculty.userid}">
	  ${StatusMsg}
	  </c:if>
	  
      <c:if test = "${Facid!=faculty.userid || Facid==null}">
      Reject Request
      </c:if>
	  
	  </a>
	  </c:if>
	    
	  <c:if test="${faculty.status==1}">
            -
      </c:if>
            
      <c:if test="${faculty.status==-1}">
            Rejected
      </c:if>
	  </td>
	  
	     
	     
	   </tr>
	 </c:forEach>
	</table>
	</c:if>
	
	${Fname} 
	${fname}
	<br>
	<br>
	
	
	
	<c:choose>
	<c:when test="${newEmpStatus==999}">
	<a href="showEmployeeRequests"><input type="button" class="button" value="Show Employee Requests"></a>
	<img width="29" height="29" src="<%=request.getContextPath()%>/resources/image/blink.gif">
	</c:when>
	<c:otherwise>
	<a href="showEmployeeRequests"><input type="button" class="button" value="Show Employee Requests"></a>
	</c:otherwise>
	</c:choose>
	<c:if test = "${Elist.size() == 0}">
	<h4>No Employees Registered</h4>
	</c:if>
	<c:if test = "${Elist.size() > 0}">
    <h4>Employee Registered</h4>
	<table align="center" id="StyleTable">
	<tr>
	<th> UserId </th>
	<th> First Name </th>
	<th> Last Name </th>
	<th> Date Of Birth </th>
	<th> Gender </th>
	<th> Contact No </th>
	<th> Email Id </th>
	<th> Status Approve </th>
	<th> Status Reject </th>
	</tr>
	<c:forEach items="${Elist}" var="employee">
	<tr>
	  <td>${employee.userid}</td>
	  <td>${employee.fname}</td>
	  <td>${employee.lname}</td>
	  <td>${employee.dob}</td>
	  <td>${employee.gender}</td>
	  <td>${employee.contactno}</td>
	  <td>${employee.email}</td>
	  
	  <td>
	  <c:if test="${employee.status==0}">
	  <a  href="Eapprove/${employee.userid}" >
	
	  <c:if test = "${id==employee.userid}">
	  ${statusMsg}
	  </c:if>
	  
      <c:if test = "${id!=employee.userid || id==null}">
      Approve Request
      </c:if>
          
	  </a>
	  </c:if>
	  
	  
	  <c:if test="${employee.status==1}">
            Approved
      </c:if>
            
      <c:if test="${employee.status==-1}">
            -
      </c:if>
	  </td>
	  
	  
	  
	  <td> 
	  <c:if test="${employee.status==0}">
	  <a href="Ereject/${employee.userid}">
	  
	  <c:if test = "${Eid==employee.userid}">
	  ${StatusMsg}
	  </c:if>
	  
      <c:if test = "${Eid!=employee.userid || Eid==null}">
      Reject Request
      </c:if>
	  
	  </a>
	  </c:if>
	  
	  <c:if test="${employee.status==1}">
            -
      </c:if>
            
      <c:if test="${employee.status==-1}">
            Rejected
      </c:if>
	  </td>
	  
	  
	</tr>
	</c:forEach>
	</table>
	</c:if>
    
    ${Ename} 
	${ename}  
	
	<br>
	<br>
	
	<a href="ApprovedEmployee"><input type="button" class="button" value="Show Approved Employee List"></a>
	<c:if test = "${approvedList.size() == 0}">
	    <h4>NA</h4>
	</c:if>
	<c:if test = "${approvedList.size() > 0}">
    <h4>Approved Employees from Admin</h4>
	<table align="center" id="StyleTable">
	<tr>
	<th> UserId </th>
	<th> First Name </th>
	</tr>
	<c:forEach items="${approvedList}" var="employee">
	<tr>
	  <td align="center">${employee.userid}</td>
	  <td align="center">${employee.fname}</td>
	</tr>
	</c:forEach>
	</table>
	</c:if>
	
	<br>
	<br>
	
	<a href="ApprovedFaculty"><input type="button" class="button" value="Show Approved Faculty List"></a>
	<c:if test = "${approvedFList.size() == 0}">
	 <h4>NA</h4>
	</c:if>
	<c:if test = "${approvedFList.size() > 0}">
    <h4>Approved Faculty from Admin</h4>
	<table align="center" id="StyleTable">
	<tr>
	<th> UserId </th>
	<th> First Name </th>
	<th>Last Name</th>
	<th>Skill Family</th>
	</tr>
	<c:forEach items="${approvedFList}" var="faculty">
	<tr>
	  <td align="center">${faculty.userid}</td>
	  <td align="center">${faculty.fname}</td>
	  <td align="center">${faculty.lname}</td>
	  <td align="center">${faculty.skillFamily}</td>
	</tr>
	</c:forEach>
	</table>
	</c:if>
	
	<br>
	<br>
	
	<a href="AddModule"><input type="button" class="button" value="Add Module"></a>
	
	<br>
	<br>
   
    <a href="LinkModule"><input type="button" class="button" value="Link Module to Faculty"></a>
    <c:if test = "${mlist.size() == 0}">
     <h4>No Modules Registered , register from above option </h4>
    </c:if>
    <c:if test = "${mlist.size() > 0}">
    <h4>Registered Modules from Admin</h4>
	<table align="center" id="StyleTable">
    <tr>
	<th>Module Id </th>
	<th> Module Name </th>
	<th>Skill Family</th>
	<th colspan="3">Find Faculty for Module</th>
	</tr>
	<c:forEach items="${mlist}" var="m">
	<tr>
	  <td align="center">${m.mid}</td>
	  <td align="center">${m.mname}</td>
	  <td align="center">${m.skillFamily}</td>
	  <td align="center"><a href="findFaculty/${m.mid}">Find Faculty</a></td>
	   <td align="center">
	       
	   <c:if test = "${FList==-1}">
       No Faculty Registered Yet
	  </c:if>
	       
	       
	  <c:if test = "${mid==m.mid}">
       ${Ffid}  ${name}
	  </c:if>
	  
	  <c:if test = "${m.facApproval==1 && m.fid!=0}">
	   ${m.fid} Assigned
	  </c:if>
	  
	   <c:if test = "${m.facApproval==-1 && m.fid!=0}">
	   ${m.fid} Rejected
	  </c:if>
	  
	   </td>
	   <td align="center"><a href="LinkFaculty/${Ffid}/${m.mid}">Link Faculty</a></td>
	   
	</tr>
	</c:forEach>
	</table>
	</c:if>
    ${Mid} ${Fid} 
    <br>
    ${moduleMsg}
    
    <br>
	
	<a href="showFacModules"><input type="button" class="button" value="Show Approved/Rejected Modules & Create Batch"></a>
	 <c:if test="${mList.size()==0}">
	 <h4>No Modules available</h4>
	 </c:if>
	 <c:if test="${mList.size()>0}">
	 <h4>Approved / Rejected Modules from Faculty</h4>
	 <h5>Approved Modules will be published to all Employees after batch registration</h5>
	<table align="center" id="StyleTable">
	<tr>
	<th> Module Id </th>
	<th> Module Name </th>
	<th> Faculty Id</th>
	<th> Faculty Status</th>
	<th colspan="2"> Create Batch </th>
	</tr>
	<c:forEach items="${mList}" var="module">
	<tr>
	  <td align="center">${module.mid}</td>
	  <td align="center">${module.mname}</td>
	  <td align="center">${module.fid}</td>
	  <td align="center">
	     <c:choose>
	       <c:when test="${module.facApproval==1}">
	          Approved
	       </c:when>
	       <c:when test="${module.facApproval==0}">
	          Waiting Facultys Approval
	       </c:when>
	       <c:when test="${module.facApproval==-1}">
	          Rejected
	       </c:when>
	     </c:choose>
	  </td>
	  <td align="center">
	     <c:choose>
	     
	       <c:when test="${module.facApproval==1}">
<a href="RegisterBatch/${module.mid}"><input type="button" class="button" value="Register Batch"></a>
	          <c:choose>
	          <c:when test="${register==1}">
	           <jsp:forward page ="BatchRegisteration.jsp">
	           <jsp:param name="mname" value="${currentModule.mname}" /> 
               <jsp:param name="mid" value="${currentModule.mid}" /> 
               <jsp:param name="fid" value="${currentModule.fid}" /> 
               <jsp:param name="mid" value="${currentModule.mid}" />
               <jsp:param name="skillFamily" value="${currentModule.skillFamily}" />
	           </jsp:forward>
	          </c:when>
	          
	          <c:when test="${register==0}">
	            <c:if test="${rmid==module.mid}">
	             Batch Already Registered
	            </c:if>
	          </c:when>
	          </c:choose>
	       </c:when>
	       
	       
	       <c:when test="${module.facApproval==0}">
	          Wait For Approval
	       </c:when>
	       
	       <c:when test="${module.facApproval==-1}">
	          Module Rejected 
	       </c:when>
	       
	     </c:choose>
	  </td>
	  
	</tr>
	
	</c:forEach>  
	</table>  
	</c:if>
	

	</div>
	
	<br>
	<hr class="new1">
	
	<h4 align="center" style="color:blue;"><a href="index.jsp">Back To Home Page</a></h4>
	

	
   
    
    

</body>
</html>


