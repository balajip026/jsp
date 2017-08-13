<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.vit.ots.utils.OTSConstants"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<center><b><font size="3">TRAINING FEEDBACK FORM</font></b></center>
<head>
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
</head>
<br>
<body>
<form id = "feedbackdetails" name = "feedbackdetails">
<div style="padding-left: 20px" >
<table border="0" height="20%" width="55%">

	<tbody>
	<tr>
	
	<td>Employee Name</td><td><s:property value="%{feedBackMap.empName}"></s:property></td>
    </tr>
	<tr>
	<td>Name Of The Trainer</td><td><s:property value="%{feedBackMap.firstName}" /> <s:property value="%{feedBackMap.lastName}" /></td>
	</tr>
	<tr>
	<td>Course Name</td><td><s:property value="%{feedBackMap.courseName}" /></td>
    </tr>
    <tr>
	<td>Date</td><td><s:property value="%{feedBackMap.showdate}" />
	<input type="hidden" id="status" name="status" value='<s:property value="%{otsfdbcktrainee.statusFlag}" />'/></td>
    </tr>
</tbody>
</table>
</div>
<br>
<div class="break"></div>
<br>
<div style="padding-left: 20px;" id="fdbckdetaildiv">
<table border="1" height="10%" width="90%">

	<tbody>
	<tr height="10%"><td align="center"> 5=Strongly agree 4= Agree 3=Neutral 2=Disagree 1=Strongly disagree</td> </tr>
	<tr border="0" height="10%"> <td align="center">Please Indicate The Relevant Number In Each Box</td></tr>
</tbody></table></div>
<br>
<div style="padding-left: 20px" class="displayTableFrame">
<table border="1" height="100%" width="90%">
<tr>
    <th align="center"><%= OTSConstants.OTS_TRAINER_FDBCK_CATEGORY %></th>
    <th align="center"><%= OTSConstants.OTS_TRAINER_FDBCK_PARAMETER %></th>
    <th align="center"><%= OTSConstants.OTS_TRAINER_FDBCK_PARAMETER_DESC %></th>
    <th align="center"><%= OTSConstants.OTS_TRAINER_FDBCK_RATING %></th>
</tr>

<tr>
<td align="justify" rowspan="8"> <%= OTSConstants.OTS_TRAINER_FDBCK_FACILITATOR %> </td>
<td align="justify"><%= OTSConstants.OTS_TRAINER_FDBCK_FACILITATOR_EXPEC %></td>
<td align="justify"><%= OTSConstants.OTS_TRAINER_FDBCK_FACILITATOR_EXPEC_DESC %></td>
<td align="justify"> <input type = "text" id="faExpectations" size="4" maxlength="1" name = "faExpectations" class="validcheck" value = '<s:property value="%{otsfdbcktrainee.faExpectations}"/>' /></td>
</tr>

<tr>
<td align="justify"><%= OTSConstants.OTS_TRAINER_FDBCK_FACILITATOR_TRSEQ %></td>
<td align="justify"><%= OTSConstants.OTS_TRAINER_FDBCK_FACILITATOR_TRSEQ_DESC %></td>
<td align="justify"> <input type = "text" id="faTrsequence" size="4" maxlength="1" name = "faTrsequence" class="validcheck" value = '<s:property value="%{otsfdbcktrainee.faTrsequence}"/>'/></td>
</tr>

<tr>
<td align="justify"><%= OTSConstants.OTS_TRAINER_FDBCK_FACILITATOR_TRPCE %></td>
<td align="justify"><%= OTSConstants.OTS_TRAINER_FDBCK_FACILITATOR_TRPCE_DESC %></td>
<td align="justify"> <input type = "text" id="faTrpace" size="4" maxlength="1" name = "faTrpace" class="validcheck" value = '<s:property value="%{otsfdbcktrainee.faTrpace}"/>'/></td>
</tr>

