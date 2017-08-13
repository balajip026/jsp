<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import = "com.vit.action.ots.program.programMainteance" %>
<%@ page import="com.vit.bean.ots.trainer.TrainerNominate"%>
<%@ page import="com.vit.bean.ots.trainer.EmpMaster"%>

<%@page import="com.vit.ots.utils.OTSConstants"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="../CommonJSs.jsp" %>
</head>
<script type="text/javascript">
var selectedRowVal ;
var noPatSelected;
var programId;
var selectedId;
var statusCode;
var statusDesc;
var primaryTrainer ;
var backupTrainer ;
var traineeNomEndDate;
var trainerNomEndDate;
var noOfQuesInSet;
var setIdForProgram = 0;
//  Wizard 1  	

                      
$(document).ready(function(){
	
	programId = $("#programIdHid").val(); 
	$("#programId").text(programId);
	$( "#editTabs" ).tabs();    // tabs

	
	if($("#isApprovalReq").val() == "Y"){
		$("#isrmapproval").attr("value",$("#isApprovalReq").val());
		$("#isrmapproval").attr("checked","checked");
	}else{
		$("#isrmapproval").attr("value",$("#isApprovalReq").val());
	}
	
	if($("#traineesAllocationFlagReq").val() == "M"){
		$("#traineesAllocationFlag").attr("value",$("#traineesAllocationFlagReq").val());
		$("#traineesAllocationFlag").attr("checked","checked");
	}{
		$("#traineesAllocationFlag").attr("value",$("#traineesAllocationFlagReq").val());
	}

	if($("#isExamReqHid").val() == "Y"){
		$("#examMode").attr("value",$("#isExamReqHid").val());
		$("#examMode").attr("checked","checked");
	}else{
		$("#examMode").attr("value",$("#isExamReqHid").val());
	}
	if($("#attendanceEligibilityFlagReq").val() == "Y"){
		$("#attendanceEligibilityFlag").attr("value",$("#attendanceEligibilityFlagReq").val());
		$("#attendanceEligibilityFlag").attr("checked","checked");
	}else{
		$("#attendanceEligibilityFlag").attr("value",$("#attendanceEligibilityFlagReq").val());
	}
	
	$(function() {
		$.ajax({
			url:"roleList.action",
			type: "POST", 
			success:function(data){
		        var trainerSelect = $('#trainerDistributionRole').empty();
		        var traineeSelect = $('#traineeDistributionRole').empty();
		        $.each(data.roleList, function(roleObject) {
			        trainerSelect.append( '<option value="'
		                                 + data.roleList[roleObject].roleId
		                                 + '">'
		                                 + data.roleList[roleObject].roleName
		                                 + '</option>' ); 
			        traineeSelect.append( '<option value="'
                            + data.roleList[roleObject].roleId
                            + '">'
                            + data.roleList[roleObject].roleName
                            + '</option>' ); 
		        });
			},
			async:false
		});
});
$(function() {
	$.ajax({
		url:"deptList.action",
		type: "POST", 
		success:function(data){
	        var trainerSelect = $('#trainerDistributionDept').empty();
	        var traineeSelect = $('#traineeDistributionDept').empty();
	        $.each(data.deptList, function(deptObject) {
	        	if( data.deptList[deptObject].deptId != "2" && data.deptList[deptObject].deptId != "All"){ 
			        trainerSelect.append( '<option value="'
		                                 + data.deptList[deptObject].deptId
		                                 + '">'
		                                 + data.deptList[deptObject].deptName
		                                 + '</option>' ); 
			        traineeSelect.append( '<option value="'
                            + data.deptList[deptObject].deptId
                            + '">'
                            + data.deptList[deptObject].deptName
                            + '</option>' ); 
		        }
	        });
		},
		async:false
	});
});
$(function() {
	$.ajax({
		url:"courseDetails.action",
		type: "POST", 
		success:function(data){
		        var courseSelect = $('#courseName').empty();
		        courseSelect.append( '<option value=>Course</option>' ); 
		        courseData = data.courseDetails;
		        $.each(data.courseDetails, function(locObject) {
		        	courseSelect.append( '<option value="'
		                                 + data.courseDetails[locObject].courseName
		                                 + '">'
		                                 + data.courseDetails[locObject].courseName
		                                 + '</option>' ); 
			       
		        });
			},
			async:false
		});
});
$(function() {
	var variable ='programId='+programId;
	$.ajax({
		url:"TrainerFreezeData.action",
		type: "POST", 
		data : variable,
		success:function(data){
			var PrimarySelect = $('#primaryTrainer').empty();
			var backupSelect = $('#backupTrainer').empty();
	        $.each(data.trainerNominationList, function(deptObject) {
	        	PrimarySelect.append( '<option value="'
	                                 + data.trainerNominationList[deptObject].empmasterTrainer.empId
	                                 + '">'
	                                 + data.trainerNominationList[deptObject].empmasterTrainer.FName
	                                 + '</option>' ); 
	        	backupSelect.append( '<option value="'
	                    + data.trainerNominationList[deptObject].empmasterTrainer.empId
	                    + '">'
	                    + data.trainerNominationList[deptObject].empmasterTrainer.FName
	                    + '</option>' ); 
	        });
		},
		async:false
	});

});

$("#isrmapproval").click(function(){
	if($("#isrmapproval").is(':checked')){
		$("#isrmapproval").attr('value', "Y");
		$("#isApprovalReq").attr('value', "Y");
		
	}else{
		$("#isApprovalReq").attr('value', "N");
		$("#isrmapproval").attr('value', "N");
	} 
});
$("#examMode").click(function(){
	if($("#examMode").is(':checked')){
		$("#examMode").attr('value', "Y");
		$("#isExamReqHid").attr('value', "Y");
		
	}else{
		$("#isExamReqHid").attr('value', "N");
		$("#examMode").attr('value', "N");
	} 
});

$("#attendanceEligibilityFlag").click(function(){
	if($("#attendanceEligibilityFlag").is(':checked')){
		$("#attendanceEligibilityFlag").attr('value', "Y");
		$("#attendanceEligibilityFlagReq").attr('value', "Y");
		
	}else{
		$("#attendanceEligibilityFlagReq").attr('value', "N");
		$("#attendanceEligibilityFlag").attr('value', "N");
	} 
});



$("#traineesAllocationFlag").click(function(){
	if($("#traineesAllocationFlag").is(':checked')){
		$("#traineesAllocationFlag").attr('value', "M");
		$("#traineesAllocationFlagReq").attr('value', "M");
		
	}else{
		$("#traineesAllocationFlagReq").attr('value', "A");
		$("#traineesAllocationFlag").attr('value', "A");
	} 
});
$(function() {
	var parameter = "programId="+programId;
		$.ajax({
			url:"editProgramDetailsObject.action",
			data:parameter,
			type: "POST", 
			success:function(data){
						setIdForProgram = data.programMainteance.setId
						$("#trainingType").val(data.programMainteance.trainingType);
						//$("#examMode").val(data.programMainteance.examMode);
						$("#courseName").val(data.programMainteance.courseName);
						if(data.programMainteance.programStartDate != null && data.programMainteance.programStartDate !=""){
						$("#programStartDate").val(Date.parse(data.programMainteance.programStartDate).toString('dd-MMM-yyyy'));
						}else{
						$("#programStartDate").val(data.programMainteance.programStartDate);}
						if(data.programMainteance.programEndDate != null && data.programMainteance.programEndDate !=""){
						$("#programEndDate").val(Date.parse(data.programMainteance.programEndDate).toString('dd-MMM-yyyy'));
						}else{
						$("#programEndDate").val(data.programMainteance.programEndDate);}
						if(data.programMainteance.trainingStartDate != null && data.programMainteance.trainingStartDate !=""){
						$("#trainingStartDate").val(Date.parse(data.programMainteance.trainingStartDate).toString('dd-MMM-yyyy'));
						}else{
						$("#trainingStartDate").val(data.programMainteance.trainingStartDate);}
						if(data.programMainteance.trainingEndDate != null && data.programMainteance.trainingEndDate !=""){
						$("#trainingEndDate").val(Date.parse(data.programMainteance.trainingEndDate).toString('dd-MMM-yyyy'));
						}else{
						$("#trainingEndDate").val(data.programMainteance.trainingEndDate);}
						if(data.programMainteance.trainerNomStartDate != null && data.programMainteance.trainerNomStartDate !=""){
						$("#trainerNomStartDate").val(Date.parse(data.programMainteance.trainerNomStartDate).toString('dd-MMM-yyyy'));
						}else{
						$("#trainerNomStartDate").val(data.programMainteance.trainerNomStartDate);}
						if(data.programMainteance.trainerNomEndDate != null && data.programMainteance.trainerNomEndDate !=""){
							trainerNomEndDate = data.programMainteance.trainerNomEndDate; 
						$("#trainerNomEndDate").val(Date.parse(data.programMainteance.trainerNomEndDate).toString('dd-MMM-yyyy'));
						}else{
						$("#trainerNomEndDate").val(data.programMainteance.trainerNomEndDate);}
						if(data.programMainteance.traineeNomStartDate != null && data.programMainteance.traineeNomStartDate !=""){
						$("#traineeNomStartDate").val(Date.parse(data.programMainteance.traineeNomStartDate).toString('dd-MMM-yyyy'));
						}else{
						$("#traineeNomStartDate").val(data.programMainteance.traineeNomStartDate);}
						if(data.programMainteance.traineeNomEndDate != null && data.programMainteance.traineeNomEndDate !=""){
							traineeNomEndDate = data.programMainteance.traineeNomEndDate;
						$("#traineeNomEndDate").val(Date.parse(data.programMainteance.traineeNomEndDate).toString('dd-MMM-yyyy'));
						}else{
						$("#traineeNomEndDate").val(data.programMainteance.traineeNomEndDate);}
						$("#trainingStartTime").val(data.programMainteance.trainingStartTime);
						$("#trainingEndTime").val(data.programMainteance.trainingEndTime);
						$("#attendanceEligibility").val(data.programMainteance.attendanceEligibility);
						$("#trainingMode").val(data.programMainteance.trainingMode);
						statusCode = data.programMainteance.status.statusCode;
						statusDesc = data.programMainteance.status.statusDesc;
						primaryTrainer = data.programMainteance.primaryTrainer;
						backupTrainer = data.programMainteance.backupTrainer;
						$(function() {
							var parameter = "empId="+data.programMainteance.backupTrainer;
							$.ajax({
								url:"EmpName.action",
								data:parameter,
								type: "POST", 
								success:function(data1){
									$("#backupTrainer").text(data1.empname +" - " +data.programMainteance.backupTrainer);
								}
							});
						});
						$(function() {
							var parameter = "empId="+data.programMainteance.primaryTrainer;
							$.ajax({
								url:"EmpName.action",
								data:parameter,
								type: "POST", 
								success:function(data1){
									$("#primaryTrainer").text(data1.empname+" - " +data.programMainteance.primaryTrainer);
									
								}
							});
						});
						$(function() {
							var array = data.programMainteance.trainerDistributionDept.split(",");
							i = 0, size = array.length
						    $options = $('#trainerDistributionDept option'); 
						    for(i; i < size; i++){
						        // filter the options with the specific value and select them
						        $options.filter('[value="'+$.trim(array[i])+'"]').prop('selected', true);
						    }
					    	    
						});
						$(function() {
							var array = data.programMainteance.trainerDistributionRole.split(",");
							i = 0, size = array.length
						    $options = $('#trainerDistributionRole option'); 
						    for(i; i < size; i++){
						        // filter the options with the specific value and select them
						        $options.filter('[value="'+$.trim(array[i])+'"]').prop('selected', true);
						    }
					    	    
						});
						$(function() {
							var array = data.programMainteance.traineeDistributionDept.split(",");
							i = 0, size = array.length
						    $options = $('#traineeDistributionDept option'); 
						    for(i; i < size; i++){
						        // filter the options with the specific value and select them
						        $options.filter('[value="'+$.trim(array[i])+'"]').prop('selected', true);
						    }
					    	    
						});
						$(function() {
							var array = data.programMainteance.traineeDistributionRole.split(",");
							i = 0, size = array.length
						    $options = $('#traineeDistributionRole option'); 
						    for(i; i < size; i++){
						        // filter the options with the specific value and select them
						        $options.filter('[value="'+$.trim(array[i])+'"]').prop('selected', true);
						    }
					    	    
						});
						
						$( "#programEndDate" ).datepicker('option','minDate',$("#programStartDate").val());
				},
			async:false
		});
	});

	$(function() {
		var parameter = 'setId='+setIdForProgram;
		$.ajax({
			url:"setDetailsOfProgram.action",
			data:parameter,
			type: "POST", 
			success:function(data){
				if(data.setQustions != null && data.setQustions != "")
				noOfQuesInSet = parseInt(data.setQustions.setNoQuestions); 
				else
					noOfQuesInSet = 0;
			}
		});
	});
	function checkMaxValue(value, colname){
	    if(!(value.match(/[^\d]/))) {
			if(value >noOfQuesInSet || value <= 0 ){
				 return [false,"Please enter total questions  between 1 and "+noOfQuesInSet];
			} else {
			    return [true,""];
			}
		}else{
			return [false,"Total questions should be numeric"];
		}
	}
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
	colNames : [ 'Exam Id','Exam Date', 'Exam Open Time', 'Exam Close Time','Total Questions','No of Objective',
					'No Of Subjective','Program Id'],
    colModel : [ { name : 'examId',index : 'examId', align : "center",editable : true,editoptions : {size : 20},key:true,hidden:true},
                 { name : 'examDate',index : 'examDate', align : "center",editable : true,editoptions : {size : 20,dataInit:function(el){ $(el).datepicker({
                     dateFormat:'d-M-yy',
                     minDate : $("#programEndDate").val(),
                     maxDare:  $("#trainingEndDate").val()
 			       })}},formatter:'date', "formatoptions":{"srcformat":"Y-m-d", "newformat":"d-M-Y"}},
                 { name : 'examOpenTime',index : 'examOpenTime', align : "center",editable : true,editoptions : {size : 20}},
                 { name : 'examCloseTime',index : 'examCloseTime', align : "center",editable : true,editoptions : {size : 20}},
                 { name : 'totalQuestion',index : 'totalQuestion', align : "center",editable : true,editoptions : {size : 20},editrules:{custom:true, custom_func:checkMaxValue}},
               	 { name : 'noObjective',index : 'noObjective', align : "center",editable : false,editoptions : {size : 20},hidden:true},
               	 { name : 'noSubjective',index : 'noSubjective', align : "center",editable : false,editoptions : {size : 20},hidden:true},
               	{ name : 'programId',index : 'programId', align : "center",editable : true,editoptions : {size : 20,value:programId},hidden:true}],
    rowNum : 4,
	//rowList : [ 10, 20, 30 ],
	pager : '#examSchedulesNav',
	loadatonce : true,
	viewrecords : true,
	height : 93,
	sortorder : "desc",
	sortname : "examDate",
	editurl  :"editExamSchedules",
	rowEdit: true, 
	rowurl:'editExamSchedules', 
	onSelectRow : function(location){
		//$("#examScheduleTBL").editRow(location,true);
	}

}); 
		$("#examScheduleTBL").jqGrid('navGrid', '#examSchedulesNav', {
			add : true,
			edit : true,
			del : true,
			search : false,
			view : true,
			refresh:true
		});
		  var myGridId = $.jgrid.jqID($("#examScheduleTBL")[0].id);

		function getAllowedNominationForLocation(gridData,loc){
			var noOfAllowedNom ;
			$.each(gridData ,function(index,child){
				if(child.location == loc){
					noOfAllowedNom = parseInt(child.numOfAllowedNom);
				}

			});	
			return noOfAllowedNom;
		}

		$(function() {
			
			$.post("locationDetails",null,function(data){

			        var locationSelect = $('#location').empty();
			        locationSelect.append( '<option value=>Location</option>' ); 
			        $.each(data.locationDetails, function(locObject) {
			        	locationSelect.append( '<option value="'
			                                 + data.locationDetails[locObject]
			                                 + '">'
			                                 + data.locationDetails[locObject]
			                                 + '</option>' ); 
				       
				        });
					
				});
		});
		function getToatalParticipants(gridData,loc){
			var total = 0;
			$.each(gridData ,function(index,child){
				if(child.location == loc){
					total = total + parseInt(child.numOfTrainees);
				}

			});	
			
				return total;
		}
		function isConferenceRoomExits(gridData,loc,primise,conf){
			var flag = true;
			$.each(gridData ,function(index,child){
				if(child.location == loc && child.primise == primise && child.conferenceCode == conf){
					flag = false;
				}
		
			});	
			
				return flag;

		}
		$('#location').change(function(){
			var parameter = "location="+$('#location').val();
			$.ajax({
				url:"locationDetails",
				data:parameter,
				success:function(data){
			        var primiseSelect = $('#primise').empty();
			        primiseSelect.append( '<option value=>Primise</option>' ); 
			        var confSelect = $('#conferenceCode').empty();
			        confSelect.append( '<option value=>Conference Room</option>' ); 
			        $.each(data.locationDetails, function(locObject) {
			        	primiseSelect.append( '<option value="'
			                                 + data.locationDetails[locObject]
			                                 + '">'
			                                 + data.locationDetails[locObject]
			                                 + '</option>' ); 
			        	$("#numOfParticipants").val("");
				       
			        	});
				},
				async:false
			});
			
			var gridData = $("#locationTBL").jqGrid ('getRowData');
			var allowedNom = getAllowedNominationForLocation(gridData,$('#location').val());
			$("#numOfAllowedNom").val(allowedNom);
			return true;
		});
		
		$("#numOfAllowedNom").change(function(){
			if(!$('#numOfAllowedNom').val().match('^(0|[1-9][0-9]*)$')){
				jAlert("Allowed nominations should be numeric");
				return false;
		    }else{
				var changedValue = $("#numOfAllowedNom").val();
				var gridObject = $("#locationTBL").jqGrid ('getRowData');
				var noOfParticipentsInLocation = getToatalParticipants(gridObject,$('#location').val());
				if(	changedValue < noOfParticipentsInLocation){
					var gridData = $("#locationTBL").jqGrid ('getRowData');
					var allowedNom = getAllowedNominationForLocation(gridData,$('#location').val());
					 $("#numOfAllowedNom").val(allowedNom)
					jAlert("Allowed nomination should be greater that total participants for location");
				}else{
					var parameters = "location="+$('#location').val()+"&programId="+programId+"&allowedNom="+changedValue;
					$.post("UpdateAllowedNominationForLocation",parameters,function(){
						$("#locationTBL").trigger("reloadGrid");
					});
				}	
		    }
		});

		$('#primise').change(function(){
			var parameter = "location="+$('#location').val()+"&primise="+$("#primise").val();
			$.ajax({url:"locationDetails",
					data :parameter,
					success:function(data){
				        var confSelect = $('#conferenceCode').empty();
				        confSelect.append( '<option value=>Conference Room</option>' ); 
				        $.each(data.locationDetails, function(locObject) {
				        	confSelect.append( '<option value="'
				                                 + data.locationDetails[locObject]
				                                 + '">'
				                                 + data.locationDetails[locObject]
				                                 + '</option>' ); 
				        	$("#numOfParticipants").val("");
					       
				        	});
						},
					async:false
			});
		});
		$('#conferenceCode').change(function(){
			$("#numOfParticipants").val("");
		});
		$("#locationTBL").jqGrid({
			url:'LocationSet.action?programId='+programId,
			//data : locationDetailsData,
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
			colNames : [ 'Id','Location', 'Primise', 'Conference Room','No Of Partiscipents','No of allowed Nominations'],
	        colModel : [ 
						 { name : 'id',index : 'id', align : "center",editable : true,editoptions : {size : 20},key:true,hidden:true},
	                     { name : 'location',index : 'location', align : "center",editable : true,editoptions : {size : 20},summaryType:'count',summaryTpl : 'Count : {0}',hidden:true},
	                     { name : 'primise',index : 'primise', align : "center",editable : true,editoptions : {size : 20}},
	                     { name : 'conferenceCode',index : 'conferenceCode', align : "center",editable : true,editoptions : {size : 20}},
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
		   		groupSummary : [true],
		   		groupText : ['<b>{0} - Allowed Nominations : {numOfAllowedNom}</b>']
			},
			onSelectRow : function(conferenceCode){
				selectedId = conferenceCode;
				var gridObject = $("#locationTBL");
				var selRowId = gridObject.jqGrid ('getGridParam', 'selrow');
				//khasim implemented on 10th Jan
				if(selRowId!==0 || selRowId!==null)
					{
					$("#locAdd").attr("disabled","disabled");
					}
				else		
					$(this).removeAttr('disabled');
				var location  = gridObject.jqGrid ('getCell', selRowId, 'location');
				$("#location").val(location);
				$("#location").trigger("change");
				var primise = gridObject.jqGrid ('getCell', selRowId, 'primise');
				$("#primise").val(primise);
				$("#primise").trigger("change");
				selectedRowVal = gridObject.jqGrid ('getCell', selRowId, 'conferenceCode')
				$("#conferenceCode").val(selectedRowVal);
				noPatSelected = gridObject.jqGrid ('getCell', selRowId, 'numOfTrainees');
				$("#numOfParticipants").val(noPatSelected);
					
				
			}

		}); 

		// Location delete from grid
		$("#btnLocDelete").click(function(){
			if(selectedId != "" && selectedId != null){
				var parameter = "id="+selectedId;
				$.post("deleteLocation",parameter,function(){
					$("#locationTBL").trigger("reloadGrid");
				});
				selectedId = "";
			}else{
				jAlert("Please select record");
			}
		});	

		// Location Edit from grid
		$("#btnLocEdit").click(function(){
				if($("#location").val()== ""){
					jAlert("please select location");
				}else if(($("#numOfAllowedNom").val() == "" )|| ($("#numOfAllowedNom").val()== null)){
					jAlert("Allowed nomination for location is mandatory");
					return false;
				}else if($("#primise").val() == ""){
					jAlert("please select premise");
				}else if($("#conferenceCode").val() == ""){
					jAlert("please select conference room");
				}else if($("#numOfParticipants").val() == ""){
					jAlert("please select no Of actual participants/premise");
				}else if(selectedRowVal != "" && selectedRowVal != null){
					var gridData = $("#locationTBL").jqGrid ('getRowData');
					var totalParticipants = getToatalParticipants(gridData,$("#location").val());
					if(selectedRowVal == $("#conferenceCode").val()){
						totalParticipants = parseInt(totalParticipants) - parseInt(noPatSelected);
						totalParticipants = parseInt(totalParticipants)+parseInt($("#numOfParticipants").val());
						if(totalParticipants <= $("#numOfAllowedNom").val()){
							$.each(gridData ,function(index,child){
								if(child.conferenceCode == selectedRowVal){
									var parameter = "programId="+programId+"&location="+child.location+"&primise="+child.primise
									+"&conferenceCode="+child.conferenceCode+"&numOfTrainees="+$("#numOfParticipants").val()
									+"&numOfAllowedNom="+child.numOfAllowedNom+"&id="+child.id;
									$.post("saveOrUpdateLocation",parameter,function(){
										$("#locationTBL").trigger("reloadGrid");
									});
								}
							});
							$("#locationTBL").setGridParam('data',gridData);
							$("#locationTBL").trigger("reloadGrid"); 
						}else{
							jAlert("Sum of participants for a location should be less OR equal to allowed nomination for location ");
						}
					}else{
						var totalParticipants = getToatalParticipants(gridData,$("#location").val());
						totalParticipants = parseInt(totalParticipants)+parseInt($("#numOfParticipants").val());
						if(totalParticipants <= $("#numOfAllowedNom").val()){
							if(isConferenceRoomExits(gridData,$("#location").val(),$("#primise").val(),$("#conferenceCode").val())){
								$.each(gridData ,function(index,child){
									if(child.conferenceCode == selectedRowVal){
										var parameter = "programId="+programId+"&location="+$("#location").val()+"&primise="+$("#primise").val()
										+"&conferenceCode="+$("#conferenceCode").val()+"&numOfTrainees="+$("#numOfParticipants").val()
										+"&numOfAllowedNom="+$("#numOfAllowedNom").val()+"&id="+child.id;
										$.post("saveOrUpdateLocation",parameter,function(){
											$("#locationTBL").trigger("reloadGrid");
										});
									}
								});
								$("#locationTBL").setGridParam('data',gridData);
								$("#locationTBL").trigger("reloadGrid"); 
							}else{
								jAlert("Conference room alreday exists for the location");	
							}
						}else{
							jAlert("Sum of participants  for a location should be less OR equal to allowed nomination for location ");
						}
					}
					selectedRowVal = "";
				}else{
					jAlert("Please select record");
				}
				
			});		 
		// Location Edit from grid END

		
		// Location Add from grid
		$("#locAdd").click(function(){
			//var location = new Array();
			if($("#location").val()== ""){
				jAlert("please select Location");
			}else if(($("#numOfAllowedNom").val() == "" )|| ($("#numOfAllowedNom").val()== null)){
				jAlert("Allowed nomination for location is mandatory");
				return false;
			}else if($("#primise").val() == ""){
				jAlert("please select Primise");
			}else if($("#conferenceCode").val() == ""){
				jAlert("please select Conference Room");
			}else if($("#numOfParticipants").val() == ""){
				jAlert("please select no Of actual participants /premise");
			}
			else{
					var gridData = $("#locationTBL").jqGrid ('getRowData');
					var totalParticipants = getToatalParticipants(gridData,$("#location").val());
					totalParticipants = parseInt(totalParticipants)+parseInt($("#numOfParticipants").val());
					if(totalParticipants <= $("#numOfAllowedNom").val()){
						if(isConferenceRoomExits(gridData,$("#location").val(),$("#primise").val(),$("#conferenceCode").val())){
							var parameter = "programId="+programId+"&location="+$("#location").val()+"&primise="+$("#primise").val()
							+"&conferenceCode="+$("#conferenceCode").val()+"&numOfTrainees="+$("#numOfParticipants").val()
							+"&numOfAllowedNom="+$("#numOfAllowedNom").val();
							$.post("saveLocation",parameter,function(){
								$("#locationTBL").trigger("reloadGrid");
							});
						}else{
							jAlert("Conference room alreday exists for the location");	
						}	
					}else{
						jAlert("Sum of participants  for a location should be less OR equal to allowed nomination for location");
					}
			}
			});
		// Location ADD from grid END
		function enableAll(){
			$("#trainingType").removeAttr("disabled");
			$("#examMode").removeAttr("disabled");
			$("#courseName").removeAttr("disabled");
			$("#trainingMode").removeAttr("disabled");
			$("#trainerNomStartDate").removeAttr("disabled");
			$("#trainerNomEndDate").removeAttr("disabled");
			$("#traineeNomStartDate").removeAttr("disabled");
			$("#traineeNomEndDate").removeAttr("disabled");
			$("#trainingStartDate").removeAttr("disabled");
			$("#trainerDistributionDept").removeAttr("disabled");
			$("#trainerDistributionRole").removeAttr("disabled");
			$("#traineeDistributionDept").removeAttr("disabled");
			$("#traineeDistributionRole").removeAttr("disabled");
			$("#trainingEndDate").removeAttr("disabled");
			$("#isrmapproval").removeAttr("disabled");
			$("#traineesAllocationFlag").removeAttr("disabled");
			$("#programStartDate").removeAttr("disabled");
		}
		
