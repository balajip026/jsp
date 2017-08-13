<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.vit.ots.utils.OTSSupport"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.vit.ots.utils.OTSConstants"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@include file="../CommonJSs.jsp" %>
<%
String empId=OTSSupport.getLoggedUserProfile().getEmpId();
%>
<input type="hidden" id="empId" name="empId" value="<%=empId%>">
<SCRIPT type="text/javascript">
var checkedVal;
$(document).ready(function(){
	function CancelNominationDialog(){

    	// Context Menu our Own Dialog Design 
	   		$( "#Cancel_details" ).dialog({			    	 	
			height: 300, width: 300, model :true,	        
	        buttons: {
     	        "Cancel Nomination": function() {
			   		 var cancelremarks=$("#cancelremarks").val();
		             if (cancelremarks == " "  || cancelremarks =="null"){
		             jAlert("enter cancel remarks","Information");
		             }else{
		            	 jAlert("Please select a record to cancel program");
		             }
		   			$.ajax({		             
	                      url: "cancelnomtrainee.action?&id="+checkedVal,
	                      data:$(("#canceldetails")).serialize(),
	                      cahce : false,
	                      success: function(data){
			   				jAlert("Program Has Been Cancelled","Information");
			   			 	$('.ui-dialog-titlebar-close').trigger('click');
			   				$(this).dialog('close');
			   				$("#MyNominationTBL").trigger("reloadGrid");
	                      	},
	         	         error:function(data){
	         	         	jAlert("Error :: "+data);
	         	       		}
		         	  });
	   			
	    	 		},
				"Close": function() {
						$(this).dialog('close');
						$("#Cancel_details").val="";
		           	}
				}
	        });
    	 $.ajax({ 		             
             url: "canceltraineedetails.action",
             data : "id="+checkedVal,
             cahce : false,
             success: function(data){
			   /*for(var key in data) {
                 alert(key);
             }*/
             $('#Cancel_details').html(data);
             },
	         error:function(data){
	         jAlert("Error :: "+data.message);
	       }            
	});     
		

	}
	function FeedbackForTrainer(){

		  $( "#feedback_trainers" ).dialog({			    	 	
   			height: 'auto', width: 'auto', model :true, autowidth: true,
   			position:[113, 0],		                             					                             			
   	        buttons: {
  	    	 "Save" : function(){
	  	    	    var bValid = true;
	  	    	    var status = $("#status").val();
	  		 		if(status == "Trainee Feedback Completed" )
	  		 			bValid=false;
	  		 		if(!bValid){
	          	    	 jAlert("You have submited Feedback Already ","Information");
	  		 		}else{
							  var serialiseData = null;
							  // Here "#FreezeTrainer" sub page form name 
							  serialiseData = $("#feedbackdetails").serialize();
							  serialiseData = serialiseData+"&"+"programId="+programId;
					  		  $.ajax({ 		             
					                url: "feedbacksave.action",
					                data : serialiseData,
					                cahce : false,
					                async   : false,
					                success: function(data){
							  			  jAlert("Feedback Saved Sucessfully","Information");
							  			  $('.ui-dialog-titlebar-close').trigger('click');
							  			  $(this).dialog('close');
						                },
						   	         error:function(data){
						   	         	jAlert("Error :: "+data.message);
						   	       	 }            
					   		  });     
	  		 	 		 }	
    	  		},
				"Submit Feedback" : function(){
	    		        var bValid = true;
	    		  		var status = $("#status").val();
	    		 		if(status == "Trainee Feedback Completed" )
	    		 			bValid=false;
	    		 		if(!bValid){
	            	    	 jAlert("You have submited Feedback Already ","Information");
	    		 		}else{
					      var serialiseData = null;
						  serialiseData = $("#feedbackdetails").serialize();
						  serialiseData = serialiseData+"&"+"programId="+programId;
			    		  $.ajax({ 		             
			                  url: "feedbacksubmit.action",
			                  data : serialiseData,
			                  cahce : false,
			                  success: function(data){
				    			  jAlert("Feedback Submitted Sucessfully","Information");
				    			  $('.ui-dialog-titlebar-close').trigger('click');
				    			  $(this).dialog('close');
			                  },
			     	          error:function(data){
			     	         	jAlert("Error :: "+data.message);
			     	       	  }            
			     		});     
    	     		}	
    	  		},
    	  		"Close": function() {
					$(this).dialog('close');
					$("#feedback_trainers").val="";
          		}
    	  	}
    	  });
   	     $.ajax({		             
                url: "feedbackdetails.action",
                data : "programId="+programId,
                async   : false,
                cache:false,
                success: function(data){
	   	    	   $('#feedback_trainers').html(data);
	   	    		var status = $("#status").val();
	   		 		if(status == "Trainee Feedback Completed" ){
	   	    	   		$(".validcheck").each(function() {
	                    	$(this).attr('disabled',"disabled");
	                   	});
	                    $(".commenttext").each(function() {
	                        $(this).attr("disabled","disabled");
	                   	});
	   		 		 }
                },
   	         error:function(data){
   	         	jAlert("Error :: "+data.message);
   	       }            
   		}); 
				
	}
	function viewExamResult(){
		$( "#View_ExamResults" ).dialog({			    	 	
			   height: 225, 
			   width: 600, 
			   model :true,	        
               buttons: { "Close": function() {
					$(this).dialog('close');
					$("#View_ExamResults").val="";
           	     }
		   		}
        }); 
		   		
	 $.ajax({ url: "viewExamResult.action",
           data : "programIdReq="+celValue,
           cahce : false,
           success: function(data){
		     /*for(var key in data) {
             alert(key);
          }*/
          $('#View_ExamResults').html(data);
         },
         error:function(data){
         jAlert("Error :: "+data.message);
       }            
	 });     

	}
	$("#MyNominationTBL").jqGrid({
		url : 'listMyNomination',
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

		    colNames : [ 'ID','Program Id', 'Trainee User Id','Course Name', 'Program Status','Nomination Status','Reason For Cancel', 'Last Updated','TraineeNomEnd Date' ],
			colModel : [ { name : 'id',index : 'id', align : "center", editable : true, editoptions : {size : 20 },editrules : {custom : true},key : true, hidden : true },
			             { name : 'proMainteanceTrainee.programId',index : 'proMainteanceTrainee.programId', align : "center", editable : true, editoptions : {size : 20 },editrules : {custom : true},key : true, hidden : false },
		                 { name : 'empMaster.empId',index : 'empMaster.empId', align : "center", editable : true, editoptions : {size : 20 },editrules : {custom : true},key : true, hidden : true },
		                 { name : 'proMainteanceTrainee.courseName',index : 'proMainteanceTrainee.courseName', align : "center", editable : true, editoptions : {size : 20 },editrules : {custom : true},key : true, hidden : false },  
		                 { name : 'proMainteanceTrainee.status.statusDesc',index : 'proMainteanceTrainee.status.statusDesc', align : "center" },
						 { name : 'traineeStatus',index : 'traineeStatus', align : "center", editable : true, editoptions : {size : 20 },editrules : {custom : true},key : true,
		                	 formatter:function(cellvalue, options, rowObject){
				              if (cellvalue ==  '<%=OTSConstants.TRAINEE_NOMINNATION_COMPLETED%>' ) {
					              cellvalue="Trainee Nomination Completed";
							      } else if(cellvalue == '<%=OTSConstants.TRAINEE_NOMINNATION_CONFIRMED%>') {
				            		  cellvalue="Trainee Nomination Confirmed";
				              }		else if(cellvalue == '<%=OTSConstants.TRAINEE_NOMINNATION_CANCEL%>') {
				            		  cellvalue="Trainee Nomination Cancelled";
				              		}
						              else if(cellvalue == '<%=OTSConstants.TRAINEE_NOM_WAITING_LIST%>') {
					            		  cellvalue="Trainee Nomination In Waiting List";
					              }
						              else if(cellvalue == '<%=OTSConstants.RM_APPROVED%>') {
					            		  cellvalue="RM Approved";
					              		}
						              else if(cellvalue == '<%=OTSConstants.RM_APPROVAL_PENDING%>') {
					            		  cellvalue="RM Approval Pending";
					              }	
					              return cellvalue;  } },
						 { name : 'cancelRemarks',index : 'cancelRemarks', align : "center", editable : true, editoptions : {size : 20 }, editrules : {custom : true},key : true ,hidden : true },
						 { name : 'updateTimestamp',index : 'updateTimestamp', align : "center", editable : true, editoptions : {size : 20 },editrules : {custom : true},key : true, hidden : true },
						 { name : 'proMainteanceTrainee.traineeNomEndDate',index : 'proMainteanceTrainee.traineeNomEndDate', align : "center", editable : true, hidden : true },
						 ],

						    rowNum : 15,
							rowList : [ 15, 20, 30 ],
							pager : '#MyNominationTBLPageDiv',
							loadatonce : false,
							viewrecords : true,
							mtype : "GET",
							//rownumbers: true,
							gridview : true,
							sortname : 'proMainteanceTrainee.programId',
							sortorder : "asc",
							caption : "Toolbar Searching",
							sortorder : "desc",
							caption : "My Nominations",
							toolbar:[true,"top"],
							height: 255,
							width : 1000,
							onSelectRow: function(id){
    									checkedVal = id;
				 						},
				 			loadComplete: function() {
				 							var feedbackCountMap;
								    		 $("tr.jqgrow", this).contextMenu('myMenu1', {
											        bindings: {
								    			 'CancelNomination': function(trigger) {

								    			    var myGrid = $('#MyNominationTBL');
								    			    var selRowId = myGrid.jqGrid ('getGridParam', 'selrow');
								    			    var celValue = myGrid.jqGrid ('getCell', selRowId, 'traineeStatus');
								    			    var celTraineeEndDate = myGrid.jqGrid ('getCell', selRowId, 'proMainteanceTrainee.traineeNomEndDate');
								    			    var curdate = $.datepicker.formatDate('yy-mm-dd', new Date());
								             	 if(celValue=="Trainee Nomination Cancelled")
								    			 {	 
								    			 jAlert("Nomination Already Cancelled");
								    			 return false;
								    			 }else if(celValue=="Trainee Nominations Freezed"){
									    			  jAlert("Nomination has been Freezed, Cannot be cancelled");
								    			 		return false;
								    			 }else if(celTraineeEndDate < curdate ){
								    				 jAlert("Cancel due date is over. "+celTraineeEndDate,"Warning");
									    			 return false;
								    			 }else{

								    				 	CancelNominationDialog;
									    			  }

			                                    	// Context Menu our Own Dialog Design 
												 
			                             		
			                          },
								    		 'FeedbackForTrainers' : function(trigger) {
						                        	    var myGrid = $('#MyNominationTBL');
									    			    var selRowId = myGrid.jqGrid ('getGridParam', 'selrow');
									    			    var programId = myGrid.jqGrid ('getCell', selRowId, 'proMainteanceTrainee.programId');
									    			    FeedbackForTrainer;
	                          					} ,     
							
							 				// View Exam Result Page Start Here 
			                              'ViewExamResults': function(trigger) {
					                          
							    			    var myGrid = $('#MyNominationTBL');
							    			    var selRowId = myGrid.jqGrid ('getGridParam', 'selrow');
							    			    var celValue = myGrid.jqGrid ('getCell', selRowId, 'proMainteanceTrainee.programId');
							    			    viewExamResult;
							    		        // Context Menu our Own Dialog Design 
			                            		}
			                          },

		                            onContextMenu: function(event) {
									var rowId = $(event.target).parent("tr").attr("id");
				         		    var grid = $("#MyNominationTBL");
				           			grid.setSelection(rowId);
									var myGrid = $('#MyNominationTBL');
				    			    var selRowId = myGrid.jqGrid ('getGridParam', 'selrow');
				    			    var programId = myGrid.jqGrid ('getCell', selRowId, 'proMainteanceTrainee.programId');
				    			    var traineeProgress = myGrid.jqGrid ('getCell', selRowId, 'traineeStatus');
				    			    alert(traineeProgress);
				              		//alert("before opening context menu");
				              		$.ajax({
									     url: "fdbckcount.action?programId="+programId,
									     async   : false,
									     cache   : false,
									     type    : "GET",
									     dataType: 'json',
									  	 success: function(data){
									  	 		contextKeyMap = data["showcontext"];
									  	 		programstatus = data["programstatus"];
									  	 		trainingprogressflag = data["trainingprogressflag"];
									  	 		$('#FeedbackForTrainers').attr('disabled','disabled').addClass('ui-state-disabled');
								  	 			if(programstatus == '<%=OTSConstants.EXAM_PENDING%>' || programstatus == '<%=OTSConstants.TRAINING_IN_PROGRESS%>' 
									  	 			|| programstatus == '<%=OTSConstants.EXAM_SCHEDULE_PENDING%>' || programstatus == '<%=OTSConstants.EXAM_IN_PROGRESS%>'
										  	 		|| programstatus == '<%=OTSConstants.TRAINEE_NOMINNATION_FREEZED%>'){
											          	$('#CancelNomination').attr('disabled','disabled').addClass('ui-state-disabled');
											          	$('#CancelNomination').unbind('click',CancelNominationDialog);
									          	}else{
								          				$('#CancelNomination').removeAttr('disabled').removeClass('ui-state-disabled');
								          				$('#CancelNomination').bind('click',CancelNominationDialog);
								          		}
									  	 		if(contextKeyMap == 'hide' || programstatus != trainingprogressflag){
									  	 			$('#FeedbackForTrainers').attr('disabled','disabled').addClass('ui-state-disabled');
									  	 			$('#FeedbackForTrainers').unbind('click',FeedbackForTrainer);
									  	 		}else{
									  	 			$('#FeedbackForTrainers').removeAttr('disabled').removeClass('ui-state-disabled');
									  	 			$('#FeedbackForTrainers').bind('click',FeedbackForTrainer);
									  	 		}

									  	 		if(!(programstatus == '<%=OTSConstants.EXAM_IN_PROGRESS%>' || programstatus == '<%=OTSConstants.PROGRAM_COMPLETED%>')){
									  	 			$('#ViewExamResults').attr('disabled','disabled').addClass('ui-state-disabled');
									  	 			$('#ViewExamResults').unbind('click',viewExamResult);
									  	 		} else{
																	
									  	 		}
			               	 			}		
								 	});
		          				return true;
		          				}


						});
				 						
					$('#MyNominationTBL').jqGrid('filterToolbar', {
						searchOnEnter : true,
						enableClear : false,
						beforeSearch : function(value) {
							$("#MyNominationTBL").jqGrid('setGridParam', {
								url : "listMyNomination?filters="
							});
						}}
					);
				
					$("#MyNominationTBL").jqGrid(
							'navGrid',
							'#MyNominationTBLPageDiv',
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
								closeOnEscape : true,
								afterShowForm : function(MyNominationTBL) {
									$(".navButton").hide();
							    }
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
									onSearch : function(params,
											postdata) {
									$("#gs_proMainteanceTrainee.programId").val("");
									$("#gs_proMainteanceTrainee.courseName").val("");
									$("#gs_traineeStatus").val("");
									$("#gs_cancelRemarks").val("");
										$("#MyNominationTBL")
												.jqGrid('setGridParam',
														{ url : "listMyNomination" });
									}
								},
							
								{
										closeOnEscape : true,
										beforeShowForm : function(MyNominationTBL) {
												$(".navButton").hide();
								}
								}
								
								);
				
					}});
					});

