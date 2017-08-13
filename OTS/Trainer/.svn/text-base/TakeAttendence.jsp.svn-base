<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<SCRIPT type="text/javascript">
$(document).ready(function(){
//alert("on ready in TakeAttendance");
var checkedVal;
var programId = $("#programId1").val();
//alert("programId========outside==========="+programId);
//delete the attendance list for selected date ramana_27_12
$("#delete").click(function() {
		  //alert("Handler for  delete click() called.");
		var TakeAttendancebasedOnDatepicking=$("#TakeAttendancebasedOnDatepicking").val();
	if (TakeAttendancebasedOnDatepicking==""){
       jAlert("Please select date before taking attendance per a particular day","Information");
       return false;
       }else{
		  programId = $("#programId1").val();
		var selectedDate=$( "#TakeAttendancebasedOnDatepicking").val();
		//alert("programId=============="+programId);
		$.ajax({		             
          url: "delattendancesheet.action?attendancedate="+selectedDate,
          cache : true,
          success: function(data){
          jAlert("Attendance sheet deleted for the selected date","Information");
          },
	         error:function(data){
	         alert("Error :: "+data);
	       }});
}//else
		});
//useful these
var trainingstartdate = $("#trainingstartdate1").val();
var trainingstartdateformat=Date.parse(trainingstartdate.toString('d-MM-yy'));
//alert("trainingstartdateformat============="+trainingstartdateformat);
var trainingenddate = $("#trainingenddate1").val();
var trainingenddateformat=Date.parse(trainingenddate.toString('d-MM-yy'));
//alert("trainingenddateformat============="+trainingenddateformat);
$(function() {
		$("#TakeAttendancebasedOnDatepicking").datepicker({
	    changeMonth: true,
		changeYear: true,
		dateFormat: 'd-M-yy',
		minDate:trainingstartdateformat,
		maxDate:trainingenddateformat
	});
	 $("#TakeDateAndGo").click(function() {
		 var TakeAttendancebasedOnDatepicking=$("#TakeAttendancebasedOnDatepicking").val();
		    if (TakeAttendancebasedOnDatepicking==""){
         jAlert("Please select date before taking attendance per a particular day","Information");
         return false;
         }else{
		 programId = $("#programId1").val();
		var selectedDate=$( "#TakeAttendancebasedOnDatepicking").val();
		//$('#TraineeDetailsForSpecificProgramTBL').jqGrid('trigger','reloadGrid');
		$("#TraineeDetailsForSpecificProgramTBL").jqGrid("GridUnload");
	        $("#TraineeDetailsForSpecificProgramTBL").jqGrid({
	        	url :'listTraineeDetailsForAttendingClass?attendancedate='+selectedDate+'&programId='+programId,//?attendancedate='+selectedDate,
 			datatype : "json",
 			jsonReader : { repeatitems : false,
 	                     root : 'attendancelist', 
 	                     //root : 'model',
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
 		    colNames : ['id','programId','traineeId','isattended','comments','attendanceDate','updateUser'],//	
 			colModel : [ { name : 'id',index : 'id', align : "center", sortable:true,editable : false, key : true,hidden:true,editable: true, editoptions: {disabled: true}},
 			            { name : 'programMainteanceForAttendance.programId',index : 'programMainteanceForAttendance.programId', align : "center", sortable:true,editable : false},
 		                { name : 'traineeId',index : 'traineeId', align : "center", sortable:true,editable: false, editoptions: {disabled: true}},
 		                { name : 'isattended',index : 'isattended', align : "center", sortable:true,editable : true,edittype:'checkbox',formatter: "checkbox", editoptions: {value: "Y:N" }, formatoptions: { disabled: false }},
 				        { name : 'comments',index : 'comments', align : "center", sortable:true,editable : true,edittype:'text',formatter: "text",formatter:function(cellvalue, options, rowObject){
 				              if (cellvalue == 'null') {
 					              cellvalue="";
 							      }
 						      return cellvalue;  }},
 				         { name : 'attendanceDate',index : 'attendanceDate', align : "center", sortable:true},
 				         { name : 'updateUser',index : 'updateUser', align : "center", sortable:true, hidden : true}
 					      ],
 						rowNum : 15,
 						rowList : [ 15, 20, 30],
 						loadatonce : false,
 						viewrecords : true,
 						mtype : "GET",
 						//toolbar:[true,"top"],
 						height: 150,
 						width: 550,
 						gridview : true,
 						sortname : 'id',
 						sortorder : "desc",
 						caption : "Trainee Details For attending Specific Prgoram",
 						//celledit: true, 	 
 				        //cellsubmit: "remote",
						onSelectRow: function(rowid){
					        checkedVal = rowid;
					        var lastSel;
					        if(rowid && rowid!==lastSel){ 
					            $('#TraineeDetailsForSpecificProgramTBL').saveRow(lastSel); 
					            lastSel=rowid; 
					         }
					         $('#TraineeDetailsForSpecificProgramTBL').editRow(rowid,true);
					      
		                   // alert("comments============="+comments);
	           			}//on select row
 						
        		 });//grid complete
	 }//else
		});//click
});
//first time loading the grid start
$("#TraineeDetailsForSpecificProgramTBL").jqGrid("GridUnload");
$("#TraineeDetailsForSpecificProgramTBL").jqGrid({
	// url :'listTraineeDetailsForAttendingClass?attendancedate='+selectedDate,//?attendancedate='+selectedDate,
	datatype : "json",
	jsonReader : { repeatitems : false,
                 root : 'attendancelist', 
                 //  root : 'model',
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
    colNames : ['id','programId','traineeId','isattended','comments','attendanceDate','updateUser'],//	
	colModel : [ { name : 'id',index : 'id', align : "center", sortable:true,editable : false, key : true,hidden:true,editable: true, editoptions: {disabled: true}},
	            { name : 'programMainteanceForAttendance.programId',index : 'programMainteanceForAttendance.programId', align : "center", sortable:true,editable : false},
                { name : 'traineeId',index : 'traineeId', align : "center", sortable:true,editable: true, editoptions: {disabled: true}},
	             { name : 'isattended',index : 'isattended', align : "center", sortable:true,editable : true,formatter: "checkbox", editoptions: { value: "Yes:No" }, formatoptions: { disabled: false }},
		         { name : 'comments',index : 'comments', align : "center", sortable:true,editable : true,edittype:'text',formatter: "text",formatter:function(cellvalue, options, rowObject){
		              if (cellvalue == 'null') {
				              cellvalue="";
						      }
					      return cellvalue;  }},
		         { name : 'attendanceDate',index : 'attendanceDate', align : "center", sortable:true},
		         { name : 'updateUser',index : 'updateUser', align : "center", sortable:true, hidden : true}
			      ],
				rowNum : 15,
				rowList : [ 15, 20, 30],
				pager : '#TraineeDetailsForSpecificProgramTBLPageDiv',
				loadatonce : false,
				viewrecords : true,
				mtype : "GET",
				//toolbar:[true,"top"],
				height: 150,
				width: 550,
				gridview : true,
				sortname : 'id',
				sortorder : "desc",
				caption : "Trainee Details For attending Specific Prgoram"
				//celledit: true, 	 
		        //cellsubmit: "remote",
		});//grid complete
//first time loading the grid end
});//end document.onready
</script>
<form name="Trainer_Take_Attenedance_form" id="Trainer_Take_Attenedance_form"  > 
<div align="center" class="swMain"> 
<fieldset>
<legend>Fetch/Prepare/Delete</legend>
&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<table align="right">
    <tr ><td align="left">Attendance Taking Date:</td>
 <td><input type="text" id="TakeAttendancebasedOnDatepicking"  name="TakeAttendancebasedOnDatepicking" readonly="readonly"></td>
    <td align="right"><div id="TakeDateAndGo">
    <input type="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" value="Fetch/Prepare Sheet"  /><span class="ui-button-text"/>
  </div> </td>
    <td align="left"><div id="delete">
    <input type="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" value="Delete Sheet"  /><span class="ui-button-text"/>
     </div></td>
    </tr>
</table><br>
</fieldset>
<br>
<table id="TraineeDetailsForSpecificProgramTBL" width="100%"></table>
<div id="TraineeDetailsForSpecificProgramTBLPageDiv"></div>
</div>  
<s:hidden id="programId1"  name="programId1" key="programId1"></s:hidden>
<s:hidden id="trainingstartdate1"  name="trainingstartdate1" key="trainingstartdate1" ></s:hidden>
<s:hidden id="trainingenddate1"  name="trainingenddate1" key="trainingenddate1" ></s:hidden>
<input type="hidden" id="freezeAttendanceFlag"  name="freezeAttendanceFlag" value='<s:property value="%{freezeFlag}"/>'></form> 
<body>
</body>  
</html>