$("#btnCancel").click(function(){
	
	$("#programEditForm").attr("action","SearchProgram");
	$("#programEditForm").submit();
});
$("#btnEdit").click(function(){
	var noexams = $("#examScheduleTBL").jqGrid('getRowData').length;
	enableAll();
	$("#noOfExamShduls").attr("value",noexams);
	if(statusCode == '<%=OTSConstants.EXAM_SCHEDULE_PENDING%>' ){
		if(noexams >0 ){
			statusCode = '<%=OTSConstants.EXAM_SCHEDULE_PENDING%>';
			$("#programEditForm").attr("action","editProgramMainteance?programId="+programId+"&status.statusCode="+statusCode+"&primaryTrainer="+primaryTrainer+
										"&backupTrainer="+backupTrainer+"&isrmapproval="+$("#isApprovalReq").val()+"&traineesAllocationFlag="+$("#traineesAllocationFlagReq").val()+"&setId="+setIdForProgram+"&attendanceEligibilityFlag="+$("#attendanceEligibilityFlag").val());
			$("#programEditForm").submit();
			
		}else{
			jAlert("Please Schedule Exam");
		}
	}else if(statusCode == '<%=OTSConstants.TRAINEE_NOMINNATION_COMPLETED%>' ){
		if( Date.parse(traineeNomEndDate).getTime() !=  Date.parse($("#traineeNomEndDate").val()).getTime()){
			statusCode = '<%=OTSConstants.TRAINEE_NOMINNATION_IN_PROGRESS%>';
			$("#programEditForm").attr("action","editProgramMainteance?programId="+programId+"&status.statusCode="+statusCode+"&primaryTrainer="+primaryTrainer+"&backupTrainer="+backupTrainer
										+"&setId="+setIdForProgram+"&isrmapproval="+$("#isApprovalReq").val()+"&traineesAllocationFlag="+$("#traineesAllocationFlagReq").val()+"&attendanceEligibilityFlag="+$("#attendanceEligibilityFlag").val());
			$("#programEditForm").submit();
		}else{
			$("#programEditForm").attr("action","editProgramMainteance?programId="+programId+"&status.statusCode="+statusCode+"&primaryTrainer="+primaryTrainer+"&backupTrainer="+backupTrainer
										+"&setId="+setIdForProgram+"&isrmapproval="+$("#isApprovalReq").val()+"&traineesAllocationFlag="+$("#traineesAllocationFlagReq").val()+"&attendanceEligibilityFlag="+$("#attendanceEligibilityFlag").val());
			$("#programEditForm").submit();
		}
			
		
	}else if(statusCode == '<%=OTSConstants.TRAINER_NOMINNATION_COMPLETED%>' ){
		if( Date.parse(trainerNomEndDate).getTime() !=  Date.parse($("#trainerNomEndDate").val()).getTime()){
			statusCode = '<%=OTSConstants.TRAINER_NOMINNATION_IN_PROGRESS%>';
			$("#programEditForm").attr("action","editProgramMainteance?programId="+programId+"&status.statusCode="+statusCode+"&primaryTrainer="+primaryTrainer+"&backupTrainer="+backupTrainer
									+"&setId="+setIdForProgram+"&isrmapproval="+$("#isApprovalReq").val()+"&traineesAllocationFlag="+$("#traineesAllocationFlagReq").val()+"&attendanceEligibilityFlag="+$("#attendanceEligibilityFlag").val());
			$("#programEditForm").submit();
		}else{
			$("#programEditForm").attr("action","editProgramMainteance?programId="+programId+"&status.statusCode="+statusCode+"&primaryTrainer="+primaryTrainer+"&backupTrainer="+backupTrainer
									+"&setId="+setIdForProgram+"&isrmapproval="+$("#isApprovalReq").val()+"&traineesAllocationFlag="+$("#traineesAllocationFlagReq").val()+"&attendanceEligibilityFlag="+$("#attendanceEligibilityFlag").val());
			$("#programEditForm").submit();
		}
			
		
	}else{
		$("#programEditForm").attr("action","editProgramMainteance?programId="+programId+"&status.statusCode="+statusCode+"&primaryTrainer="+primaryTrainer+"&backupTrainer="+backupTrainer+"&setId="+setIdForProgram+"&isrmapproval="
				+$("#isApprovalReq").val()+"&traineesAllocationFlag="+$("#traineesAllocationFlagReq").val()+"&attendanceEligibilityFlag="+$("#attendanceEligibilityFlag").val());
		$("#programEditForm").submit();
	}
});

