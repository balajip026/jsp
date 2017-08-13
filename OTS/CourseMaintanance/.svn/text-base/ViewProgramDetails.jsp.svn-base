<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.vit.bean.ots.trainer.TrainerNominate"%>
<%@ page import="com.vit.bean.ots.trainer.EmpMaster"%>
<%@ page import = "com.vit.action.ots.program.programMainteance" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>  
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Program Details</title>
<%@include file="../CommonJSs.jsp" %>
</head>
<STYLE type="text/css">
	fieldset.form
		{
		   width: 315px;
		   height: 280px;
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
	$( "#viewTab" ).tabs();    
	var programMaintenance = $("#programObj").val();
	/*$("#trainingType").text(programMaintenance.trainingType);
	$("#examMode").text(programMaintenance.examMode);
	$("#courseName").text(programMaintenance.courseName);
	$("#programStartDate").text(programMaintenance.programStartDate);
	$("#programEndDate").text(programMaintenance.programEndDate);
	$("#trainingStartDate").text(programMaintenance.trainingStartDate);
	$("#trainingEndDate").text(programMaintenance.trainingEndDate);
	$("#trainingStartTime").text(programMaintenance.trainingStartTime);
	$("#trainingEndTime").text(programMaintenance.trainingEndTime);
	$("#trainerNomStartDate").text(programMaintenance.trainerNomStartDate);
	$("#trainerNomEndDate").text(programMaintenance.trainerNomEndDate);
	$("#traineeNomStartDate").text(programMaintenance.traineeNomStartDate);
	$("#traineeNomEndDate").text(programMaintenance.traineeNomEndDate);
	//$("#status").text(programMaintenance.status);
	//$("#cancelRemarks").text(programMaintenance.cancelRemarks);
	$("#trainingMode").text(programMaintenance.trainingMode);
	$("#numOfTrainees").text(programMaintenance.numOfTrainees);
	$("#numOfTraineesBackup").text(programMaintenance.numOfTraineesBackup);
	//$("#primaryTrainer").text(programMaintenance.primaryTrainer);
	//$("#backupTrainer").text(programMaintenance.backupTrainer);
	//$("#noExamSchedules").text(programMaintenance.noExamSchedules);
	$("#isrmapproval").text(programMaintenance.isrmapproval);
	$("#attendanceEligibility").text(programMaintenance.attendanceEligibility);
	$("#trainerDistributionDept").text(programMaintenance.trainerDistributionDept);
	$("#trainerDistributionRole").text(programMaintenance.trainerDistributionRole);
	$("#traineeDistributionDept").text(programMaintenance.traineeDistributionDept);
	$("#traineeDistributionRole").text(programMaintenance.traineeDistributionRole);
	//$("#updateUser").val(programMaintenance.updateUser);
	//$("#updateTimestamp").val(programMaintenance.updateTimestamp);
*/
	if($("#isApprovalReq").val() == "Y"){
		$("#isrmapproval").attr("checked","checked");
	}
	if($("#attendanceEligibilityFlagReq").val() == "Y"){
		$("#attendanceEligibilityFlag").attr("checked","checked");
	}

	if($("#traineesAllocationFlagReq").val() == "M"){
		$("#traineesAllocationFlag").attr("checked","checked");
	}
	if($("#isExamReqHid").val() == "Y"){
		$("#examMode").attr("checked","checked");
	}
var programId = $("#programIdHid").val();
	$("#locationTBL").jqGrid({
		url:'LocationSet.action?programId='+programId,
		datatype: "json",
		jsonReader: {
			repeatitems : false,
			root : 'model',
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
		colNames : [ 'Location', 'Primise', 'Conference Room','No Of Partiscipents','No of allowed Nominations'],
        colModel : [ 
                     { name : 'location',index : 'location', align : "center",editable : true,editoptions : {size : 20},summaryType:'count',summaryTpl : 'Count : {0}',hidden:true},
                     { name : 'primise',index : 'primise', align : "center",editable : true,editoptions : {size : 20}},
                     { name : 'conferenceCode',index : 'conferenceCode', align : "center",editable : true,editoptions : {size : 20},key:true},
                     { name : 'numOfTrainees',index : 'numOfTrainees', align : "center",editable : true,editoptions : {size : 20},summaryType:'sum',summaryTpl : 'Total : {0}'},
                     { name : 'numOfAllowedNom',index : 'numOfAllowedNom', align : "center",editable : true,editoptions : {size : 20},summaryType:'max',hidden:true}],
        rowNum : 4,
		//rowList : [ 10, 20, 30 ],
		pager : '#locationNavTBL',
		loadatonce : true,
		viewrecords : true,
		width : 800,
		height : 180,
		sortorder : "desc",
		sortname : "programId",
		gridview:true,
		grouping: true,
	   	groupingView : {
	   		groupField : ['location'],
	   		//groupColumnShow : [false],
	   		groupSummary : [true],
	   		groupText : ['<b>{0} - Allowed Nominations : {numOfAllowedNom}</b>']
		}
		

	}); 
			$("#locationTBL").jqGrid('navGrid', '#locationNavTBL', {
				add : false,
				edit : false,
				del : false,
				search : false,
				view : false,
				refresh:false
			});


			$("#trainerDetailsTBL").jqGrid({
				url:'listTrainerNominateForView.action?programId='+programId,
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
				colNames : [ 'Trainer Id', 'Trianer Name', 'Status'],
		        colModel : [ 
		                     { name : 'empmasterTrainer.empId',index : 'empmasterTrainer.empId', sortable:false, align : "center",editable : true, width : 70 },
		                     { name : 'empmasterTrainer.FName',index : 'empmasterTrainer.FName', sortable:false, align : "center",editable : true,editoptions : {size : 20}},
		                     { name : 'statusForTrainer.statusDesc',index : 'statusForTrainer.statusDesc', sortable:false, align : "center",editable : true,editoptions : {size : 20},key:true}],
				//rowList : [ 10, 20, 30 ],
				//pager : '#trainerDetailsNavTBL',
				loadatonce : true,
				viewrecords : true,
				width : 500,
				height : 250,
				sortorder : "desc",
				sortname : "programId",
				gridview:true

			}); 
					$("#trainerDetailsTBL").jqGrid('navGrid', '#trainerDetailsNavTBL', {
						add : false,
						edit : false,
						del : false,
						search : false,
						view : false,
						refresh:false
					});

					$("#traineeDetailsTBL").jqGrid({
						url:'listTraineeNominateForView.action?programId='+programId,
						datatype: "json",
						jsonReader: {
							repeatitems : false,
							root : 'traineeListForProgram',
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
						colNames : [ 'Trainee Id', 'Trianee Name', 'Status'],
				        colModel : [ 
				                     { name : 'empMaster.empId',index : 'empMaster.empId', align : "center",editable : true,sortable:false, width : 70 },
				                     { name : 'empMaster.FName',index : 'empMaster.FName', align : "center",sortable:false, editable : true,editoptions : {size : 20}},
				                     { name : 'traineeStatus',index : 'traineeStatus', align : "center", sortable:false,
				                    	 formatter:function(cellvalue, options, rowObject){
				                    		$.ajax({url: "StatusDescription.action", 
												data : "statusCode="+cellvalue,
										        success: function(data)
											      {
				                    					cellvalue = data.statusDesc;
											      },
											    async:false
				                    		});		
									      return cellvalue;  }}],
						//rowList : [ 10, 20, 30 ],
						//pager : '#traineeDetailsNavTBL',
						loadatonce : true,
						viewrecords : true,
						width : 500,
						height : 250,
						sortorder : "desc",
						sortname : "programId",
						gridview:true

					}); 
							$("#traineeDetailsTBL").jqGrid('navGrid', '#traineeDetailsNavTBL', {
								add : false,
								edit : false,
								del : false,
								search : false,
								view : false,
								refresh:false
							});
			$("#examScheduleTBL").jqGrid({
				url:'viewExamSchedules.action?programId='+programId,
				datatype: "json",
				jsonReader: {
					repeatitems : false,
					root : 'examList',
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
				colNames : [ 'Exam Date', 'Exam Open Time', 'Exam Close Time','Total No Questions','No of Objective',
								'No Of Subjective'],
		        colModel : [ 
		                     { name : 'examDate',index : 'examDate', align : "center", editable : true,editoptions : {size : 20},key:true},
		                     { name : 'examOpenTime',index : 'examOpenTime', align : "center",editable : true,editoptions : {size : 20}},
		                     { name : 'examCloseTime',index : 'examCloseTime', align : "center",editable : true,editoptions : {size : 20}},
		                     { name : 'totalQuestion',index : 'totalQuestion', align : "center",editable : true,editoptions : {size : 20}},
		                   	 { name : 'noObjective',index : 'noObjective', align : "center",editable : true,editoptions : {size : 20},hidden:true},
		                   	 { name : 'noSubjective',index : 'noSubjective', align : "center",editable : true,editoptions : {size : 20},hidden:true}],
		        rowNum : 4,
				//rowList : [ 10, 20, 30 ],
				pager : '#examSchedulesNav',
				loadatonce : true,
				viewrecords : true,
				height : 93,
				sortorder : "desc",
				sortname : "examDate",
				onSelectRow : function(location){
					//alert(location);
				}

			}); 
			
					$("#examScheduleTBL").jqGrid('navGrid', '#examSchedulesNav', {
						add : false,
						edit : false,
						del : false,
						search : false,
						view : false,
						refresh:false
					});
					
	$("#btnCancel").click(function(){
		
		$("#programViewForm").attr("action","SearchProgram");
		$("#programViewForm").submit();
	});
	$("#btnEdit").click(function(){
		
		$("#programViewForm").attr("action","editProgramDetails?programId="+programId);
		$("#programViewForm").submit();
	});
	$(function() {
		if($("#programStartDate").text() != null && $("#programStartDate").text() !=""){
			$("#programStartDate").text(Date.parse($("#programStartDate").text()).toString('dd-MMM-yyyy'));
		}if($("#programEndDate").text() != null && $("#programEndDate").text() !=""){
			$("#programEndDate").text(Date.parse($("#programEndDate").text()).toString('dd-MMM-yyyy'));
		}if($("#trainingStartDate").text() != null && $("#trainingStartDate").text() !=""){
			$("#trainingStartDate").text(Date.parse($("#trainingStartDate").text()).toString('dd-MMM-yyyy'));
		}if($("#trainingEndDate").text() != null && $("#trainingEndDate").text() !=""){
			$("#trainingEndDate").text(Date.parse($("#trainingEndDate").text()).toString('dd-MMM-yyyy'));
		}if($("#trainerNomStartDate").text() != null && $("#trainerNomStartDate").text() !=""){
			$("#trainerNomStartDate").text(Date.parse($("#trainerNomStartDate").text()).toString('dd-MMM-yyyy'));
		}if($("#trainerNomEndDate").text() != null && $("#trainerNomEndDate").text() !=""){
			$("#trainerNomEndDate").text(Date.parse($("#trainerNomEndDate").text()).toString('dd-MMM-yyyy'));
		}if($("#traineeNomStartDate").text() != null && $("#traineeNomStartDate").text() !=""){
			$("#traineeNomStartDate").text(Date.parse($("#traineeNomStartDate").text()).toString('dd-MMM-yyyy'));
		}if($("#traineeNomEndDate").text() != null && $("#traineeNomEndDate").text() !=""){
			$("#traineeNomEndDate").text(Date.parse($("#traineeNomEndDate").text()).toString('dd-MMM-yyyy'));
		}
	});
});
</SCRIPT>
<body>
<form id="programViewForm" name="programViewForm" method="post" action="saveOrUpdateprogramMainteance"> 
<s:hidden id="programObj" name="programObj" key="model" value="%{programMainteance}"></s:hidden>
<br>
<div id="heading" class="title" align="left">Program Details</div>
<br>
<table align="center" border="0" cellpadding="0" cellspacing="0" width="95%" height="90%">
<tr><td>
<div id="viewTab" class="tabsContent">
<ul>
  				<li><a href="#programDetails">
                <label class="stepNumber"></label>
                <span class="stepDesc">
                   Program Details</span><br />
                   <small></small>
                
            </a></li>
  				<li><a href="#programDetails1">
                <label class="stepNumber"></label>
                <span class="stepDesc">
                   Nomination Distribution Details</span><br />
                   <small></small>
                
            </a></li>
  				<li><a href="#locationDetails">
                <label class="stepNumber"></label>
                <span class="stepDesc">
                   Location Details</span><br />
                   <small></small>
                                   
             </a></li>
             <li><a href="#ExamDetails">
                <label class="stepNumber"></label>
                <span class="stepDesc">
                   Examination Details</span><br />
                   <small></small>
             </a></li>
             <li><a href="#traineeAndTrainerDetails">
                <label class="stepNumber"></label>
                <span class="stepDesc">
                    Trainer & Trainee Details<br />
                   <small></small>
                </span>                   
             </a></li>
  			</ul>
  			<div id="programDetails">	
            <h2 class="StepTitle"></h2>
            <table align="left">
             <tr><td>Program Type : </td>
             	 <td><s:property value="programMainteance.trainingType" />
             	 </td>
             	 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
             	 <td>Training Mode : </td>
			 		 <td><s:property value="programMainteance.trainingMode"/></td>
             		
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td>Course Name : </td><td><s:property value="programMainteance.courseName"/>
            								</td>
            	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            	<td>Program Name : </td><td><s:property value="programMainteance.programId" /></td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
            	<td> Program Start Date : </td><td><span id="programStartDate"><s:property  value="programMainteance.programStartDate" /></span></td>
            	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            	<td> Program End Date : </td><td><span id="programEndDate"><s:property  value="programMainteance.programEndDate" /></span></td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
            	<td> Trainer Nomination Start Date : </td><td><span id="trainerNomStartDate"><s:property value="programMainteance.trainerNomStartDate" /></span></td>
            	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            	<td> Trainer Nomination End Date : </td><td><span id="trainerNomEndDate"><s:property value="programMainteance.trainerNomEndDate" /></span></td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
            	<td> Trainee Nomination Start Date : </td><td><span id="traineeNomStartDate"><s:property value="programMainteance.traineeNomStartDate" /></span></td>
            	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            	<td> Trainee Nomination End Date : </td><td><span id="traineeNomEndDate"><s:property value="programMainteance.traineeNomEndDate" /></span></td>
            </tr>
            <tr><td>&nbsp;</td></tr>
             <tr>
            	<td> Training Start Date : </td><td><span id="trainingStartDate"><s:property value="programMainteance.trainingStartDate" /></span></td>
            	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            	<td> Training End Date : </td><td><span id="trainingEndDate"><s:property value="programMainteance.trainingEndDate"/></span>	</td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
            	<td> Training Start Time : </td><td><s:property value="programMainteance.trainingStartTime" /></td>
            	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            	<td> Training End Time : </td><td><s:property value="programMainteance.trainingEndTime" /></td>
            </tr>
            <tr><td>&nbsp;</td></tr>
			<tr>
			 		<td>Is Exam Required : </td>
             	 	 <td><input type="checkbox" name="examMode" id="examMode" value="Y" disabled="disabled"></td>
             	 	 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
             	 	 <td>Trainee Eligibility Attendance % To Attend Exam : </td><td><s:property value="programMainteance.attendanceEligibility" />%</td>
			 	</tr>
            	<tr><td>&nbsp;</td></tr>
            	<tr><td>Is RM Approval Required For Trainees Nomination : </td>
            		<td><input type="checkbox" name="isrmapproval" id="isrmapproval" disabled="disabled"></td>
            		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            		<td>Manual Trainee Allocation : </td>
            		<td><input type="checkbox" name="traineesAllocationFlag" id="traineesAllocationFlag" disabled="disabled"></td>
            	</tr>
            </table>
			</div>
			<div id="programDetails1">
			<fieldset>
			<legend>Trainer</legend>
			 <table align="left">
            	<tr>
             	 	 <td>Departments Eligible for Nomination&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>: </td>
			 		 <td><s:property value="programMainteance.trainerDistributionDept" />
             		 	 
             	 	 </td>
			 	</tr>
           	 	 <tr><td>&nbsp;</td></tr>
           	 	 <tr>
			 		 <td>Roles Eligible for Nomination&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>: </td>
			 		 <td><s:property value="programMainteance.trainerDistributionRole"/>
             		 	 
             	 	 </td>
           	 	 </tr>
           	 	 
			 	</table>
			 	</fieldset>
			 	<br>
			 	<fieldset>
				<legend>Trainee</legend>
			 	<table align="left">
            	
       	 	 	 <tr>
             	 	 <td>Departments Eligible for Nomination </td><td>: </td>
			 		 <td><s:property value="programMainteance.traineeDistributionDept" />
             		 	 
             	 	 </td>
			 	</tr>
          	 	 <tr><td>&nbsp;</td></tr>
       	 	 	<tr>
			 		 <td>Roles Eligible for Nomination </td><td>: </td>
			 		 <td><s:property value="programMainteance.traineeDistributionRole" /> 
             		 	 
             	 	 </td>
          	 	 </tr>
          	 	 <tr><td>&nbsp;</td></tr>
       	 	 	<tr>
			 		 <td>Attendance Eligibility Freeze Required ? </td><td>: </td>
			 		  <td><input type="checkbox" name="attendanceEligibilityFlag" id="attendanceEligibilityFlag" value="Y" disabled="disabled"></td>
          	 	 </tr>
			</table>
			</fieldset>
			</div>
	
			<div id="locationDetails" >	
            <h2 class="StepTitle"></h2>
            <br><br>
            <!-- 
            <table>
            
            <tr>
            	<td>No Of Trainees : </td><td><s:property value="programMainteance.numOfTrainees" /></td>
            	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            	<td>No Of Trainees Backup : </td><td><s:property value="programMainteance.numOfTraineesBackup" /></td>
            </tr>
            </table>
             -->
            <br>
             <fieldset title="Exam Schedule" >
            	<legend>Program Location Details</legend>
            	<br>
            	<table id="locationTBL" width="100%"></table>
            	<div id="locationNavTBL"></div>
            	<br>
            </fieldset>
			</div>
			<div id="ExamDetails">	
            <h2 class="StepTitle"></h2>
            <br>
             <table>
            <tr>
            	<td>Primary Trainer : </td>
            	<td>
           			<s:property value="programMainteance.primaryTrainer" />
           	 	</td>
           	 	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            	<td>Backup Trainer : </td>
            	<td>
           			<s:property value="programMainteance.backupTrainer" />
           	 	</td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <!-- <tr>
            			<td>No Of Exam Schedules : </td><td><s:property value="programMainteance.noExamSchedules"/></td>
           		 </tr>
        		 <tr><td>&nbsp;</td></tr>
            		<tr>
            			<td>Total No Ques : </td><td><s:property value="programMainteance.totalNoQues"/></td>
            			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            			<td>No Of Objective : </td><td><s:property value="programMainteance.noOfObjective"/></td>
            			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            			<td>No Of Subjective : </td><td><s:property value="programMainteance.noOfSubjective"/></td>
            		</tr>
            		
            		<tr>
            			<td>Exam Date : </td><td><s:property value="programMainteance.examDate"/></td>
            			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            			<td>Exam Open Time : </td><td><s:property value="programMainteance.examOpnTime"/></td>
            			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            			<td>Exam Close Time : </td><td><s:property value="programMainteance.examCloseTime"/></td>
            		</tr>
            		--> 
            </table>    
            <br><br>
            <fieldset title="Exam Schedule" >
            	<legend>Exam Schedule</legend>
            	<br>
            	<table id="examScheduleTBL"></table>
            	<div id="examSchedulesNav"></div>
            	<br>
            </fieldset>
            <s:hidden value="%{programMainteance.isrmapproval}" id="isApprovalReq"></s:hidden>
            <s:hidden value="%{programMainteance.programId}" id="programIdHid"></s:hidden>
            <s:hidden value="%{programMainteance.examMode}" id="isExamReqHid"></s:hidden>
            <s:hidden value="%{programMainteance.traineesAllocationFlag}" id="traineesAllocationFlagReq"></s:hidden>
            <s:hidden value="%{programMainteance.attendanceEligibilityFlag}" id="attendanceEligibilityFlagReq"></s:hidden>
			</div>
				<div id="traineeAndTrainerDetails">
					<table width="1000">
						<tr>
							<td>
								<table width="100%">
									<tr><td>
										<fieldset >
											<legend style="color: #fffFFF; background: #185994; border: 1px solid #781351; padding: 2px 8px; "><b>Trainer Details</b></legend>
												<table id="trainerDetailsTBL"></table>
												<div id="trainerDetailsNavTBL"></div>
										</fieldset>
									</td></tr>
								</table>
							</td>
							<td><hr width="2" size="800" color="red" style="border: solid;2px "></td>
							<td>
								<table width="100%">
									<tr><td>
										<fieldset >
											<legend style="color: #fffFFF; background: #185994; border: 1px solid #781351; padding: 2px 8px; "><b>Trainee Details</b></legend>
												<table id="traineeDetailsTBL"></table>
												<div id="traineeDetailsNavTBL"></div>
										</fieldset>
									</td></tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
</div>
</td></tr>
</table>
<br><br>
<table align="left">
	<tr>
		<td style="font-size: 11px;font-family: 'verdana','Courier New'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Current Program Status : <b><i style="color: green;"><s:text name="programMainteance.status.statusDesc" /></i></b></td>
	</tr>
</table>
<table align="right">
	<tr>
		<td><input type="button" value="Edit" id="btnEdit"
			class="btnEditDel fm-button ui-state-default ui-corner-all fm-button-icon-left">&nbsp;&nbsp;<input
			type="button" value="Cancel" id="btnCancel"
			class="fm-button ui-state-default ui-corner-all fm-button-icon-left">&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
</table>
</form>
</body>
</html>