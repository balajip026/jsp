<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.vit.ots.utils.OTSConstants"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@include file="../CommonJSs.jsp" %>
<SCRIPT type="text/javascript">

$(document).ready(function(){
	 var traineeAllocation;
 // Validation Function 
 function chekvalid(value,APP_CODE,DESCRIPTION ) 
    {
    if (value == ""  || value =="null") 
        return [false,"Please Enter value."];
        else 
           return [true,""];
     }
 //Primary Trainer & Backup Trainer Validation 
 function validate(object){
		var flag = true;
		if(($("#PrimaryTrainer").val() == "" )){
			jAlert("Please select primary trainer ");
			flag = false;
		}
		else if(($("#backupTrainer").val() == "" )){
			jAlert("Please select backup trainer ");
			flag = false;
		}
		return flag;
	}	

 //Trainee Validation 
 function TraineeValidate(object){
		var flag = true;
		if(($("#locationTBL").val() == "" )){
			jAlert("Please choose Trainee Nominations");
			flag = false;
		}
		return flag;
	}	
	
 var checkedVal; 
$("#TrainingSearchTBL").trigger("reloadGrid"); 
$("#TrainingSearchTBL").jqGrid({
			url : 'listprogramMainteance',
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
	
		    colNames : [ 'Program Id', 'Training Type', 'Exam Mode','Course Name', 'Program Start Date', 'Program End Date', 'Training StartDate','Training EndDate', 'Training StartTime','Training Duration', 'Trainer Nom StartDate','Trainer Nom EndDate','Trainee Nom StartDate', 'Trainee Nom EndDate', 'Status','Status Code', 'CancelRemarks', 'TrainingMode', 'NumOfTrainees', 'NumOfTraineesBackup','PrimaryTrainer','BackupTraineer', 'NoOfExam_schedules', 'isRMApproval', 'attendanceEligibility', 'Trainer Dis Dept','Trainer Dis Role', 'Trainee Dis Dept','Trainee Dis Role', 'UPDATED BY','Trainee Allocation' ],
			colModel : [ { name : 'programId',index : 'programId', align : "center", editable : true, editoptions : {size : 20 }, 
		                   editrules : {custom : true, custom_func : chekvalid }, key : true },
		                 { name : 'trainingType',index : 'trainingType', align : "center",  hidden : true },
			             { name : 'examMode',index : 'examMode', align : "center",  hidden : true },
			             { name : 'courseName',index : 'courseName', align : "center" },
				         { name : 'programStartDate',index : 'programStartDate', align : "center", editable : true, formatter:'date', "formatoptions":{"srcformat":"Y-m-d", "newformat":"d-M-Y"}},
					     { name : 'programEndDate',index : 'programEndDate', align : "center", editable : true,formatter:'date', "formatoptions":{"srcformat":"Y-m-d", "newformat":"d-M-Y"}},          
						 { name : 'trainingStartDate',index : 'trainingStartDate', align : "center", hidden : true },  
						 { name : 'trainingEndDate',index : 'trainingEndDate', align : "center", hidden : true }, 
                         { name : 'trainingStartTime',index : 'trainingStartTime', align : "center", hidden : true },  
						 { name : 'trainingEndTime',index : 'trainingEndTime', align : "center", hidden : true }, 	   
                         { name : 'trainerNomStartDate',index : 'trainerNomStartDate', align : "center", hidden : true },    
						 { name : 'trainerNomEndDate',index : 'trainerNomEndDate', align : "center", hidden : true },    
						 { name : 'traineeNomStartDate',index : 'traineeNomStartDate', align : "center", hidden : true },
						 { name : 'traineeNomEndDate',index : 'traineeNomEndDate', align : "center", hidden : true },
						 { name : 'status.statusDesc',index : 'status.statusDesc', align : "left" },
						 { name : 'status.statusCode',index : 'status.statusCode', align : "left" ,hidden : true },
						 { name : 'cancelRemarks',index : 'cancelRemarks', align : "center", hidden : true },
						 { name : 'trainingMode',index : 'trainingMode', align : "center", hidden : true },
						 { name : 'numOfTrainees',index : 'numOfTrainees', align : "center", hidden : true },
						 { name : 'numOfTraineesBackup',index : 'numOfTraineesBackup', align : "center", hidden : true },  
						 { name : 'primaryTrainer',index : 'primaryTrainer', align : "center",  hidden : true },      
						 { name : 'backupTrainer',index : 'backupTrainer', align : "center", hidden : true },      
						 { name : 'noExamSchedules',index : 'noExamSchedules', align : "center", hidden : true }, 
						 { name : 'isrmapproval',index : 'isrmapproval', align : "center", hidden : true }, 	   
						 { name : 'attendanceEligibility',index : 'attendanceEligibility', align : "center", hidden : true },   
						 { name : 'trainerDistributionDept',index : 'trainerDistributionDept', align : "center", hidden : true }, 	
						 { name : 'trainerDistributionRole',index : 'trainerDistributionRole', align : "center", hidden : true }, 
						 { name : 'traineeDistributionDept',index : 'traineeDistributionDept', align : "center", hidden : true },
						 { name : 'traineeDistributionRole',index : 'traineeDistributionRole', align : "center", hidden : true },
						 { name : 'updateUser',index : 'updateUser', align : "center", editable : false, hidden : true },
						 { name : 'traineesAllocationFlag',index : 'traineesAllocationFlag', align : "center", editable : false, hidden : true } ],
						rowNum : 15,
						rowList : [ 15, 20, 30 ],
						pager : '#TrSeatchTBLPageDiv',
						loadatonce : false,
						viewrecords : true,
						mtype : "GET",
						//rownumbers: true,
						multiselect: false,
						gridview : true,
						sortname : 'courseName',
						caption : "Toolbar Searching",
						sortorder : "desc",
						caption : "Training Search",
						toolbar:[true,"top"],
						editurl : "saveOrUpdateprogramMainteance",
						height: 255,
						width : 1000, 
					    onSelectRow: function(programId){
							    checkedVal = programId;
							    var myGrid = $('#TrainingSearchTBL');
							    var selRowId = myGrid.jqGrid ('getGridParam', 'selrow');
	                            var celValue = myGrid.jqGrid ('getCell', selRowId, 'status.statusDesc');
	                            traineeAllocation = $("#TrainingSearchTBL").jqGrid ('getCell', selRowId, 'traineesAllocationFlag');
								//alert(traineeAllocation);
							   // $("#programIdHid").attr("value",checkedVal);
							    //alert(checkedVal);
						     },
						     
						// Context Menu Loading Details....
						loadComplete: function() {
				    		 $("tr.jqgrow", this).contextMenu('myMenu1', {
							        bindings: {
							            'CancelProgram': function(trigger) {
				    			 if(checkedVal != null && checkedVal !=""){
					    			 var myGrid = $('#TrainingSearchTBL');
                                     var selRowId = myGrid.jqGrid ('getGridParam', 'selrow');
                                     var celValue = myGrid.jqGrid ('getCell', selRowId, 'status.statusCode');
                                     var celProgramEndDate = myGrid.jqGrid ('getCell', selRowId, 'programEndDate');
                                     var curdate = $.datepicker.formatDate('yy-mm-dd', new Date());
                                     	//alert("celValue"+celValue);
                                         if(celProgramEndDate < curdate ){
                                        	 jAlert("Nomination due date is over. "+celProgramEndDate,"Warning");
							               return false;
                                    }
						            $("#Cancel_details").dialog({			    	 	
                                    		   height: 190, 
                                    		   width: 330, 
                                    		   model :true,	        
                                               buttons: { "Submit": function() {
							                   var bValid = true;
							                   if( bValid ) {
											   var serialiseData = null;
												// Here "#frm_demo" sub page form name 
												serialiseData = $(("#frm_demo")).serialize();
												serialiseData = serialiseData + "&"+"programId="+checkedVal;
												//alert("serialiseData ::: "+ serialiseData);
											$.ajax({url: "CancelProgramAction.action", 
													data : serialiseData,
											        success: function(data)
												      {
												      jAlert("Success of cancel program sucessfully","Information");           		             
												      $("#TrainingSearchTBL").trigger("reloadGrid"); 
												       },
													 error:function(data){
													 //alert("Error :: "+data.message);
													   }            
					                               });
													  $(this).dialog('close');
													  $("#Cancel_details").val=""; 
													 }
                                    	    	  },
                                    	    	  Close: function() {
                                    					$(this).dialog('close');
                                    					$("#Cancel_details").val="";
                                    	    	 	  }
                                    				},
                                    			 close: function() {
                                    					$("#Cancel_details").val=""; 
                                                	}          
                                    	       }); 

                                    		 $.ajax({url: "CancelProgram.action",
	                                                 data : "remarks="+checkedVal,
	                                                 cahce : true,
	                                                 success: function(data){
                                    				 var count = 0;			        	       
	                                                 $('#Cancel_details').html(data);
	                                                 },
	                                    	         error:function(data){
	                                    	         jAlert("Error :: "+data.message);
	                                    	       }            
	                                    		}); 
                                               
				    			             }
				    		 
	    					                   else{
													jAlert("Please select a record to cancel program");
		                                    	}  
				    			              
	                                    	},

                                    	 // Freeze Trainee Nominations Context Dialog    
							            'FreezeTrainerNominations': function(/*trigger*/) {
                                           	   // Context Menu our Own Dialog Design 
                                           	if(checkedVal != null && checkedVal !=""){
                                           	 //var myGrid = $('#TrainingSearchTBL');
                                             //var selRowId = myGrid.jqGrid ('getGridParam', 'selrow');
                                             //var celValue = myGrid.jqGrid ('getCell', selRowId, 'status.statusCode');
                                             //alert("celValue"+celValue);
                                              //if(celValue != 'OTSConstants.TRAINER_NOMINNATION_IN_PROGRESS') 
        						                  // {  
        							                //jAlert("Trainer Nominations already Freezed","Information");
        							                //return false;
        						                   //}
                                               	
										  	$( "#viewFreezeTrainer_details" ).dialog({
												  	   height: 435, 
												  	   width: 558, 
		                                    		   model :true,	        
		                                               buttons: { "Freeze Nominations": function() {
										  	           // Validation Function 
									                   var bValid = validate(this);
									                   if( bValid ) {
													   var serialiseData = null;
														// Here "#FreezeTrainer" sub page form name 
														serialiseData = $(("#TrainerFreeze")).serialize();
														serialiseData = serialiseData + "&"+"programId="+checkedVal;
														$.ajax({url: "TrainerFreezeAction.action", 
															data : serialiseData,
															cahce : true,
													        success: function(data)
														       {
															jAlert("Trainer nominations Freezed sucessfully","Information");     
															$("#TrainingSearchTBL").trigger("reloadGrid");
															$('.ui-dialog-titlebar-close').trigger('click');
					                             	        $(this).dialog("close"); 
					                                    },
					                                    															 
														     error:function(data){
															 jAlert("Error :: "+data.message);
															     }            
							                                  });
															  
															 }
		                                    	    	  },
		                                    	    	  Close: function() {
		                                    					$(this).dialog('close');
		                                    					$("#viewFreezeTrainer_details").val="";
		                                    	    	 	  }
		                                    				},
		                                    			 close: function() {
		                                    					$("#viewFreezeTrainer_details").val=""; 
		                                                	}          
		                                    	       }); 

                                             $.ajax({url: "TrainerFreeze.action",
			                                                 data : "programId="+checkedVal+"&traineesAllocationFlag="+traineeAllocation,
			                                                 cahce : true,
			                                                 success: function(data){
		                                    				 var count = 0;			        	       
			                                                 $('#viewFreezeTrainer_details').html(data);
			                                                 },
			                                    	         error:function(data){
			                                    	         jAlert("Error :: "+data.message);
			                                    	       }    
                                         	        
			                                    		}); 
			                                           	}else{
															jAlert("Please select a record to freeze trainer nominations");
				                                    	}
			                                    	},			    	 	
                                    			
                                            // View/Freeze Trainer Nominations Context Dialog    
									       'FreezeTraineeNominations': function(/*trigger*/) {
		                                           	// Context Menu our Own Dialog Design 
		                                           	if(checkedVal != null && checkedVal !=""){

		                                           	 //var myGrid = $('#TrainingSearchTBL');
		                                             //var selRowId = myGrid.jqGrid ('getGridParam', 'selrow');
		                                             //var celValue = myGrid.jqGrid ('getCell', selRowId, 'status.statusCode');
		                                             //alert("celValue"+celValue);
		                                              //if(celValue != 'OTSConstants.TRAINEE_NOMINNATION_IN_PROGRESS') 
		        						                 //  {  
		        							             //   jAlert("Trainee Nominations already Freezed","Information");
		        							             //   return false;
		        						                 //  }
	        						                   
												   		$( "#FreezeTrainee_details" ).dialog({			    	 	
												   		height: 430, 
												   		width: 775,
				                                    	model :true,				   
				                                        buttons: {'Freeze Nominations': function() {
												   		    // Validation Function 
											                //var bValid = TraineeValidate(this);
												   			var bValid = true;
											                   if( bValid ) {
															   var serialiseData = null;
																// Here "#FreezeTrainer" sub page form name 
																serialiseData = $(("#TraineeFreeze")).serialize();
																serialiseData = serialiseData + "&"+"programId="+checkedVal;
															$.ajax({url: "ProgramFreezePMTLevel.action", 
																	data : serialiseData,
																	cahce : true,
															        success: function(data)
																       {
																 jAlert("Trainee nominations Freezed sucessfully","Information");     
																 $("#TrainingSearchTBL").trigger("reloadGrid");
																 $('.ui-dialog-titlebar-close').trigger('click');
							                             	     $(this).dialog("close"); 
							                                    },
																     error:function(data){
																	 jAlert("Error :: "+data.message);
																	     }    
															        
									                                  });
																	  
																	 }
				                                    	    	  },
				                                    	    	  Close: function() {
				                                    					$(this).dialog('close');
				                                    					$("#FreezeTrainee_details").val="";
				                                    	    	 	  }
				                                    				},
				                                    			 close: function() {
				                                    					$("#FreezeTrainee_details").val=""; 
				                                                	}          
				                                    	       }); 

		                                             $.ajax({url: "TraineeFreeze.action",
					                                                 data : "programId="+checkedVal+"&traineesAllocationFlag="+traineeAllocation,
					                                                 cahce : true,
					                                                 success: function(data){
				                                    				 var count = 0;			        	       
					                                                 $('#FreezeTrainee_details').html(data);
					                                                 },
					                                    	         error:function(data){
					                                    	         jAlert("Error :: "+data.message);
					                                    	       }            
					                                    		});     
					                                    	}else{
																jAlert("Please select a record to freeze trainee nominations");
					                                    	}}			    	 	
							        }, // bindings end
		                                   
							       onContextMenu: function(event) {

							             var myGrid = $('#TrainingSearchTBL');
									     var selRowId = myGrid.jqGrid ('getGridParam', 'selrow');
			                             var Cancelstatus = myGrid.jqGrid ('getCell', selRowId, 'status.statusCode');
			                             var TrainerFreeze = myGrid.jqGrid ('getCell', selRowId, 'status.statusCode');
			                             var TraineeFreeze = myGrid.jqGrid ('getCell', selRowId, 'status.statusCode');
			                             var celProgramEndDate = myGrid.jqGrid ('getCell', selRowId, 'programEndDate');
	                                     var curdate = $.datepicker.formatDate('yy-mm-dd', new Date());
			                         	 //alert("status"+status);
	                                     // Cancel Program Status
	                                     if(Cancelstatus == '<%=OTSConstants.PROGRAM_CANCEL %>' || 
	                                    	Cancelstatus == '<%=OTSConstants.PROGRAM_COMPLETED %>' ||
	                                    	celProgramEndDate < curdate ) 
		                                    {  
	                                    	  // $('#CancelTrainer').unbind('click', cancelProgramDialog); 
	                                       	   $('#CancelProgram').attr('disabled','disabled').addClass('ui-state-disabled');
                                      		 }
                                          else 
        							  	 	 {
                                        	  // $('#CancelProgram').bind('click', cancelProgramDialog);
                                        	   $('#CancelProgram').removeAttr('disabled').removeClass('ui-state-disabled');
                                             }
                                         
                                         // Trainer Freeze Status 
                                         if(TrainerFreeze != '<%=OTSConstants.TRAINER_NOMINNATION_IN_PROGRESS %>') 
	                                        {
			                            	  $('#FreezeTrainerNominations').attr('disabled','disabled').addClass('ui-state-disabled');
                                   		    }
                                          else
	     							  	 	{
	                                     	  $('#FreezeTrainerNominations').removeAttr('disabled').removeClass('ui-state-disabled');
	                                        }

                                       // Trainee Freeze Status 
                                         if(TraineeFreeze != '<%=OTSConstants.TRAINEE_NOMINNATION_IN_PROGRESS %>') 
                                            {
			                            	  $('#FreezeTraineeNominations').attr('disabled','disabled').addClass('ui-state-disabled');
                                   		    }
                                          else
	     							  	 	{
	                                     	  $('#FreezeTraineeNominations').removeAttr('disabled').removeClass('ui-state-disabled');
	                                        }
	                                        
                                          			  	 		
							            return true;
							         }
							   
		                  });

				   	$('#TrainingSearchTBL').jqGrid('filterToolbar', { 
					   	searchOnEnter : true, 
					   	enableClear : false,	
					   	beforeSearch : function(value) 
					   	{
					     $("#TrainingSearchTBL").jqGrid('setGridParam', { url : "listprogramMainteance?filters=" });
			            }
				  	}); 
				}
			});
	
	$("#TrainingSearchTBL").jqGrid(
			'navGrid',
			'#TrSeatchTBLPageDiv',
			{ edit : false, add : false, del : false, search : true, view : false,refresh:true }, //options
			{ height : 200, reloadAfterSubmit : true, closeAfterEdit : true, closeOnEscape : true, caption : "Add" }, // edit options
    		{ height : 200, reloadAfterSubmit : true, closeAfterAdd : true, closeOnEscape : true, onClickButton : function() {
				//alert("Adding Row");
				}
    		}, // add options
			{ // now define settings for Delete dialog      
				mtype : "POST",
				reloadAfterSubmit : true,
				onclickSubmit : function(rp_ge, postdata) {
					//alert(postdata);
					rp_ge.url = "deleteprogramMainteance?programId="
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
				$("#gs_status.statusDesc").val("");
				$("#gs_status.statusCode").val("");
				$("#gs_cancelRemarks").val("");
				$("#gs_trainingMode").val("");
				$("#gs_numOfTrainees").val("");
				$("#gs_numOfTraineesBackup").val("");
				$("#gs_primaryTrainer").val("");
				$("#gs_backupTrainer").val("");
				$("#gs_noExamSchedules").val("");
                $("#gs_isrmapproval").val("");
                $("#gs_attendanceEligibility").val(0);
				$("#gs_trainerDistributionDept").val("");
				$("#gs_trainerDistributionRole").val("");
				$("#gs_traineeDistributionDept").val("");
				$("#gs_traineeDistributionRole").val("");
                $("#gs_updateUser").val("");
                $("#gs_traineesAllocationFlag").val("");                
				$("#TrainingSearchTBL").jqGrid('setGridParam', { url : "listprogramMainteance" });
			},

			//reloadAfterSearch : true },// search options
			// { closeOnEscape : true 

		  // });

			reloadAfterSearch : true },// search options
			{ closeOnEscape : true }).jqGrid('navButtonAdd',"#TrSeatchTBLPageDiv",
					{
				title:"View",
				buttonicon : "ui-icon ui-icon-document",
				position: "first", 
				caption : "",
				onClickButton : function(){
						if(checkedVal != "" && checkedVal != null){
							$("#gs_programId").val(checkedVal);
							$("#gs_attendanceEligibility").val(0);
							$("#gs_noExamSchedules").val(0);
							$("#programDeatilsForm").attr("action", "viewProgramDetails");
							$("#programDeatilsForm").submit();
							
						}else{
							jAlert("Please, select row", "Warning"); 
						}
					}
			     }).jqGrid('navButtonAdd',"#TrSeatchTBLPageDiv",
				{
				title:"Edit",
				buttonicon : "ui-icon ui-icon-pencil",
				position: "first", 
				caption : "",
				onClickButton : function(){
			    	 if(checkedVal != "" && checkedVal != null){
							$("#gs_programId").val(checkedVal);
							$("#gs_attendanceEligibility").val(0);
							$("#gs_noExamSchedules").val(0);
							$("#programDeatilsForm").attr("action", "editProgramDetails");
							$("#programDeatilsForm").submit();
							
						}else{
							jAlert("Please, select row", "Warning");
						}
					}
			     }).jqGrid('navButtonAdd',"#TrSeatchTBLPageDiv",
				{
				title:"Add",
				buttonicon : "ui-icon ui-icon-plus",
				position: "first", 
				caption : "",
				onClickButton : function(){
					$("#programDeatilsForm").attr("action", "SearchProgramAddAction");
					$("#programDeatilsForm").submit();

					}
		     });
             
         
   });