$(function() {
	var dateToday = new Date();
	$( "#programStartDate" ).datepicker({
	    changeMonth: true,
		changeYear: true,
		dateFormat: 'd-M-yy',	
		minDate: dateToday ,
		onSelect: function(selected) {
	          $("#programEndDate").datepicker("option","minDate", selected);
	          $("#trainerNomStartDate").datepicker("option","minDate", selected);
	          $("#traineeNomStartDate").datepicker("option","minDate", selected);
	          $("#trainingStartDate").datepicker("option","minDate", selected);
	          $("#trainerNomStartDate").datepicker("option","minDate", selected);
	        }
			
	});
});

//EndDate Program
$(function() {
	
	$( "#programEndDate" ).datepicker({
	    changeMonth: true,
		changeYear: true,
		dateFormat: 'd-M-yy',
		minDate: $("#programStartDate").val(),
		onSelect: function(selected) {
			 $("#trainerNomStartDate").datepicker("option","maxDate", selected);
	           $("#trainerNomEndDate").datepicker("option","maxDate", selected);
	           $("#traineeNomStartDate").datepicker("option","maxDate", selected);
	           $("#traineeNomEndDate").datepicker("option","maxDate", selected);
	           $("#trainingEndDate").datepicker("option","maxDate", selected);
	           $("#trainingStartDate").datepicker("option","maxDate", selected);
	           
	        }
    
			
	});
});


