<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.vit.action.ots.exam.ExamSchedule"%>

<%@page import="com.vit.ots.utils.OTSConstants"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<%@include file="../CommonJSs.jsp" %>
<SCRIPT type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/widgets/jquery.countdown.js"></SCRIPT>
<script type="text/javascript">



function liftOff(){
	// alert("Times is finished for Exam and is Submitting");
     }


$(document).ready(function(){
		$('#btnExamSubmit').attr("disabled","disabled");
		var resultData ;
		var dataObject;
		var index = 0;
		var checkVal = new Array();
		var ansMap = new Object();
		var noOfQuestionsInExam ;
		var programId = $("#programIdHid").val();
		var setId = $("#setIdHid").val();
		var primaryTrainer = $("#primaryTrainerHid").val();
		//alert(primaryTrainer); 
		$("#btnPrevious").attr("disabled","disabled");
		$("#examDiv").hide();
		$("#resultDiv").hide();
		$("#resultSts").hide();

		$.ajax( { url :"listExamSchedulesByProgram.action",
			data : "programId=" + programId,
			cache : false,
			async : false,
			success : function(data) {
					$.each(data.examList,function(index,value){
						noOfQuestionsInExam = data.examList[index].totalQuestion;
						$("#totalQuesInExam").text(data.examList[index].totalQuestion);
						$("#durationOfExam").text(data.examList[index].totalQuestion);
					});
				}
			});
		
		$("#btnTakeExam").click( function() {
			if($("#agree").is(':checked')){
				$("#examDiv").show();
				$("#instructionDiv").hide();
				$.ajax( { url :"ExamQuestList.action",
					data : "programId=" + programId + "&setId=" + setId,
					cache : false,
					async : false,
					success : function(data) {
						$("#queNo").text(index+1);
						dataObject = data;
						resultData = data.traineeExamQuestionslist;
						//alert(resultData.length);
						// $('#totalnoofqustions').val(resultData.length);
						if(resultData.length >0 ){
							$('#Ques').text(resultData[index].question);
							$('#ans1val').text(resultData[index].objectiveA);
							$('#ans2val').text(resultData[index].objectiveB);
							$('#ans3val').text(resultData[index].objectiveC);
							$('#ans4val').text(resultData[index].objectiveD);
							$('#questionNo').val(resultData[index].qid);
							$.each(resultData,function(index){
										ansMap[resultData[index].qid] = "Not Answered";
							});
						}
				},
				error : function(data) {
					jAlert("Error :: " + data.message);
				}
				});
				$('#countTime').countdown({
								until : '+'+noOfQuestionsInExam+'m',
								onExpiry : submitExam,
								compact : true,
								layout : '<b class=red>Left Over Time {sep} {mnn}{sep}{snn}</b>',
								format : 'M:S'
				});

			}else{
				jAlert("Please Agree Terms & Condition");
		    }
		});
		
		

		function checkedAnswer(){
			var answer = new Array();
			 $("#examDiv input:checkbox").each(function(object,value){
				 if($(this).is(':checked')){
					 	answer.push($(this).val());
					}
			 });
			 return answer;
		}
		function checkSelected(object){
			if(object != null && object != "Not Answered"){
				$.each(object,function(key,value){
					$('#option'+value).attr("checked","checked");
				});
			}
		}
        // Next Button Operation 
		$('#btnNext').click( function() {
			var qIdMap = $('#questionNo').val();
			var answer  = checkedAnswer();
			//alert(answer);
			if(answer != null && answer.length >0){
				ansMap[qIdMap] = answer;
			}else{
				ansMap[qIdMap] = "Not Answered";
			}
			$("#btnPrevious").removeAttr("disabled");
						
			index++;
			$("#queNo").text(index+1);
			resultData = dataObject.traineeExamQuestionslist;
				if (index < resultData.length) {
					$('input:checkbox').removeAttr('checked');
					$('#Ques').text(resultData[index].question);
					$('#ans1val').text(resultData[index].objectiveA);
					$('#ans2val').text(resultData[index].objectiveB);
					$('#ans3val').text(resultData[index].objectiveC);
					$('#ans4val').text(resultData[index].objectiveD);
					var qId = resultData[index].qid;
					$('#questionNo').val(qId);
					checkSelected(ansMap[qId]);
					if(index == resultData.length-1){
						$("#btnNext").attr("disabled","disabled");
						
					}
				} else {
					jAlert("exam is Finished");
				}
				 if(index == resultData.length-1){
					$('#btnExamSubmit').removeAttr("disabled");
				} 
			});

		// Previous Button Operation 
		$("#btnPrevious").click(function(){
			var qIdMap = $('#questionNo').val();
			var answer  = checkedAnswer();
			ansMap[qIdMap] = answer;
			$('input:checkbox').removeAttr('checked');
			$("#btnNext").removeAttr("disabled");
			index = index-1;
			$("#queNo").text(index+1);		
			var resultData = dataObject.traineeExamQuestionslist;
			if (index >= 0) {
				$('#Ques').text(resultData[index].question);
				$('#ans1val').text(resultData[index].objectiveA);
				$('#ans2val').text(resultData[index].objectiveB);
				$('#ans3val').text(resultData[index].objectiveC);
				$('#ans4val').text(resultData[index].objectiveD);
				var qId = resultData[index].qid;
				$('#questionNo').val(qId);
				checkSelected(ansMap[qId]);
				if(index == 0){
					$("#btnPrevious").attr("disabled","disabled");
				}
			} else {
				$("#btnPrevious").attr("disabled","disabled");
			}
		});	
		
		var resultDiv ;

		function updateExamResult(totalQues,totalCorrectAns,marks,percentage,resultStatus){
   		    $.ajax( { url : "examResultAction.action",
		    data : "programId=" + programId + "&totalQues=" + totalQues + "&totalCorrectAns=" + totalCorrectAns 
		           + "&marks=" + marks + "&percentage=" + percentage + "&resultStatus=" + resultStatus + "&primaryTrainer=" + primaryTrainer,
		    cache : false,
		    async : false,
		  	success : function(data) {
  	
			}
		});
	}

       	function calculateResult(totalQuestions,totalCorrectAns){
           	var classColor ;
			var wrongAnswers = totalQuestions - totalCorrectAns;
			var marks = totalCorrectAns;
			var percentage = (marks/totalQuestions)*100;
			var resultStatus; 
			if(percentage>60){
				classColor = "green";
				resultStatus = '<%=OTSConstants.EXAM_PASS %>';
			}else{
				classColor = "red";
				resultStatus = '<%=OTSConstants.EXAM_FAIL %>';
			}
			$("#score").text(marks);
			$("#totalQues").text(totalQuestions);
			$("#percentage").text(percentage.toFixed(2));
			$("#status").text(resultStatus);
            // Exam Result update to DB 
			updateExamResult(totalQuestions,totalCorrectAns,marks,percentage,resultStatus);
       	}
       	

       	
        function showResult(){
        	var html = "<br>";
            html += "<table width=100% style=padding-left:1cm;>";
			var resultData = dataObject.traineeExamQuestionslist;
			var totalQues = resultData.length;
			var totalCorrectAns = 0;
			var quesNo = 1;
			$.each(resultData,function(index){
				var queId = resultData[index].qid;
				html += "<tr><td><b> "+quesNo+") "+ resultData[index].question +"</b></td></tr>";
				html += "<tr><td>&nbsp;&nbsp;&nbsp;&nbsp; a) "+ resultData[index].objectiveA +"</td></tr>";
				html += "<tr><td>&nbsp;&nbsp;&nbsp;&nbsp; b) "+ resultData[index].objectiveB +"</td></tr>";
				html += "<tr><td>&nbsp;&nbsp;&nbsp;&nbsp; c) "+ resultData[index].objectiveC +"</td></tr>";
				html += "<tr><td>&nbsp;&nbsp;&nbsp;&nbsp; d) "+ resultData[index].objectiveD +"</td></tr>";
				html += "<tr><td>&nbsp;</td></tr>";
				var userAns = ansMap[queId];
				userAns = userAns.toString();
				//alert("userAns : " + userAns);
				var correctAns = resultData[index].objectiveAnswer;
				correctAns = correctAns.toString();
				//alert("correct : " +correctAns);
				html += "<tr><td>&nbsp;&nbsp;&nbsp;&nbsp; Correct Answer : <b>"+ correctAns +"</b></td></tr>";
				if(userAns == correctAns){
					totalCorrectAns++;
					html += "<tr><td>&nbsp;&nbsp;&nbsp;&nbsp; User Answer : <b  style=color:green>"+ userAns +"</b></td></tr>";
        		}else{
        			html += "<tr><td>&nbsp;&nbsp;&nbsp;&nbsp; User Answer : <b style=color:red>"+ userAns +"</b></td></tr>";
        		}
				html += "<tr><td>&nbsp;</td></tr>";
				quesNo++;
			});
			
			calculateResult(totalQues,totalCorrectAns);
			html += "</table>";
			$("#resultFieldSet").append(html);
			$("#resultSts").hide();
			$("#resultDiv").show();
			$("#examDiv").hide();
			$("#instructionDiv").hide();
		}
		
		function submitExam(){
			var qIdMap = $('#questionNo').val();
			var answer  = checkedAnswer();
			if(answer != null && answer.length >0){
				ansMap[qIdMap] = answer;
			}else{
				ansMap[qIdMap] = "Not Answered";
			}
			var ansArray  = "";
			ansArray += "{"; 
			$.each(ansMap,function(key,value){
				if(ansArray.length >1){
					ansArray +=",";
				  }
				var ansVal = ansMap[key];
				//alert(ansVal.toString());
				ansVal = ansVal.toString();
				ansVal = ansVal.replace(',','$');
				//alert(ansVal);
				ansArray += (key+":"+ansVal) ;
			});
			ansArray += "}";
			$.ajax( { 	url : "examSubmitAction.action",
					    data : "programId=" + programId + "&ansMap=" + ansArray,
					    cache : false,
					    async : false,
					  	success : function(data) {
			  	
						}
			});
	
			showResult();
		}
		 // Exam Submit Operation 
		$('#btnExamSubmit').click(function() {
			submitExam();
		});


		$("#btnDone").click(function(){
			$("#resultDivision").hide();
			$("#resultDiv").hide();
			$("#resultSts").show();
			$("#examDiv").hide();
			$("#instructionDiv").hide();
			
		});
        // Back button operation  
		$("#btnBack").click(function(){
			$("#examActionForm").attr("action", "Exam");
       		$("#examActionForm").submit();
     	 });

		// Cancel button operation  
		$("#btnCancel").click(function(){
			$("#examActionForm").attr("action", "Exam");
       		$("#examActionForm").submit();
     	 });
	
 }); // Final End
