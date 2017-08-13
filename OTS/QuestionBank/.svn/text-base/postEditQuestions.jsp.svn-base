<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%
String subjectCodeEdit=request.getParameter("subjectCode");
String topicCodeEdit=request.getParameter("topicCode");
%>
<input type="hidden" id="subjectCodeEdit" name="subjectCodeEdit" value="<%=subjectCodeEdit%>">
<input type="hidden" id="topicCodeEdit" name="topicCodeEdit" value="<%=topicCodeEdit%>">
<%@include file="../CommonJSs.jsp" %>
<script type="text/javascript">
function SearchQuestions(){
    document.serachquetionsform.submit();
}
$(document).ready(function(){
	var subjectCodeEditPage=$("#subjectCodeEdit").val();//from setQuestions.jsp
	var topicCodeEditPage=$("#topicCodeEdit").val();//from setQuestions.jsp
	
//bhargavi wants write the following code start
//for Topic drop down
 $('#SubjectCode').change(function() {
			 		var selectedvalue=$(this).val();
			 		$.ajax({		             
			            url: "topicDetails.action?&id="+selectedvalue,
			            cache : false,
			            success: function(data){
				 		   	var topicSelect = $('#TopicCode').empty();
				 		  	topicSelect.append( '<option value=>--Select--</option>' ); 
				            $.each(data.topicDetails, function(locObject) {
					             $('#TopicCode').append($('<option value="'+data.topicDetails[locObject].topicId+'"/>').text(data.topicDetails[locObject].topicCode
							 ));
				            });
				            $('#TopicCode').val(topicCodeEditPage);
			            },
			            async:false,
				        error:function(data){
				        	alert("Error :: "+data);
				       	}
				});  
		});//end bahrgavi
		
	 $.ajax({		             
        url: "subjectDetails.action",
        cache : false,
        success: function(data){
		 	var courseSelect = $('#SubjectCode').empty();
	        courseSelect.append( '<option value=>--Select--</option>' ); 
	        $.each(data.subjectDetails, function(locObject) {
	        	courseSelect.append( '<option value="'
			              + data.subjectDetails[locObject].subjectId+'">'
	                   +data.subjectDetails[locObject].subjectCode+ '</option>' );
	
	        });
	        $('#SubjectCode').attr("value",subjectCodeEditPage);
	        $("#SubjectCode").trigger("change");
        },
        async:false
        }); 
//bhargavi wants write the following codeend	  
	//alert($("#complexityHid").val());
	var $radios = $('input:radio[name=complexityMap]');
	if($radios.is(':checked') === false) {
		if($("#complexityHid").attr("value") == "s")
		  	$('input:radio[value=s]').attr('checked', "checked");
		else if($("#complexityHid").attr("value") == "m")	  
			$('input:radio[value=m]').attr('checked', "checked");
		else  
			$('input:radio[value=c]').attr('checked', "checked");	   	   
     } 

//Checbox validation
	var value1 = $('#objectiveAnswerHid').val().split(",");
	var check1 = $("input[type='checkbox']");
	for(var i = 0; i < value1.length; i++){
		//alert("inside for loop***"+value1[i]);
		var checkbox = $("input[type='checkbox'][value='"+value1[i]+"']");
		checkbox.attr("checked","checked");
	}
	
//----------------Start Post-------------------------------------------------------
 $('#cancel').click( function() {
		 $('.ui-icon-closethick').trigger('click');
		}); 
var length; 
	$('#btnEdit').click( function() {
		 //bhargavi put validation for checkbox start
		var courseListVal=$("#SubjectCode").val();
	  	if(courseListVal == "" || courseListVal =="Topic"){
		jAlert(" Please Select Topic. ");
		return false;
		}
	
	    var quest=$("#question").val();
			 if(quest == "" || quest == null){
				jAlert(" Please Enter Question. ");
			 	return false;
				}
				var complexityVal=$("input[name='complexity']:checked").val();
				if(complexityVal == "" || complexityVal == null){
					jAlert(" Please Select Complexity. ");
					return false;
				}
	  		var objectAnserA=$("#ans1").val();
	  		length= objectAnserA.trim().length;
	  	   		if(objectAnserA == "" || objectAnserA == null ||length==0){
	  	   	   		jAlert(" Please Enter Obective Answer A. ");
		 			return false;
					}
	  			var objectAnserB=$("#ans2").val();
	  			 length= objectAnserB.trim().length;
	  			if(objectAnserB == "" || objectAnserB == null ||length==0){
	  					jAlert(" Please Enter Obective Answer B. ");
		 				return false;
						}
				var objectAnserC=$("#ans3").val();
				 length= objectAnserC.trim().length;
				if(objectAnserC == "" || objectAnserC == null ||length==0){
					jAlert(" Please Enter Obective Answer C. ");
		 			return false;
					}
				var objectAnserD=$("#ans4").val();
				length= objectAnserD.trim().length;
				if(objectAnserD == "" || objectAnserD == null ||length==0){
					jAlert(" Please Enter Obective Answer D. ");
	   	 		return false;
	 			}

		//end validations
		var objAnsChecked=false;
			$('input[name=objAns]').each( function() {
				if( $(this).is(':checked') ) {
					objAnsChecked = true;
				}
			});
			if(!objAnsChecked)
			{
				jAlert(" Please  select atleast one  answer","Information");
   	 		return false;
 		}
	 //bhargavi put validation for checkbox end 		
  	//Check box iterator
	var array_values = [];
	$('input[type=checkbox]').each( function(object,value) {
	
		if(value.name == "objAns"){
			if( $(this).is(':checked') ) {
				 array_values.push( $(this).attr("value") );
			}
		}
	});  
 	
 	var arrayValues = array_values.join(',');
 	$("#objectiveAnswer").attr("value",arrayValues);
	var postQueList = $("#editQuestion").serialize();
	$.post('editPostQuestion.action',postQueList, function(data) {
	});
});
});//document
</script>
<body>
<form id="editQuestion" name="editQuestion" theme="simple">
	<div align="center" >