</SCRIPT>
<body>
<form id="programDeatilsForm" action="">
<div align="center" width="100%" >
<br>
<div id="heading" class="title" align="left">Training Search</div>
<br>
<table id="TrainingSearchTBL" width="100%"></table>
<div id="TrSeatchTBLPageDiv"></div>

<div class="contextMenu" id="myMenu1" style="display:none">
    <ul style="width: 100px">
        <li id="FreezeTrainerNominations">
           <span class="ui-icon ui-icon-plus" style="float:left"></span>
           <span style="font-size:11px; font-family:Verdana">Freeze Trainer Nominations</span>
        </li>
        
        <li id="FreezeTraineeNominations">
           <span class="ui-icon ui-icon-plus" style="float:left"></span>
           <span style="font-size:11px; font-family:Verdana">Freeze Trainee Nominations</span>
        </li>
        
        <li id="CancelProgram"> 
            <span class="ui-icon ui-icon-trash" style="float:left"></span>
            <span style="font-size:11px; font-family:Verdana">Cancel Program</span>
        </li>
       <!-- <li id="UpdateStatus">
            <span class="ui-icon ui-icon-trash" style="float:left"></span>
            <span style="font-size:11px; font-family:Verdana">Update Program Status</span>
        </li> -->
    </ul>
</div>
</div>
<!-- All Dialog Titles  -->
 <div id="viewFreezeTrainer_details" title="Freeze Trainer Nomination Details" style="display:none;"></div>
 <div id="FreezeTrainee_details" title="Freeze Trainee Nomination Details" style="display:none;"></div> 
 <div id="Cancel_details" title="Cancel Program Details" style="display:none;"> </div> 
 <!-- <div id="Status_details" title="Status Update Details" style="display:none;"> </div> -->
<br>
<input type="hidden" id="programIdHid" value="">
</form>
</body>
</html>