</script>
<s:form name="examActionForm" id="examActionForm" theme="simple" action="">
<div align="center" class="swMain" id="instructionDiv"><br>
<div id="heading" class="title" align="left">Exam Process</div>
<br>
<div align="center">
	<table width="90%">
		<tr>
			<td>
			<fieldset style="border: 1px ridge #185994; " ><legend
				id="form_deliveryDetails-legend" style="color: #fff; background: #185994; border: 1px solid #781351; padding: 2px 6px; ">Examination Instructions</legend>
			<table align="left">
				<tr>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td align="left" class="tp-p-instruction" id="totalnoofqustions" name="totalnoofqustions" style="width: 22em;">&nbsp;&nbsp;&nbsp;1) Total number of questions : <b><span id="totalQuesInExam"></span></b>.</td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td align="left" class="tp-p-instruction" style="width: 22em;">&nbsp;&nbsp;&nbsp;2) Duration Of Examination: <b><span id="durationOfExam"></span></b>&nbsp;minutes.</td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				
				<tr>
					<td align="left" class="tp-p-instruction" style="width: 33em;">&nbsp;&nbsp;&nbsp;3) Each question carry 1 mark, no negative marks.</td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				
			</table>
			</fieldset>
			</td>
		</tr>
	</table>
	<input type="hidden" id="questionNo" name="questionNo">
	<br>
	<table>
		<tr>
			<td align="center"><input type="checkbox" id="agree" name="agree" />&nbsp;&nbsp;&nbsp;I agree to the terms and conditions </td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</tr>
		<tr>
			<td><input type="button" id="btnTakeExam" name="btnTakeExam" value="Take Exam"
				       class="ui-button ui-widget ui-state-default ui-corner-all">
				<input type="button" id="btnCancel" name="btnCancel" value="Cancel"
				       class="ui-button ui-widget ui-state-default ui-corner-all"></td>
		</tr>
	</table>
