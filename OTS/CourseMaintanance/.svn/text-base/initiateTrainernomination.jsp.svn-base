<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.vit.action.ots.program.programMainteance" %>
<%@ page import="com.vit.bean.ots.trainer.TrainerNominate"%>
<%@ page import="com.vit.bean.ots.trainer.EmpMaster"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<STYLE type="text/css">
	fieldset.form
		{
		   width: 485px;
		   height: 80px;
		}
	
	fieldset.form legend 
		{
			font-size: 1.1em;
			line-height: 1.2em;
			font-weight: bold;
			color: #fff;
			padding: 1px;
			margin-bottom: 12px;
			padding-top: 4px;
		}
	.leftnav 
		{
		   height:330 px; 
		   float: left;
		   width:375px;
		    border-right: 1px solid #003D7A;
		}
	
	.rightContent 
		{
		   min-height: 400px;
		   float:left;
		}
</STYLE>

<SCRIPT type="text/javascript">

$(document).ready(function(){
$("#programStartDate").text(Date.parse($("#programStartDateHid").val()).toString('dd-MMM-yyyy'));
$("#programEndDate").text(Date.parse($("#programEndDateHid").val()).toString('dd-MMM-yyyy'));
$("#trainingStartDate").text(Date.parse($("#trainingStartDateHid").val()).toString('dd-MMM-yyyy'));
$("#trainingEndDate").text(Date.parse($("#trainingEndDateHid").val()).toString('dd-MMM-yyyy'));
var checkedVal; 
var programId = $("#programId").val();
var trainingStartDate = $("#trainingStartDate").val();
var trainingEndDate = $("#trainingEndDate").val();
	//alert(programId);
var data = $("#selectDiv").html();
// alert(data);
	$("#locationTBL").jqGrid({
		      // 	url:'TrainerFreezeData',
		      url:'TrainerFreezeData.action?programId='+programId,
		       	datatype: "json",
				jsonReader: {
					repeatitems : false,
					root : 'trainerNominationList', 
					page : function(obj) {
						return obj.page;
					},
					total : function(obj) {
						return obj.total;
					},
					records : function(obj) {
						return obj.records;
					}
				}, 
				colNames : [ 'ProgramID', 'Trainer Name', 'Training Dates',],
			    colModel : [ { name : 'programMainteanceTrainer.programId',index : 'programMainteanceTrainer.programId', align : "center" , hidden : true}, 
						   // { name : 'empmasterTrainer.empId',index : 'empmasterTrainer.empId', align : "center", key : true },
						     { name : 'empmasterTrainer.FName',index : 'empmasterTrainer.FName', align : "left", width:212 },
						     { name : 'trainingDates',index : 'trainingDates', align : "center", width:250 ,editable : true }
				             //{ name : 'trainerproposedStartDate',index : 'trainerproposedStartDate', align : "center", width:120 ,editable : true, formatter:'date', "formatoptions":{"srcformat":"Y-m-d", "newformat":"d-M-Y"}},
					        // { name : 'trainerproposedEndDate',index : 'trainerproposedEndDate', align : "center", width:120 , editable : true, formatter:'date', "formatoptions":{"srcformat":"Y-m-d", "newformat":"d-M-Y"}}
					       ],  
					               
					                                                      
			    //rowNum : 5,
				//rowList : [ 10, 20, 30 ],
				pager : '#locationNavTBL',
				loadatonce : false,
				viewrecords : true,
				rownumbers: true,
				// multiselect : true,
				gridview : true,
				height : 93,
				sortorder : "desc",
				sortname : "programMainteance.programId",
				onSelectRow : function(trainerID){
						checkedVal = trainerID;
						//alert(checkedVal);
				}

			}); 

});		
</SCRIPT>
</head>
<body>
<fieldset class="form" ><legend style="color: #fffFFF; background: #185994; border: 1px solid #781351; padding: 2px 8px; "><b>Program Details</b></legend>
<table class="swMain" >
            <tr>
			   <td align="left"><b>Program Id :</b></td><td align="left"> <s:property value="programId"/></td>
			   <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>
       	       <td align="left"><b>Program StartDate :</b></td><td><SPAN id="programStartDate"></SPAN></td>
               <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
              <td align="left"><b>Program EndDate :</b></td><td><SPAN id="programEndDate"></SPAN></td>
            </tr>
          	<tr>
       	       <td align="left"><b>Training StartDate :</b></td><td><SPAN id="trainingStartDate"></SPAN></td>
               <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
       	       <td align="left"><b>Training EndDate :</b></td><td><SPAN id="trainingStartDate"></SPAN></td>
            </tr>
</table>
</fieldset>
<s:hidden id="programStartDateHid" value="%{trainerNominationList[0].programMainteanceTrainer.programStartDate}"></s:hidden>
<s:hidden id="programEndDateHid"  value="%{trainerNominationList[0].programMainteanceTrainer.programEndDate}"></s:hidden>
<s:hidden id="trainingStartDateHid"  value="%{trainerNominationList[0].programMainteanceTrainer.trainingStartDate}"></s:hidden>
<s:hidden id="trainingEndDateHid"  value="%{trainerNominationList[0].programMainteanceTrainer.trainingEndDate}"></s:hidden>
<br>
<br>
<table id="locationTBL"></table>
<br>
<s:hidden id="programId"  name="programId" key="programId" ></s:hidden>
</body>
<s:form name="TrainerFreeze" id="TrainerFreeze" theme="simple"> 
<div align="left">
<fieldset class="form" ><legend style="color: #fffFFF; background: #185994; border: 1px solid #781351; padding: 2px 8px; "><b>Select Trainers</b></legend>
<table align="center" class="swMain" >
         <tr>
			 <td><s:label value="Primary Trainer :" labelposition="left" ></s:label></td> 
			 <td><s:select id="PrimaryTrainer" name="PrimaryTrainer"  headerKey="" headerValue="Select..." list="trainerNominationList" listKey="empmasterTrainer.empId" listValue="empmasterTrainer.fName">
			  </s:select></td>
			  </tr>
			  <tr>
	    <td><s:label value="Backup Trainer :" labelposition="left" ></s:label></td>
        <td><s:select id="backupTrainer" name="backupTrainer" headerKey="" headerValue="Select..." list="trainerNominationList" listKey="empmasterTrainer.empId" listValue="empmasterTrainer.fName"></s:select></td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>
</table>
</fieldset>
</div>
 </s:form>
</html>