// StartDate Trainer Nomination
$(function() {
	//var dateToday = new Date();
	$( "#trainerNomStartDate" ).datepicker({
	    changeMonth: true,
		changeYear: true,
		dateFormat: 'd-M-yy',	
		minDate: $("#programStartDate").val() ,
		maxDate: $("#programEndDate").val(),
		onSelect: function(selected) {
	          $("#trainerNomEndDate").datepicker("option","minDate", selected);
	          $("#traineeNomStartDate").datepicker("option","minDate", selected);
	          $("#traineeNomEndDate").datepicker("option","minDate", selected);
	          $("#trainingStartDate").datepicker("option","minDate", selected);
	           $("#trainingEndDate").datepicker("option","minDate", selected);
	        }
					
	});
});

// EndDate Trainer Nomination
$(function() {
		
		$( "#trainerNomEndDate" ).datepicker({
		    changeMonth: true,
			changeYear: true,
			dateFormat: 'd-M-yy',
			minDate: $("#trainerNomStartDate").val() ,
			maxDate: $("#programEndDate").val(),
			onSelect: function(selected) {
		           $("#traineeNomStartDate").datepicker("option","minDate", selected);
		           $("#traineeNomEndDate").datepicker("option","minDate", selected);
		           $("#traineeNomStartDate").datepicker("option","minDate", selected);
		           $("#traineeNomEndDate").datepicker("option","minDate", selected);
		           $("#trainingStartDate").datepicker("option","minDate", selected);
		           $("#trainingEndDate").datepicker("option","minDate", selected);
		        }	
		});
	});