</SCRIPT>

<body>
<form id="MyNominations">
<div align="center" width="100">
<br>
<div id="heading" class="title" align="left">Trainee</div>
<br>
<table id="MyNominationTBL" width="100%"></table>
<div id="MyNominationTBLPageDiv"></div>
</div>
<br>
<input type="hidden" id="query" value="">
<br>
<div class="contextMenu" id="myMenu1" style="display:none">
    <ul style="width: 100px">
        <li id="CancelNomination">
           <span class="ui-icon ui-icon-plus" style="float:left"></span>
           <span style="font-size:11px; font-family:Verdana">Cancel Nomination</span>
        </li>
        <li id="FeedbackForTrainers">
           <span class="ui-icon ui-icon-plus" style="float:left"></span>
           <span style="font-size:11px; font-family:Verdana">Feedback For Trainers</span>
        </li>
        <li id="ViewExamResults">
           <span class="ui-icon ui-icon-document" style="float:left"></span>
           <span style="font-size:11px; font-family:Verdana">View Exam Results</span>
        </li>
      </ul>
 </div>
<div id="Cancel_details" title="Cancel Program Details" style="display:none;"> </div>
<div id="feedback_trainers" title="Feedback For Trainer" style="display:none;"> </div>
<div id="View_ExamResults" title="View Exam Results" style="display:none;"> </div>
</form>
</body>
</html>