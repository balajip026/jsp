<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Program</title>
</head>
<%
String CourseNameEdit=request.getParameter("CourseNameEdit");
%>
<input type="hidden" id="CourseNameEdit" name="CourseNameEdit" value="<%=CourseNameEdit%>">

<%@include file="../CommonJSs.jsp" %>
<STYLE type="text/css">
.resizedTextbox {width: 150px; height: 15px; padding: 1px}
.mywidth{width:150px; height: 25px;}

 .input-row {
    display: block;
    width: 100%;
    height: 20px;
    clear: both; 
    overflow: hidden; /* stretch to contain floated children */
    margin-bottom: 10px;
}

</STYLE>
<SCRIPT type="text/javascript">
$(document).ready(function(){

	//bhargavi written end

	var CourseNameEditPage=$("#CourseNameEdit").val();//from setQuestions.jsp
	//alert("CourseNameEditPage======="+CourseNameEditPage);
	var courseName = $("#courseName").val();
	var selectedSetId = $("#selectedSetIdHid").val();
	var setQuestions = new Array();
	var DelQuestions = new Array();
	var selectRowDeatils = new Array();
	var selectRowDets = new Array();
    var totalTraineesInLocation;
    var totalNoOfTrainees;
	var programId ;
	
	$("#editWizard").tabs();
	$("#editWizard").tabs({
	    select: function(event, ui) {
	       if(ui.index == 2){
	    	      $('#quetionDisp').html('');
				  var flag = true;
				  var html = "";
				  var val=$('input:checkbox:checked').length;
				  var tot=$("#noofquestionslist").val();
				  $.each(selectRowDets, function (index, idata) {
					  //alert(selectRowDets[index]);
					  var $table = $('<table>');
					  $table.appendTo("");
					  var $tbody = $table.append('<tbody />').children('tbody');
					  $tbody.append('<tr />').children('tr:last')
					  .append("<td>"+(index+1)+"  :"+selectRowDets[index]+"</td>");
					  $table.appendTo('#quetionDisp');
					});
	       	}
	    }
	});
	$("#sub").hide();
	$("#obj").hide();
	$("#q").hide();
	$("#o").hide();

		$(function() {
			$.ajax({
				url:"courseDetails.action",
				type: "POST", 
				success:function(data){
			        var courseSelect = $('#courseName').empty();
				        courseSelect.append( '<option value=>--Course--</option>' ); 
				        $.each(data.courseDetails, function(locObject) {
				        	courseSelect.append( '<option value="'
				                                 + data.courseDetails[locObject].courseId
				                                 + '">'
				                                 + data.courseDetails[locObject].courseName
				                                 + '</option>' ); 
			                });
					},
				 async:false
            });
		});
		$(function() {
			$.ajax({
				url:"EditSetQuestions.action",
				data:"selectedSetId="+selectedSetId,
				type: "POST", 
				success:function(data){
							//$("#courseName").val(data.questionSet.courseName);
							  $('#courseName').attr("value",CourseNameEditPage);
							courseName = data.questionSet.courseName;
							$("#setName").val(data.questionSet.setName);
							$("#setDescription").val(data.questionSet.setDescription);
							$("#noofquestionslist").val(data.questionSet.setNoQuestions);
							$("#simpleQuestionsforMarks").val(data.questionSet.SWeightage);
							$("#mediumQuestionsforMarks").val(data.questionSet.MWeightage);
							$("#complexQuestionsforMarks").val(data.questionSet.CWeightage);
							$("#courseName").trigger("change");
				},
				async:false
			});
		});

			 $("#courseName").change(function(){
				courseName = $("#courseName").val();
				$("#QuestionTBL").jqGrid('setGridParam', { url: 'listQuestionsForSetPreparation.action?courseName='+ courseName}).trigger("reloadGrid");		
			});


///  QUESTIONS LIST FROM QBANK START**************************************************************************************
 $("#QuestionTBL").jqGrid({
			url : 'listQuestionsForSetPreparation.action?courseName='+CourseNameEditPage,
			datatype : "json",
			jsonReader : {
				repeatitems : false,
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
			},colNames : ['qid','Subject Code','Topic Code', 'Complexity','Question','Question type','ObjectiveA','ObjectiveB','ObjectiveC','ObjectiveD','Objective Answer','subject Answer','updateUser'],
			colModel : [{name: 'qid', index: 'qid', editable: true, hidden:true,key:true },
						{name : 'subjectsForQuestionBabk.subjectCode',index : 'subjectsForQuestionBabk.subjectCode',align : "center",editable : true,edittype : 'select'}, 		
						{name : 'topicsForQuestionBank.topicCode',index : 'topicsForQuestionBank.topicCode',align : "center",editable : true,edittype : 'select'}, 			  	  
						{name : 'complexity',index : 'complexity',align : "center",
							formatter:function(cellvalue, options, rowObject){
				              if (cellvalue == 's' || cellvalue == 'S') {
					              cellvalue="Simple";
							      } else if(cellvalue == 'm' || cellvalue == 'M') {
				            		  cellvalue="Medium";
				              }else{
					              cellvalue="Complex";
				              }return cellvalue;
				              },editable : true,edittype : 'select'},
						{name : 'question',index : 'question',align : "center",editable : true,edittype : 'textarea'},
						{name : 'questiontype',	index : 'questiontype',align : "center",
							formatter:function(cellvalue, options, rowObject){
				              if (cellvalue == 's'|| cellvalue == 'S') {
					              cellvalue="Subjective";
							      } else if(cellvalue == 'o' || cellvalue == 'O') {
				            		  cellvalue="Objective";
				              }return cellvalue;
				              },editable : true,edittype : 'select'},
						{name : 'objectiveA',	index : 'objectiveA',align : "center",editable : true,hidden:true,edittype : 'select'},
						{name : 'objectiveB',	index : 'objectiveB',align : "center",editable : true,hidden:true,edittype : 'select'},
						{name : 'objectiveC',	index : 'objectiveC',align : "center",editable : true,hidden:true,edittype : 'select'},
						{name : 'objectiveD',	index : 'objectiveD',align : "center",editable : true,hidden:true,edittype : 'select'},
						{name : 'objectiveAnswer',	index : 'objectiveAnswer',align : "center",editable : true,hidden:true,edittype : 'select'},
						{name : 'subjectAnswer',	index : 'subjectAnswer',align : "center",editable : true,hidden:true,edittype : 'select'},
						{name : 'updateUser',	index : 'updateUser',align : "center",editable : true,hidden:true,edittype : 'select'}],
						pager : '#QuestionTBLPageDiv',
						loadatonce : false,
						viewrecords : true,
						mtype : "POST",
						multiselect: true,
						height: 100,
						width: 950,
						gridview : true,
						sortname : 'question',
						caption : "Toolbar Searching",
						sortorder : "desc",
						caption : "&nbsp; Questions Details",
						ajaxRowOptions: { async: true } ,
						onSelectRow : function(id,object,status){
							var gridObject = $("#QuestionTBL");
							//this is for hidding the top select box
  							gridObject.closest('div.ui-jqgrid-view').find('table.ui-jqgrid-htable th input[type="checkbox"]').hide();
  								var selRowId = gridObject.jqGrid ('getGridParam', 'selrow');
  								var Question  = gridObject.jqGrid ('getCell', selRowId, 'question');
  								$("#ques").text(Question);
  								if(object){
  									selectRowDeatils.push(selRowId);
  									selectRowDets.push(Question);
  									 $.each(DelQuestions, function (index, idata) {
	  						             if(idata == id){
	  						            	DelQuestions.splice(index, 1);
	  						             }
						       			});
  								}else{
	  							       $.each(selectRowDeatils, function (index, idata) {
		  						             if(idata == id){
		  						            	selectRowDeatils.splice(index, 1);
		  						            	selectRowDets.splice(index, 1);
		  						            	
		  						             }
  						       			});
	  							     DelQuestions.push(id);
  								}
  								var Questype = gridObject.jqGrid ('getCell', selRowId, 'questiontype');
	  								if(Questype == "Subjective"){
		  							$("#sub").show();
  									$("#obj").hide();
  									$("#o").hide();
  									$("#q").show();
  									}else if(Questype == "Objective"){
  										$("#sub").hide();
  										$("#obj").show();
  										$("#o").show();
  										$("#q").show();
  									}
  								var answ = gridObject.jqGrid ('getCell', selRowId, 'subjectAnswer');
  								$("#ans").text(answ);
  								var objecta = gridObject.jqGrid ('getCell', selRowId, 'objectiveA');
	  							$("#ans1").text(objecta);
	  							var objectb = gridObject.jqGrid ('getCell', selRowId, 'objectiveB');
	  							$("#ans2").text(objectb);
	  							var objectc = gridObject.jqGrid ('getCell', selRowId, 'objectiveC');
	  							$("#ans3").text(objectc);
	  							var objectd = gridObject.jqGrid ('getCell', selRowId, 'objectiveD');
	  							$("#ans4").text(objectd);
	  							var objAns= gridObject.jqGrid ('getCell', selRowId, 'objectiveAnswer');
	  							$("#oAns").text(objAns);
	  						},
	  						onSelectAll: function(aRowids,status){
		  				    	  selectedSetId = aRowids;	
		  				       },
  						loadComplete: function() {
		  							// getting question of set 
		  							$.ajax({
		  							url:"listQuestionsBySet",
		  							data:"selectedSetId="+selectedSetId,
		  							type: "POST", 
		  							success:function(data){
		  									var listQuestions = data.questionListForSet;
		  										$.each(listQuestions ,function(index){
		  											//alert("in loop================="+listQuestions[index].questionBankForSetquestionsInQustionSet.qid);
		  												setQuestions.push(listQuestions[index].questionBankForSetquestionsInQustionSet.qid);
		  												$('#QuestionTBL').jqGrid('setSelection',listQuestions[index].questionBankForSetquestionsInQustionSet.qid);
		  											
		  										});
		  									//alert(setQuestions);
		  							},
		  							async:false
		  						});
	  							// getting question of set 
	  						}
  						
				});
///  QUESTIONS LIST END**************************************************************************************
	$("#QuestionTBL").jqGrid('navGrid','#QuestionTBLPageDiv',
	{
		edit : false,
		add : false,
		del : false,
		search : true,
		view : false
	}, //options
	{
		reloadAfterSubmit : true,
		closeAfterEdit : true,
		closeOnEscape : true,
		beforeShowForm : function(){
			$(".navButton").hide(); 
		}
	}, //Multi Search  
	{
		multipleSearch : true,
		closeOnEscape : true,
		groupOps : [ {
			op : "AND",
			text : "AND"
		}, {
			op : "OR",
			text : "OR"
		} ],
		matchText : "Find",
		rulesText : " matches",
		sopt : [ 'cn', 'bw', 'eq', 'ne', 'lt', 'le',
				'gt', 'ge', 'ew' ],
		onSearch : function(params, postdata) {
			$("#gs_TOPIC_CODE").val("");
			$("#gs_COMPLEXITY").val("");
			$("#gs_UPDATE_USER").val("");
			$("#QuestionTBL").jqGrid('setGridParam', {
				url : "listSearchQuestions" 
			});
		},
		reloadAfterSearch : true
		
	});	

	///  QUESTION LIST **************************************************************************************
		$("#btnEdit").click(function(){
			 //bhargavi put validation for checkbox start
			 var setName=$("#setName").val(); 
			 var courseName=$("#courseName").val();
			 var setDescription=$("#setDescription").val();
			 var noofquestionslist=$("#noofquestionslist").val();
			 var simpleQuestionsforMarks=$("#simpleQuestionsforMarks").val(); 
			 var mediumQuestionsforMarks=$("#mediumQuestionsforMarks").val();
			 var complexQuestionsforMarks=$("#complexQuestionsforMarks").val();
			 
			if(($("#setName").val() == "" ) || ($("#setName").val()== null)|| setName.trim().length==0 ){
				jAlert("Please Specify Set Name ","Information");
				return false;
			}

			if(($("#setDescription").val() == "" ) || ($("#setDescription").val()== null)|| setDescription.trim().length==0 ){
				jAlert("Please Specify Set Description ","Information");
				return false;
			}

			if(($("#noofquestionslist").val() == "" ) || ($("#noofquestionslist").val()== null)|| noofquestionslist.trim().length==0 ){
				jAlert("Please Specify No. of Questions ","Information");
				return false;
			}

			if(($("#mediumQuestionsforMarks").val() == "" ) || ($("#mediumQuestionsforMarks").val()== null)|| mediumQuestionsforMarks.trim().length==0 ){
				jAlert("Please Specify mediumQuestionsforMarks ","Information");
				return false;
			}

			if(($("#complexQuestionsforMarks").val() == "" ) || ($("#complexQuestionsforMarks").val()== null)|| complexQuestionsforMarks.trim().length==0 ){
				jAlert("Please Specify complexQuestionsforMarks ","Information");
				return false;
			}
			
			 //end validations
			var val = $('input:checkbox:checked').length;
			var tot = $("#noofquestionslist").val();
			var url = "editSaveSetQuestion?id="+ selectRowDeatils+"&selectedSetId="+selectedSetId;
			var postList = $("#editQuestionForm").serialize();
			
			//$.post(url,postList, function(data) {
			if (tot == val) {
				if(DelQuestions.length > 0 ){
					$.ajax({
						url:"deleteQuestionsFromSet.action",
						data:"selectedSetId="+selectedSetId+"&deleteQuestionIds="+DelQuestions,
						type: "POST", 
						success:function(data){
							$("#editQuestionForm").attr("action",url);
							$("#editQuestionForm").submit();
						},
						async:false
		
					});
				}else{
					$("#editQuestionForm").attr("action",url);
					$("#editQuestionForm").submit();
				}
			} else {
				//bhargavi want here step1 validation
				jAlert("Please select no of questions = "+ tot);
			}
		});
$("#btnCancel").click( function() {
	$("#editQuestionForm").attr("action","SetQuestions.action");
	$("#editQuestionForm").submit();
		});	
	});
	