// StartDate Trainee Nomination
$(function() {
	//var dateToday = new Date();
	$( "#traineeNomStartDate" ).datepicker({
	    changeMonth: true,
		changeYear: true,
		dateFormat: 'd-M-yy',	
		minDate: $("#trainerNomEndDate").val() ,
		maxDate: $("#programEndDate").val(), 
		onSelect: function(selected) {
	          $("#traineeNomEndDate").datepicker("option","minDate", selected);
	          $("#trainingStartDate").datepicker("option","minDate", selected);
	           $("#trainingEndDate").datepicker("option","minDate", selected);
	        }	
	});
});

// EndDate Trainee Nomination
$(function() {
	
	$( "#traineeNomEndDate" ).datepicker({
	    changeMonth: true,
		changeYear: true,
		dateFormat: 'd-M-yy',
		minDate: $("#traineeNomStartDate").val() ,
		maxDate: $("#programEndDate").val() ,
		onSelect: function(selected) {
	           $("#trainingStartDate").datepicker("option","minDate", selected);
	           $("#trainingEndDate").datepicker("option","minDate", selected);
	       }	
	});
});

// StartDate Training Nomination
$(function() {
	//var dateToday = new Date();
	$( "#trainingStartDate" ).datepicker({
	    changeMonth: true,
		changeYear: true,
		dateFormat: 'd-M-yy',	
		minDate: $("#traineeNomEndDate").val() ,
		maxDate: $("#programEndDate").val() ,
		onSelect: function(selected) {
	          $("#trainingEndDate").datepicker("option","minDate", selected);
	        }	
	});
});

