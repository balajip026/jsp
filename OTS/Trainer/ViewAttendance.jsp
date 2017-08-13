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
var programId = $("#programId").val();
//alert("======================="+programId);
var programIdReq = $("#programId").val();
//alert("programIdReq======== in TakeAttendance"+programIdReq);
$(function() {
	//alert("on ready in TaleAttendance");
	//Taking attendance start date
	$( "#ViewAttendancebasedOnDatepicking" ).datepicker({
	    changeMonth: true,
		changeYear: true,
		dateFormat: 'd-M-yy'
		/* onSelect: function(selected) {
         $("#TrainerPropStartDate").datepicker("option","minDate","maxDate",selected);
        }*/
			
	});
		
	//grid for taking attended trainees for particular program start
$("#TraineeDetailsForAttendedClassesViewTBL").jqGrid({
			url :'listTraineeDetailsViewAttendance?programId='+programId,
			datatype : "json",
			jsonReader : { repeatitems : false,
	                      root : 'traineeAttendancelist', 
						  // root : 'model',
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
		    colNames : [ 'ID','Program Id','Trainee ID', 'Is Attended','Comments','Attendance Date','update user'], 	
		    
			colModel : [ { name : 'id',index : 'id', align : "center", sortable:true,editable : false, key : true },
			             { name : 'programId',index : 'programId', align : "center", sortable:true},
						 { name : 'traineeId',index : 'traineeId', align : "center", sortable:true,editable : false},
			             { name : 'isattended',index : 'isattended', align : "center", sortable:true,editable : true},
			             { name : 'comments',index : 'comments', align : "center", sortable:true},
			             { name : 'attendanceDate',index : 'attendanceDate', align : "center", sortable:true},
			             { name : 'updateUser',index : 'updateUser', align : "center", sortable:true}
					      ],
						rowNum : 15,
						rowList : [ 15, 20, 30],
						pager : '#TraineeDetailsForAttendedClassesViewTBLPageDiv',
						loadatonce : false,
						viewrecords : true,
						mtype : "GET",
						toolbar:[true,"top"],
						height: 150,
						width: 550,
						gridview : true,
						sortname : 'id',
						sortorder : "desc",
						caption : "Trainee Details For View Attendance",
						onSelectRow: function(rowid){
					        checkedVal = rowid;
					       // alert("onSelectRow========"+checkedVal);
					       // $('#TraineeDetailsForAttendedClassesViewTBL').editRow(id, true); 
					         var lastSel;
					        if(rowid && rowid!==lastSel){ 
						       //for restoreing row 
					            $('#TraineeDetailsForAttendedClassesViewTBL').saveRow(lastSel); 
					            lastSel=rowid; 
					            //salert("lastSel========"+lastSel);
					         }
					         //for editing row
					         
					        // $("#TraineeDetailsForAttendedClassesViewTBL").jqGrid('editRow',true); 
					         $('#TraineeDetailsForAttendedClassesViewTBL').editRow(rowid,true);
					      /*  $("#TraineeDetailsForSpecificProgramTBL").jqGrid('editRow',rowid, 
					        		{ 
					        		    keys : true, 
					        		    oneditfunc: function(rowid) {
					        		        alert ("edited this row having rowid======="+rowid); 
					        		        //getting all cell values
					        		    }
		        		    
					        		}
			        		);
			        		//for saving row
					        jQuery("#TraineeDetailsForAttendedClassesViewTBL").jqGrid('saveRow',rowid, 
					        		{ 
					        		    successfunc: function( response ) {
					        		        return true; 
					        		    }
					        		});
			        		
					        $('#TraineeDetailsForAttendedClassesViewTBL').jqGrid("editCell", 0, 0, true);*/
					        $('#TraineeDetailsForAttendedClassesViewTBL').jqGrid("editCell", 0, 0, false);
					        var myTraineeAttendanceGrid = $('#TraineeDetailsForAttendedClassesViewTBL');
					        
                            var selRowId = myTraineeAttendanceGrid.jqGrid ('getGridParam', 'selrow');
                            var traineeId = myTraineeAttendanceGrid.jqGrid ('getCell', selRowId, 'traineeId');
                            //alert("traineeId"+traineeId);
                            
	        		        var isAttended = myTraineeAttendanceGrid.jqGrid ('getCell', selRowId, 'isAttended');
                           // alert("isAttended"+isAttended);
                            
                            var comments=myTraineeAttendanceGrid.jqGrid ('getCell', selRowId, 'comments');
                           // var com=comments.val();
                           // var test=$(comments).val(); 
                           // alert("comments============="+comments);
                            //alert("test============="+test);

                           var rowData = $(this).getRowData(rowid); 
                            //alert("rowData-----------"+rowData);
                        var temp= rowData['comments'];//replace name with you column
                            // alert("comments"+comments);
			           },
			           onCellSelect: function(rowid,iCol,cellcontent,e) {
			               //alert(cellcontent);
			           },
			           afterEditCell:function (rowid, cellname, value, iRow, iCol){
				          // alert(" afterEditCell==========="+rowid);
			        	  // document.getElementById(iRow+'_'+cellname);//.select();
			        	   
			        	    } 
			        /*   loadComplete: function() {
				           alert("loadcomplete");
				           alert("only for client side sorting=============");
			        	    $("#TraineeDetailsForAttendedClassesViewTBL").trigger("reloadGrid"); // Call to fix client-side sorting
			        	}*/
});
});
});//end document.onready
</script>
<form name="Trainer_View_Attenedance_form" id="Trainer_View_Attenedance_form" theme="simple"> 
<div align="center" class="swMain"> 
<fieldset style="border: 1px ridge #185994; width: 600px"><legend style="color: #fff; background: #185994; border: 1px solid #781351; padding: 2px 8px; "><b>Choose Dates</b></legend>
<table align="center">
 	 <tr><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td></tr>
    <tr>
    <td>View Attendance Date : </td><td><input type="text" id="ViewAttendancebasedOnDatepicking"  name="ViewAttendancebasedOnDatepicking"></td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
     <tr><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td></tr>
</table>
</fieldset>
<table id="TraineeDetailsForAttendedClassesViewTBL" width="100%"></table>
<div id="TraineeDetailsForAttendedClassesViewTBLPageDiv"></div>

</div>   
<s:hidden id="programId"  name="programId" key="programId" ></s:hidden>
</form> 
<body>
</body>  
</html>