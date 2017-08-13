<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.vit.bean.ots.trainee.*"%>
<%@ page import="com.vit.action.ots.program.programMainteance"%>
<%@ page import="com.vit.bean.ots.trainer.TrainerNominate"%>
<%@ page import="com.vit.bean.ots.trainer.EmpMaster"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.vit.ots.utils.OTSConstants"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<STYLE type="text/css">
	fieldset.form
		{
		   width: 315px;
		   height: 300px;
		}
	
	fieldset.form legend 
		{
			font-size: 1.1em;
			line-height: 1.2em;
			font-weight: bold;
			color: #fff;
			padding: 1px;
			margin-bottom: 12px;
			padding-top: 4px;
		}
	.leftnav 
		{
		   height:300 px; 
		   float: left;
		   width:375px;
		    border-right: 1px solid #003D7A;
		}
	
	.rightContent 
		{
		   min-height: 250px;
		   float:left;
		}
</STYLE>
<SCRIPT type="text/javascript">

$(document).ready(function(){

var checkedVal; 
var programId = $("#programId").val();
var selRowId = $("#TrainingSearchTBL").jqGrid ('getGridParam', 'selrow');
var traineeAllocation = $("#TrainingSearchTBL").jqGrid ('getCell', selRowId, 'traineesAllocationFlag');
var data = $("#selectDiv").html();

  $("#locationTBL").jqGrid({
		url:'TraineeFreezeData1.action?programId='+programId,
       	datatype: "json",
		jsonReader: {
			repeatitems : false,
			//root :'traineeNominationList',
			root :'traineeNominationFreezeList',
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
		 colNames : [ 'program Id', 'Trainee Name', 'Nomination Status', 'UpdateTimeStamp'],
		 colModel : [ { name : 'proMainteanceTrainee.programId',index : 'proMainteanceTrainee.programId ', align : "center", hidden : true}, 
					  { name : 'empMaster.FName',index : 'empMaster.FName', align : "center", key : true },
					  // { name : 'empMaster.fName',index : 'empMaster.fName', align : "center" },
			          { name : 'traineeStatus',index : 'traineeStatus', align : "center",
				        formatter:function(cellvalue, options, rowObject){
			              if (cellvalue == 'TENCF') {
				              cellvalue="Trainee Nomination Confirmed";
						      }
					      return cellvalue;  }},
				      { name : 'updateTimestamp',index : 'updateTimestamp', align : "center", hidden : true}],  
        //rowNum : 10,
		//rowList : [ 10, 20, 30 ],
		//pager : '#locationNavTBL',
		loadatonce : true,
		viewrecords : true,
		//height : 93,
		height : 180,
		//multiselect: true,
		sortorder : "desc",
		sortname : "proMainteanceTrainee.programId",
		onSelectRow : function(traineeId){
			checkedVal = traineeId;
			//alert(checkedVal);
	   }

  });
  

	 $("#locationTBL").jqGrid('navGrid', '#locationNavTBL', {
				add : false,
				edit : false,
				del : true,
				search : false,
				view : false,
				refresh:false
			});  
  
    // Add Button Function 
	$("#locAdd").click(function(){   

	      //alert($('#nominatedTrainees').val());
	      var postQueList = "programId="+programId+"&freezeList="+$('#nominatedTrainees').val();
	      //alert(postQueList);
	      $.post('TraineeFreezeAction.action',postQueList, function(data) {
	    	 $("#locationTBL").trigger("reloadGrid"); 
	    	 $('#location').change();
	     });
	});
			 
	
  // Location Select Function :  
	$(function() {
		$.post("locationDetails",null,function(data){
	
		        var locationSelect = $('#location').empty();
		        locationSelect.append( '<option value=>Select...</option>' ); 
		        $.each(data.locationDetails, function(locObject) {
		        	locationSelect.append( '<option value="'
		                                 + data.locationDetails[locObject]
		                                 + '">'
		                                 + data.locationDetails[locObject]
		                                 + '</option>' ); 
			       });
			  });
	     }); //End 
  	
	$('#location').change(function(){
		var parameter = "location="+$('#location').val()+"&programId="+$("#hidProgramId").val();
		$.post("traineeidbylocation",parameter,function(data){
	        var nominatedTraineesSelect = $('#nominatedTrainees').empty();
	        nominatedTraineesSelect.append( '<option value=TRAI>Select Nominated Trainees.....</option>');
            // locationlist Method on change values 
	        $.each(data.locationlist, function(locObject) {
	        	nominatedTraineesSelect.append( '<option value="'
	                                 + data.locationlist[locObject]
	                                 + '">'
	                                 + data.locationlist[locObject]
	                                 + '</option>' ); 
		       });
		   });
	   });
	   
	 $(function(){

		   if( traineeAllocation == '<%=OTSConstants.TRAINEE_ALLOCATION_AUTO %>' ){
				$("#locAdd").attr("disabled","disabled");
			}
	   });
	
	  
});
</SCRIPT>
<style type="text/css">
@import url("${pageContext.request.contextPath}/stylesheet/Jquery/wizard/demo_style.css");
@import url("${pageContext.request.contextPath}/stylesheet/Jquery/wizard/smart_wizard.css");
</style>
</head>

<body>
<s:form name="TraineeFreeze" id="TraineeFreeze" theme="simple">
<div id="locationDetails" >	
<div id="locationSets">
<table><tr><td><div style="float: left;" class="leftnav">
<fieldset class="form" ><legend style="color: #fffFFF; background: #185994; border: 1px solid #781351; padding: 2px 8px; "><b>Nomination Details</b></legend>
            <table>
            	
		            <tr>
					   <td align="left">Program Id :</td><td align="left"> <s:property value="programId"/></td>
				    </tr>
		            <tr>
            	        <td><s:label value="Location:" labelposition="left" ></s:label></td>
            	    	<td><select id="location" name="location"> <option value="">Select...</option></select></td>
             	 	    <s:hidden id="hidProgramId" value="%{programId}"></s:hidden>
             	 	    <td>&nbsp;&nbsp;&nbsp;</td>
             	 	 </tr>
             	 	 <tr><td>&nbsp;</td></tr>
            	    <tr> 
             	 		<td><s:label value="Nominated Trainees:" labelposition="left" ></s:label></td> 
             	 		<td><select id="nominatedTrainees" name="nominatedTrainees" multiple='multiple' size="8" >
             	 		    <option value="TRAI">Select nominated trainees.....</option></select></td>
					</tr>
					
				    <tr><td>&nbsp;</td></tr>
               	    <tr> 
		            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            	    <td align="right"><input type="button" id="locAdd" value="Save" class="fm-button ui-state-default ui-corner-all fm-button-icon-center"></td>
             	 	</tr>
             	 	</table>
  </fieldset> 
  </div>
  <div style="float: right;">
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <fieldset class="form" ><legend style="color: #fffFFF; background: #185994; border: 1px solid #781351; padding: 2px 8px;"><b>Confirm Nominees</b></legend>
		<table id="locationTBL"></table>
		<div id="locationNavTBL"></div>
  </fieldset>
  </div>

</td>
</tr>
</table>
</div>
</div>
</s:form>
<s:hidden id="programId"  name="programId" key="programId" ></s:hidden>
</body>

</html>