<tr>
<td align="justify"><%= OTSConstants.OTS_TRAINER_FDBCK_FACILITATOR_COMTN %></td>
<td align="justify"><%= OTSConstants.OTS_TRAINER_FDBCK_FACILITATOR_COMTN_DESC %></td>
<td align="justify"> <input type = "text" id="faTrcommunication" size="4" maxlength="1" name = "faTrcommunication" class="validcheck" value = '<s:property value="%{otsfdbcktrainee.faTrcommunication}"/>'/></td>
</tr>

<tr>
<td align="justify"><%= OTSConstants.OTS_TRAINER_FDBCK_FACILITATOR_WLPRD %></td>
<td align="justify"><%= OTSConstants.OTS_TRAINER_FDBCK_FACILITATOR_WLPRD_DESC %></td>
<td align="justify"> <input type = "text" id="faWellprepared" size="4" maxlength="1" name = "faWellprepared" class="validcheck" value = '<s:property value="%{otsfdbcktrainee.faWellprepared}"/>'/></td>
</tr>

<tr>
<td align="justify"><%= OTSConstants.OTS_TRAINER_FDBCK_FACILITATOR_COFTP %></td>
<td align="justify"><%= OTSConstants.OTS_TRAINER_FDBCK_FACILITATOR_COFTP_DESC %></td>
<td align="justify"> <input type = "text" id="faCovoftopics" size="4" maxlength="1" name = "faCovoftopics" class="validcheck" value = '<s:property value="%{otsfdbcktrainee.faCovoftopics}"/>'/></td>
</tr>

<tr>
<td align="justify"><%= OTSConstants.OTS_TRAINER_FDBCK_FACILITATOR_INTCN %></td>
<td align="justify"><%= OTSConstants.OTS_TRAINER_FDBCK_FACILITATOR_INTCN_DESC %></td>
<td align="justify"> <input type = "text" id="faInteraction" size="4" maxlength="1" name = "faInteraction" class="validcheck" value = '<s:property value="%{otsfdbcktrainee.faInteraction}"/>'/></td>
</tr>
        
<tr>
<td align="justify"><%= OTSConstants.OTS_TRAINER_FDBCK_FACILITATOR_ATCDB %></td>
<td align="justify"><%= OTSConstants.OTS_TRAINER_FDBCK_FACILITATOR_ATCDB_DESC %></td>
<td align="justify"> <input type = "text" id="faAbilitytcd" size="4" maxlength="1" name = "faAbilitytcd" class="validcheck" value = '<s:property value="%{otsfdbcktrainee.faAbilitytcd}"/>'/></td>
</tr>       

<tr>
<td align="justify" rowspan="5"> <%= OTSConstants.OTS_TRAINER_FDBCK_OVERALL %> </td>
<td align="justify"><%= OTSConstants.OTS_TRAINER_FDBCK_OVERALL_CNTML %></td>
<td align="justify"><%= OTSConstants.OTS_TRAINER_FDBCK_OVERALL_CNTML_DESC %></td>
<td align="justify"> <input type = "text" id="ovContent" size="4" maxlength="1" name = "ovContent" class="validcheck" value = '<s:property value="%{otsfdbcktrainee.ovContent}"/>'/></td>
</tr>

<tr>
<td align="justify"><%= OTSConstants.OTS_TRAINER_FDBCK_OVERALL_LBEEX %></td>
<td align="justify"><%= OTSConstants.OTS_TRAINER_FDBCK_OVERALL_LBEEX_DESC %></td>
<td align="justify"><input type = "text" id="ovContent" size="4" maxlength="1" name = "ovLabexercises" class="validcheck" value = '<s:property value="%{otsfdbcktrainee.ovLabexercises	}"/>'/></td>
</tr>

<tr>
<td align="justify"><%= OTSConstants.OTS_TRAINER_FDBCK_OVERALL_CLFCL %></td>
<td align="justify"><%= OTSConstants.OTS_TRAINER_FDBCK_OVERALL_CLFCL_DESC %></td>
<td align="justify"><input type = "text" id="ovCrfacilities" size="4" maxlength="1" name = "ovCrfacilities" class="validcheck" value = '<s:property value="%{otsfdbcktrainee.ovCrfacilities}"/>'/></td>
</tr>