<table width="50%">
<tr><td>

<fieldset style="border: 1px ridge #185994;width: 450px  "> 
<legend style="color: #fff; background: #185994; border: 1px solid #781351; padding: 2px 6px; "><b>Edit Question</b></legend>
<table align="left" width="100%">
 	<!-- <tr><td align="left">Topic:</td><td align="left"><select id="SubjectCode" name="SubjectCode">
            								<option>Topic</option>
     								</select></td></tr>-->
<!-- <tr><td><span style="color:red">*</span>Subject: </td><td><select id="SubjectCode" name="SubjectCode" class="input-row" disabled="disabled"><option>Subject</option></select></td></tr> -->
<tr><td><span style="color:red">*</span> Subject:</td><td align="left"><s:text name="%{model.subjectsForQuestionBabk.subjectCode}" />
    								     								
<!-- <tr><td><span style="color:red">*</span>Topic: </td><td><select id="TopicCode" name="TopicCode" class="input-row" disabled="disabled"><option>Topic</option></select></td></tr> -->
<tr><td><span style="color:red">*</span> Topic:</td><td align="left"><s:text name="%{model.topicsForQuestionBank.topicCode}" />    								
<tr><td><s:hidden id="complexityHid" name="complexityHid" value="%{model.complexity}"></s:hidden></td></tr>
<tr><td><span style="color:red">*</span> Complexity : </td>
			<td><table><tr>
			<td> <input type="radio"  id="complexity" name="complexity" value="s"></td><td> Simple </td>
			<td><input type="radio"  id="complexity" name="complexity" value="m"></td><td> Medium</td>
			<td><input type="radio"  id="complexity" name="complexity" value="c"></td><td> Complex</td>
			</tr></table>
</td></tr>
 <tr><td><s:textarea id="question" label="Question" name="question" rows="2" cols="35" value="%{model.Question}"/></td>
      </tr>
 </table>
</fieldset>
</td></tr></table>
</div>

				<!-- ------Objective Answer------------- -->
<div id="Objective" class="desc" align="center">
<table width="50%">

<tr><td>
<fieldset style="border: 1px ridge #185994;width: 450px  "><legend style="color: #fff; background: #185994; border: 1px solid #781351; padding: 2px 6px; "><b>Objective Answer</b></legend>
<table align="center">
 	 <tr><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td></tr>
      <tr><td><s:textarea  id="ans1" label="A" name="objectiveA" value="%{model.objectiveA}" rows="2" cols="35" />
   			   <s:textarea id="ans2" label="B" name="objectiveB" value="%{model.objectiveB}" rows="2" cols="35" /></td></tr>
   	  <tr><td><s:textarea id="ans3" label="C" name="objectiveC" value="%{model.objectiveC}" rows="2" cols="35"/>
			    <s:textarea id="ans4" label="D" name="objectiveD" value="%{model.objectiveD}" rows="2" cols="35"/>
		</td></tr>
  </table>
<table>
 <tr><td>&nbsp;</td><td align="left">Answer:</td><td align="left">
     						<input type="checkbox" id="objAns1" name="objAns" value="a"/>A&nbsp;
    						<input type="checkbox" id="objAns2" name="objAns" value="b"/>B&nbsp;
     						<input type="checkbox" id="objAns3" name="objAns" value="c"/>C&nbsp;
     						<input type="checkbox" id="objAns4" name="objAns" value="d"/>D&nbsp;
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
	<tr><td><input type="submit" id="btnEdit" value="Submit" class="fm-button ui-state-default ui-corner-all fm-button-icon-left"/></td>
	<td><input type="button" id="cancel" name="cancel" value="Cancel" class="fm-button ui-state-default ui-corner-all fm-button-icon-left"/></td></tr> 
</table>
</div>

  <s:hidden name="qid" value="%{model.qid}" id="qid"></s:hidden>
  <s:hidden name="objectiveAnswerHid" value="%{model.objectiveAnswer}" id="objectiveAnswerHid"></s:hidden>
  <input type="hidden" id="objectiveAnswer" name="objectiveAnswer" value="">
  <s:hidden name="questiontype" id="questiontype" value="%{model.questiontype}"/>
</form>
<form name="serachquetionsform" action="SearchQuestions.action"></form>
</body>
</html>