</SCRIPT>
<style type="text/css">
@import url("${pageContext.request.contextPath}/stylesheet/Jquery/wizard/demo_style.css");
@import url("${pageContext.request.contextPath}/stylesheet/Jquery/wizard/smart_wizard.css");
</style>

<body> 
<form id="editQuestionForm" name="editQuestionForm" method="post" action="addSetQuestion"> 
<br>
<div id="heading" class="title">Edit SetQuestion</div>
<br>
 <table align="center" border="0" cellpadding="0" cellspacing="0" width="95%">
<tr><td>
<div id="editWizard" class="tabsContent" >
<ul>
  				<li><a href="#setQuestionDetails">
                <label class="stepNumber">1</label>
                <span class="stepDesc">
                   Question Set Details<br />
                   <small></small>
                </span>
            </a></li>
  				<li><a href="#setQuestionDetails1">
                <label class="stepNumber">2</label>
                <span class="stepDesc">
                  Set Question Details<br />
                   <small></small>
                </span>
            </a></li>
  				<li><a href="#locationDetails">
                <label class="stepNumber">3</label>
                <span class="stepDesc">
                   Summary<br />
                   <small></small>
                </span>                   
             </a></li>
  			</ul>
  			
  		<!-- Wizard1  -->	
<div id="setQuestionDetails">	
            <h2 class="StepTitle"></h2>
             <table align="center" width="600"><tr><td>
   			 <fieldset style="border: 2px ridge #185994; "> 
   			  <legend style="color: #fff; background: #185994; border: 1px solid #781351; padding: 2px 6px; "><b>Set Details</b></legend>
            <table align="center" >
            <tr><td>&nbsp;</td></tr>
            <tr>
          		<td><span style="color:red">*</span> Course Name : </td><td><select id="courseName" name="courseName" class="input-row" disabled="disabled"><option>Course</option></select></td>
            </tr>
             <tr><td>&nbsp;</td></tr>
            <tr>
            	<td><span style="color:red">*</span> Set Name : </td><td><input type="text" id="setName" name="setName" size="25" maxlength="45" class="resizedTextbox"  readonly="readonly"></td>
            </tr>
             <tr><td>&nbsp;</td></tr>
            <tr>
              	<td><span style="color:red">*</span> Set Description : </td><td><textarea id="setDescription" rows="2" cols="25" name="setDescription" maxlength="100" class="mywidth" ></textarea></td>
            </tr>
             <tr><td>&nbsp;</td></tr>
            <tr>
             	<td><span style="color:red">*</span> No Of Questions : </td><td><input type="text" id="noofquestionslist" name="noofquestionslist" size="6" class="resizedTextbox" maxlength="3"></td>
            </tr>
           <tr>
        		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            </tr>
            </table></fieldset>
         </td></tr></table>
            <!-- Marks for Questions -->
            <table align="center" width="600"><tr><td>
            <fieldset style="border: 2px ridge #185994; "> 
            <legend style="color: #fff; background: #185994; border: 1px solid #781351; padding: 2px 6px; "><b>Marks for Questions</b></legend>
             <table align="center" >
          	<tr>
          		<td><span style="color:red">*</span> Simple Questions : </td><td><input type="text" id="simpleQuestionsforMarks" name="simpleQuestionsforMarks" size="6" class="resizedTextbox" maxlength="2"></td>
            </tr>  
            <tr>
               	<td><span style="color:red">*</span> Medium Questions  : </td><td><input type="text" id="mediumQuestionsforMarks" name="mediumQuestionsforMarks" size="6" class="resizedTextbox" maxlength="2"></td>
            </tr> 
        	<tr>
			    <td><span style="color:red">*</span> Complex Questions : </td><td><input type="text" id="complexQuestionsforMarks" name="complexQuestionsforMarks" size="6" class="resizedTextbox" maxlength="2"></td>
			</tr>	 	 <tr><td>&nbsp;</td></tr>
		   </table></fieldset> </td></tr></table>