<tr>
<td align="justify"><%= OTSConstants.OTS_TRAINER_FDBCK_OVERALL_LBFCL %></td>
<td align="justify"><%= OTSConstants.OTS_TRAINER_FDBCK_OVERALL_LBFCL_DESC %></td>
<td align="justify"><input type = "text" id="ovLabfacilities" size="4" maxlength="1" name = "ovLabfacilities" class="validcheck" value = '<s:property value="%{otsfdbcktrainee.ovLabfacilities}"/>'/></td>
</tr>

<tr>
<td align="justify"><%= OTSConstants.OTS_TRAINER_FDBCK_OVERALL_MNSRT %></td>
<td align="justify"><%= OTSConstants.OTS_TRAINER_FDBCK_OVERALL_MNSRT_DESC %></td>
<td align="justify"><input type = "text" id="ovMentorsupport" size="4" maxlength="1" name = "ovMentorsupport" class="validcheck" value = '<s:property value="%{otsfdbcktrainee.ovMentorsupport}"/>'/></td>
</tr>

</table>
<br>
<div class="break" style="padding-left: 10px"></div>
<div style="padding-left: 20px">
<table align="left">
<tr>
<td><%= OTSConstants.OTS_TRAINER_FDBCK_LIKED%></td>
<td><textarea rows="5" cols="96" id="fbtext1" name = "fbtext1" class = "commenttext" ><s:property value="%{otsfdbcktrainee.fbtext1}"/></textarea></td>
</tr>

<tr>
<br>
<td><%= OTSConstants.OTS_TRAINER_FDBCK_DSLKD%></td>
<td><textarea rows="5" cols="96" id="fbtext2" name = "fbtext2" class = "commenttext" ><s:property value="%{otsfdbcktrainee.fbtext2}"/></textarea></td>
</tr>

</table>
</div>
</div>
</form>
</body>

<SCRIPT type="text/javascript">
$(document).ready(function(){
	//$("#fdbckdetaildiv input,#fdbckdetaildiv textarea").attr("disabled",true);

	$('.validcheck').each(function() {
		
	var default_value = $(this).val();
	
	if(default_value == "") {
		$(this).val(0);
    }
	});

	$('.validcheck').focus(function() {
		var default_value = $(this).val();
		
		if(default_value == 0) {
			$(this).val("");
	    }
	    });

	$('.validcheck').blur(function(e) {
		var default_value = $(this).val();
		if(default_value == "") {
			$(this).val(0);
	    }
		var integerReg = /^(0|[1-5][0-5]*)$/;
		if(!integerReg.test(this.value))
				{
			     jAlert("Numeric Only Allowed. Please enter number between 1 to 5.","Information");
			     focus(this);
				}
	    
	    });
    
	$(".validcheck").keyup(function(e) {
	    var $this = $(this);
	    var val = $this.val();
	    if (val > 5){
	        e.preventDefault();
	        $this.val(0);
	    }
	    else if (val < 0)
	    {
	        e.preventDefault();
	        $this.val(0);
	    }
	});

	$("#feedbackdetails").submit(function(e) {
		//alert("AFTER SUBMIT"+this.value);
		var characterReg = /^\s*[a-zA-Z0-9,\s]+\s*$/;
		 if(!characterReg.test(this.value)) {
			 
			 jAlert("Please enter text without special characters.","Information");
			 ("#fbtext2").focus();
		 }
		
	});

	$(".validcheck").keydown(function(e){
						
			            var key = e.charCode || e.keyCode || 0;
			            // allow backspace, tab, delete, arrows, numbers and keypad numbers ONLY
			            return (
			                key == 8 || 
			                key == 9 ||
			                key == 46 ||
			                (key >= 37 && key <= 40) ||
			                (key >= 48 && key <= 57) ||
			                (key >= 96 && key <= 105));
			        
	});
	
var status = $("#status").val();
if(status == "Trainee Feedback Completed" ){
	$('#feedbackdetails').find("input, textarea, select").attr("disabled",true);
	
}
});

</SCRIPT>

</html>