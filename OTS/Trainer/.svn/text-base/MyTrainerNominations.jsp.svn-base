<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.vit.action.ots.program.programMainteance" %>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>

<%@page import="com.vit.ots.utils.OTSConstants"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@include file="../CommonJSs.jsp" %>
<SCRIPT type="text/javascript">
var checkedVal;
var  setId;
var  freezeStatus;
var recordCount;
var programId;
$(document).ready(function(){
	var trainingstartdate = $("#trainingstartdate").val();
	var trainingstartdateformat=Date.parse(trainingstartdate.toString('d-MM-yy'));
	var trainingenddate = $("#trainingenddate").val();
	var trainingenddateformat=Date.parse(trainingenddate.toString('d-MM-yy'));

	function cancelRemarksDialog(){
	      $("#Cancel_details").dialog({			    	 	
  		   height: 250, 
  		   width: 300, 
  		   model :true,	        
            buttons: {
                    "Submit": function() {
	                   var bValid = true;
	                   if( bValid ) {
							   var serialiseData = null;
								// Here cancel remarks
							   var cremarks=$("#cancelremarks").val();
							  // alert("cremarks=============="+cremarks);
							   if (cremarks == " "  || cremarks =="null"){
                             	jAlert("Please enter cancel reamarks","Information");
                             }else{
								serialiseData = $(("#Trainer_cancel_form")).serialize();
								serialiseData = serialiseData + "&"+"id="+checkedVal;
								$.ajax({		             
                                   url: "CancelMyTrainer.action?&id="+checkedVal,
                                   data:serialiseData,
                                   cache : false,
                                   success: function(data){
                                   jAlert("Success of cancel trainer sucessfully","Information");
                                   $("#MyNominationTrainerTBL").trigger("reloadGrid"); 
                                   $('.ui-dialog-titlebar-close').trigger('click');
                      	            $(this).dialog("close");
                                   },
                      	         error:function(data){
                      	         alert("Error :: "+data);
                  	       	}});
                             }
							 }
      	    	  },
      			 "Cancel": function() {
      	    		   $('.ui-dialog-titlebar-close').trigger('click');
          	           $(this).dialog("close");
      	    	 	}
  				}      
			}); 
     
     		//for jsp
  		 $.ajax({url: "CancelTrainer.action?programId="+programId,
                   data : "id="+checkedVal,
                   cahce : true,
                   success: function(data){
  				 var count = 0;			        	       
                   $('#Cancel_details').html(data);
                   },
      	         error:function(data){
      	         alert("Error :: "+data.message);
      	       }            
      		});  
		
	}

	function QuestionSetDialog(){

		$("#Question_sets").dialog({			    	 	
  		   height: 360, 
  		   width: 600, 
  		   model :true,	        
           buttons: {
                   	"Save": function() {
         	   		 	   var freezflag= $("#freezeQuestion").val();
                           if(freezflag=="FQ"){
                         	 	jAlert("Question set already freezed for this program","Information");
                         	    return false;
                           }
                		   var myGrid = $('#MyNominationTrainerTBL');
                           var selRowId = myGrid.jqGrid ('getGridParam', 'selrow');
                           var celValue = myGrid.jqGrid ('getCell', selRowId, 'programMainteanceTrainer.programId');
                           var trainerStatus = myGrid.jqGrid ('getCell', selRowId, 'statusForTrainer.statusCode');
						   var serialiseData = null;
						   var QuestionSetTrainersaveform = $('#Trainer_Question_Set_form');
						   var disabled = QuestionSetTrainersaveform.find(':input:disabled').removeAttr('disabled');
                            // serialize the form
                           var serialized = QuestionSetTrainersaveform.serialize();
                           // re-disabled the set of inputs that you previously enabled
                           disabled.attr('disabled','disabled');
						   serialiseData = serialized + "&"+"programId="+celValue;
							$.ajax({		             
                                     url: "SaveQuestionSetByTrainerInProgram.action?&id="+checkedVal,
                                     data:serialiseData,
                                     cache : false,
                                     success: function(data){
                                     jAlert("Saved questionset successfully","Information");
                                     $("#MyNominationTrainerTBL").trigger("reloadGrid"); 
                                     $('.ui-dialog-titlebar-close').trigger('click');
                         	         $(this).dialog("close");
                                     },
                        	         error:function(data){
                        	         alert("Error :: "+data);
                    	       }});
              	     },
          	    	 "Freeze": function() {
                              var freezflag= $("#freezeQuestion").val();
                             // alert("freezflag==>" + freezflag);
                              if(freezflag=="FQ"){
                             	 jAlert("Question set already freezed for this program","Information");
                             	 return false;
                              }
                              //bhargavi written this for freeze also save the setId
                              var QuestionSetTrainersaveform = $('#Trainer_Question_Set_form');
							  var disabled = QuestionSetTrainersaveform.find(':input:disabled').removeAttr('disabled');
		                            // serialize the form
		                      var serialized = QuestionSetTrainersaveform.serialize();
		                           // re-disabled the set of inputs that you previously enabled
		                      disabled.attr('disabled','disabled');
							  serialiseData = serialized;
							  alert(serialized);
               	    	 	  $.ajax({		             
                                       url: 'FreezeQuestionSet.action?programId='+programId,
                                       data:serialiseData,
                                       cache : false,
                                       success: function(data){
	                                          jAlert("question paper  freezed successfully","Information");
	                                          $("#MyNominationTrainerTBL").trigger("reloadGrid"); 
	                                          $('.ui-dialog-titlebar-close').trigger('click');
	                             	          $(this).dialog("close");
                                       },
	                       	          	error:function(data){
	                       	         	alert("Error :: "+data);
                                       }
                               });
                               return false;//without this control goes to the previous action(ie.,FreezeQuestionSet)
     	    	 	           },
              			 "Cancel": function() {
                  	            $(this).dialog("close");
              	    	 	  }
  				   }      
  	       }); 
	  		 $.ajax({url: "TrainerQuestionSet.action?programId="+programId+'&setId='+setId+'&freezeQuestionSet='+freezeStatus,
	                   data : "qsets="+checkedVal,
	                   cahce : true,
	                   success: function(data){
	                   $('#Question_sets').html(data);
	                   },
	      	         error:function(data){
	      	         alert("Error :: "+data.message);
	      	       }            
	      		});  

	}
	function TakeAttendenceDialog(){


        var myGrid = $('#MyNominationTrainerTBL');
           var selRowId = myGrid.jqGrid ('getGridParam', 'selrow');
          programId = myGrid.jqGrid ('getCell', selRowId, 'programMainteanceTrainer.programId');
           //alert("programId========="+programId);
           $("#programIdReq").attr("value",programId);
           var serialiseData = null;
           serialiseData = "programId="+programId;
       $("#Take_Attendance").dialog({			    	 	
		   height: 450, 
		   width: 600, 
		   model :true,	        
       buttons: {
           "Save": function() {
	    	    recordCount= $("#TraineeDetailsForSpecificProgramTBL").jqGrid('getGridParam', 'records');
	    	    var TakeAttendancebasedOnDatepicking=$("#TakeAttendancebasedOnDatepicking").val();
			    if (TakeAttendancebasedOnDatepicking==""){
		            jAlert("Please select date to proceed","Information");
		            return false;
	            }else if(recordCount==0){
	                jAlert("Sorry you don't have any records to save","Information");
	            }else{
		            	 //here write code
		                 var freezflag= $("#freezeAttendanceFlag").val();
		               //  alert("freezflag--------"+freezflag);
		                 if(freezflag=='<%=OTSConstants.OTS_TRAINER_FREEZ_ATTANDACE%>'){
		                	 jAlert("Changes are not allowed after freeze","Information");
		                	 return false;
		                 }
		                 //
		                var resourcePermit = {};
						var assign={};
						var count;
						var i;
		            	var rowIDs = $("#TraineeDetailsForSpecificProgramTBL").jqGrid('getDataIDs');
		            	for (i = 0, count = rowIDs.length; i < count; i += 1) {
		            		var rowData =  $("#TraineeDetailsForSpecificProgramTBL").jqGrid('getRowData',rowIDs[i]);
		            		var resourceId =  rowIDs[i];
		            		var isAssigned= $('#'+ resourceId+'_isattended').val();
		            		var comments= $('#'+ resourceId+'_comments').val(); 
		            		resourcePermit[resourceId] =isAssigned;
		            		assign[resourceId] =comments;
		            	}
		            	var  assignStr = JSON.stringify(assign);
		            	var  resPermit = JSON.stringify(resourcePermit);
						$.ajax({		             
				                  url: "SaveAttendance.action?resourcePermit="+resPermit+"&assign="+assignStr,
				                  cache : false,
				                  success: function(data){
					                  jAlert("Save attendance successfully","Information");
					                  $("#MyNominationTrainerTBL").trigger("reloadGrid");
					                  $('.ui-dialog-titlebar-close').trigger('click');
					     	          $(this).dialog("close");
				                  },
				     	         error:function(data){
				     	         alert("Error :: "+data);
			     	       }});
		          }
 	    	  },
 	    	 "Freeze": function() {
	 	    		recordCount= $("#TraineeDetailsForSpecificProgramTBL").jqGrid('getGridParam', 'records');
	 	    		if(recordCount==0){
	                    jAlert("Sorry you don't have any records to Freeze","Information");
	                    return false;
	                 }
	 	    		 var freezflag= $("#freezeAttendanceFlag").val();
	                 if(freezflag=="FA"){
	                	 jAlert("Attendance already freezed","Information");
	                	   return false;
	                 }
	 	    		var trainingenddate1 = $("#trainingenddate1").val();
	 	    		var today = new Date();
	 	    		var todayDateInFlow = new Date(today.getFullYear()+"/"+(today.getMonth()+1)+"/"+today.getDate());
	 	    		var x=trainingenddate1.split('-');
	 	    		var prgEndDate = new Date(x[0]+"/"+x[1]+"/"+x[2]);
	 	    		if(trainingenddate1 > prgEndDate){
	 	    			jAlert("Freezing not allowed before training completion date","Information");
	 	    						return false;								
	 	    		   }
	 	    		else{
	     	    		$.ajax({		             
	                          url: 'FreezeAttendance.action?programId='+programId,
	                          //data:serialiseData,
	                          cache : false,
	                          success: function(data){
	                          jAlert("Attendance  freezed successfully","Information");
	                          $('.ui-dialog-titlebar-close').trigger('click');
	             	            $(this).dialog("close");
	                          },
	             	         error:function(data){
	             	         alert("Error :: "+data);
	              	       }});
	 	    	        }
     	     },
 			 "Cancel": function() {
	 	             $('.ui-dialog-titlebar-close').trigger('click');
	 	            $(this).dialog("close");
 	    	 }
		} //buttons     
	}); //dialog
        $.ajax({url: "TrainerTakeAttendance.action?programId="+programId,
        		//data : "programId="+programId,
	          cahce : true,
	          success: function(data){
	          $('#Take_Attendance').html(data);
	          },
		         error:function(data){
		         alert("Error :: "+data.message);
		       }            
		});//ajax    


	}
	function AttendenceEligibilityDialog(){


              $("#TakeEligibility_Attendance").dialog({
             height: 450, 
        	  width: 600, 
   		   model :true,	        
    	        buttons: {
  	          "Save": function() {
           	   recordCount= $("#TraineeDetailsForSpecificProgramTBLAttendanceEligibility").jqGrid('getGridParam', 'records');
   	    		if(recordCount==0){
                      jAlert("Sorry you don't have any records to save","Information");
                      return false;
                      }
           	   var freezflag= $("#freezeAttendacenElgFlag").val();
           	  // alert(freezflag);
                    if(freezflag=="FE"){
                   	 jAlert("Changes are not allowed after freeze","Information");
                   	   return false;
                    }
           	    var TakeAttendancebasedOnDatepicking=$("#TakeAttendancebasedOnDatepicking").val();
                       var resourcePermit = {};
						var assign={};
						var count;
						var i;
                   	var rowIDs = $("#TraineeDetailsForSpecificProgramTBLAttendanceEligibility").jqGrid('getDataIDs');
                   	for (i = 0, count = rowIDs.length; i < count; i += 1) {
                   		var rowData =  $("#TraineeDetailsForSpecificProgramTBLAttendanceEligibility").jqGrid('getRowData',rowIDs[i]);
                   		var resourceId =  rowIDs[i];
                   		var iseligible= $('#'+ resourceId+'_iseligible').val();
                   		var comments= $('#'+ resourceId+'_comments').val(); 
                   		  resourcePermit[resourceId] =iseligible;
                   		  assign[resourceId] =comments;
                   	}
                   	var  assignStr = JSON.stringify(assign);
                   	var  resPermit = JSON.stringify(resourcePermit);
					$.ajax({		             
                         url: "SaveAttendanceEligibility.action?resourcePermit="+resPermit+"&assign="+assignStr+"&programId="+programId,
                         cache : false,
                         success: function(data){
                         jAlert("Saved attendanceeligibility successfully","Inforamation");
                         $("#MyNominationTrainerTBL").trigger("reloadGrid");
                         $('.ui-dialog-titlebar-close').trigger('click');
            	            $(this).dialog("close");
                         },
            	         error:function(data){
            	         alert("Error :: "+data);
            	       }
                	       });
					return false;//without this control goes to the previous action(ie.,SaveAttendance)
        	    	  },
  	    	 "Freeze": function() {
        	    		  recordCount= $("#TraineeDetailsForSpecificProgramTBLAttendanceEligibility").jqGrid('getGridParam', 'records');
         	    		if(recordCount==0){
                            jAlert("Sorry you don't have any records to Freeze","Information");
                            return false;
                            }
        	    		 var freezflag= $("#freezeAttendacenElgFlag").val();
                          if(freezflag=="FE"){
                         	 jAlert("Changes are not allowed after freeze","Information");
                         	   return false;
                          }
        	    	$.ajax({		             
                             url: 'freezeEligibility.action?programId='+programId,
                             //data:serialiseData,
                             cache : false,
                             success: function(data){
                         jAlert("Saved successfully","Information");
                         $('.ui-dialog-titlebar-close').trigger('click');
            	            $(this).dialog("close");
                             },
                	         error:function(data){
                	         alert("Error :: "+data);
                	       }});
        	    	 	  },
      			 "Cancel": function() {
      	            $('.ui-dialog-titlebar-close').trigger('click');
      	            $(this).dialog("close");
      	    	 	  }
				      }
    	           }); 
               $.ajax({url: "TrainerAttendanceEligibility.action?programId="+programId,
	                //data : "programId="+programId,
	                  cahce : true,
                     success: function(data){
                     $('#TakeEligibility_Attendance').html(data);
                     },
        	         error:function(data){
        	         alert("Error :: "+data.message);
        	       }            
        		});//ajax    
        	  


	}
function reload(result) {
    $("#MyNominationTrainerTBL").trigger("reloadGrid"); 
} 
	$("#MyNominationTrainerTBL").jqGrid({
		url : 'listMyTrainerNominate',
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
	     	 colNames : [ 'Id', 'Program Id','Training Dates','Trainer_Id','Trainer Status','Trainer Code','Program Status','Set Id','freezeQuestionSet','freezeAttendance','freezeEligibility','Cancel Remarks','updateTimestamp','TrainerEnd Date'],
				colModel : [ { name : 'id',index : 'id', align : "center", editable : false,key : true,hidden:true},
			                 { name : 'programMainteanceTrainer.programId',index : 'programMainteanceTrainer.programId', align : "center", editable : false,key : true },
							 { name : 'trainingDates',index : 'trainingDates', align : "center"},
							 { name : 'empmasterTrainer.empId',index : 'empmasterTrainer.empId', align : "center",hidden : true},
							 { name : 'statusForTrainer.statusDesc',index : 'statusForTrainer.statusDesc', align : "center"},
							 { name : 'statusForTrainer.statusCode',index : 'statusForTrainer.statusCode', align : "center",hidden:true,sortable:false,search:false},
							 //{ name : 'trainerStatus',index : 'trainerStatus', align : "center"},
							 { name : 'programMainteanceTrainer.status.statusDesc',index : 'programMainteanceTrainer.status.statusDesc', align : "center", editable : false},  
							 { name : 'programMainteanceTrainer.setId',index : 'programMainteanceTrainer.setId', align : "center", editable : false,hidden:true,searchoptions: { defaultValue:0 }},  
							 { name : 'freezeQuestionSet',index : 'freezeQuestionSet', align : "center", editable : false,hidden:true},
							 { name : 'freezeAttendance',index : 'freezeAttendance', align : "center", editable : false,hidden:true}, 
							 { name : 'freezeEligibility',index : 'freezeEligibility', align : "center", editable : false,hidden:true},     
							 { name : 'cancelRemarks',index : 'cancelRemarks', align : "center", editable : false,hidden:true},
							 { name : 'updateTimestamp',index : 'updateTimestamp', align : "center", editable : true,hidden:true},
							 { name : 'programMainteanceTrainer.trainerNomEndDate',index : 'programMainteanceTrainer.trainerNomEndDate', align : "center",hidden:true}
							 ],
						    rowNum : 15,
							rowList : [ 15, 20, 30 ],
							pager : '#MyNominationTrainerTBLPageDiv',
							loadatonce : false,
							viewrecords : true,
							mtype : "GET",
							gridview : true,
							sortname : 'id',
							sortorder : "asc",
							caption : "Toolbar Searching",
							sortorder : "desc",
							caption : "My Nominations",
							toolbar:[true,"top"],
							height: 255,
							width : 1000,
							onSelectRow: function(id){
			                    checkedVal = id;
			                    //alert(checkedVal);
			                    var myGrid = $('#MyNominationTrainerTBL');
	                            var selRowId = myGrid.jqGrid ('getGridParam', 'selrow');
	                            programId = myGrid.jqGrid ('getCell', selRowId, 'programMainteanceTrainer.programId');
	                            setId = myGrid.jqGrid ('getCell', selRowId, 'programMainteanceTrainer.setId');
	                            freezeStatus=myGrid.jqGrid ('getCell', selRowId, 'freezeQuestionSet');
	                           	
	                  		},
							// Context Menu Loading Details....
							loadComplete: function() {
					    		 $("tr.jqgrow", this).contextMenu('myMenu1', {
								        bindings: { 
					    		      'CancelTrainer': function(trigger) {
						    			 if(checkedVal != null && checkedVal !=""){
							    		      var myGrid = $('#MyNominationTrainerTBL');
		                                      var selRowId = myGrid.jqGrid ('getGridParam', 'selrow');
		                                   	  var celValue = myGrid.jqGrid ('getCell', selRowId, 'statusForTrainer.statusCode');
		                                      var celTrainerEndDate = myGrid.jqGrid ('getCell', selRowId, 'programMainteanceTrainer.trainerNomEndDate');
		                                      var cancelRemarks = myGrid.jqGrid ('getCell', selRowId, 'cancelRemarks');
		                                      cancelRemarksDialog;					
			                             }else if(checkedVal == 0){
			                            	 jAlert("Please,select row","Warning");
				                             return false;
			                             }
                                 	},
                                  //end cancel trainer
                                 	//set question set
                                  'QuestionSet': function(trigger) {
	                                 	if(checkedVal != null && checkedVal !=""){
	                                 			QuestionSetDialog;
	                                     }else{
	                                    	 jAlert("Please,select row","Warning");
	                                     }   
                                    },
                                 	//end question set
                                 	//Take Attendence start 
                                  'TakeAttendance': function(trigger) {
                                        if(checkedVal != null && checkedVal !=""){
                                        	TakeAttendenceDialog;
                                        }else{
                                            jAlert("Please select a record to take attendance","Information");
                                     	}  
                                 	},
                                 	//Take Attendence start end

                                 	//view Attendance start 
                                  'AttendanceEligibility': function(trigger) {
                                        if(checkedVal != null && checkedVal !=""){
                                        	AttendenceEligibilityDialog;
                                        }else{
                                            jAlert("Please select a record to take eligibility","Information");
                                     	}  
                                 	}
                                 	//view Attendance end
					 			  },
					 			 onContextMenu: function (event) {
							 			var myGrid = $('#MyNominationTrainerTBL');
					    			    var selRowId = myGrid.jqGrid ('getGridParam', 'selrow');
					    			    var trainerStatus = myGrid.jqGrid ('getCell', selRowId, 'statusForTrainer.statusCode');
					    			    var programId= myGrid.jqGrid ('getCell', selRowId, 'programMainteanceTrainer.programId');
					    			    var celTrainerEndDate = myGrid.jqGrid ('getCell', selRowId, 'programMainteanceTrainer.trainerNomEndDate');
					    			    var curdate = $.datepicker.formatDate('dd-mm-yy', new Date());
	                                    var freezeAttendance= myGrid.jqGrid ('getCell', selRowId, 'freezeAttendance');
	                                	$('#CancelTrainer').unbind('click', cancelRemarksDialog);
                                     	$('#CancelTrainer').attr('disabled','disabled').addClass('ui-state-disabled');
                                     	$('#QuestionSet').attr('disabled','disabled').addClass('ui-state-disabled');
					              		$('#TakeAttendance').attr('disabled','disabled').addClass('ui-state-disabled');
					              		$('#AttendanceEligibility').attr('disabled','disabled').addClass('ui-state-disabled');
					              		$('#QuestionSet').unbind('click', QuestionSetDialog);
					              		$('#TakeAttendance').unbind('click', TakeAttendenceDialog);
					              		$('#AttendanceEligibility').unbind('click', AttendenceEligibilityDialog);
                                     	if(trainerStatus == '<%=OTSConstants.TRAINER_NOMINNATION_LTP%>' ){
	                                     		$('#CancelTrainer').bind('click', cancelRemarksDialog);
	                                   		 	$('#CancelTrainer').removeAttr('disabled').removeClass('ui-state-disabled');
                                     	}
                                     	if(trainerStatus == '<%=OTSConstants.SETTING_QUESTION_PAPER_PENDING%>' ){
                                     		$('#QuestionSet').bind('click', QuestionSetDialog);
                                   		 	$('#QuestionSet').removeAttr('disabled').removeClass('ui-state-disabled');
                                   		 	$('#TakeAttendance').bind('click', TakeAttendenceDialog);
                                   		 	$('#TakeAttendance').removeAttr('disabled').removeClass('ui-state-disabled');
                                 		}
                                     	if(trainerStatus == '<%=OTSConstants.ATTENDENCE_PENDING%>' ){
                                   		 	$('#TakeAttendance').bind('click', TakeAttendenceDialog);
                                   		 	$('#TakeAttendance').removeAttr('disabled').removeClass('ui-state-disabled');
                                 		}
                                     	if(trainerStatus == '<%=OTSConstants.ATTENDENCE_ELIGIBILTY_FREEZE_PENDING%>' ){
                                   		 	$('#AttendanceEligibility').bind('click', AttendenceEligibilityDialog);
                                   		 	$('#AttendanceEligibility').removeAttr('disabled').removeClass('ui-state-disabled');
                                 		}
					    			
   							  	 		
                        	    	   return true;
                        	    	   
                                   	}
				              });
	     	}//ContextMenu
							
	});

	$('#MyNominationTrainerTBL').jqGrid('filterToolbar', {
			searchOnEnter : true,
			enableClear : false,
			beforeSearch : function(value) {
				$("#MyNominationTrainerTBL").jqGrid('setGridParam', {
					url : "listMyTrainerNominate?filters="
				});
			}
		});

	$("#MyNominationTrainerTBL").jqGrid(
			'navGrid',
			'#MyNominationTrainerTBLPageDiv',
			{
				edit : false,
				add : false,
				del : false,
				search : true,
				view : true
			}, //options
			   {
				reloadAfterSubmit : true,
				closeAfterEdit : true,
				closeOnEscape : true
				}, // edit options
				{
					reloadAfterSubmit : true,
					closeAfterAdd : true,
					closeOnEscape : true
				},  //add options
				{
					
				},  //del options
				{
					multipleSearch : true,
					closeOnEscape : true,
					groupOps : [ {op : "AND", text : "AND" },
								 {op : "OR", text : "OR" } ],
					matchText : "Find",
					rulesText : " matches",
					sopt : [ 'cn', 'bw', 'eq', 'ne', 'lt', 'le', 'gt', 'ge', 'ew' ],
					reloadAfterSearch : true,
					closeAfterSearch:true,
					onSearch : function(params,postdata) {
						//alterations would be here
						$("#gs_programMainteanceTrainer.programId").val("");
   						$("#gs_trainerproposedStartDate").val("");
   						$("#gs_trainerproposedEndDate").val("");
   						$("#gs_empmasterTrainer.empId").val("");
   						$("#gs_trainerStatus").val("");
   						$("#gs_cancelRemarks").val("");
						$("#MyNominationTrainerTBL")
								.jqGrid('setGridParam',
										{ url : "listMyTrainerNominate" });
					}
				},
			
				{
						closeOnEscape : true,
						beforeShowForm : function(MyNominationTrainerTBL) {
								$(".navButton").hide();
				}
				});
					

		  
});
</SCRIPT>

