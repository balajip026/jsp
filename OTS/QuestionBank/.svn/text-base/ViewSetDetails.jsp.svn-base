<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<%
String CourseNameEdit=request.getParameter("CourseNameEdit");
%>
<input type="hidden" id="CourseNameEdit" name="CourseNameEdit" value="<%=CourseNameEdit%>">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Program</title>
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
	var selectedSetId = $("#selectedSetIdHid").val();
	$("#selectedSetId").attr("value",selectedSetId);
	var programId ;
	var CourseNameEditPage=$("#CourseNameEdit").val();//from setQuestions.jsp
	//alert("CourseNameViewPage======="+CourseNameEditPage);
	
	$("#viewWizard").tabs();
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
				        courseSelect.append( '<option value=>Course</option>' ); 
				        courseData = data.courseDetails;
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
							$("#setName").val(data.questionSet.setName);
							$("#setDescription").val(data.questionSet.setDescription);
							$("#noofquestionslist").val(data.questionSet.setNoQuestions);
							$("#simpleQuestionsforMarks").val(data.questionSet.SWeightage);
							$("#mediumQuestionsforMarks").val(data.questionSet.MWeightage);
							$("#complexQuestionsforMarks").val(data.questionSet.CWeightage);
				},
				async:false
			});
		});

///  QUESTION LIST FROM QBANK START**************************************************************************************

	 $("#QuestionTBL").jqGrid({
			url : 'listQuestionsBySet?selectedSetId='+selectedSetId,
			datatype : "json",
			jsonReader : {
				root : 'questionListForSet',
				repeatitems : false,
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
			colModel : [{name: 'questionBankForSetquestionsInQustionSet.qid', index: 'questionBankForSetquestionsInQustionSet.qid', editable: true, hidden:true,key:true },
						{name : 'questionBankForSetquestionsInQustionSet.subjectsForQuestionBabk.subjectCode',index : 'questionBankForSetquestionsInQustionSet.subjectsForQuestionBabk.subjectCode',align : "center",editable : true,edittype : 'select'},
						{name : 'questionBankForSetquestionsInQustionSet.topicsForQuestionBank.topicCode',index : 'questionBankForSetquestionsInQustionSet.topicsForQuestionBank.topicCode',align : "center",editable : true,edittype : 'select'},
						{name : 'questionBankForSetquestionsInQustionSet.complexity',index : 'questionBankForSetquestionsInQustionSet.complexity',align : "center",
							formatter:function(cellvalue, options, rowObject){
				              if (cellvalue == 's') {
					              cellvalue="Simple";
							      } else if(cellvalue == 'm') {
				            		  cellvalue="Medium";
				              }else{
					              cellvalue="Complex";
				              }return cellvalue;
				              },editable : true,edittype : 'select'},
						{name : 'questionBankForSetquestionsInQustionSet.question',index : 'questionBankForSetquestionsInQustionSet.question',align : "center",editable : true,edittype : 'textarea'},
						{name : 'questionBankForSetquestionsInQustionSet.questiontype',	index : 'questionBankForSetquestionsInQustionSet.questiontype',align : "center",
							formatter:function(cellvalue, options, rowObject){
				              if (cellvalue == 's') {
					              cellvalue="Subjective";
							      } else if(cellvalue == 'o') {
				            		  cellvalue="Objective";
				              }return cellvalue;
				              },editable : true,edittype : 'select'},
						{name : 'questionBankForSetquestionsInQustionSet.objectiveA',	index : 'questionBankForSetquestionsInQustionSet.objectiveA',align : "center",editable : true,hidden:true,edittype : 'select'},
						{name : 'questionBankForSetquestionsInQustionSet.objectiveB',	index : 'questionBankForSetquestionsInQustionSet.objectiveB',align : "center",editable : true,hidden:true,edittype : 'select'},
						{name : 'questionBankForSetquestionsInQustionSet.objectiveC',	index : 'questionBankForSetquestionsInQustionSet.objectiveC',align : "center",editable : true,hidden:true,edittype : 'select'},
						{name : 'questionBankForSetquestionsInQustionSet.objectiveD',	index : 'questionBankForSetquestionsInQustionSet.objectiveD',align : "center",editable : true,hidden:true,edittype : 'select'},
						{name : 'questionBankForSetquestionsInQustionSet.objectiveAnswer',	index : 'questionBankForSetquestionsInQustionSet.objectiveAnswer',align : "center",editable : true,hidden:true,edittype : 'select'},
						{name : 'questionBankForSetquestionsInQustionSet.subjectAnswer',	index : 'questionBankForSetquestionsInQustionSet.subjectAnswer',align : "center",editable : true,hidden:true,edittype : 'select'},
						{name : 'questionBankForSetquestionsInQustionSet.updateUser',	index : 'questionBankForSetquestionsInQustionSet.updateUser',align : "center",editable : true,hidden:true,edittype : 'select'}],
						pager : '#QuestionTBLPageDiv',
						loadatonce : false,
						viewrecords : true,
						mtype : "POST",
						multiselect: false,
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
  								var selRowId = gridObject.jqGrid ('getGridParam', 'selrow');
  								var Question  = gridObject.jqGrid ('getCell', selRowId, 'questionBankForSetquestionsInQustionSet.question');
  								$("#ques").text(Question);
  								var Questype = gridObject.jqGrid ('getCell', id, 'questionBankForSetquestionsInQustionSet.questiontype');
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
  								var answ = gridObject.jqGrid ('getCell', selRowId, 'questionBankForSetquestionsInQustionSet.subjectAnswer');
  								$("#ans").text(answ);
  								var objecta = gridObject.jqGrid ('getCell', selRowId, 'questionBankForSetquestionsInQustionSet.objectiveA');
	  							$("#ans1").text(objecta);
	  							var objectb = gridObject.jqGrid ('getCell', selRowId, 'questionBankForSetquestionsInQustionSet.objectiveB');
	  							$("#ans2").text(objectb);
	  							var objectc = gridObject.jqGrid ('getCell', selRowId, 'questionBankForSetquestionsInQustionSet.objectiveC');
	  							$("#ans3").text(objectc);
	  							var objectd = gridObject.jqGrid ('getCell', selRowId, 'questionBankForSetquestionsInQustionSet.objectiveD');
	  							$("#ans4").text(objectd);
	  							var objAns= gridObject.jqGrid ('getCell', selRowId, 'questionBankForSetquestionsInQustionSet.objectiveAnswer');
	  							$("#oAns").text(objAns);
	  						},
	  						onSelectAll: function(aRowids,status){
	  				    	   selectedSetId = aRowids;	
	  				       }
				});
	///  QUESTION LIST FROM QBANK END**************************************************************************************
		$('#QuestionTBL').jqGrid('filterToolbar', {
			searchOnEnter : true,
			enableClear : false,
			beforeSearch : function(value) {
			$("#QuestionTBL").jqGrid('setGridParam', {
			url : "listSearchQuestions?filters="
				});
			}
		});

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
	});
