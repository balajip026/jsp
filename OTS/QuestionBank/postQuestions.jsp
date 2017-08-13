<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@include file="../CommonJSs.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
   	$(function() {
        //bhargavi
		 $.post("subjectDetails",null,function(data){
		     var courseSelect = $('#SubjectCode').empty();
	        courseSelect.append( '<option value=>--Select--</option>' ); 
	        courseData = data.subjectDetails;
	        $.each(data.subjectDetails, function(locObject) {
	        	courseSelect.append( '<option value="'
	        			              + data.subjectDetails[locObject].subjectId+'">'
	                                 +data.subjectDetails[locObject].subjectCode+ '</option>' );
               });
	        });
        
	//Subject Select End
        //bhargavi subject end
		        //bhargavi for topic
			 	$('#SubjectCode').change(function() {
			 		var selectedvalue=$(this).val();
			 		 var topicSelect = $('#TopicCode').empty();
			 		  topicSelect.append( '<option value=>--Select--</option>' ); 
			 		$.ajax({		             
			            url: "topicDetails.action?&id="+selectedvalue,
			            cache : false,
			            success: function(data){
			            $.each(data.topicDetails, function(locObject) {
				             if(data.topicDetails[locObject].topicCode!=" " && data.topicDetails[locObject].topicCode!="null"){ 
				             $('#TopicCode').append($('<option value="'+data.topicDetails[locObject].topicId+'"/>').text(data.topicDetails[locObject].topicCode
						             ));
				            	 }
				            });
			            },
				         error:function(data){
				         alert("Error :: "+data);
				       }
					       });  
				 	 		   });//end bahrgavi
		});
    $('#btnCancel').click( function() {
		 $('.ui-icon-closethick').trigger('click');
		});
var length;   	
$('#submit').click( function() {
   	   	//----start Validatiion----------
   	   	var courseListVal=$("#SubjectCode").val();
   	   	if(courseListVal == "" || courseListVal =="Subject"){
			jAlert(" Please Select Subject. ");
			return false;
			}
   	 	var TopicCodeVal=$("#TopicCode").val();
   	   	if(TopicCodeVal == "" || TopicCodeVal =="Subject"){
			jAlert(" Please Select Topic. ");
			return false;
			}
   	 	var complexityVal=$("input[name='complex']:checked").val();
		if(complexityVal == "" || complexityVal == null){
			jAlert(" Please Select Complexity. ");
			return false;
		}
		var quest=$("#quest").val();
   		if(quest == "" || quest == null){
   			jAlert(" Please Enter Question. ");
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
	 		//check box validation for answer strat need to change the ids
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
   	   	//----End  Validatiion----------
  //Check box iterator
	var array_values = [];
	$('input[type=checkbox]').each( function() {
		if( $(this).is(':checked') ) {
		array_values.push( $(this).val() );
		}
	});
 
 	var arrayValues = array_values.join(',');
	var postQueList = $("#addQuestion").serialize();
	postQueList = postQueList+ "&arrayValues=" + arrayValues;
	$.post('addPostQuestion.action',postQueList, function(data) {
	});
});
});
</script>
<body>
<form id="addQuestion" name="addQuestion" theme="simple">
				<!-- ------AddQuestion  Answer------------- -->
<div align="center" class="desc" align="center">
<table width="50%">
<tr><td>

<fieldset style="border: 1px ridge #185994;width: 450px "> 
<legend style="color: #fff; background: #185994; border: 1px solid #781351; padding: 2px 6px; "><b>Add Question</b></legend>

<table align="center">
 	   <tr><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td></tr>
	<tr><td align="left"><span style="color:red">*</span> Subject:</td><td align="left"><select id="SubjectCode" name="SubjectCode">
            								<option>Subject</option>
     								</select></td></tr>
     <tr><td align="left"><span style="color:red">*</span> Topic:</td><td align="left"><select id="TopicCode" name="TopicCode">
            								<option>Select Subject DropDown</option>
     								</select></td></tr>						
	<tr>
      	<td align="left"><span style="color:red">*</span> Complexity:</td> 
        <td align="left">
	    <input type="radio" id="complex" name="complex" value="s"/><label for="objectivea">Simple</label>
		<input type="radio" id="complex" name="complex" value="m"/><label for="objectiveb">Medium</label>
		<input type="radio" id="complex" name="complex" value="c"/><label for="objectivec">Complex</label>
	    </td>
    </tr>  
  
      <tr><td align="left"><span style="color:red">*</span>Question:</td>
      		<td><textarea id="quest" name="quest" rows="2" cols="35"></textarea></td>
      </tr>
<tr><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td></tr>
</table>
</fieldset>
</td></tr></table>
</div>

				<!-- ------Objective Answer--------------------------->
<div id="Objective" class="desc" align="center">
<table width="50%">
<tr><td>
<fieldset style="border: 1px ridge #185994; "><legend style="color: #fff; background: #185994; border: 1px solid #781351; padding: 2px 6px; "><b>Objective Answer</b></legend>
<table align="center">
 	 <tr><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td></tr>
      <tr><td>&nbsp;</td><td align="left">A:</td><td><textarea id="ans1" name="ans1" rows="2" cols="35"/></textarea></td>
   
     <td>&nbsp;</td><td align="left">B:</td><td><textarea id="ans2" name="ans2" rows="2" cols="35"/></textarea></td></tr>
     
      <tr><td>&nbsp;</td><td align="left">C:</td><td><textarea id="ans3" name="ans3" rows="2" cols="35"/></textarea></td>

      <td>&nbsp;</td><td align="left">D:</td><td><textarea id="ans4" name="ans4" rows="2" cols="35"/></textarea></td></tr>
     
    
     <tr><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td></tr>
     
</table>
<table> <tr><td>&nbsp;</td><td align="left">Answer:</td><td align="left">
     						<input type="checkbox" id="objAns1" name="objAns" value="a"/>A&nbsp;
    						<input type="checkbox" id="objAns2" name="objAns" value="b"/>B&nbsp;
     						<input type="checkbox" id="objAns3" name="objAns" value="c"/>C&nbsp;
     						<input type="checkbox" id="objAns4" name="objAns" value="d"/>D&nbsp;
     						</td>
     <td>&nbsp;</td></tr></table>
</fieldset>
</td>
</tr></table>
</div>

<div align="center">
<table>
	<tr><td><input type="submit" id="submit" value="Save" class="fm-button ui-state-default ui-corner-all fm-button-icon-left"/></td>
	<td><input type="button" id="btnCancel" name="btnCancel" value="Cancel" class="fm-button ui-state-default ui-corner-all fm-button-icon-left"/></td></tr> 
</table>
</div>

</form>
</body>
</html>