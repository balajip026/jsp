<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@include file="../CommonJSs.jsp" %>

<div align="center" class="swMain"> 
<table>
   <tr>
         <td> Status: </td>
          <td><select id="primaryTrainer">
             	 	<option value="ONLN">New </option>
             		<option value="CLSR">TrainerNom In Progress</option>
             		<option value="CLSR">TrainerNom Completed</option>
             		<option value="CLSR">TraineeNom In Progress</option>
             		<option value="CLSR">TraineeNom Completed</option>
             	</select></td>
     </tr>
     </table>

</div>      
</html>