// EndDate Training Nomination
$(function() {
	
	$( "#trainingEndDate" ).datepicker({
	    changeMonth: true,
		changeYear: true,
		dateFormat: 'd-M-yy',
		minDate: $("#trainingStartDate").val() ,
		maxDate: $("#programEndDate").val() 
			
	});
});

// Status wise validation of editable fields
$(function() {
	$("#trainingType").attr("disabled","disabled");
	$("#examMode").attr("disabled","disabled");
	$("#courseName").attr("disabled","disabled");
	$("#trainingMode").attr("disabled","disabled");
	$("#trainerNomStartDate").attr("disabled","disabled");
	$("#trainerNomEndDate").attr("disabled","disabled");
	$("#traineeNomStartDate").attr("disabled","disabled");
	$("#traineeNomEndDate").attr("disabled","disabled");
	$("#trainingStartDate").attr("disabled","disabled");
	$("#trainerDistributionDept").attr("disabled","disabled");
	$("#trainerDistributionRole").attr("disabled","disabled");
	$("#traineeDistributionDept").attr("disabled","disabled");
	$("#traineeDistributionRole").attr("disabled","disabled");
	$("#attendanceEligibilityFlag").attr("disabled","disabled");
	$("#trainingEndDate").attr("disabled","disabled");
	$("#isrmapproval").attr("disabled","disabled");
	$("#traineesAllocationFlag").attr("disabled","disabled");
	$("#programStartDate").attr("disabled","disabled");
	//$("#editTabs").tabs( "disable" , 3);
	//$("#editTabs").tabs( "disable" , 2);
	$("#locAdd").attr("disabled","disabled");
	$("#btnLocEdit").attr("disabled","disabled");
	$("#btnLocDelete").attr("disabled","disabled");
	 $("#edit_" + myGridId).addClass('ui-state-disabled');
     $("#del_" + myGridId).addClass('ui-state-disabled');
     $("#view_" + myGridId).addClass('ui-state-disabled');
     $("#add_" + myGridId).addClass('ui-state-disabled');
	
	$("#currProgStatus").text(statusDesc);
	if((statusCode == '<%=OTSConstants.TRAINER_NOMINNATION_PENDING%>') || (statusCode == '<%=OTSConstants.TRAINER_NOMINNATION_IN_PROGRESS%>')
		|| (statusCode == '<%=OTSConstants.TRAINER_NOMINNATION_COMPLETED%>') || (statusCode == '<%=OTSConstants.TRAINER_NOMINNATION_FREEZED%>') ){
			$("#traineeNomStartDate").removeAttr("disabled");
			$("#traineeNomEndDate").removeAttr("disabled");
			$("#trainingStartDate").removeAttr("disabled");
			$("#trainingEndDate").removeAttr("disabled");
			$("#isrmapproval").removeAttr("disabled");
			$("#attendanceEligibilityFlag").removeAttr("disabled");
			$("#traineesAllocationFlag").removeAttr("disabled");
			$("#locAdd").removeAttr("disabled");
			$("#btnLocEdit").removeAttr("disabled");
			$("#btnLocDelete").removeAttr("disabled");
			if((statusCode == '<%=OTSConstants.TRAINER_NOMINNATION_PENDING%>')|| (statusCode == '<%=OTSConstants.TRAINER_NOMINNATION_IN_PROGRESS%>')){
				$("#examMode").removeAttr("disabled");
   			 	$("#trainerNomStartDate").removeAttr("disabled");
   			 	$("#trainerNomEndDate").removeAttr("disabled");
   				$("#trainerDistributionDept").removeAttr("disabled");
   				$("#trainerDistributionRole").removeAttr("disabled");
   				$("#traineeDistributionDept").removeAttr("disabled");
   				$("#traineeDistributionRole").removeAttr("disabled");
			}else if((statusCode == '<%=OTSConstants.TRAINER_NOMINNATION_COMPLETED%>')){
				$("#attendanceEligibilityFlag").removeAttr("disabled");
				$("#traineeNomStartDate").removeAttr("disabled");
				$("#traineeNomEndDate").removeAttr("disabled");
				$("#trainingStartDate").removeAttr("disabled");
				$("#trainingEndDate").removeAttr("disabled");
				$("#trainerNomEndDate").removeAttr("disabled");
			}
		}else if((statusCode == '<%=OTSConstants.TRAINEE_NOMINNATION_PENDING%>') || (statusCode == '<%=OTSConstants.TRAINEE_NOMINNATION_IN_PROGRESS%>')
				|| (statusCode == '<%=OTSConstants.TRAINEE_NOMINNATION_COMPLETED%>')||  (statusCode == '<%=OTSConstants.TRAINEE_NOMINNATION_FREEZED%>') ){
			$("#attendanceEligibilityFlag").removeAttr("disabled");
				$("#trainingStartDate").removeAttr("disabled");
				$("#trainingEndDate").removeAttr("disabled");
				$("#attendanceEligibilityFlag").removeAttr("disabled");
			if((statusCode == '<%=OTSConstants.TRAINEE_NOMINNATION_PENDING%>')||(statusCode == '<%=OTSConstants.TRAINEE_NOMINNATION_IN_PROGRESS%>')){
				//alert("inside");
				$("#attendanceEligibilityFlag").removeAttr("disabled");
				$("#locAdd").removeAttr("disabled");
				$("#btnLocEdit").removeAttr("disabled");
				$("#btnLocDelete").removeAttr("disabled");
   			 	$("#traineeNomEndDate").removeAttr("disabled");
   				$("#traineeDistributionDept").removeAttr("disabled");
   				$("#traineeDistributionRole").removeAttr("disabled");
			}else if((statusCode == '<%=OTSConstants.TRAINEE_NOMINNATION_COMPLETED%>')){
				$("#attendanceEligibilityFlag").removeAttr("disabled");
				$("#traineeNomEndDate").removeAttr("disabled");
			}
		}else if((statusCode == '<%=OTSConstants.TRAINING_PENDING%>') 
				|| (statusCode == '<%=OTSConstants.TRAINING_IN_PROGRESS%>') ){
				$("#attendanceEligibilityFlag").removeAttr("disabled");
				$("#trainingEndDate").removeAttr("disabled");
			if((statusCode == '<%=OTSConstants.TRAINING_PENDING%>')){
				$("#attendanceEligibilityFlag").removeAttr("disabled");
				$("#trainingStartDate").removeAttr("disabled");
				
			}else { 
				$("#trainingStartTime").attr("disabled","disabled");
				$("#trainingEndTime").attr("disabled","disabled");
			}
		}else if((statusCode == '<%=OTSConstants.EXAM_SCHEDULE_PENDING%>')) {
				//$("#editTabs").tabs( "enable" , 3);
				$("#edit_" + myGridId).removeClass('ui-state-disabled');
			    $("#del_" + myGridId).removeClass('ui-state-disabled');
			    $("#view_" + myGridId).removeClass('ui-state-disabled');
			    $("#add_" + myGridId).removeClass('ui-state-disabled');
				$("#trainingStartTime").attr("disabled","disabled");
				$("#trainingEndTime").attr("disabled","disabled");
		
		}else if((statusCode == '<%=OTSConstants.EXAM_PENDING%>')) {
			//$("#editTabs").tabs( "enable" , 3);
			$("#edit_" + myGridId).removeClass('ui-state-disabled');
		    $("#del_" + myGridId).removeClass('ui-state-disabled');
		    $("#view_" + myGridId).removeClass('ui-state-disabled');
		    $("#add_" + myGridId).removeClass('ui-state-disabled');
			$("#trainingStartTime").attr("disabled","disabled");
			$("#trainingEndTime").attr("disabled","disabled");
	
		 }else if((statusCode == '<%=OTSConstants.EXAM_IN_PROGRESS%>')) {
			$("#attendanceEligibility").attr("disabled","disabled");
			$("#trainingStartTime").attr("disabled","disabled");
			$("#trainingEndTime").attr("disabled","disabled");
		
		}else if((statusCode == '<%=OTSConstants.EXAM_COMPLETED%>')) {
			$("#attendanceEligibility").attr("disabled","disabled");
			$("#trainingStartTime").attr("disabled","disabled");
			$("#trainingEndTime").attr("disabled","disabled");
		}else if((statusCode == '<%=OTSConstants.PROGRAM_COMPLETED%>')) {
			$("#attendanceEligibility").attr("disabled","disabled");
			$("#trainingStartTime").attr("disabled","disabled");
			$("#trainingEndTime").attr("disabled","disabled");
			$("#btnEdit").attr("disabled","disabled");
			$("#programEndDate").attr("disabled","disabled");
			
		}
			
});

});


