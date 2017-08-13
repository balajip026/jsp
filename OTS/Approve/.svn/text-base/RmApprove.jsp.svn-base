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

$(document).ready(function(){
 // Validation Function 
 function chekvalid(value,APP_CODE,DESCRIPTION ) 
    {
    if (value == ""  || value =="null") 
        return [false,"Please Enter value."];
        else 
           return [true,""];
     } 

 var checkedVal; 
 
$("#TrainingSearchTBL").jqGrid({
			url : 'listRMApprovals', 
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
	
		     	    colNames : [ 'Program Id', 'Trainee Name','Nomination Status','Last Updated','ID' ],
					colModel : [ { name : 'proMainteanceTrainee.programId',index : 'proMainteanceTrainee.programId', align : "center", editable : true, editoptions : {size : 20 },editrules : {custom : true}, hidden : false },
				                // { name : 'empMaster.empId',index : 'empMaster.empId', align : "center", editable : true, editoptions : {size : 20 },editrules : {custom : true}},
				                 { name : 'empMaster.FName',index : 'empMaster.FName', align : "center", editable : true, editoptions : {size : 20 },editrules : {custom : true}},    
								 { name : 'traineeStatus',index : 'traineeStatus', align : "center", editable : true, editoptions : {size : 20 },editrules : {custom : true},
								   formatter:function(cellvalue, options, rowObject){
						              if (cellvalue == 'RMPND') {
							              cellvalue="RM Approval Pending";
									      }
								      return cellvalue;  }},
								 //{ name : 'cancelRemarks',index : 'cancelRemarks', align : "center", editable : true, editoptions : {size : 20 }, editrules : {custom : true},key : true },
								 { name : 'updateTimestamp',index : 'updateTimestamp', align : "center", editable : true, editoptions : {size : 20 },editrules : {custom : true}, hidden:true},
								 { name : 'id',index : 'id', align : "center", editable : true, editoptions : {size : 20 },editrules : {custom : true},key : true, hidden:true }],
						rowNum : 10,
						rowList : [ 10, 20, 30 ],
						pager : '#TrSeatchTBLPageDiv',
						loadatonce : false,
						viewrecords : true,
						mtype : "GET",
						//rownumbers: true,
						multiselect: false,
						gridview : true,
						sortname : 'id',
						caption : "Toolbar Searching",
						sortorder : "desc",
						caption : "Approve Details",
						toolbar:[false,"top"],
						//editurl : "saveOrUpdateprogramMainteance",
						width : 1000, 

						onSelectRow: function(id){
							    checkedVal = id;
							   // $("#programIdHid").attr("value",checkedVal);
							   // alert(checkedVal);
						     },
						     
						// Context Menu Loading Details....
						loadComplete: function() {
				    		 $("tr.jqgrow", this).contextMenu('myMenu1', {
							        bindings: {

				    			    // RM Reject Context Dialog     
						            'Approve': function(trigger) {
				    					$("#Approve_details").dialog({	
						                   height: 180, 
                                    	   width: 320, 
                                   		   model :true,	        
                                           buttons: { "Approve": function() {
							                   var bValid = true;
							                   if( bValid ) {
												   var serialiseData = null;
												   serialiseData = $(("#RMApproval_demo")).serialize();
												   serialiseData = serialiseData + "&"+"programId="+checkedVal;
												   $.ajax({url: "RmApprovalAction.action", 
														data : serialiseData,
														cahce : true,
												        success: function(data){
											     			$('.ui-dialog-titlebar-close').trigger('click');
					                             	        $(this).dialog("close"); 
					                             	       	$("#TrainingSearchTBL").trigger("reloadGrid");
						                                  },
													     error:function(data){
														 jAlert("Error :: "+data.message);
														     }            
						                                  });
														  
														 }
	                                    	    	  }, 
                                                 
	                                    	    	  Close: function() {
	                                    					$(this).dialog('close');
	                                    					$("#Approve_details").val="";
	                                    	    	 	  }
	                                    				},
	                                    			 close: function() {
	                                    					$("#Approve_details").val=""; 
	                                                	}          
	                                    	       }); 
                                                   														
	                                   		 $.ajax({url: "TraineeRMApproval.action",
	                                                 data : "remarks="+checkedVal,
	                                                 cahce : true,
	                                                 success: function(data){
	                                   				 var count = 0;			        	       
	                                                 $('#Approve_details').html(data);
	                                                 },
	                                    	         error:function(data){
	                                    	         jAlert("Error :: "+data.message);
	                                    	       }            
	                                    		});     
	                                    	},
	                                    	
							               'Reject': function() {
                                            	$( "#Reject_details" ).dialog({
                                            		   height: 180, 
                                          		       idth: 320,   
		                                    		   model :true,	        
		                                               buttons: { "Reject": function() {
									                   var bValid = true;
									                   if( bValid ) {
													   var serialiseData = null;
														serialiseData = $(("#RMReject_demo")).serialize();
														serialiseData = serialiseData + "&"+"programId="+checkedVal;
														$.ajax({url: "RmRejectAction.action", 
															data : serialiseData,
															cahce : true,
															 success: function(data){
														    //jAlert(" Sample Test    ","Information");
														     	$('.ui-dialog-titlebar-close').trigger('click');
							                             	    $(this).dialog("close");
							                             		$("#TrainingSearchTBL").trigger("reloadGrid"); 
							                                   },
														     error:function(data){
															 jAlert("Error :: "+data.message);
															     }            
							                                  });
															  
															 }
		                                    	    	  },
		                                    	    	  Close: function() {
		                                    					$(this).dialog('close');
		                                    					$("#Reject_details").val="";
		                                    	    	 	  }
		                                    				},
		                                    			 close: function() {
		                                    					$("#Reject_details").val=""; 
		                                                	}          
		                                    	       }); 

                                             $.ajax({url: "TraineeRMReject.action",
			                                                 data : "programId="+checkedVal,
			                                                 cahce : true,
			                                                 success: function(data){
		                                    				 var count = 0;			        	       
			                                                 $('#Reject_details').html(data);
			                                                 },
			                                    	         error:function(data){
			                                    	         jAlert("Error :: "+data.message);
			                                    	       }            
			                                    		});     
			                                    	},			    	 	

			                            onContextMenu: function(event) {
							            var rowId = $(event.target).closest("tr.jqgrow").attr("id");
							            //grid.setSelection(rowId);
							            // disable menu for rows with even rowids
							            $('#del').attr("disabled",Number(rowId)%2 === 0);
							            if (Number(rowId)%2 === 0) {
							                $('#del').attr("disabled","disabled").addClass('ui-state-disabled');
							            } else {
							                $('#del').removeAttr("disabled").removeClass('ui-state-disabled');
							            }
							            return true;
							         }
							    }
		                  });

	     /* $('#TrainingSearchTBL').jqGrid('filterToolbar', {searchOnEnter : true, enableClear : false,	beforeSearch : function(value) 
			   	{
			      $("#TrainingSearchTBL").jqGrid('setGridParam', { url : "listRMApprovals?filters=" });
	            }
	        }); */

	$("#TrainingSearchTBL").jqGrid(
			'navGrid',
			'#TrSeatchTBLPageDiv',
				{ edit : false, 
				  add : false, 
				  del : false, 
				  search : false, 
				  view : false }, //options
				  
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
				$("#gs_PROGRAM_ID").val("");
				$("#gs_TRAINING_TYPE").val("");
				$("#gs_EXAM_MODE").val("");
				$("#gs_COURSE_NAME").val("");
				$("#gs_PROGRAM_START_DATE").val("");
				$("#gs_PROGRAM_END_DATE").val("");
				$("#gs_TRAINING_START_DATE").val("");
				$("#gs_TRAINING_END_DATE").val("");
				$("#gs_TRAINING_START_TIME").val("");
				$("#gs_TRAINING_END_TIME").val("");				
				$("#gs_TRAINER_NOM_START_DATE").val("");
				$("#gs_TRAINER_NOM_END_DATE").val("");
				$("#gs_TRAINEE_NOM_START_DATE").val("");
				$("#gs_TRAINEE_NOM_END_DATE").val("");
				$("#gs_STATUS").val("");
				$("#gs_CANCEL_REMARKS").val("");
				$("#gs_TRAINING_MODE").val("");
				$("#gs_NUM_OF_TRAINEES").val("");
				$("#gs_NUM_OF_TRAINEES_BACKUP").val("");
				$("#gs_PRIMARY_TRAINER").val("");
				$("#gs_BACKUP_TRAINER").val("");
				$("#gs_NO_EXAM_SCHEDULES").val("");
                $("#gs_ISRMAPPROVAL").val("");
				$("#gs_TRAINER_DISTRIBUTION_DEPT").val("");
				$("#gs_TRAINER_DISTRIBUTION_ROLE").val("");
				$("#gs_TRAINEE_DISTRIBUTION_DEPT").val("");
				$("#gs_TRAINEE_DISTRIBUTION_ROLE").val("");
                $("#gs_UPDATE_USER").val("");
				$("#TrainingSearchTBL").jqGrid('setGridParam', { url : "listRMApprovals" });
			}

			//reloadAfterSearch : true },// search options
			// { closeOnEscape : true 

		  // });

			//reloadAfterSearch : true },// search options
			//{ closeOnEscape : true }).jqGrid('navButtonAdd',"#TrSeatchTBLPageDiv" ,
					
			  //{
				//title:"Add",
				//buttonicon : "ui-icon ui-icon-plus",
				//position: "first", 
				//caption : "",
				//onClickButton : function(){
					//$("#programDeatilsForm").attr("action", "SearchProgramAddAction");
					//$("#programDeatilsForm").submit();

					//}
					
			     }); 
              }
         });
   });
</SCRIPT>
<body>
<form id="programDeatilsForm">
<div align="center" width="100%" >
<br>
<div id="heading" class="title" align="left">Training Search</div>
<br>
<table id="TrainingSearchTBL" width="100%"></table>
<div id="TrSeatchTBLPageDiv"></div>

<div class="contextMenu" id="myMenu1" style="display:none">
    <ul style="width: 100px">
       
        <li id="Approve">
            <span class="ui-icon ui-icon-pencil" style="float:left"></span>
            <span style="font-size:11px; font-family:Verdana"> Approve</span>
        </li>
        
         <li id="Reject">
           <span class="ui-icon ui-icon-plus" style="float:left"></span>
           <span style="font-size:11px; font-family:Verdana"> Reject</span>
        </li>
     </ul>
</div>
</div>
<!-- All Dialog Titles  -->
 <div id="Approve_details" title="Approve Details " style="display:none;"> </div>
 <div id="Reject_details" title="Reject Details" style="display:none;"></div> 
<br>
</form>
</body>
</html>