</div>
			
			
			
<!-- SetQuestion Details1 For Wizards -->
<div id="setQuestionDetails1" >
			
		  <h2 class="StepTitle"></h2>
            <table id="QuestionTBL" width="100%"></table>
			<div id="QuestionTBLPageDiv"></div>
			<div id="dd"></div>  
            <div id="sample">
			<div id="q">
			<table>
			<tr><td>&nbsp;</td></tr>
			<tr><td><font color="#7FABC4">Question:</font></td><td>&nbsp;</td><td><b><font color="#185994"><span id="ques"></span></font></b></td>
			</tr></table>
			</div>
			<div id="obj">
			<table>
			<tr><td align="left"><font color="#7FABC4">Object A:</font></td><td>&nbsp;</td><td><font color="#185994"><span id="ans1"></span></font></td></tr>
   			<tr><td align="left"><font color="#7FABC4">Object B:</font></td><td>&nbsp;</td><td><font color="#185994"><span id="ans2"></span></font></td></tr>
     		<tr><td align="left"><font color="#7FABC4">Object C:</font></td><td>&nbsp;</td><td><font color="#185994"><span id="ans3"></span></font></td></tr>
		 	<tr><td align="left"><font color="#7FABC4">Object D:</font></td><td>&nbsp;</td><td><font color="#185994"><span id="ans4"></span></font></td></tr>
     		</table>
     	  	</div>
     	  	<div id='o'>
     		<table><tr><td><font color="#7FABC4">Objective Answer:</font></td><td>&nbsp;</td><td><b><font color="#185994"><span id="oAns"></span></font></b></td></tr>
     		</table>
     	  	</div>
			
			<div id="sub">
				<table><tr><td><font color="#7FABC4">Answer:</font></td><td>&nbsp;</td><td><b><font color="#185994"><span id="ans"></span></font></b></td>
			</tr></table>
			</div>
			</div>
            <br>
			
</div>
	<!-- SetQuestion Details for wizard 3 -->
<div id="locationDetails" >	
           <h2 class="StepTitle"></h2>
            <table><tr><td>
            <div id="quetionDisp" style="overflow:auto;">
            </div>
            </td></tr></table>
            <br>
</div>
</div>
<br>
<div id="editButtons">
<table align="right">
<tr align="right">
	<td align="right"><input type="button" value="Save" id="btnEdit" class="fm-button ui-state-default ui-corner-all fm-button-icon-left">&nbsp;&nbsp;
		<input type="button" value="Cancel" id="btnCancel" class="fm-button ui-state-default ui-corner-all fm-button-icon-left">&nbsp;&nbsp;
	</td>
</tr>
</table>
</div>

</td></tr></table>

<s:hidden value="%{examSetId}" id="selectedSetIdHid"></s:hidden>
</form>
</body>
</html>