<body>
<form id="MyTrainerNominations">
<input type="hidden" id="programIdReq"  name="programIdReq" />
<div align="center" width="100">
<br>
<div id="heading" class="title" align="left">Trainer</div>
<br>
<table id="MyNominationTrainerTBL" width="100%"></table>
<div id="MyNominationTrainerTBLPageDiv"></div>

<div class="contextMenu" id="myMenu1" style="display:none">
<ul style="width: 100px">

<li id="CancelTrainer">
<span class="ui-icon ui-icon-trash" style="float:left"></span>
<span style="font-size:11px; font-family:Verdana">Cancel Nominate</span>
</li>

<li id="QuestionSet">
<span class="ui-icon ui-icon-plus" style="float:left"></span>
<span style="font-size:11px; font-family:Verdana">Prepare Question Paper</span>
</li>

<li id="TakeAttendance">
<span class="ui-icon ui-icon-plus" style="float:left"></span>
<span style="font-size:11px; font-family:Verdana">Take/View Attendance</span>
</li>

<li id="AttendanceEligibility">
<span class="ui-icon ui-icon-document" style="float:left"></span>
<span style="font-size:11px; font-family:Verdana">Attendance Eligibility</span>
</li>

</ul>
</div>
</div>
<!-- All Dialog Titles  -->
<div id="trainer_details" title="Trainer DETAILS" style="display:none;"> </div> 
<div id="Cancel_details" title="Cancel Trainer Nomination Details" style="display:none;"></div> 
<div id="Question_sets" title="Question sets" style="display:none;"></div> 
<div id="Take_Attendance" title="Attendance Maintainence" style="display:none;"></div> 
<div id="TakeEligibility_Attendance" title="AttendanceEligibility Details" style="display:none;"></div>
<s:hidden id="programId"  name="programId" key="programId"></s:hidden>
<s:hidden id="trainingstartdate"  name="trainingstartdate" key="trainingstartdate" ></s:hidden>
<s:hidden id="trainingenddate"  name="trainingenddate" key="trainingenddate" ></s:hidden>
</form>
</body>
</html>