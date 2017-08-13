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
 function CourseValue(value,COURSE_NAME ) {
		if (value == ""  || value =="null")
		   return [false,"Please Enter CourseName."];
		   else
			   return [true,""];
			}
 function Questionvalue(value,QUESTION ) {
		if (value == ""  || value =="null")
		   return [false,"Please Enter PlatformCode."];
		   else
			   return [true,""];
			}
 var checkedVal; 
 
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
	
		     	colNames : [ 'QUESTION','COURSE_NAME', 'COMPLEXITY', 'QUESTION_TYPE', 'OBJECT_A',
		     				'OBJECT_B', 'OBJECT_C','OBJECT_D' ,'OBJ_ANS','ANSWER','UPDATE_USER' ],
		     				colModel:[ 
		     							{
		     			name : 'QUESTION',
		     			index : 'QUESTION',  
		     			align : "center",
		     			editable : true,
		     			edittype : 'textarea',
		     			editoptions : {},
		     			editrules : {
		     				custom : true,
		     				custom_func : Questionvalue
		     			}
		     		}, {  name : 'COURSE_NAME',
		     			index : 'SUBJECT_CODE',  
		     			align : "center",
		     			editable : true,
		     			edittype : 'select', 
		     			editoptions : {
		     				size : 20
		     			},
		     			editrules : {
		     				custom : true,
		     				custom_func : CourseValue
		     			}
		     			
		     		}, 	
		     		{  name : 'COMPLEXITY',
		     			index : 'COMPLEXITY',  
		     			align : "center",
		     			editable : true,
		     			formatter: 'select',
		     			edittype : 'select', 
		     			editoptions : {value: 'S:Simple;M:Medium;C:Complex', defaultValue: 'S' 
		     				
		     			},stype: 'select', searchoptions: { sopt: ['eq', 'ne'], value: ':Any;S:Simple;M:Medium;C:Complex' },
		     			editrules : {
		     				custom : true,
		     				//custom_func : chekvalid
		     			}
		     			
		     		},		{  name : 'QUESTION_TYPE',
		     			index : 'QUESTION_TYPE',  
		     			align : "center",
		     			editable : true,
		     			formatter: 'select',
		     			edittype : 'select', 
		     			editoptions : {value: 'O:Objective;S:Subjective', defaultValue: 'O' 
		     				
		     			},stype: 'select', searchoptions: { sopt: ['eq', 'ne'], value: ':Any;O:Objective;S:Subjective' },
		     			editrules : {
		     				custom : true
		     				//custom_func : chekvalid
		     			}
		     			
		     		},		{
		     			name : 'OBJECT_A',
		     			index : 'OBJECT_A',  
		     			align : "center",
		     			editable : true,
		     			edittype : 'textarea',
		     			editoptions : {},
		     			editrules : {
		     				custom : true
		     				//custom_func : chekvalid
		     			}
		     		},		{
		     			name : 'OBJECT_B',
		     			index : 'OBJECT_B',  
		     			align : "center",
		     			editable : true,
		     			edittype : 'textarea',
		     			editoptions : {},
		     			editrules : {
		     				custom : true
		     				//custom_func : chekvalid
		     			}
		     		}, {
		     			name : 'OBJECT_C',
		     			index : 'OBJECT_C',  
		     			align : "center",
		     			editable : true,
		     			edittype : 'textarea',
		     			editoptions : {},
		     			editrules : {
		     				custom : true
		     				//custom_func : chekvalid
		     			}
		     		},{
		     			name : 'OBJECT_D',
		     			index : 'OBJECT_D',  
		     			align : "center",
		     			editable : true,
		     			edittype : 'textarea',
		     			editoptions : {},
		     			editrules : {
		     				custom : true
		     				//custom_func : chekvalid
		     			}
		     		},{  name : 'OBJ_ANS',
		     			index : 'OBJ_ANS',  
		     			align : "center",
		     			editable : true,
		     			formatter: 'select',
		     			edittype : 'select', 
		     			editoptions : {value: 'A:A;B:B;C:C;D:D', defaultValue: 'A' 
		     				
		     			},stype: 'select', searchoptions: { sopt: ['eq', 'ne'], value: ':Any;A:A;B:B;C:C;D:D' },
		     			editrules : {
		     				custom : true
		     				//custom_func : chekvalid
		     			}
		     			
		     		},
		     		{
		     			name : 'ANSWER',
		     			index : 'ANSWER',  
		     			align : "center",
		     			editable : true,
		     			edittype : 'textarea',
		     			editoptions : {},
		     			editrules : {
		     				custom : true
		     				//custom_func : chekvalid
		     			}
		     		},{
		     								name : 'UPDATE_USER',
		     								index : 'UPDATE_USER',  
		     								align : "center",
		     								editable : false,
		     								hidden : true,
		     								editoptions : {
		     									size : 20
		     								}
		     							} ],
						rowNum : 10,
						rowList : [ 10, 20, 30 ],
						pager : '#TrSeatchTBLPageDiv',
						loadatonce : false,
						viewrecords : true,
						mtype : "GET",
						//rownumbers: true,
						multiselect: true,
						gridview : true,
						sortname : 'courseName',
						caption : "Toolbar Searching",
						sortorder : "desc",
						caption : "Training Search",
						toolbar:[true,"top"],
						editurl : "saveOrUpdateprogramMainteance",
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
							            'CancelProgram': function(trigger) {
							                $("#Cancel_details").dialog({			    	 	
                                    		   height: 250, 
                                    		   width: 300, 
                                    		   model :true,	        
                                               buttons: { "Submit": function() {
							                   var bValid = true;
							                   if( bValid ) {
											   var serialiseData = null;
												// Here "#frm_demo" sub page form name 
												serialiseData = $(("#frm_demo")).serialize();
												serialiseData = serialiseData + "&"+"programId="+checkedVal;
												//alert("serialiseData ::: "+ serialiseData);
											$.ajax({url: "saveOrUpdateprogramMainteance.action", 
													data : serialiseData,
											        success: function(data)
												      {           		             
												        //alert(data.message);
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
	                                    	         alert("Error :: "+data.message);
	                                    	       }            
	                                    		});     
	                                    	},

                                    	 // View/Freeze Trainer Nominations Context Dialog    
							            'FreezeTrainerNominations': function(/*trigger*/) {
                                           	   // Context Menu our Own Dialog Design 
										  	$( "#viewFreezeTrainer_details" ).dialog({
										      		   height: 350, 
		                                    		   width: 500, 
		                                    		   model :true,	        
		                                               buttons: { "Freeze Nominations": function() {
									                   var bValid = true;
									                   if( bValid ) {
													   var serialiseData = null;
														// Here "#FreezeTrainer" sub page form name 
														serialiseData = $(("#FreezeTrainer")).serialize();
														serialiseData = serialiseData + "&"+"programId="+checkedVal;
														//alert("serialiseData ::: "+ serialiseData);
													$.ajax({url: "saveOrUpdateprogramMainteance.action", 
															data : serialiseData,
													        success: function(data)
														      {           		             
														        //alert(data.message);
														       },
															 error:function(data){
															 //alert("Error :: "+data.message);
															   }            
							                               });
															  $(this).dialog('close');
															  $("#viewFreezeTrainer_details").val=""; 
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
			                                                 data : "programId="+checkedVal,
			                                                 cahce : true,
			                                                 success: function(data){
		                                    				 var count = 0;			        	       
			                                                 $('#viewFreezeTrainer_details').html(data);
			                                                 },
			                                    	         error:function(data){
			                                    	         alert("Error :: "+data.message);
			                                    	       }            
			                                    		});     
			                                    	},			    	 	
                                    			
                                            // View/Freeze Trainer Nominations Context Dialog    
									       'FreezeTraineeNominations': function(/*trigger*/) {
		                                           	// Context Menu our Own Dialog Design 
												   		$( "#viewFreezeTrainee_details" ).dialog({			    	 	
		                                    			height: 350, width: 350, model :true,	        
		                                    	        buttons: { "Submit": function() {
		                                    	    	 		},
		                                    				Cancel: function() {
		                                    						$(this).dialog('close');
		                                    						$("#viewFreezeTrainee_details").val="";
		                                    		           	}
		                                    				},
		                                    				close: function() {
		                                    					   $("#viewFreezeTrainee_details").val=""; 
		                                    				}          
		                                    	        }); 

		                                    		 $.ajax({ 		             
		                                                 url: "TraineeFreeze.action",
		                                                // data : "id="+checkedVal,
		                                                 cahce : true,
		                                                 success: function(data){
		                                    				 var count = 0;			        	       
		                                                 $('#viewFreezeTrainee_details').html(data);
		                                                 },
		                                    	         error:function(data){
		                                    	         alert("Error :: "+data.message);
		                                    	       }            
		                                    	});     
		                                    	
		                                 },	 
		                                 
							            // Status Update Context Dialog    
							          /* 'UpdateStatus': function(trigger) {
												 $("#Status_details").dialog({			    	 	
		                                    			height: 250, width: 300, model :true,	        
		                                    	        buttons: { "Submit": function() {
		                                    	    	 		   },
                                                                 Cancel: function() {
		                                    						$(this).dialog('close');
		                                    						$("#Status_details").val=""; 
		                                    		           	}
		                                    				},
		                                    				close: function() {
		                                    					   $("#Status_details").val=""; 
		                                    				}          
		                                    	        }); 

		                                    		 $.ajax({ 		             
		                                                 url: "StatusUpdate.action",
		                                                 //data : "id="+checkedVal,
		                                                 cahce : true,
		                                                 success: function(data){
		                                    				 var count = 0;			        	       
		                                                 $('#Status_details').html(data);
		                                                 },
		                                    	         error:function(data){
		                                    	         alert("Error :: "+data.message);
		                                    	       }            
		                                    		}); 
		                                    	},*/
		                                    	
							       onContextMenu: function(event/*, menu*/) {
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

	   	$('#TrainingSearchTBL').jqGrid('filterToolbar', {searchOnEnter : true, enableClear : false,	beforeSearch : function(value) 
		   	{
		     $("#TrainingSearchTBL").jqGrid('setGridParam', { url : "listprogramMainteance?filters=" });
            }
	  });

	$("#TrainingSearchTBL").jqGrid(
			'navGrid',
			'#TrSeatchTBLPageDiv',
			{ edit : true, add : false, del : true, search : true, view : false }, //options
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
				$("#gs_COURSE_NAME").val("");
				$("#gs_QUESTION").val("");
				$("#gs_QUESTION_TYPE").val("");
				$("#gs_COMPLEXITY").val("");
				$("#gs_OBJ_ANS").val("");
				$("#gs_OBJECT_A").val("");
				$("#gs_OBJECT_B").val("");
				$("#gs_OBJECT_C").val("");
				$("#gs_OBJECT_D").val("");
				$("#gs_ANSWER").val("");				
				$("#gs_QUESTION").val("");
				$("#gs_UPDATE_USER").val("");
				
			},

			//reloadAfterSearch : true },// search options
			// { closeOnEscape : true 

		  // });

			reloadAfterSearch : true },// search options
			{ closeOnEscape : true }).jqGrid('navButtonAdd',"#TrSeatchTBLPageDiv",
				{
				title:"Add",
				buttonicon : "ui-icon ui-icon-plus",
				position: "first", 
				caption : "",
				onClickButton : function(){
					$("#programDeatilsForm").attr("action", "SearchQuestionAction"); // SearchProgramAddAction
					$("#programDeatilsForm").submit();

					}
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
        <li id="FreezeTrainerNominations">
           <span class="ui-icon ui-icon-plus" style="float:left"></span>
           <span style="font-size:11px; font-family:Verdana">View\Freeze Trainer Nominations</span>
        </li>
        
        <li id="FreezeTraineeNominations">
           <span class="ui-icon ui-icon-plus" style="float:left"></span>
           <span style="font-size:11px; font-family:Verdana">View\Freeze Trainee Nominations</span>
        </li>
        
        <li id="CancelProgram">
            <span class="ui-icon ui-icon-pencil" style="float:left"></span>
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
 <div id="viewFreezeTrainer_details" title="View / Freeze Trainer Nomination Details" style="display:none;"></div>
 <div id="viewFreezeTrainee_details" title="View / Freeze Trainee Nomination Details" style="display:none;"></div> 
 <div id="Cancel_details" title="Cancel Program Details" style="display:none;"> </div> 
 <!-- <div id="Status_details" title="Status Update Details" style="display:none;"> </div> -->
<br>
<input type="hidden" id="programIdHid" value="">
</form>
</body>
</html>