<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>

<%@page import="com.vit.ots.utils.ParameterUtil"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Program</title>
<%@include file="../CommonJSs.jsp" %>
<style type="text/css">
@import url("${pageContext.request.contextPath}/stylesheet/Jquery/timePicker.css");
</style>
<SCRIPT type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/widgets/jquery.timePicker.js"></SCRIPT>
<SCRIPT type="text/javascript">
$(document).ready(function(){
	var selectedRowVal ;
	var programId ;
	var noPatSelected;
	var locationDetailsData = [];
	//  Wizard 1  	
	var jsonRequestObj = [];
		
	 $("#trainingStartTime").timepicker({

		 'timeFormat': 'H:i'
		  

		 });            
	 $("#trainingEndTime").timepicker({

		 'timeFormat': 'H:i'
		  

		 });       	
	 function onFinishCallback(){
		 
		 var gridObject = $("#locationTBL").getGridParam('data');
		 jsonRequestObj.push({rows:gridObject});		 
		  if(($("#numOfAllowedNom").val() == "" )|| ($("#numOfAllowedNom").val()== null)){
				jAlert("Allowed nomination is mandatory");
				return false;
			}else if(gridObject.length <= 0){
				jAlert("Training should be held atleast in one location"); 
		    }else{
			    //jAlert("Please note your program id : '"+programId+"'");
				var url = "saveOrUpdateprogramMainteance?programId="+programId+
							"&jsonLocObject="+JSON.stringify(jsonRequestObj)+"&traineesAllocationFlag="+$("#traineesAllocationFlag").val()
							+"&isrmapproval="+$("#isrmapproval").val()+"&attendanceEligibilityFlag="+$("#attendanceEligibilityFlag").val();
		 		$("#programCreateForm").attr("action",url);
		  		$("#programCreateForm").submit();
	  		//alert("DOne");
		    }
	  }  
	 function validateStepOne(){
			var flag = true;
			if(($("#courseName").val() == "" )){
				jAlert("Please select course name");
				flag = false;
			}else if(($("#programStartDate").val() == "" ) || ($("#programStartDate").val()== null)){
				jAlert("Please provide program start date");
				flag = false;
			}else if(($("#programEndDate").val() == "" ) || ($("#programEndDate").val()== null)){
				jAlert("Please provide program end date");
				flag = false;
			}else if(($("#trainerNomStartDate").val() == "" ) || ($("#trainerNomStartDate").val()== null)){
				jAlert("Please provide trainer nomination start date");
				flag = false;
			}else if(($("#trainerNomEndDate").val() == "" ) || ($("#trainerNomEndDate").val()== null)){
				jAlert("Please provide trainer nomination end Date");
				flag = false;
			}else if(($("#traineeNomStartDate").val() == "" ) || ($("#traineeNomStartDate").val()== null)){
				jAlert("Please provide trainee nomination Start Date");
				flag = false;
			}else if(($("#traineeNomEndDate").val() == "" ) || ($("#traineeNomEndDate").val()== null)){
				jAlert("Please provide trainee nomination end Date");
				flag = false;
			}else if(($("#trainingStartDate").val() == "" ) || ($("#trainingStartDate").val()== null)){
				jAlert("Please provide training Start Date");
				flag = false;
			}else if(($("#trainingEndDate").val() == "" ) || ($("#trainingEndDate").val()== null)){
				jAlert("Please provide training End Date");
				flag = false;
			}else if(($("#trainingStartTime").val() == "" ) || ($("#trainingStartTime").val()== null)){
				jAlert("Please provide training Start Time");
				flag = false;
			}else if(($("#trainingEndTime").val() == "" ) || ($("#trainingEndTime").val()== null)){
				jAlert("Please provide training End Time");
				flag = false;
			}else if(($("#attendanceEligibility").val() == "" ) || ($("#attendanceEligibility").val()== null)){
				jAlert("Please specify attendence eligibility % ");
				flag = false;
			}else if(!$('#attendanceEligibility').val().match('^(0|[1-9][0-9]*)$')){
					jAlert("Attendence eligibility % should be numeric");
					flag = false;
			    }
			return flag;
	  }
	  function validateStepTwo(){
			var flag = true;
			if(($("#trainerDistributionRole").val() == "" )|| ($("#trainerDistributionRole").val()== null)){
				jAlert("Atleast one role should be selected for trainer");
				flag = false;
			}else if(($("#trainerDistributionDept").val() == "" ) || ($("#trainerDistributionDept").val()== null)){
				jAlert("Atleast one department should be selected for trainer");
				flag = false;
			}else if(($("#traineeDistributionRole").val() == "" ) || ($("#traineeDistributionRole").val()== null)){
				jAlert("Atleast one role should be selected for trainee");
				flag = false;
			}else if(($("#traineeDistributionDept").val() == "" ) || ($("#traineeDistributionDept").val()== null)){
				jAlert("Atleast one department should be selected for traine2");
				flag = false;
			}

			
			return flag;
	  }
	  function validateSteps(stepnumber){
	        var isStepValid = true;
	        if(stepnumber == 2){
	        	isStepValid =  validateStepOne();
	        }if(stepnumber == 3){
	        	isStepValid =  validateStepTwo();
	        }
	        return isStepValid;
	  }
	 function leaveAStepCallback(obj, context){
		  //alert("Leaving step " + context.fromStep + " to go to step " + context.toStep);
	        return validateSteps(context.toStep); 
	  }

	$('#addWizard').smartWizard({transitionEffect:'fade',
		onFinish:onFinishCallback,
		onLeaveStep:leaveAStepCallback
		});

	
	$(function(){
		var divName = $(".actionBar"); 
		var element = "<a href=# id=btnCancel class=buttonNext >Cancel</a>";
		divName.append(element);
		 $("#btnCancel").click(function(){
				 $("#programCreateForm").attr("action","SearchProgram");
			  	 $("#programCreateForm").submit();
		 });
	});

	
  //StartDate Programe
  
  	
	$(function() {
		var dateToday = new Date();
		$( "#programStartDate" ).datepicker({
		    changeMonth: true,
			changeYear: true,
			dateFormat: 'd-M-yy',	
			minDate: dateToday ,
			selectMultiple:true,
			
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
			minDate: $( "#programStartDate" ).val() ,
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
			minDate: $( "#programStartDate" ).val() ,
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
				minDate: $( "#trainerNomStartDate" ).val() ,
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
			minDate: $( "#programStartDate" ).val() ,
			//minDate: dateToday ,
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
			minDate: $( "#traineeNomStartDate" ).val() ,
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
			minDate: $( "#programStartDate" ).val() ,
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
			minDate: $( "#trainingStartDate" ).val() 
			/*onSelect: function(selected) {
	           $("#trnrNomStartDate").datepicker("option","maxDate", selected);
	        }*/
				
		});
	});

	// to get location of selected
	function getLocationDetails(gridData,conf){
		var location;
		$.each(gridData ,function(index,child){
			if(child.conferenceCode == conf){
				location = child.location;
			}
	
		});	
		return location;
	}

	// to get primise of selected
	function getPrimiseDetails(gridData,conf){
		var location;
		$.each(gridData ,function(index,child){
			if(child.conferenceCode == conf){
				location = child.Primise;
			}
	
		});	
		return location;
	}


	// location details Grid
	
	
	$("#locationTBL").jqGrid({
		data : locationDetailsData,
		datatype: "local",
		colNames : [ 'Location', 'Primise', 'Conference Room','No Of Participants','No of allowed Nominations'],
        colModel : [ 
                     { name : 'location',index : 'location', align : "center",editable : true,editoptions : {size : 20},summaryType:'count',summaryTpl : 'Count : {0}',hidden:true},
                     { name : 'primise',index : 'primise', align : "center",editable : true,editoptions : {size : 20}},
                     { name : 'conferenceCode',index : 'conferenceCode', align : "center",editable : true,editoptions : {size : 20},key:true},
                     { name : 'numOfParticipants',index : 'numOfParticipants', align : "center",editable : true,editoptions : {size : 20},summaryType:'sum',summaryTpl : 'Total : {0}'},
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
			selectedRowVal = conferenceCode;
			var gridObject = $("#locationTBL");
			var selRowId = gridObject.jqGrid ('getGridParam', 'selrow');
			var location  = gridObject.jqGrid ('getCell', selRowId, 'location');
			$("#location").val(location);
			$("#location").trigger("change");
			var primise = gridObject.jqGrid ('getCell', selRowId, 'primise');
			$("#primise").val(primise);
			$("#primise").trigger("change");
			$("#conferenceCode").val(conferenceCode);
			noPatSelected = gridObject.jqGrid ('getCell', selRowId, 'numOfParticipants');
			$("#numOfParticipants").val(noPatSelected);
				
			
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
// location grid End


	// Total PArticipants in the grid
	function getToatalParticipants(gridData,loc){
		var total = 0;
		$.each(gridData ,function(index,child){
			if(child.location == loc){
				total = total + parseInt(child.numOfParticipants);
			}
	
		});	
		
			return total;
	}

	// check weather add conference room in the grid
	function isConferenceRoomExits(gridData,loc,primise,conf){
		var flag = true;
		$.each(gridData ,function(index,child){
			if(child.location == loc && child.primise == primise && child.conferenceCode == conf){
				flag = false;
			}
	
		});	
		
			return flag;

	}

	// Location delete from grid
	$("#btnLocDelete").click(function(){
		if(selectedRowVal != "" && selectedRowVal != null){
			$("#locationTBL").delRowData(selectedRowVal);
			$("#locationTBL").setGridParam('data',$("#locationTBL").getGridParam('data'));
			$("#locationTBL").trigger("reloadGrid"); 
			selectedRowVal = "";
		}else{
			jAlert("Please select record");
		}
	});	

	// Location Edit from grid
	$("#btnLocEdit").click(function(){
			if($("#location").val()== ""){
				jAlert("please select Location");
			}else if(($("#numOfAllowedNom").val() == "" )|| ($("#numOfAllowedNom").val()== null)){
				jAlert("Allowed nomination for location is Mandatory");
				return false;
			}else if($("#primise").val() == ""){
				jAlert("please select Primise");
			}else if($("#conferenceCode").val() == ""){
				jAlert("please select Conference Room");
			}else if($("#numOfParticipants").val() == ""){
				jAlert("please select no Of Actual Participants/Primise");
			}else if(selectedRowVal != "" && selectedRowVal != null){
				var gridData = $("#locationTBL").getGridParam('data');
				var totalParticipants = getToatalParticipants(gridData,$("#location").val());
				if(selectedRowVal == $("#conferenceCode").val()){
					totalParticipants = parseInt(totalParticipants) - parseInt(noPatSelected);
					totalParticipants = parseInt(totalParticipants)+parseInt($("#numOfParticipants").val());
					if(totalParticipants <= $("#numOfAllowedNom").val()){
						$.each(gridData ,function(index,child){
							if(child.conferenceCode == selectedRowVal){
								child.numOfParticipants = $("#numOfParticipants").val();
							}
						});
						$("#locationTBL").setGridParam('data',gridData);
						$("#locationTBL").trigger("reloadGrid"); 
					}else{
						jAlert("Sum of Participants for a location should be less OR Equal to allowed nomination for location");
					}
				}else{
					var totalParticipants = getToatalParticipants(gridData,$("#location").val());
					totalParticipants = parseInt(totalParticipants)+parseInt($("#numOfParticipants").val());
					if(totalParticipants <= $("#numOfAllowedNom").val()){
						if(isConferenceRoomExits(gridData,$("#location").val(),$("#primise").val(),$("#conferenceCode").val())){
							$.each(gridData ,function(index,child){
								if(child.conferenceCode == selectedRowVal){
									child.location = $("#location").val()
									child.conferenceCode = $("#conferenceCode").val()
									child.primise = $("#primise").val()
									child.numOfAllowedNom = $("#numOfAllowedNom").val()
									child.numOfParticipants = $("#numOfParticipants").val();
								}
							});
							$("#locationTBL").setGridParam('data',gridData);
							$("#locationTBL").trigger("reloadGrid"); 
						}else{
							jAlert("Conference Room alreday Exists For the Location");	
						}
					}else{
						jAlert("Sum of Participants for a location should be less OR Equal to allowed nomination for location");
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
			jAlert("Allowed nomination for location is Mandatory");
			return false;
		}else if($("#primise").val() == ""){
			jAlert("please select Primise");
		}else if($("#conferenceCode").val() == ""){
			jAlert("please select Conference Room");
		}else if($("#numOfParticipants").val() == ""){
			jAlert("please select no Of Actual Participants/Primise");
		}else{
				var gridData = $("#locationTBL").getGridParam('data');
				var totalParticipants = getToatalParticipants(gridData,$("#location").val());
				totalParticipants = parseInt(totalParticipants)+parseInt($("#numOfParticipants").val());
				if(totalParticipants <= $("#numOfAllowedNom").val()){
					if(isConferenceRoomExits(gridData,$("#location").val(),$("#primise").val(),$("#conferenceCode").val())){
						gridData.push({programId:programId,location:$("#location").val(),primise:$("#primise").val(),
							conferenceCode:$("#conferenceCode").val(),numOfParticipants:$("#numOfParticipants").val(),numOfAllowedNom:+$("#numOfAllowedNom").val()});
						$("#locationTBL").setGridParam('data',gridData);
						$("#locationTBL").trigger("reloadGrid"); 
					}else{
						jAlert("Conference Room alreday Exists For the Location");	
					}	
				}else{
					jAlert("Sum of Participants for a location should be less OR Equal to allowed nomination for location");
				}
		}
		});
	// Location ADD from grid END
	
	
	$(function() {
		
			$.post("roleList",null,function(data){

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
				
			});
	});
	$(function() {
		
		$.post("deptList",null,function(data){

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
			
		});
});


	$(function() {
		
		$.post("locationDetails",null,function(data){

		        var locationSelect = $('#location').empty();
		        locationSelect.append( '<option value=>--Select--</option>' ); 
		        $.each(data.locationDetails, function(locObject) {
		        	locationSelect.append( '<option value="'
		                                 + data.locationDetails[locObject]
		                                 + '">'
		                                 + data.locationDetails[locObject]
		                                 + '</option>' ); 
			       
			        });
				
			});
	});

	// To get Allowend nom  for location
	function getAllowedNominationForLocation(gridData,loc){
		var noOfAllowedNom ;
		$.each(gridData ,function(index,child){
			if(child.location == loc){
				noOfAllowedNom = parseInt(child.numOfAllowedNom);
			}
	
		});	
		return noOfAllowedNom;
	}
	
	$('#location').change(function(){
		var parameter = "location="+$('#location').val();
		$.ajax({
			url:"locationDetails",
			data:parameter,
			success:function(data){
		        var primiseSelect = $('#primise').empty();
		        primiseSelect.append( '<option value=>--Select--</option>' ); 
		        var confSelect = $('#conferenceCode').empty();
		        confSelect.append( '<option value=>Conference Room</option>' ); 
		        $.each(data.locationDetails, function(locObject) {
		        	primiseSelect.append( '<option value="'
		                                 + data.locationDetails[locObject]
		                                 + '">'
		                                 + data.locationDetails[locObject]
		                                 + '</option>' ); 
			       
		        	});
		        $("#numOfParticipants").val("");
			},
			
			async:false
		});
		
		var gridData = $("#locationTBL").getGridParam('data');
		var allowedNom = getAllowedNominationForLocation(gridData,$('#location').val());
		$("#numOfAllowedNom").val(allowedNom);
		return true;
	});

	$("#numOfAllowedNom").change(function(){
		if(!$('#numOfAllowedNom').val().match('^(0|[1-9][0-9]*)$')){
			jAlert("Allowed nominations Should Be Numeric");
			return false;
	    }else{
			var changedValue = $("#numOfAllowedNom").val();
			var gridObject = $("#locationTBL").getGridParam('data');
			var noOfParticipentsInLocation = getToatalParticipants(gridObject,$('#location').val());
			if(	changedValue < noOfParticipentsInLocation){
				jAlert("Allowed Nomination should be greater that total Participants for location");
				var gridData = $("#locationTBL").getGridParam('data');
				var allowedNom = getAllowedNominationForLocation(gridData,$('#location').val());
				$("#numOfAllowedNom").val(allowedNom);
			}else{
				$.each(gridObject ,function(index,child){
					if(child.location == $('#location').val()){
						child.numOfAllowedNom = changedValue;
					}
				});
				$("#locationTBL").setGridParam('data',gridObject);
				$("#locationTBL").trigger("reloadGrid"); 
			}	
	    }
	});
	
	$('#primise').change(function(){
		var parameter = "location="+$('#location').val()+"&primise="+$("#primise").val();
		$.ajax({url:"locationDetails",
				data :parameter,
				success:function(data){
			        var confSelect = $('#conferenceCode').empty();
			        confSelect.append( '<option value=>--Select--</option>' ); 
			        $.each(data.locationDetails, function(locObject) {
			        	confSelect.append( '<option value="'
			                                 + data.locationDetails[locObject]
			                                 + '">'
			                                 + data.locationDetails[locObject]
			                                 + '</option>' ); 
				       
			        	});
			    	$("#numOfParticipants").val("");
					},
				async:false
		});
	});
	$('#conferenceCode').change(function(){
		$("#numOfParticipants").val("");
	});
	$(function() {
			
			$.post("courseDetails",null,function(data){
	
			        var courseSelect = $('#courseName').empty();
			      			        courseSelect.append( '<option value=>--Select--</option>' ); 
			        courseData = data.courseDetails;
			        $.each(data.courseDetails, function(locObject) {
			        	courseSelect.append( '<option value="'
			                                 + data.courseDetails[locObject].courseName
			                                 + '">'
			                                 + data.courseDetails[locObject].courseName
			                                 + '</option>' ); 
				       
			        });
				
			});
	});
	function getMonth(date) {
	    var month = date.getMonth();
	    month = month+1;
	    return month < 10 ? '0' + month : month; // ('' + month) for string result
	} 
	function getDate(date) {
	    var date = date.getDate();
	    return date < 10 ? '0' + date : date; // ('' + month) for string result
	} 
var courseData;
	$('#courseName').change(function(){
		var date = (new Date);
		var year = date.getFullYear();
		var month = getMonth(date);
		var day = getDate(date);
		var currentTimeStamp = year+""+(month)+""+day;
		var courseName = $('#courseName').val();
		var platFormName;
		var SubName;
		  $.each(courseData, function(locObject) {
			
			  if(courseName == courseData[locObject].courseName){
				  platFormName = courseData[locObject].platformCode;
				  SubName = courseData[locObject].subjectCode;
			  }
		  });
		  var courseNamePar = "courseName="+courseName;
		  var programeId1 ;
		  $.ajax({url:"programCount",
				data :courseNamePar,
				success:function(data){
			 	 programeId1 = courseName.substring(0,4)+currentTimeStamp+data.programsCountOnCourse;	
		  			},
		  		async:false

		  });
		programId = programeId1;
		$('#programIdHid').val(programeId1);
		$('#programId').text(programeId1);
		//alert($('#programIdHid').val());
	});

	$("#isrmapproval").click(function(){
		if($("#isrmapproval").is(':checked')){
			$("#isrmapproval").attr('value', "Y");
		}else{
			$("#isrmapproval").attr('value', "N");
		} 
	});
	$("#attendanceEligibilityFlag").click(function(){
		//alert($("#attendanceEligibilityFlag").val());
		if($("#attendanceEligibilityFlag").is(':checked')){
			$("#attendanceEligibilityFlag").attr('value', "Y");
		}else{
			$("#attendanceEligibilityFlag").attr('value', "N");
		}
		//alert($("#attendanceEligibilityFlag").val()); 
	});

	$("#traineesAllocationFlag").click(function(){
		if($("#traineesAllocationFlag").is(':checked')){
			$("#traineesAllocationFlag").attr('value', "M");
		}else{
			$("#traineesAllocationFlag").attr('value', "A");
		} 
	});
	$("#examMode").click(function(){
		if($("#examMode").is(':checked')){
			$("#examMode").attr('value', "Y");
		}else{
			$("#examMode").attr('value', "N");
		} 
	});
});


</SCRIPT>
<style type="text/css">
@import url("${pageContext.request.contextPath}/stylesheet/Jquery/wizard/demo_style.css");
@import url("${pageContext.request.contextPath}/stylesheet/Jquery/wizard/smart_wizard.css");

</style>
</head>
<body> 
<form id="programCreateForm" name="programCreateForm" method="post" action="saveOrUpdateprogramMainteance"> 
<br>
<div id="heading" class="title" align="left">Program Creation</div>
<br>
<table align="center" border="0" cellpadding="0" cellspacing="0">
<tr><td>
<div id="addWizard" class="swMain" >
<ul>
  				<li><a href="#programDetails">
                <label class="stepNumber">1</label>
                <span class="stepDesc">
                   Program Details<br />
                   <small></small>
                </span>
            </a></li>
  				<li><a href="#programDetails1">
                <label class="stepNumber">2</label>
                <span class="stepDesc">
                   Nomination Eligibilities<br />
                   <small></small>
                </span>
            </a></li>
  				<li><a href="#locationDetails">
                <label class="stepNumber">3</label>
                <span class="stepDesc">
                   Location Details<br />
                   <small></small>
                </span>                   
             </a></li>
  			</ul>
  			<div id="programDetails" class="tabsContent">	
            <h2 class="StepTitle"></h2>
            <table align="left">
             <tr><td>Program Type : </td>
             	 <td><select id="trainingType" name="trainingType" style="width:123px">
             	 			<%if("true".equals(ParameterUtil.getVITCodeValue("OTS","INTL"))){ %>
             	 			<option value="Internal">Internal</option>
             	 			<%} %>
             	 			<%if("true".equals(ParameterUtil.getVITCodeValue("OTS","EXTL"))){ %>
             				<option value="External">External</option>
             				<%} %>
             		 </select>
             	 </td>
             	 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
             	 <td>Training Mode : </td>
		 		 <td><select id="trainingMode" name="trainingMode" style="width:123px">
            	 		 <!-- <option value="Online">Online</option> -->
            			<option value="Class Room">Class Room</option>
            		</select>
             	 </td>
             	 
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td>Course Name : </td><td><select id="courseName" name="courseName" style="width:123px">
            								<option>--Course--</option>
            								</select></td>
            	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            	<td>Program Name : </td><td><span id="programId" name="programId"></span></td>
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
             	 	 <td><input type="checkbox" name="examMode" id="examMode" value="Y" checked="checked"></td>
             	 	 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
             	 	 <td>Trainee Eligibility Attendance % To Attend Exam : </td><td><input type="text" id="attendanceEligibility" name="attendanceEligibility">%</td>
			 	</tr>
            	<tr><td>&nbsp;</td></tr>
            	<tr><td>Is RM Approval Required For Trainees Nomination : </td>
            		<td><input type="checkbox"  id="isrmapproval" value="N"></td>
            		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            		<td>Manual Trainee Allocation : </td>
            		<td><input type="checkbox" id="traineesAllocationFlag" value="A"></td>
            	</tr>
            </table>
			</div>
			<div id="programDetails1" class="tabsContent">	
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
           			 <td><input type="checkbox"  id="attendanceEligibilityFlag" value="N"></td>
          	 	 </tr>
       	 	 	 
			</table>
			</fieldset>
			</div>
	
			<div id="locationDetails" class="tabsContent">	
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
			<div id="trainee" style="display:none">	
            <h2 class="StepTitle"></h2>
            <br>
             <table>
            <tr>
            	<td>Primary Trainer : </td>
            	<td>
           			<select id="prmyTrnr">
            	 			<option value="Conf1">VITG00531</option>
            				<option value="Conf2">VITG00536</option>
            		</select>
           	 	</td>
           	 	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            	<td>Backup Trainer : </td>
            	<td>
           			<select id="bkpTrnr">
            	 			<option value="Conf1">VITG00538</option>
            				<option value="Conf2">VITG00533</option>
            		</select>
           	 	</td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
            	<td>No Of Exam Schedules : </td><td><input type="text" id="noOfExamShduls"></td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            		<tr>
            			<td>Total No Ques : </td><td><input type="text" id="totalNoQues"></td>
            			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            			<td>No Of Objective : </td><td><input type="text" id="noOfObjective"></td>
            			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            			<td>No Of Subjective : </td><td><input type="text" id="noOfSubjective"></td>
            		</tr>
            </table>
            <br><br>
            <fieldset title="Exam Schedule" >
            	<legend>Exam Schedule</legend>
            	
            	<table>
            		<tr>
            			<td>Exam Date : </td><td><input type="text" id="examDate" readonly="readonly"></td>
            			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            			<td>Exam Open Time : </td><td><input type="text" id="examOpnTime"></td>
            			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            			<td>Exam Close Time : </td><td><input type="text" id="examCloseTime"></td>
            		</tr>
            		
            	</table>
            </fieldset>
            <input type="hidden" value="" id="programIdHid">
			</div>
</div>
</td></tr></table>
</form>
</body>
</html>
