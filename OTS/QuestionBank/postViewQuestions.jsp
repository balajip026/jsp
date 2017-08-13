<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@include file="../CommonJSs.jsp" %>
<script type="text/javascript">

$(document).ready(function(){


$("#complexity").hide();
	
	var $radios = $('input:radio[name=complexityMap]');
	//alert($("#complexity").val())   
	if($radios.is(':checked') === false) {
		//for disabling the radio buttons in view mode
		 $('input:radio[value=simple]').attr('disabled', 'disabled');
		 $('input:radio[value=medium]').attr('disabled', 'disabled');
		 $('input:radio[value=complex]').attr('disabled', 'disabled');
		if($("#complexity").val() == "s"){
		  	$('input:radio[value=simple]').attr('checked', "checked");
		}
		else if($("#complexity").val() == "m"){
			$('input:radio[value=medium]').attr('checked', "checked");
		}
		else{  
			$('input:radio[value=complex]').attr('checked', "checked");	
		}   	   
     } 

	//bahrgavi
	//Checbox validation
	var value1 = $('#objectiveAnswerHid').val().split(",");
	var check1 = $("input[type='checkbox']");
	for(var i = 0; i < value1.length; i++){
		//alert("inside for loop***"+value1[i]);
		var checkbox = $("input[type='checkbox'][value='"+value1[i]+"']");
		checkbox.attr("checked","checked");
	}
	
	
	//bhargavi end
	//Clear Button Validations
	 $('#cancel').click( function() {
		 $('.ui-icon-closethick').trigger('click');
		}); 
//Check box iterator
var array_values = [];
$('input[type=checkbox]').each( function() {
	if( $(this).is(':checked') ) {
	array_values.push( $(this).val() );
	}
});

	var arrayValues = array_values.join(',');
var postQueList = $("#viewQuestion").serialize();//problem is same id take place
postQueList = postQueList+ "&arrayValues=" + arrayValues;
});



</script>
<body>
<form id="viewQuestion" name="viewQuestion" theme="simple" >
				
<div align="center" >
<table width="50%">
<tr><td>
<fieldset style="border: 1px ridge #185994;width: 450px   "> 
<legend style="color: #fff; background: #185994; border: 1px solid #781351; padding: 2px 6px; "><b>View Question</b></legend>
<table align="center">
 	<tr><td><span style="color:red">*</span> Subject:</td><td align="left"><s:text  name="postQuestion.subjectsForQuestionBabk.subjectCode" ></s:text></td></tr>
 	<tr><td><span style="color:red">*</span> Topic:</td><td align="left"><s:text  name="postQuestion.topicsForQuestionBank.topicCode" ></s:text></td></tr>
 <tr><td><s:textfield id="complexity" name="postQuestion.complexity" cssStyle="width:140px"/></td></tr>
<tr><td align="left"><span style="color:red">*</span> Complexity : <s:radio id="complexityMap" name="complexityMap" list="questype" value="defaultQuestionValue"/></td></tr>
<tr><td align="left"><span style="color:red">*</span>Question:</td><td><s:textarea  name="question" value="%{postQuestion.question}" rows="2" cols="35" onFocus="question.blur()"/></td></tr>
 </table>
</fieldset>
</td></tr></table>
</div>
			<!-- ------Objective Answer------------- -->
<div id="Objective" class="desc" align="center">
<table width="50%">
<tr><td>
<fieldset style="border: 1px ridge #185994;width: 450px ">
<legend style="color: #fff; background: #185994; border: 1px solid #781351; padding: 2px 6px; "><b>Objective Answer</b></legend>
<table align="center">
 	 <tr><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td></tr>
     <tr><td><s:textarea label="A" name="objectiveA" value="%{postQuestion.objectiveA}" rows="2" cols="35" onFocus="objectiveA.blur()"/></td></tr>
   	 <tr><td><s:textarea  label="B" name="objectiveB" value="%{postQuestion.objectiveB}" rows="2" cols="35" onFocus="objectiveB.blur()"/></td></tr>
     <tr><s:textarea label="C" name="objectiveC" value="%{postQuestion.objectiveC}" rows="2" cols="35" onFocus="objectiveC.blur()"/></td></tr>
     <tr><td><s:textarea label="D"  name="objectiveD" value="%{postQuestion.objectiveD}" rows="2" cols="35" onFocus="objectiveD.blur()"/></td></tr>
<table>
 <tr><td>&nbsp;</td><td align="left">Answer:</td><td align="left">
     						<input type="checkbox" id="objAns1" name="objAns" value="a" disabled="disabled"/>A&nbsp;
    						<input type="checkbox" id="objAns2" name="objAns" value="b" disabled="disabled"/>B&nbsp;
     						<input type="checkbox" id="objAns3" name="objAns" value="c" disabled="disabled"/>C&nbsp;
     						<input type="checkbox" id="objAns4" name="objAns" value="d" disabled="disabled"/>D&nbsp;
     						</td>
					     <td>&nbsp;</td></tr>
					     <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
</table>
</fieldset>
</td>
</tr></table>
</div>
<div align="center">
<table>
	<tr><td><input type="button" id="cancel" name="cancel" value="Cancel" class="fm-button ui-state-default ui-corner-all fm-button-icon-left"/></td></tr> 
</table>
</div>
  <s:hidden name="objectiveAnswerHid" value="%{postQuestion.objectiveAnswer}" id="objectiveAnswerHid"></s:hidden>
</form>
</body>
</html>