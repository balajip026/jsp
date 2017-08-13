<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.vit.bean.ots.trainee.OtsTraineeNominateTbl" %>    
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<form name="canceldetails" id="canceldetails"> 
<div align="center" class="swMain">
<s:iterator value = "otstraineenominate">
<table align="left" class="swMain">
	<tr>
       	<td align="left">Program Id :</td> <td align="left"><s:property value="proMainteanceTrainee.programId"/></td>
     </tr>
    <tr>
       	<td align="left">Course Name :</td> <td align="left"><s:property value="proMainteanceTrainee.courseName"/></td>
     </tr>
     <tr>
       	<td align="left">Last Updated Timestamp :</td> <td align="left"><s:property value="updateTimestamp"/></td>
     </tr>
     <tr>
        <td align="left"><s:textarea label="Cancel Remarks" id ="cancelremarks" name="cancelremarks" cols="30" rows="6"/> </td>
        
        
     </tr>
 </table>
</s:iterator>
</div>   
</form>   
</html>