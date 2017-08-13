<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.vit.action.ots.program.programMainteance" %>  
<%@ page import="net.vit.pat.DTO.UserProfile" %>  
<%@ page import="com.vit.bean.ots.trainer.EmpMaster"%>  
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<s:iterator value="EmpMaster"/>
<script type="text/javascript">
$(document).ready(function(){
	  var myGrid = $('#TrainerNominateTBL');
      var selRowId = myGrid.jqGrid ('getGridParam', 'selrow');
     // var programStartDate = myGrid.jqGrid ('getCell', selRowId, 'programStartDate');
     // var programEndDate = myGrid.jqGrid ('getCell', selRowId, 'programEndDate');
      
	var dateToday = new Date();
	
	$("#TrainingStartDate").val(Date.parse($("#TrainingStartDate").val()).toString('dd-MMM-yyyy'));
	$("#TrainingEndDate").val(Date.parse($("#TrainingEndDate").val()).toString('dd-MMM-yyyy'));
	var TrainingEndDate =  $("#TrainingEndDate").val();
	var trainingstartdate = $("#TrainingStartDate").val();
	var dateTodayConvert=Date.parse(dateToday.toString('d-MM-yy'));
	trainingstartdate = Date.parse(trainingstartdate.toString('d-M-yy'));
	TrainingEndDate = Date.parse(TrainingEndDate.toString('d-M-yy'));
	//alert(trainingstartdate);
	$(function() {
		$( "#trainingDates" ).multiDatesPicker({
		    changeMonth: true,
			changeYear: true,
			dateFormat: 'd-M-yy',
			minDate:trainingstartdate,
			maxDate:TrainingEndDate
		});
	});
	// EndDate Trainer Nomination

});
</SCRIPT>
</head>
<body>
<form name="add_trainer_nominate_form" id="add_trainer_nominate_id" > 
<table>
<tr><td>
<table align="left">

<s:iterator value="programMainteance">
<tr>
<td> Program Id : </td><td><input type="text" id="programId" name="programId" disabled="disabled" value="<s:property value='programMainteance.programId'/>"></td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>
<tr>
<td> Training Start Date : </td><td><input type="text" id="TrainingStartDate" name="TrainingStartDate" disabled="disabled" value="<s:property value='programMainteance.trainingStartDate'/>"></td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td> Training End Date : </td><td><input type="text" id="TrainingEndDate" name="TrainingEndDate" disabled="disabled" value="<s:property value='programMainteance.trainingEndDate'/>"></td>
</tr>
</s:iterator>
</table>
</td></tr>
<tr><td>
<div class="break" style="margin-top: 45px;"></div>
<br>
</td></tr>
<tr><td>
<table align="left">
<tr>
<td> Pick&nbsp;Training&nbsp;Dates : </td><td><input type="text" id="trainingDates"  name="trainingDates" readonly="readonly"></td>

</tr>
</table>
</td></tr>
</table>
</form>   
</body>
</html>