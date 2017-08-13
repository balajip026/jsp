<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.vit.action.ots.program.programMainteance" %>
<%@ page import="com.vit.ots.utils.OTSSupport"%>  
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<%@page import="net.vit.pat.DTO.UserProfile"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<SCRIPT type="text/javascript">

$("#trainingStartDate").text(Date.parse($("#trainingStartDateHid").val()).toString('dd-MMM-yyyy'));
$("#trainingEndDate").text(Date.parse($("#trainingEndDateHid").val()).toString('dd-MMM-yyyy'));

$(document).ready(function(){
   	var primaryTrainer = $("#primaryTrainerHId").val();
   	var backUpTrainer = $("#backupTrainerHID").val();
      $.ajax({url: "EmpName.action", 
               data : "empId="+primaryTrainer,
               success: function(data){
           				 $("#primaryTrainerName").text(data.empname);
                 },
              async:false
        });       
       	$.ajax({url: "EmpName.action", 
           data : "empId="+backUpTrainer,
           success: function(data){
       				 $("#backUpTrainerName").text(data.empname);
             },
          async:false
    	});                
});
</SCRIPT>
<form name="frm_demo" id="frm_demo"> 
<div align="center" class="swMain"> 
<s:iterator value="programMainteance">
<table align="left" class="swMain">
	<tr>
       	<td align="left">Program Id</td><td> :</td><td align="left"> <s:property value="programId"/></td>
     </tr>
     <tr>
       	<td align="left">Course Name</td><td > :</td><td align="left"> <s:property value="courseName"/></td>
     </tr>
     <tr>
       	<td align="left">Training StartDate </td><td> :</td><td align="left"> <SPAN id="trainingStartDate"> </SPAN></td>
     </tr>
     <tr>
       	<td align="left">Training EndDate</td><td> :</td><td align="left"> <SPAN id="trainingEndDate"> </SPAN></td>
     </tr>
     <tr>
       	<td align="left">Primary Trainer </td><td> :</td><td align="left"><span id="primaryTrainerName"></span> </td>
     </tr>
     <tr>
       	<td align="left">Backup Trainer</td><td> :</td><td align="left"> <span id="backUpTrainerName"></span></td>
       	
     </tr>
     <%
     String empPremise=OTSSupport.getLoggedUserProfile().getEmppremise();
     %>
     <s:iterator value="traininglocationlist">
	     <tr>
	         <s:set var="pri" value="%{primise}"></s:set>
	           <s:set scope="request" var="reqpremise" value="pri"/>
				<%
				String mypremise = (String)request.getAttribute("reqpremise");
				//out.println("got it mypremise :: "+ mypremise);
				//out.println("got it emppremise :: "+ empPremise);
				if(mypremise.equalsIgnoreCase(empPremise))
				{
					//out.println("got it ");
				%>
		       	<td align="left">Location </td><td>:</td>
		       	<td align="left"><s:property value="primise"/>&nbsp,&nbsp<s:property value="location"/></td>
			<%
				}
			%>
		</tr>
	<s:hidden id="primaryTrainerHId"  name="primaryTrainer" key="primaryTrainer" ></s:hidden>
	<s:hidden id="backupTrainerHID"  name="backupTrainer" key="backupTrainer" ></s:hidden>
	<s:hidden id="trainingStartDateHid"  value="%{trainingStartDate}"></s:hidden>
    <s:hidden id="trainingEndDateHid"  value="%{trainingEndDate}"></s:hidden>
     </s:iterator>
     
</table>
</s:iterator>
</div>   
</form>   
</html>