</SCRIPT>
<style type="text/css">
@import url("${pageContext.request.contextPath}/stylesheet/Jquery/wizard/demo_style.css");
@import url("${pageContext.request.contextPath}/stylesheet/Jquery/wizard/smart_wizard.css");
</style>
</head>
<body> 
<form id="viewQuestionForm" name="viewQuestionForm" method="post" action="addSetQuestion"> 
<br>
<div id="heading" class="title">View SetQuestion</div>
<br>
 <table align="center" border="0" cellpadding="0" cellspacing="0" width="95%">
<tr><td>
<div id="viewWizard" class="tabsContent" >
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
          		<td><span style="color:red">*</span> Course Name : </td><td><select id="courseName" name="courseName"  class="input-row" disabled="disabled"><option>Course</option></select></td>
            </tr>
             <tr><td>&nbsp;</td></tr>
            <tr>
            	<td><span style="color:red">*</span> Set Name : </td><td><input type="text" id="setName" name="setName" size="25" maxlength="45" class="resizedTextbox" readonly="readonly"></td>
            </tr>
             <tr><td>&nbsp;</td></tr>
            <tr>
              	<td><span style="color:red">*</span> Set Description : </td><td><textarea id="setDescription" rows="2" cols="25" name="setDescription" maxlength="100" class="mywidth"  readonly="readonly" ></textarea></td>
            </tr>
             <tr><td>&nbsp;</td></tr>
            <tr>
             <td><span style="color:red">*</span> No Of Questions : </td><td><input type="text" id="noofquestionslist" name="noofquestionslist" size="6" maxlength="3" class="resizedTextbox" readonly="readonly"></td>
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
          		<td><span style="color:red">*</span> Simple Questions : </td><td><input type="text" id="simpleQuestionsforMarks" name="simpleQuestionsforMarks" size="6" maxlength="2" class="resizedTextbox" readonly="readonly"></td>
            </tr>  
            <tr>
               <td><span style="color:red">*</span> Medium Questions  : </td><td><input type="text" id="mediumQuestionsforMarks" name="mediumQuestionsforMarks" size="6" maxlength="2" class="resizedTextbox" readonly="readonly"></td>
            </tr> 
        	<tr>
			   <td><span style="color:red">*</span> Complex Questions : </td><td><input type="text" id="complexQuestionsforMarks" name="complexQuestionsforMarks" size="6" maxlength="2" class="resizedTextbox"  readonly="readonly"></td>
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
</div>
<br>
<div id="editButtons">
<table align="right">
<tr align="right">
</tr>
</table>
</div>

</td></tr></table>

<s:hidden value="%{examSetId}" id="selectedSetIdHid"></s:hidden>
<input type="hidden" id="selectedSetId" name="selectedSetId">
</form>
</body>
</html>