</script>
<body> 
<form id="programEditForm" name="programEditForm" method="post" action="saveOrUpdateprogramMainteance"> 
<br>
<div id="heading" class="title" align="left">Program Details</div>
<br>
<table align="center" border="0" cellpadding="0" cellspacing="0" width="95%">
<tr><td>
<div id="editTabs" class="tabsContent">
<ul>
  				<li><a href="#programDetails">
                <label class="stepNumber"></label>
                <span class="stepDesc">
                   Program Details<br />
                   <small></small>
                </span>
            </a></li>
  				<li><a href="#programDetails1">
                <label class="stepNumber"></label>
                <span class="stepDesc">
                   Nomination Distribution Details<br />
                   <small></small>
                </span>
            </a></li>
  				<li><a href="#locationDetails">
                <label class="stepNumber"></label>
                <span class="stepDesc">
                   Location Details<br />
                   <small></small>
                </span>                   
             </a></li>
             	<li><a href="#trainee">
                <label class="stepNumber"></label>
                <span class="stepDesc">
                    Examination Details<br />
                   <small></small>
                </span>                   
             </a></li>
  			</ul>
  			<div id="programDetails">	
            <h2 class="StepTitle"></h2>
            <table align="left">
             <tr><td>Program Type : </td>
             	 <td><select id="trainingType" name="trainingType" style="width:130px;;">
             	 			<option value="Internal">Internal</option>
             				<!-- <option value="EX">External</option> -->
             		 </select>
             	 </td>
             	 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
             	 <td>Training Mode : </td>
			 		 <td><select id="trainingMode" name="trainingMode" style="width:130px";>
             	 			<!-- <option value="Online">Online</option> -->
             				<option value="Class Room">Class Room</option>
             		 	 </select>
             	 </td>
             		
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td>Course Name : </td><td><select id="courseName" name="courseName" style="width:130px;">
            								<option>Course</option>
            								</select></td>
            	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            	<td>Program Name : </td><td><span id="programId"></span></td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
            	<td> Program Start Date : </td><td><input type="text" id="programStartDate" name="programStartDate" readonly="readonly"></td>
            	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            	<td> Program End Date : </td><td><input type="text" id="programEndDate" name="programEndDate" readonly="readonly"></td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
            	<td> Trainer Nomination Start Date : </td><td><input type="text" id="trainerNomStartDate" name="trainerNomStartDate" readonly="readonly"></td>
            	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            	<td> Trainer Nomination End Date : </td><td><input type="text" id="trainerNomEndDate" name="trainerNomEndDate" readonly="readonly"></td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
            	<td> Trainee Nomination Start Date : </td><td><input type="text" id="traineeNomStartDate" name="traineeNomStartDate" readonly="readonly"></td>
            	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            	<td> Trainee Nomination End Date : </td><td><input type="text" id="traineeNomEndDate" name="traineeNomEndDate" readonly="readonly"></td>
            </tr>
            <tr><td>&nbsp;</td></tr>
             <tr>
            	<td> Training Start Date : </td><td><input type="text" id="trainingStartDate" name="trainingStartDate" readonly="readonly"></td>
            	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            	<td> Training End Date : </td><td><input type="text" id="trainingEndDate" name="trainingEndDate" readonly="readonly"></td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
            	<td> Training Start Time : </td><td><input type="text" id="trainingStartTime" name="trainingStartTime"></td>
            	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            	<td> Training End Time : </td><td><input type="text" id="trainingEndTime" name="trainingEndTime"></td>
            </tr>
            <tr><td>&nbsp;</td></tr>
			<tr>
				<td>Is Exam Required : </td>
             	 	 <td><input type="checkbox" name="examMode" id="examMode" value="Y"></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
             	 	 <td>Trainee Eligibility Attendance % To Attend Exam : </td><td><input type="text" id="attendanceEligibility" name="attendanceEligibility">%</td>
			 	</tr>
            	<tr><td>&nbsp;</td></tr>
            	<tr><td>Is RM Approval Required For Trainees Nomination : </td>
            		<td><input type="checkbox" id="isrmapproval"></td>
            		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            		<td>Manual Trainee Allocation : </td>
            		<td><input type="checkbox" id="traineesAllocationFlag"></td>
            	</tr>
            </table>
			</div>
			<div id="programDetails1">
			 <fieldset>
			<legend>Trainer</legend>
			 <table align="left" >
            	 <tr height="20px"></tr>
            	 <tr>
             	 	 <td>Departments Eligible for Nomination :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			 		 <td><select id="trainerDistributionDept" name="trainerDistributionDept" multiple="multiple" size="4" style="width:200px">
             	 			<option value="WEBD">Web Development</option>
             				<option value="MANF">Mainframes</option>
             		 	 </select>
             	 	 </td>
			 	</tr>
           	 	 <tr><td>&nbsp;</td></tr>
           	 	 <tr>
			 		 <td>Roles Eligible for Nomination :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			 		 <td><select id="trainerDistributionRole" name="trainerDistributionRole" multiple="multiple" size="4" style="width:200px">
             	 			<option value="TRAI">Software Engineer Trainees</option>
             				<option value="SOER">Software Engineer</option>
             		 	 </select>
             	 	 </td>
           	 	 </tr>
			 	</table></fieldset><br>
			 	<fieldset>
				<legend>Trainee</legend>
			 	<table align="left">
            	<tr>
             	 	 <td>Departments Eligible for Nomination : </td>
			 		 <td><select id="traineeDistributionDept" name="traineeDistributionDept" multiple="multiple" size="4" style="width:200px">
             	 			<option value="WEBD">Web Development</option>
             				<option value="MANF">Mainframes</option>
             		 	 </select>
             	 	 </td>
			 	</tr>
          	 	 <tr><td>&nbsp;</td></tr>
          	 	 <tr>
			 		 <td>Roles Eligible for Nomination : </td>
			 		 <td><select id="traineeDistributionRole" name="traineeDistributionRole" multiple="multiple" size="4" style="width:200px"> 
             	 			<option value="TRAI">Software Engineer Trainees</option>
             				<option value="SOER">Software Engineer</option>
             		 	 </select>
             	 	 </td>
          	 	 </tr>
          	 	 <tr><td>&nbsp;</td></tr>
            	 <tr>
            	 	 <td>Attendance Eligibility Freeze Required ? : </td>
           			 <td><input type="checkbox" id="attendanceEligibilityFlag" value="N"></td>
          	 	 </tr>
       	 	 	 
			</table>
			</fieldset>
			</div>
	
			<div id="locationDetails" >	
          <h2 class="StepTitle"></h2>
            <table>
            <tr>
            	<td>&nbsp;&nbsp;Location : </td>
            			<td>
	            			<select id="location" name="location">
	             	 			<option value="">Location</option>
	             		 	</select>
       	 		</td>
       	 		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
       	 		<td>Allowed Nomination For Location : </td><td><input type="text" id="numOfAllowedNom" name="numOfAllowedNom"></td>
            	<!--<td>No Of Trainees : </td><td><input type="text" id="numOfTrainees" name="numOfTrainees"></td>
            	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            	<td>No Of Trainees Backup : </td><td><input type="text" id="numOfTraineesBackup" name="numOfTraineesBackup"></td>  -->
            </tr>
            </table>
            <br>
            <div class="break"></div>
            <br>
            <div id="locationSets">
            	<table width="100%">
            		<tr>
            			<!-- <td>Location : </td>
            			<td>
	            			<select id="location" name="location">
	             	 			<option value="">Location</option>
	             		 	</select>
             	 		</td>
             	 		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td> -->
             	 		<td>Primise : </td>
             	 		<td>
	            			<select id="primise" name="primise">
	             	 			<option value="">Primise</option>
	             		 	</select>
             	 		</td>
             	 		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
             	 		<td>Conference Room : </td>
						<td>
	            			<select id="conferenceCode" name="conferenceCode">
	             	 			<option value="">Conference Room</option>
	             		 	</select>
             	 		</td>
             	 	</tr>
             	 	<tr><td>&nbsp;</td></tr>
             	 	<tr>	
             	 		<td>No Of Participants : </td><td><input type="text" id="numOfParticipants" name="numOfParticipants"></td>
             	 		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
             	 		<td><input type="button" id="locAdd" value="Add" class="fm-button ui-state-default ui-corner-all fm-button-icon-left">&nbsp;&nbsp;&nbsp;&nbsp;
             	 			<input type="button" id="btnLocEdit" value="Save" class="fm-button ui-state-default ui-corner-all fm-button-icon-left">&nbsp;&nbsp;&nbsp;&nbsp;
             	 			<input type="button" id="btnLocDelete" value="Delete" class="fm-button ui-state-default ui-corner-all fm-button-icon-left"></td>
            		</tr>
            		<tr><td>&nbsp;</td></tr>
            	</table>
	            <div class="break"></div>
	            <br>
            	<table id="locationTBL" width="100%"></table>
            	<div id="locationNavTBL"></div>
            </div>
			</div>
			<div id="trainee">	
            <h2 class="StepTitle"></h2>
            <br>
             <table>
            <tr>
            	<td>Primary Trainer : </td>
            	<td>
           			<b><span id="primaryTrainer" style="text-transform: uppercase"></span></b>
           	 	</td>
           	 	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            	<td>Backup Trainer : </td>
            	<td>
           			<b><span id="backupTrainer" style="text-transform: uppercase"></span></b>
           	 	</td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
            	<!-- <td>No Of Exam Schedules : </td> --><td><input type="hidden" id="noOfExamShduls" value=""></td>
            </tr>
           
            </table>
            <br><br>
            <fieldset title="Exam Schedule" >
            	<legend>Exam Schedule</legend>
            	<!--
            	<table>
            		 <tr>
            			<td>Total No Ques : </td><td><input type="text" id="totalNoQues"></td>
            			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            			<td>No Of Objective : </td><td><input type="text" id="noOfObjective"></td>
            			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            			<td>No Of Subjective : </td><td><input type="text" id="noOfSubjective"></td>
            		</tr>
            		<tr>
            			<td>Exam Date : </td><td><input type="text" id="examDate"></td>
            			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            			<td>Exam Open Time : </td><td><input type="text" id="examOpnTime"></td>
            			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            			<td>Exam Close Time : </td><td><input type="text" id="examCloseTime"></td>
            			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            			<td><input type="button" id="examAdd" value="Add" class="fm-button ui-state-default ui-corner-all fm-button-icon-left"></td>
            		</tr>
            	</table>
            	 -->
            	<br>
            	<table id="examScheduleTBL"></table>
            	<div id="examSchedulesNav"></div>
            	<br>
            </fieldset>
            
			</div>
			