</div>
</div>
<div align="left" class="swMain" id="examDiv"><br>
<div id="heading" class="title" align="left">Examination </div>
<br>
<div align="center">
	<table width="90%">
		<tr>
			<td>
			<div id="countTime" align="RIGHT"></div>
			</td>
		</tr>
		<tr>
			<td>
			<fieldset style="border: 1px ridge #185994;"><legend style="color: #fff; background: #185994; border: 1px solid #781351; padding: 2px 6px;" id="form_deliveryDetails-legend"><b>Questions</b></legend> <br>
	       
	       <table align="left" width="850">
				<tr>
					<td>
					<div id="countTime" align="left"></div>
					</td>
	
				</tr>
				<tr>
					<td>
					<div align="left">
					<table id="test" align="left">
						<tr>
							<td>&nbsp;<span id="queNo">1</span>)&nbsp;&nbsp;<span id="Ques"></span></td>
						</tr>
						<tr>
						</tr>
						<tr>
							<td>
							<table align="left">
	
								<tr>
								    <td width="5%">&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="optiona" name="optiona" value="a" /> a) 
									<span id="ans1val"></span></td>
								</tr>
								<tr></tr>
								<tr>
									<td width="5%">&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="optionb"  name="optionb" value="b" /> b) 
									<span id="ans2val"></span></td>
								</tr>
								<tr>
									<td width="5%">&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="optionc"  name="optionc" value="c" /> c) 
									<span id="ans3val"></span></td>
								</tr>
								<tr>
									<td width="5%">&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="optiond"  name="optiond" value="d" /> d) 
									<span id="ans4val"></span></td>
								</tr>
	                        </table>
							</td>
						</tr>
					</table>
					</div>
					</td>
				</tr>
	
			</table>
			<br>
			</fieldset>
	
			</td>
		</tr>
	</table>
	<br>
	<table align="center">
		<tr>
			<td id="btn2" align="center"><input type="button" id="btnPrevious" value="Previous" class="ui-button ui-widget ui-state-default ui-corner-all"></td>
			<td id="btn" align="center"><input type="button" id="btnNext" name="btnNext" value="Next" class="ui-button ui-widget ui-state-default ui-corner-all"></td>
			<td id="btn" align="center"><input type="button" id="btnExamSubmit" value="Submit Exam" class="ui-button ui-widget ui-state-default ui-corner-all"></td>
		</tr>
	</table>

