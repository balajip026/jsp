<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@include file="../CommonJSs.jsp" %>
<SCRIPT type="text/javascript">
//khasim implemented for adding button instead of context menu
function addTrainer(){
	 //AddTrainer_details     
	 $("#AddTrainer_details").dialog({			    	 	
		   height:300, 
		   width: 600, 
		  close: true,
		  // model :true,	        
        buttons: {
         "Nominate": function() {
          var bValid = true;
          if( bValid ) {
		   var serialiseData = null;
			var nominateTrainersaveform = $('#add_trainer_nominate_id');
			var disabled = nominateTrainersaveform.find(':input:disabled').removeAttr('disabled');
           // serialize the form
           var serialized = nominateTrainersaveform.serialize();
          // re-disabled the set of inputs that you previously enabled
           disabled.attr('disabled','disabled');
			//serialiseData = serialized + "&"+"programId="+checkedVal;
			//alert("serialiseData ::: "+ serialized);
		$.ajax({url: "TrainerNominateTOTNT.action", //TrainerNominateTOTNT1
				data : serialized,
		        success: function(data)
			      {  
			   jAlert("Trainer nominated successfully","Information");
			   $("#TrainerNominateTBL").trigger("reloadGrid"); 
              $('.ui-dialog-titlebar-close').trigger('click');
 	            $(this).dialog("close");
			     },
				 error:function(data){
				 alert("Error :: "+data.message);
				   }            
            });
				  $("#AddTrainer_details").val=""; 
				 }
	    	  },
			 "Cancel": function() {
	    		  $('.ui-dialog-titlebar-close').trigger('click');
	             $(this).dialog("close");
	    	 	  }
				}         
	       }); 
      //for jsp
		
}
$(document).ready(function(){
 // Validation Function 
 var checkedVal=0;
 function chekvalid(value,APP_CODE,DESCRIPTION ) 
    {
    if (value == ""  || value =="null") 
        return [false,"Please Enter value."];
        else 
           return [true,""];
     } 
$("#TrainerNominateTBL").jqGrid({
			url :'listTrainerNominateDirect',// 'listTrainerNominate',//'listprogramMainteance',
			datatype : "json",
			jsonReader : { repeatitems : false,
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
		     	colNames : [ 'Program Id', 'Training Type', 'Exam Mode','Course Name', 'Program StartDate', 'Program EndDate', 'Training StartDate','Training EndDate', 'Training StartTime','Training Duration', 'Trainer Nom StartDate','Trainer Nom EndDate','Trainee Nom StartDate', 'Trainee Nom EndDate', 'Status', 'CancelRemarks', 'TrainingMode', 'NumOfTrainees', 'NumOfTraineesBackup','PrimaryTrainer','BackupTraineer', 'NoOfExam_schedules', 'isRMApproval', 'attendanceEligibility', 'Trainer Dis Dept','Trainer Dis Role', 'Trainee Dis Dept','Trainee Dis Role', 'UPDATED BY' ], 	
				colModel : [ { name : 'programId',index : 'programId', align : "center", editable : true, editoptions : {size : 20 },key : true },
			                 { name : 'trainingType',index : 'trainingType', align : "center", editable : false,hidden:true,key:true} ,
				             { name : 'examMode',index : 'examMode', align : "center", editable : false,hidden:true,key:true} ,
				             { name : 'courseName',index : 'courseName', align : "center", editable : true, editoptions : {size : 20 }}, 
					         { name : 'programStartDate',index : 'programStartDate', align : "center", editable : false,hidden:true,key:true,formatter:'date', "formatoptions":{"srcformat":"Y-m-d", "newformat":"d-M-Y"}}, 
						     { name : 'programEndDate',index : 'programEndDate', align : "center", editable : false,hidden:true,
					        	       formatter:'date', "formatoptions":{"srcformat":"Y-m-d", "newformat":"d-M-Y"}},
							 { name : 'trainingStartDate',index : 'trainingStartDate', align : "center", editable : true,
				                    	 formatter:'date', "formatoptions":{"srcformat":"Y-m-d", "newformat":"d-M-Y"}},
							 { name : 'trainingEndDate',index : 'trainingEndDate', align : "center", editable : true,
				                    	 formatter:'date', "formatoptions":{"srcformat":"Y-m-d", "newformat":"d-M-Y"}},
	                         { name : 'trainingStartTime',index : 'trainingStartTime', align : "center", editable : false,hidden:true,
				                         formatter:'date', "formatoptions":{"srcformat":"Y-m-d", "newformat":"d-M-Y"}},
							 { name : 'trainingEndTime',index : 'trainingEndTime', align : "center", editable : false,hidden:true,
				                    	 formatter:'date', "formatoptions":{"srcformat":"Y-m-d", "newformat":"d-M-Y"}},
	                         { name : 'trainerNomStartDate',index : 'trainerNomStartDate', align : "center", editable : false,hidden:true},
							 { name : 'trainerNomEndDate',index : 'trainerNomEndDate', align : "center", editable : false,hidden:true},
							 { name : 'traineeNomStartDate',index : 'traineeNomStartDate', align : "center", editable : false,hidden:true,
				                    	formatter:'date', "formatoptions":{"srcformat":"Y-m-d", "newformat":"d-M-Y"}},
							 { name : 'traineeNomEndDate',index : 'traineeNomEndDate', align : "center", editable : false,hidden:true,
				                    	formatter:'date', "formatoptions":{"srcformat":"Y-m-d", "newformat":"d-M-Y"}},
							 { name : 'status.statusDesc',index : 'status.statusDesc', align : "center", editable : true,   editoptions : {size : 20 }},
							 { name : 'cancelRemarks',index : 'cancelRemarks', align : "center", editable : false,hidden:true,key:true},
							 { name : 'trainingMode',index : 'trainingMode', align : "center", editable : false,hidden:true,key:true}, 
							 { name : 'numOfTrainees',index : 'numOfTrainees', align : "center", editable : false,hidden:true,key:true}, 
							 { name : 'numOfTraineesBackup',index : 'numOfTraineesBackup', align : "center", editable : false,hidden:true,key:true}, 
							 { name : 'primaryTrainer',index : 'primaryTrainer', align : "center", editable : false,hidden:true,key:true}, 
							 { name : 'backupTrainer',index : 'backupTrainer', align : "center", editable : false,hidden:true,key:true}, 
							 { name : 'noExamSchedules',index : 'noExamSchedules', align : "center", editable : false,hidden:true,key:true}, 
							 { name : 'isrmapproval',index : 'isrmapproval', align : "center", editable : false,hidden:true,key:true}, 
							 { name : 'attendanceEligibility',index : 'attendanceEligibility', align : "center", editable : false,hidden:true,key:true}, 
							 { name : 'trainerDistributionDept',index : 'trainerDistributionDept', align : "center", editable : false,hidden:true,key:true},
							 { name : 'trainerDistributionRole',index : 'trainerDistributionRole', align : "center", editable : false,hidden:true,key:true}, 
							 { name : 'traineeDistributionDept',index : 'traineeDistributionDept', align : "center", editable : false,hidden:true,key:true}, 
							 { name : 'traineeDistributionRole',index : 'traineeDistributionRole', align : "center",editable : false,hidden:true,key:true},
							 { name : 'updateUser',index : 'updateUser',	align : "center", editable : false,hidden:true,key:true} ],
							rowNum : 15,
							rowList : [ 15, 20, 30 ],
							pager : '#TrainerSeatchTBLPageDiv',
							loadatonce : false,
							viewrecords : true,
							mtype : "GET",
							//rownumbers: true,
							toolbar:[true,"top"],
							height: 255,
							width: 1000,
							gridview : true,
							sortname : 'courseName',
							sortorder : "desc",
							caption : "Trainer Details",
							toolbar:[true,"top"],
							onSelectRow: function(rowid){
						        checkedVal = rowid;
				           },
				           gridComplete: function () { 
				              $("#TrainerNominateTBL").trigger("reloadGrid");
				           },
				         afterSubmit : function(response, postdata){
	       },  
	       afterComplete : function(response, postdata){
	       }   
				         /*  onRightClickRow: function(rowid,iRow,iCol,e){
						        checkedVal = rowid;
						        alert("onRightClickRow========"+checkedVal);
						        alert("e========"+e);
						      
					           },*/
				// Context Menu Loading Details....Disabled by khasim 0n 10jan13
			
	});
	$('#TrainerNominateTBL').jqGrid('filterToolbar', {
			searchOnEnter : true,
			enableClear : false,
			beforeSearch : function(value) {
				$("#TrainerNominateTBL").jqGrid('setGridParam', {
					url : "listTrainerNominateDirect?filters="
				});
			}
		});
	$("#TrainerNominateTBL").jqGrid(
				'navGrid',
				'#TrainerSeatchTBLPageDiv',
				{ edit : false, add : false, del : false, search : true, view : true }, //options
				{ height : 200, reloadAfterSubmit : true, closeAfterEdit : true, closeOnEscape : true, caption : "Add" }, // edit options
				{ height : 200, reloadAfterSubmit : true, closeAfterAdd : true, closeOnEscape : true, onClickButton : function() {
					}
				}, // add options
				{ // now define settings for Delete dialog      
					mtype : "POST",
					reloadAfterSubmit : true,
					onclickSubmit : function(rp_ge, postdata) {
						rp_ge.url = "deleteTrainingSearch?COURSE_NAME="
								+ postdata;
					},
					serializeDelData : function(postdata) {
						return "";
					},
					closeOnEscape : true
				}, // del options
				{
					multipleSearch : true,
					closeOnEscape : true,
					groupOps : [ { op : "AND", text : "AND" }, 
								 { op : "OR", text : "OR" } ],
					matchText : "Find",
					rulesText : " matches",
					sopt : [ 'cn', 'bw', 'eq', 'ne', 'lt', 'le', 'gt', 'ge', 'ew' ],
					onSearch : function(params, postdata) {
					$("#gs_programId").val("");
					$("#gs_trainingType").val("");
					$("#gs_examMode").val("");
					$("#gs_courseName").val("");
					$("#gs_programStartDate").val("");
					$("#gs_programEndDate").val("");
					$("#gs_trainingStartDate").val("");
					$("#gs_trainingEndDate").val("");
					$("#gs_trainingStartTime").val("");
					$("#gs_trainingEndTime").val("");				
					$("#gs_trainerNomStartDate").val("");
					$("#gs_trainerNomEndDate").val("");
					$("#gs_traineeNomStartDate").val("");
					$("#gs_traineeNomEndDate").val("");
					$("#gs_status").val("");
					$("#gs_cancelRemarks").val("");
					$("#gs_trainingMode").val("");
					$("#gs_numOfTrainees").val("");
					$("#gs_numOfTraineesBackup").val("");
					$("#gs_primaryTrainer").val("");
					$("#gs_backupTrainer").val("");
					$("#gs_noExamSchedules").val("");
	               $("#gs_isrmapproval").val("");
	               $("#gs_attendanceEligibility").val("");
					$("#gs_trainerDistributionDept").val("");
					$("#gs_trainerDistributionRole").val("");
					$("#gs_traineeDistributionDept").val("");
					$("#gs_traineeDistributionRole").val("");
					$("#gs_updateUser").val("");
					$("#TrainerNominateTBL").jqGrid('setGridParam', { url : "listTrainerNominate" });
				},
				reloadAfterSearch : true },// search options
				{		beforeShowForm : function(TrainerNominateTBL){
						$(".navButton").hide();
			                }},
				{ closeOnEscape : true }).jqGrid('navButtonAdd',"#TrainerSeatchTBLPageDiv",
				{
			title:"Add Trainer",
			add:false,
			addtext:'Add Nominate',
			buttonicon : "upload-icon.jpg",
			position: "first", 
			caption : "NominateTrainer",
			onClickButton : function(){
					 var myGrid = $('#TrainerNominateTBL');
                     var selRowId = myGrid.jqGrid ('getGridParam', 'selrow');
                  	 var celTrainerEndDate = myGrid.jqGrid ('getCell', selRowId, 'trainerNomEndDate');
                  	 var curdate = $.datepicker.formatDate('yy-mm-dd', new Date());
                  	 if(checkedVal == 0) {
						jAlert("Please,select row","Warning");
						return false;
					//}
						}else if(celTrainerEndDate < curdate){
							jAlert("Nomination due date is over. "+celTrainerEndDate,"Warning");
					        return false;

						}else{
							
					//for jsp
				 $.ajax({url: "listTrainerNominateFromPMT.action",
	             data : "programId="+checkedVal,
	             cahce : true,
	             success: function(data){
					   var count = 0;			        	       
	             $('#AddTrainer_details').html(data);
	             },
		         error:function(data){
		         alert("Error :: "+data.message);
		       }            
			});
					addTrainer();
					
				} 
				}
				    
				//}//
		     }); 
	});
	</SCRIPT>
	<body>

	<form id="TrainerNominateDeatilsForm">
	<div align="center"  width="100%">
	<br>
	<div id="heading" class="title" align="left">Training Search</div>
	<br>
	<table id="TrainerNominateTBL" width="100%"></table>
	<div id="TrainerSeatchTBLPageDiv"></div>
	<br> <div id="TrainerNominate"  style="width: 700px;height:400px;"></div>  
	<!-- <div class="contextMenu" id="myMenu1" style="display:none">
	<ul style="width: 100px">

	<li id="AddTrainerNominations">
	<span class="ui-icon ui-icon-plus" style="float:left"></span>
	<span style="font-size:11px; font-family:Verdana">Nominate Trainer</span>
	</li>

	</ul>
	</div> -->
	</div>
	<!-- All Dialog Titles  -->
	<div id="trainer_details" title="Trainer DETAILS" style="display:none;"> </div> 
	<div id="AddTrainer_details" title="Trainer Nomination Details" style="display:none;"></div> 
	<br> <div id="TrainerNominate"  style="width: 700px;height:400px;"></div>  
	<br>
	</form>

	</body>
	</html>