</div>
<br>
<div id="editButtons">
<table align="left">
<tr align="left">
	<td style="font-size: 11px;font-family: 'verdana','Courier New'">
			&nbsp;&nbsp;&nbsp;&nbsp;Current Program Status : 
			<b><i style="color: green;"><span id="currProgStatus"></span></i></b>
	</td>
</tr></table> 
<table align="right">
<tr align="right">
	<td align="right"><input type="button" value="Save" id="btnEdit" class="fm-button ui-state-default ui-corner-all fm-button-icon-left">&nbsp;&nbsp;
		<input type="button" value="Cancel" id="btnCancel" class="fm-button ui-state-default ui-corner-all fm-button-icon-left">&nbsp;&nbsp;
	</td>
</tr>
</table>
</div>
</td></tr></table>
 			 <s:hidden value="%{programMainteance.programId}" id="programIdHid"></s:hidden>
			<s:hidden value="%{programMainteance.isrmapproval}" id="isApprovalReq"></s:hidden>
			<s:hidden value="%{programMainteance.traineesAllocationFlag}" id="traineesAllocationFlagReq"></s:hidden>
			<s:hidden value="%{programMainteance.examMode}" id="isExamReqHid"></s:hidden>
			<s:hidden value="%{programMainteance.attendanceEligibilityFlag}" id="attendanceEligibilityFlagReq"></s:hidden>
			
			
          
</form>
</body>
</html>