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
var checkedVal; 
$("#TrainingSearchTBL").jqGrid({
			//url : 'listprogramMainteance',
			url : 'listTraineeExam',
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
	
		    colNames : [ 'Program Id', 'Course Name','Set Id', 'Status','Primary Trainer'],
			colModel : [ { name : 'programId',index : 'programId', align : "center", editable : true, editoptions : {size : 20 }, 
		                   editrules : {custom : true }, key : true},
		                 { name : 'courseName',index : 'courseName', align : "center"},   
		                 { name : 'setId',index : 'setId', hidden : true, align : "center"},
		                 { name : 'status.statusDesc',index : 'status.statusDesc', align : "center"},
		                 { name : 'primaryTrainer',index : 'primaryTrainer', align : "center", 
		                           formatter:function(cellvalue, options, rowObject) 
		                            {
		                               $.ajax({url: "EmpName.action", 
		                                       data : "empId="+cellvalue,
		                                       success: function(data)
		                                         {
		                                            cellvalue = data.empname;
		                                         },
		                                      async:false
		                                });                
		                                     return cellvalue;  
		                             }}],
						rowNum : 10,
						rowList : [ 10, 20, 30 ],
						pager : '#TrSeatchTBLPageDiv',
						loadatonce : false,
						viewrecords : true,
						mtype : "GET",
						multiselect: false,
						gridview : true,
						sortname : 'programId',
						caption : "Toolbar Searching",
						sortorder : "desc",
						caption : "Exam Details",
						toolbar:[true,"top"],
						editurl : "saveOrUpdateprogramMainteance",
						width : 1000, 
                        onSelectRow: function(programId){
							    checkedVal = programId;
							  //$("#programIdHid").attr("value",checkedVal);
							  //  alert(checkedVal);
						     },
						     
						// Context Menu Loading Details....
						loadComplete: function() {
				    		 $("tr.jqgrow", this).contextMenu('myMenu1', {
							     bindings: {
							     // Take Test own page calling Here 
							     'takeTest': function(){
				    			  var myGrid = $('#TrainingSearchTBL');
				    			  var selRowId = myGrid.jqGrid('getGridParam', 'selrow');

					    		  var programId = myGrid.jqGrid ('getCell', selRowId, 'programId');
				    		      var setId = myGrid.jqGrid ('getCell', selRowId, 'setId');
				    		      var primaryTrainer = myGrid.jqGrid ('getCell', selRowId, 'primaryTrainer');

					    		   $("#programIdReq").attr("value",programId);
				    		       $("#setIdReq").attr("value",setId);
				    		       $("#primaryTrainerReq").attr("value",primaryTrainer);
				    		       if(checkedVal != "" && checkedVal != null){
					    		       $("#programDeatilsForm").attr("action", "ExamPaper");
                                   		$("#programDeatilsForm").submit();
				    		       }
				    		    },
				    		    'examSchedules': function(trigger) {
				    				  if(checkedVal != null && checkedVal !=""){
                                        $("#examSchedules_details").dialog({			    	 	
                                  		   height: 230, 
                                  		   width: 490, 
                                  		   model :true,
                                 buttons: { "Cancel": function() {
                        					$(this).dialog('close');
                        					$("#examSchedules_details").val="";
                        	    	 	  }
                        				},
                                        close: function() {
                              			$("#examSchedules_details").val=""; 
                                     }      
                                  });  
                                        
                                       var serialiseData = null;
									   serialiseData = $(("#ExamSchedule")).serialize();
									   serialiseData = serialiseData + "&"+"programId="+checkedVal;
                                       // Here ExamSchedules Page Calling
                                       $.ajax({url: "ExamSchedules.action",
		                                                 data : "programIdReq="+checkedVal,
		                                                 cahce : false,
		                                                 success: function(data){
	                                    				 var count = 0;			        	       
		                                                 $('#examSchedules_details').html(data);
		                                                 },
		                                    	         error:function(data){
		                                    	         alert("Error :: "+data.message);
		                                    	       }            
		                                    		}); 
							    					}else{
														jAlert("Please Select a Record to Exam Schedules");
			                                    	}    
		                                    	},			    	 	
			                                    			
			                                   
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
					    		 

		                              
                    // Filter Search Some Issue  
				  /* 	$('#TrainingSearchTBL').jqGrid('filterToolbar', { 
					   	searchOnEnter : true, 
					   	enableClear : false,	
					   	beforeSearch : function(value) 
					   	{
					     $("#TrainingSearchTBL").jqGrid('setGridParam', { url : "listTraineeExam?filters=" });
			            }
				  	}); */
				}
			});
	
	$("#TrainingSearchTBL").jqGrid(
			'navGrid',
			'#TrSeatchTBLPageDiv',
			{ edit : false, add : false, del : false, search : false, view : false, refresh : false }, //options
			{ height : 200, reloadAfterSubmit : true, closeAfterEdit : true, closeOnEscape : true, caption : "Add" }, // edit options
    		{ height : 200, reloadAfterSubmit : true, closeAfterAdd : true, closeOnEscape : true, onClickButton : function() {
			}}, // add options
			{ // now define settings for Delete dialog      
				mtype : "POST",
				reloadAfterSubmit : true,
				onclickSubmit : function(rp_ge, postdata) {
					// alert(postdata);
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
				

			//reloadAfterSearch : true },// search options
			// { closeOnEscape : true 

		  // });

			reloadAfterSearch : true },// search options
			{ closeOnEscape : true });


   });
</SCRIPT>
<body>
<form id="programDeatilsForm" action="">
 <input type="hidden" id="programIdReq"  name="programIdReq" />
 <input type="hidden" id="setIdReq" name="setIdReq" />
 <input type="hidden" id="primaryTrainerReq" name="primaryTrainerReq" />
  <input type="hidden" name="param2" value=""/>
<div align="center" >
<br>
<div id="heading" class="title" align="left">AVAILABLE EXAMS </div>
<br>
<table id="TrainingSearchTBL" width="100%"></table>
<div id="TrSeatchTBLPageDiv"></div>

<div class="contextMenu" id="myMenu1" style="display:none">
    <ul style="width: 100px">
             
        <li id="takeTest">
            <span class="ui-icon ui-icon-pencil" style="float:left"></span>
            <span style="font-size:11px; font-family:Verdana">Take Test</span>
        </li> 
                
        <li id="examSchedules">
            <span class="ui-icon ui-icon-pencil" style="float:left"></span>
            <span style="font-size:11px; font-family:Verdana">View Exam Schedules</span>
        </li> 
    </ul>
    
  </div>
</div>

<!-- All Dialog Titles  -->
 <div id="examSchedules_details" title="Exam Schedules Details" style="display:none;"></div>

<br>
<input type="hidden" id="programIdHid" value="">
</form>
</body>
</html>