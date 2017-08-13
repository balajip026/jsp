<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
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
	var selectRowDeatils = new Array();
	var selectRowDets = new Array();
    var jsonObj = []; 
   
    var totalTraineesInLocation;
    var totalNoOfTrainees;
	var programId ;
	//  ---------------------Wizard-----------------------   	
		 function onFinishCallback(){
		 	var url = "addSetQuestion?id="+selectRowDeatils;
			var postList = $("#setQuestionForm").serialize();
		 	  	$("#setQuestionForm").attr("action",url+"&"+postList);
		 	  	$("#setQuestionForm").submit();
			}     
		 function validateStepOne(){
				var flag = true;
				var numericReg = /^\d*[0-9](|.\d*[0-9]|,\d*[0-9])?$/;           
				var characterReg = /^\s*[a-zA-Z0-9,\s]+\s*$/;
				 var setName=$("#setName").val(); 
				 var courseName=$("#courseName").val();
				 var setDescription=$("#setDescription").val();
				 var noofquestionslist=$("#noofquestionslist").val();
				 var simpleQuestionsforMarks=$("#simpleQuestionsforMarks").val(); 
				 var mediumQuestionsforMarks=$("#mediumQuestionsforMarks").val();
				 var complexQuestionsforMarks=$("#complexQuestionsforMarks").val();
				if(($("#setName").val() == "" ) || ($("#setName").val()== null)|| setName.trim().length==0 ){
					jAlert("Please Specify Set Name ","Information");
					flag = false;
				}else if(!characterReg.test($("#setName").val()) || setName.trim().length==0){
					jAlert("No special characters allowed ","Information");
					 flag = false;
				}else if(($("#courseName").val() == "" )|| courseName.trim().length==0){
					jAlert("Please select Course Name","Information");
					flag = false;
				}else if(($("#setDescription").val() == "" ) || ($("#setDescription").val()== null)|| setDescription.trim().length==0){
					jAlert("Please Provide Set Description","Information");
					flag = false;
				}else if(($("#noofquestionslist").val() == "" ) || ($("#noofquestionslist").val()== null)|| noofquestionslist.trim().length==0){
					jAlert("Please Provide no of Questions","Information");
					flag = false;
				}else if(!numericReg.test($("#noofquestionslist").val())|| noofquestionslist.trim().length==0){
					jAlert("Please enter Numeric value for No of Questions.","Information");
					 flag = false;
				}else if(($("#simpleQuestionsforMarks").val() == "" ) || ($("#simpleQuestionsforMarks").val()== null)|| simpleQuestionsforMarks.trim().length==0){
					jAlert("Please Provide Marks for Simple Questions ","Information");
					flag = false;
				}else if(!numericReg.test($("#simpleQuestionsforMarks").val())|| simpleQuestionsforMarks.trim().length==0){
					jAlert("Please enter Numeric value Marks For SimpleQuestions","Information");
					 flag = false;
				}else if(($("#mediumQuestionsforMarks").val() == "" ) || ($("#mediumQuestionsforMarks").val()== null)|| mediumQuestionsforMarks.trim().length==0){
					jAlert("Please Provide Marks for Medium Questions","Information");
					flag = false;
				}else if(!numericReg.test($("#mediumQuestionsforMarks").val())|| mediumQuestionsforMarks.trim().length==0 ){
					jAlert("Please enter Numeric value Marks For Medium Questions.","Information");
					 flag = false;
				}else if(($("#complexQuestionsforMarks").val() == "" ) || ($("#complexQuestionsforMarks").val()== null) || complexQuestionsforMarks.trim().length==0){
					jAlert("Please Provide Marks for Complex Questions.","Information");
					flag = false;
				}else if(!numericReg.test($("#complexQuestionsforMarks").val())|| complexQuestionsforMarks.trim().length==0){
					jAlert("Please enter Numeric value Marks For Complex Questions.","Information");
					 flag = false;
				}					
				return flag;
		  }
		  function validateStepTwo(){
			  $('#quetionDisp').html('');
			  var flag = true;
			  var html = "";
			  var val=$('input:checkbox:checked').length;
			  var tot=$("#noofquestionslist").val();

			  if(tot == val){
			//  alert("Checked Length::"+val+"No of Questions::"+tot);

			  $.each(selectRowDets, function (index, idata) {
				  //alert(selectRowDets[index]);
				  var $table = $('<table>');
				  $table.appendTo("");
				  var $tbody = $table.append('<tbody />').children('tbody');
				  $tbody.append('<tr />').children('tr:last')
				  .append("<td>"+(index+1)+"  :"+selectRowDets[index]+"</td>");
				  $table.appendTo('#quetionDisp');
				});
			  }else{
				  validateStepOne();
				  jAlert("Please select no of questions = "+tot);
				  flag=false;
			  }
		  return flag;
		  }
		  
		  function validateSteps(stepnumber){
		        var isStepValid = true;
		        if(stepnumber == 2){
		        	isStepValid =  validateStepOne();
		        }if(stepnumber == 3){
		        	isStepValid =  validateStepTwo();
		        }
		        return isStepValid;
		  }

		  
		  function leaveAStepCallback(obj, context){
				  //alert("Leaving step " + context.fromStep + " to go to step " + context.toStep);
			        return validateSteps(context.toStep); 
		  }
			 
		  $('#addWizard').smartWizard({transitionEffect:'fade',
				onFinish:onFinishCallback,
				onLeaveStep:leaveAStepCallback
		  });


			$(function(){
				var divName = $(".actionBar"); 
				var element = "<a href=# id=btnCancel class=buttonNext >Cancel</a>";
				divName.append(element);
				 $("#btnCancel").click(function(){
						 $("#setQuestionForm").attr("action","SetQuestions.action");
					  	 $("#setQuestionForm").submit();
				 });
			});
		  var courseName  = $("#courseName").val();
			$("#courseName").change(function(){
				courseName = $("#courseName").val();
				$("#QuestionTBL").jqGrid('setGridParam', { url: 'listQuestionsForSetPreparation.action?courseName='+ courseName}).trigger("reloadGrid");	
			});
		  $("#QuestionTBL").jqGrid({
				url : 'listQuestionsForSetPreparation.action?courseName='+courseName,
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
				},colNames : ['qid','Subject','Topic Code', 'Complexity','Question','Question type','ObjectiveA','ObjectiveB','ObjectiveC','ObjectiveD','Objective Answer','subject Answer','updateUser'],
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
						              if (cellvalue == 's') {
							              cellvalue="Subjective";
									      } else if(cellvalue == 'o') {
						            		  cellvalue="Objective";
						              	  }return cellvalue;
						          },editable : true,edittype : 'select',hidden:true},
								{name : 'objectiveA',	index : 'objectiveA',align : "center",editable : true,hidden:true,edittype : 'select'},
								{name : 'objectiveB',	index : 'objectiveB',align : "center",editable : true,hidden:true,edittype : 'select'},
								{name : 'objectiveC',	index : 'objectiveC',align : "center",editable : true,hidden:true,edittype : 'select'},
								{name : 'objectiveD',	index : 'objectiveD',align : "center",editable : true,hidden:true,edittype : 'select'},
								{name : 'objectiveAnswer',	index : 'objectiveAnswer',align : "center",editable : true,hidden:true,edittype : 'select'},
								{name : 'subjectAnswer',	index : 'subjectAnswer',align : "center",editable : true,hidden:true,edittype : 'select'},
								{name : 'updateUser',	index : 'updateUser',align : "center",editable : true,hidden:true,edittype : 'select'}],
								//rowNum : 15,
								//rowList : [ 15, 20, 30 ],
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
								onSelectRow : function(id,object,status){
			  							  	var gridObject = $("#QuestionTBL");
			  	  							var selRowId = gridObject.jqGrid ('getGridParam', 'selrow');
			  								var Question  = gridObject.jqGrid ('getCell', selRowId, 'question');
			  								$("#ques").text(Question);
			  								
			  								if(object){
			  									selectRowDeatils.push(selRowId);
			  									selectRowDets.push(Question);
			  								}else{
				  								//alert("inside else");
			  							       $.each(selectRowDeatils, function (index, idata) {
				  						             if(idata == id){
				  						            	selectRowDeatils.splice(index, 1);
				  						            	selectRowDets.splice(index, 1);
			  						             	}
			  						       		});
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
				  						loadComplete: function() {
					  				    	 var gridObject = $("#QuestionTBL");
				  							//this is for hidding the top select box
				  	  						gridObject.closest('div.ui-jqgrid-view').find('table.ui-jqgrid-htable th input[type="checkbox"]').hide();
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
 
//------------------------------------Question Details----------------------------
$("#sub").hide();
$("#obj").hide();
$("#q").hide();
$("#o").hide();

//Check box iterator
var array_values = [];
$('input[type=checkbox]').each( function() {
	if( $(this).is(':checked') ) {
		//alert($(this).val());
	array_values.push( $(this).val() );
	}
});

//var checkedVal; 
			
			/*	$('#QuestionTBL').jqGrid('filterToolbar', {
					searchOnEnter : true,
					enableClear : false,
					beforeSearch : function(value) {
					$("#QuestionTBL").jqGrid('setGridParam', {
					url : "listSearchQuestions?filters="
									//url : "listCourses?filters="	
						});
					}
				});*/

	

	$(function() {
				$.post("courseDetails",null,function(data){
		        var courseSelect = $('#courseName').empty();
			        courseSelect.append( '<option value=>--Select--</option>' ); 
			        $.each(data.courseDetails, function(locObject) {
			        	courseSelect.append( '<option value="'
			                                 + data.courseDetails[locObject].courseId
			                                 + '">'
			                                 + data.courseDetails[locObject].courseName
			                                 + '</option>' ); 
                        });
                    });
            });
    });




	  

</SCRIPT>
<style type="text/css">
@import url("${pageContext.request.contextPath}/stylesheet/Jquery/wizard/demo_style.css");
@import url("${pageContext.request.contextPath}/stylesheet/Jquery/wizard/smart_wizard.css");

</style>
</head>
<body> 
<form id="setQuestionForm" name="setQuestionForm" method="post" action="addSetQuestion"> 
<br>
<div id="heading" class="title">Add SetQuestion</div>
<br>
 <table align="center" border="0" cellpadding="0" cellspacing="0">
<tr><td>
<div id="addWizard" class="swMain" >
<ul>
  				<li><a href="#setQuestionDetails">
                <label class="stepNumber">1</label>
                <span class="stepDesc">
                   SetQuestion Details<br />
                   <small></small>
                </span>
            </a></li>
  				<li><a href="#setQuestionDetails1">
                <label class="stepNumber">2</label>
                <span class="stepDesc">
                   Question Details<br />
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
<div id="setQuestionDetails" class="scrLabel" >	
            <h2 class="StepTitle"></h2>
             <table align="center" width="600"><tr><td>
   			 <fieldset style="border: 2px ridge #185994; "> 
   			  <legend style="color: #fff; background: #185994; border: 1px solid #781351; padding: 2px 6px; "><b>Set Details</b></legend>
            <table align="center" >
            <tr><td>&nbsp;</td></tr>
            <tr>
          		<td><span style="color:red">*</span> Course Name : </td><td><select id="courseName" name="courseName" class="input-row" ><option>Course</option></select></td>
            </tr>
             <tr><td>&nbsp;</td></tr>
            <tr>
            	<td><span style="color:red">*</span> Set Name : </td><td><input type="text" id="setName" name="setName" size="25" maxlength="45" class="resizedTextbox" ></td>
            </tr>
             <tr><td>&nbsp;</td></tr>
            <tr>
              	<td><span style="color:red">*</span> Set Description : </td><td><textarea id="setDescription" rows="2" cols="25" name="setDescription" maxlength="100" class="mywidth"></textarea></td>
            </tr>
             <tr><td>&nbsp;</td></tr>
            <tr>
             	<td><span style="color:red">*</span> No Of Questions : </td><td><input type="text" id="noofquestionslist" name="noofquestionslist" size="6" maxlength="3" class="resizedTextbox"></td>
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
          		<td><span style="color:red">*</span> Simple Questions : </td><td><input type="text" id="simpleQuestionsforMarks" name="simpleQuestionsforMarks" size="6" maxlength="2" class="resizedTextbox"></td>
            </tr>  
            <tr>
               	<td><span style="color:red">*</span> Medium Questions  : </td><td><input type="text" id="mediumQuestionsforMarks" name="mediumQuestionsforMarks" size="6" maxlength="2" class="resizedTextbox"></td>
            </tr> 
        	<tr>
			    <td><span style="color:red">*</span> Complex Questions : </td><td><input type="text" id="complexQuestionsforMarks" name="complexQuestionsforMarks" size="6" maxlength="2" class="resizedTextbox"></td>
			</tr>	 	 <tr><td>&nbsp;</td></tr>
		   </table></fieldset> </td></tr></table>
</div>
			
			
			
<!-- SetQuestion Details1 For Wizards -->
<div id="setQuestionDetails1" >
			
			<table id="QuestionTBL" width="100%"></table>
			<div id="QuestionTBLPageDiv"></div>
			<div id="dd"></div>  
		
			<div id="sample">
			<div id="q">
			<table>
			<tr><td>&nbsp;</td></tr>
			<tr><td><font color="#7FABC4"><span style="color:red">*</span> Question:</font></td><td>&nbsp;</td><td><b><font color="#185994"><span id="ques"></span></font></b></td>
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
</td></tr></table>

</form>
</body>
</html>