</div>
<s:hidden name="programId" id="programIdHid" /> 
<s:hidden name="setIdstr" id="setIdHid"/>
<s:hidden name="primaryTrainer" id="primaryTrainerHid"/></div>
<div id="resultDiv">
<br>
<div id="heading" class="title" align="left">Exam Result</div>
<div id="resultDivision" style="overflow:scroll; height:450px;"> 
<fieldset id="resultFieldSet" style="border: 1px ridge #185994;">
<legend style="color: #fff; background: #185994; border: 1px solid #781351; padding: 1px 6px; "><b>Exam Details</b></legend>
</fieldset>
</div>



<br> 
<table align="center">
		<tr>
		   <td id="btn2" align="center"><input type="button" id="btnDone" value="Done" class="ui-button ui-widget ui-state-default ui-corner-all"></td>
		</tr>
</table>
</div>
<div id="resultSts" align="center"> 
<br>
<div id="heading" class="title" align="left">Exam Result</div>
<br>
<table width="90%"><tr><td>
<fieldset style="border: 2px ridge #185994; "> <legend style="color: #fff; background: #185994; border: 1px solid #781351; padding: 2px 6px; " id="form_deliveryDetails-legend"><b>Result</b></legend> <br>
<table align ="left" style="padding-left: 3px">
<tr align="left"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Your score is<b>&nbsp;<span id="score"></span>&nbsp;</b> out of <b><span id="totalQues"></span></b></td> </tr>
<tr align="left"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Your Exam percentage is <b><span id="percentage"></span> %</b></td></tr> 
<tr align="left"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Your Result Status is <b><span id="status" style="color:green"></span></b></td> </tr>
<tr align="left"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
</table>
<br>
</fieldset>
</td></tr></table>
<br> 
<table align="center">
		<tr>
		   <td id="btn3" align="center"><input type="button" id="btnBack" name="btnBack" value="Done" class="ui-button ui-widget ui-state-default ui-corner-all"></td>
		</tr>
</table>
</div>

</s:form>   
</html>