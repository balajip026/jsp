<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.vit.ots.utils.OTSSupport"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@include file="../CommonJSs.jsp" %>
<%
     String empLoc=OTSSupport.getLoggedUserProfile().getLocationCode();
	 if(empLoc.equalsIgnoreCase("CHEN"))
		 {
		 	empLoc = "Chennai";
		 }
	 else{
		 empLoc = "Hyderabad";
	 	 }
     %>
     
 <input type="hidden" id="empLoc" name="empLoc" value="<%=empLoc%>">
 
<SCRIPT type="text/javascript">
$(document).ready(function(){
	var key0;
	var key1;
	var checkedVal;
function NominateProgramDialog(){
	
		  	$( "#Nominate_details" ).dialog({			    	 	
						height: 300, width: 300, model :true,	        
				        buttons: {
			        	    "Nominate": function() {
						   		$.ajax({		             
				                         url: "nominatetrainee.action?id="+checkedVal+"&empLoc="+$("#empLoc").val()+"&key0="+key0+"&key1="+key1,
				                         cache : true,
				                         success: function(data){
								   			jAlert(data["statusMap"]["status"],"Information");
							   				$("#TraineeNominateTBL").trigger('reloadGrid');
							   				$('.ui-dialog-titlebar-close').trigger('click');
							   				$(this).dialog('close');
					   				  	  
				                         },
				            	         error:function(data){
				            	         	alert("Error :: "+data);
				            	       }});
				    	 			},
							"Close": function() {
										$(this).dialog('close');
										$("#Nominate_details").val="";
					           		}
						},
						close: function() {
						   $("#Nominate_details").val=""; 
					 	}          
		    		 }); 
		       		 $.ajax({ 		             
		                    url: "listTraineeDetails.action",
		                    data : "id="+checkedVal,
		                    cahce : true,
		                    success: function(data){
		       					var count = 0;			        	       
		                    	$('#Nominate_details').html(data);
		                    },
		       	         	error:function(data){
		       	         		alert("Error :: "+data.message);
		       	       		}            
		       			});     
}
	
	var itemsDisabled = {};
	 $(document)[0].oncontextmenu = function() {return false;}; 
	
	$("#TraineeNominateTBL").jqGrid({
		url : 'listTraineeNominate?empLoc='+$("#empLoc").val(),
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

		    colNames : [ 'Program Id', 'Training Type', 'Exam Mode','Course Name', 'Program StartDate', 'Program EndDate', 'Training StartDate','Training EndDate', 'Training StartTime','Training Duration', 'Trainer Nom StartDate','Trainer Nom EndDate','Trainee Nom StartDate', 'Trainee Nom EndDate', 'Status', 'CancelRemarks', 'TrainingMode', 'NumOfTrainees', 'NumOfTraineesBackup','PrimaryTrainer','BackupTraineer', 'NoOfExam_schedules', 'isRMApproval', 'attendanceEligibility', 'Trainer Dis Dept','Trainer Dis Role', 'Trainee Dis Dept','Trainee Dis Role', 'UPDATED BY'],
			colModel : [ { name : 'programId',index : 'programId', align : "center", editable : true, editoptions : {size : 20 }, 
                editrules : {custom : true }, key : true, hidden: false },
                { name : 'trainingType',index : 'trainingType', align : "center", editable : true, editoptions : {size : 20 }, 
	               editrules : {custom : true }, key : true, hidden: true },
	             { name : 'examMode',index : 'examMode', align : "center", editable : true, editoptions : {size : 20 }, 
		           editrules : {custom : true }, key : true, hidden: true },
	             { name : 'courseName',index : 'courseName', align : "center", editable : true, editoptions : {size : 20 }, 
		           editrules : {custom : true}, key : true },
		         { name : 'programStartDate',index : 'programStartDate', align : "center", editable : true, editoptions : {size : 20 } , 
			       editrules : {custom : true }, key : true, hidden: true },
			     { name : 'programEndDate',index : 'programEndDate', align : "center", editable : true, editoptions : {size : 20 }, 
				   editrules : {custom : true }, key : true, hidden: true },          
				 { name : 'trainingStartDate',index : 'trainingStartDate', align : "center", editable : true, editoptions : {size : 20 }, 
				   editrules : {custom : true }, key : true,formatter:'date', "formatoptions":{"srcformat":"Y-m-d", "newformat":"d-M-Y"} },  
				 { name : 'trainingEndDate',index : 'trainingEndDate', align : "center", editable : true, editoptions : {size : 20 }, 
				   editrules : {custom : true}, key : true,formatter:'date', "formatoptions":{"srcformat":"Y-m-d", "newformat":"d-M-Y"} }, 
                { name : 'trainingStartTime',index : 'trainingStartTime', align : "center", editable : true, editoptions : {size : 20 }, 
				   editrules : {custom : true }, key : true, hidden: true },  
				 { name : 'trainingEndTime',index : 'trainingEndTime', align : "center", editable : true, editoptions : {size : 20 }, 
				   editrules : {custom : true }, key : true, hidden: true }, 	   
                { name : 'trainerNomStartDate',index : 'trainerNomStartDate', align : "center", editable : true, editoptions : {size : 20 }, 
				   editrules : {custom : true}, key : true, hidden: true },    
				 { name : 'trainerNomEndDate',index : 'trainerNomEndDate', align : "center", editable : true, editoptions : {size : 20 }, 
				   editrules : {custom : true }, key : true, hidden: true },    
				 { name : 'traineeNomStartDate',index : 'traineeNomStartDate', align : "center", editable : true, editoptions : {size : 20 }, 
				   editrules : {custom : true }, key : true, hidden: true },
				 { name : 'traineeNomEndDate',index : 'traineeNomEndDate', align : "center", editable : true, hidden: true},
				 { name : 'status.statusDesc',index : 'status.statusDesc', align : "center", editable : true, hidden : true,  editoptions : {size : 20 }, 
				   editrules : {custom : true}, key : true, hidden: true },
				 { name : 'cancelRemarks',index : 'cancelRemarks', align : "center", editable : true, hidden : true, editoptions : {size : 20 }, 
				   editrules : {custom : true }, key : true, hidden: true },
				 { name : 'trainingMode',index : 'trainingMode', align : "center", editable : true,  hidden : true, editoptions : {size : 20 }, 
				   editrules : {custom : true}, key : true, hidden: true },
				 { name : 'numOfTrainees',index : 'numOfTrainees', align : "center", editable : true,  hidden : true, editoptions : {size : 20 }, 
				   editrules : {custom : true }, key : true, hidden: true },
				 { name : 'numOfTraineesBackup',index : 'numOfTraineesBackup', align : "center", editable : true,  hidden : true, editoptions : {size : 20 }, 
				   editrules : {custom : true}, key : true, hidden: true },  
				 { name : 'primaryTrainer',index : 'primaryTrainer', align : "center", 
                       formatter:function(cellvalue, options, rowObject) {
                               $.ajax({url: "EmpName.action", 
                                       data : "empId="+cellvalue,
                                       success: function(data)
                                         {
                                            cellvalue = data.empname;
                                         },
                                      async:false
                                });                
                                     return cellvalue;  
                             }},
				  { name : 'backupTrainer',index : 'backupTrainer', align : "center",
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
                             }},        
				 { name : 'noExamSchedules',index : 'noExamSchedules', align : "center", editable : true, hidden : true, editoptions : {size : 20 }, 
				   editrules : {custom : true}, key : true, hidden: true }, 
				 { name : 'isrmapproval',index : 'isrmapproval', align : "center", editable : true, hidden : true, editoptions : {size : 20 }, 
				   editrules : {custom : true }, key : true, hidden: true }, 	   
				 { name : 'attendanceEligibility',index : 'attendanceEligibility', align : "center", editable : true, hidden : true, editoptions : {size : 20 }, 
				    editrules : {custom : true }, key : true, hidden: true },   
				 { name : 'trainerDistributionDept',index : 'trainerDistributionDept', align : "center", editable : true, hidden : true, editoptions : {size : 20 }, 
				   editrules : {custom : true }, key : true, hidden: true}, 	
				 { name : 'trainerDistributionRole',index : 'trainerDistributionRole', align : "center", editable : true, hidden : true, editoptions : {size : 20 }, 
				   editrules : {custom : true}, key : true, hidden: true }, 
				 { name : 'traineeDistributionDept',index : 'traineeDistributionDept', align : "center", editable : true, hidden : true, editoptions : {size : 20 }, 
				   editrules : {custom : true }, key : true, hidden: true },
				 { name : 'traineeDistributionRole',index : 'traineeDistributionRole', align : "center", editable : true, hidden : true, editoptions : {size : 20 }, 
				   editrules : {custom : true }, key : true, hidden: true },
				 { name : 'updateUser',index : 'updateUser',	align : "center", editable : false,	hidden : true, editoptions : {size : 20 }}],
						    rowNum : 15,
							rowList : [ 15, 20, 30 ],
							pager : '#TraineeNominateTBLPageDiv',
							loadatonce : false,
							viewrecords : true,
							mtype : "GET",
							//rownumbers: true,
							multiselect: false,
							gridview : true,
							sortname : 'courseName',
							sortorder : "asc",
							caption : "Toolbar Searching",
							sortorder : "desc",
							caption : "Nominate",
							toolbar:[true,"top"],
							height: 255,
							width : 1000,
							onSelectRow: function(id){
			    			checkedVal = id;
			    		 },

							loadComplete: function() {
									var traineeCountMap;
					    		 	$("tr.jqgrow", this).contextMenu('myMenu1', {
								    bindings: {
					    			 'NominateTrainee': function(trigger) {
					    		 		 if(checkedVal != null && checkedVal !=""){
					    		 			 var myGrid = $('#TraineeNominateTBL');
					    		 	         var selRowId = myGrid.jqGrid ('getGridParam', 'selrow');
					    		 	   	  	 var celTrainerEndDate = myGrid.jqGrid ('getCell', selRowId, 'traineeNomEndDate');
					    		 			 var curdate = $.datepicker.formatDate('yy-mm-dd', new Date());
					    		 			 if(celTrainerEndDate < curdate){
					    		 			   	  jAlert("Nomination due date is over. "+celTrainerEndDate,"Warning");
					    		 	              return false;
					    		 	         }
					    		 		  //else if ($('#NominateTrainee').hasClass('ui-state-disabled') === false) {
					    		 	  // Context Menu our Own Dialog Design 
					    		 	  		else{
					    		 				NominateProgramDialog;
					    		 	  		}
					    		 		  }
						    			 }},
                          			onContextMenu: function(event) {
	                          			var rowId = $(event.target).parent("tr").attr("id");
	        		         		    var grid = $("#TraineeNominateTBL");
	        		           			grid.setSelection(rowId);
	                         		  	$("#TraineeNominateTBL").jqGrid('setSelection',rowId);
	                         		  	$('#NominateTrainee').attr('disabled','disabled').addClass('ui-state-disabled');
                 				 		$("#NominateTrainee").unbind('click', NominateProgramDialog);
                 				 		$.ajax({
  		    							     url: "traineecount.action?id="+checkedVal+"&empLoc="+$("#empLoc").val(),
  		    							     async   : false,
  		    							     cache   : false,
  		    							     type    : "POST",
  		    							     dataType: 'json',
  		    							  	 success: function(data){
	   		    							  	 traineeCountMap = data["traineeCountMap"];
	   		    							  	 key0 = traineeCountMap.key0;
	   		    							  	 key1 = traineeCountMap.key1; 
                                         	 },
                                         	 async:false		
  		    							 });
	                         			 if(key0 < key1){	
	                         				$('#NominateTrainee').removeAttr('disabled').removeClass('ui-state-disabled');
	                				 		$('#NominateTrainee').bind('click', NominateProgramDialog);
	                				 	 }	
	                          			return true;
                          				}
									});

						$('#TraineeNominateTBL').jqGrid('filterToolbar', {
							searchOnEnter : true,
							enableClear : false,
							beforeSearch : function(value) {
								$("#TraineeNominateTBL").jqGrid('setGridParam', {
									url : "listTraineeNominate?filters="
								});
							}}
						);

					$("#TraineeNominateTBL").jqGrid(
							'navGrid',
							'#TraineeNominateTBLPageDiv',
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
						afterShowForm : function(TraineeNominateTBL) {
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
							closeOnEscape : true,
							groupOps : [ {op : "AND", text : "AND" },
										 {op : "OR", text : "OR" } ],
							matchText : "Find",
							rulesText : " matches",
							sopt : [ 'cn', 'bw', 'eq', 'ne', 'lt', 'le', 'gt', 'ge', 'ew' ],
							reloadAfterSearch : true,
							onSearch : function(params,
									postdata) {
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
								 		$("#query").val(
										$(".query").html());
								$("#TraineeNominateTBL")
										.jqGrid('setGridParam',
												{ url : "listTraineeNominate" });
							}
							},
			
							{
									closeOnEscape : true,
									beforeShowForm : function(TraineeNominateTBL) {
											$(".navButton").hide();
							}
							});
		}
					
	/*$("#nominate").click(function() {
		
		var selRowIds = $('#TraineeNominateTBL').jqGrid('getGridParam', 'selarrrow');
		for(int i=0; i < selRowIds.length; i++)
		{
		 $.ajax({
	            type: "POST",
	            url: "nominatetrainee",
	            dataType: "json",
	            data: $("#traineeNominate").serialize(),
	            success: function() {
	                alert('Inserted!');
	            }
	   });
		}
	});
	*/
		  
});
	});
</SCRIPT>

<body>
<form id="traineeNominate">
<div align="center" width="100">
<br>
<div id="heading" class="title" align="left">Trainee</div>
<br>
<table id="TraineeNominateTBL" width="100%"></table>
<div id="TraineeNominateTBLPageDiv"></div>
</div>
<input type="hidden" id="query" value="">
<br>
<br>
<div class="contextMenu" id="myMenu1" style="display:none">
    <ul style="width: 100px">
        <li id="NominateTrainee">
           <span class="ui-icon ui-icon-plus" style="float:left"></span>
           <span style="font-size:11px; font-family:Verdana">Nominate</span>
        </li>
     </ul>
 </div>
 <div id="Nominate_details" title="Nominate Program Details" style="display:none;"> </div>
</form>
</body>
</html>