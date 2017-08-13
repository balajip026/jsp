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

//alert("on ready in TakeAttendance==================");
var trainingstartdate = $("#trainingstartdate1").val();
//alert("trainingstartdate======================"+trainingstartdate);

var trainingstartdateformat=Date.parse(trainingstartdate.toString('d-MM-yy'));
//alert("bhar======================"+trainingstartdateformat);
//$("#trainingstartdate").val().text(Date.parse($("#traineeNomEndDate").text()).toString('dd-MMM-yyyy'));

var trainingenddate = $("#trainingenddate1").val();
//alert("trainingenddate======================"+trainingenddate);
var trainingenddateformat=Date.parse(trainingenddate.toString('d-MM-yy'));
//alert("rayala======================"+trainingenddateformat);
var checkedVal;
var programId = $("#programId1").val();
//alert("programId======================="+programId);
$("#TraineeDetailsForSpecificProgramTBLAttendanceEligibility").jqGrid({
	 url :'TrainerAttendanceEligibilityForGrid?programId='+programId,//?attendancedate='+selectedDate,
	datatype : "json",
	jsonReader : { repeatitems : false,
                   root : 'attendanceEligibilitylist', 
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
    colNames : ['id','programId','traineeId','Eligibility %','Actual %','iseligible','comments','updateUser'],	
	colModel : [{ name : 'id',index : 'id', align : "center", sortable:true,editable : false, key : true,editoptions: {disabled: true}},
	             { name : 'programMainteanceForAttendanceEligibility.programId',index : 'programMainteanceForAttendanceEligibility.programId', align : "center", sortable:true,editable : false},
                 { name : 'traineeId',index : 'traineeId', align : "center", sortable:true,editable: false, editoptions: {disabled: true}},
	             { name : 'attendanceEligibilityPer',index : 'attendanceEligibilityPer', align : "center", sortable:true,editable: false},
	             { name : 'calcPerTemp',index : 'calcPerTemp', align : "center", sortable:true,editable: false},
	             { name : 'iseligible',index : 'iseligible', align : "center", sortable:true,editable : true,edittype:"checkbox",formatter: "checkbox", editoptions: {value: "Y:N" }, formatoptions: { disabled: false }},
	             { name : 'comments',index : 'comments', align : "center", sortable:true,editable : true,edittype:'text',formatter: "text", formatter:function(cellvalue, options, rowObject){
		              if (cellvalue == '{null}') {
			              cellvalue="";
					      }
				      return cellvalue;  }},
		         { name : 'updateUser',index : 'updateUser', align : "center", sortable:true}
			      ],
				rowNum : 15,
				rowList : [ 15, 20, 30],
				loadatonce : false,
				viewrecords : true,
				mtype : "GET",
				height: 250,
				width: 550,
				gridview : true,
				sortname : 'id',
				sortorder : "desc",
				caption : "Trainee Attendance Eligibility",
				onSelectRow: function(rowid){
	        checkedVal = rowid;
	        var lastSel;
	        if(rowid && rowid!==lastSel){ 
	            $('#TraineeDetailsForSpecificProgramTBLAttendanceEligibility').saveRow(lastSel); 
	            lastSel=rowid; 
	         }
	         $('#TraineeDetailsForSpecificProgramTBLAttendanceEligibility').editRow(rowid,true);
	      
           // alert("comments============="+comments);
       }//on select row
});//grid complete
//first time loading the grid end
});//end document.onready
</script>
<form name="Trainer_Attenedance_Eligibility_form" id="Trainer_Attenedance_Eligibility_form" theme="simple" > 
<div align="center" class="swMain"> 
<table align="center">
 	 <tr><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td></tr>
     <tr><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td></tr>
</table>
<table id="TraineeDetailsForSpecificProgramTBLAttendanceEligibility" width="100%"></table>
</div>  
<s:hidden id="programId1"  name="programId1" key="programId1" ></s:hidden>
<s:hidden id="trainingstartdate1"  name="trainingstartdate1" key="trainingstartdate1" ></s:hidden>
<s:hidden id="trainingenddate1"  name="trainingenddate1" key="trainingenddate1" ></s:hidden> 
<input type="hidden" id="freezeAttendacenElgFlag"  name="freezeAttendacenElgFlag" value='<s:property value="%{freezeFlag}"/>'>
</form> 
<body>
</body>  
</html>