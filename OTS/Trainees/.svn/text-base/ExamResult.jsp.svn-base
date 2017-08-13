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
<SCRIPT type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/widgets/jquery.countdown.js"></SCRIPT>
<script type="text/javascript">
var programId = $("#programIdHid").val();

$.ajax({ url: "viewExamResultData.action",
    data : "programId="+programId,
    cahce : false,
    success: function(data){
    	if(data.traineeExamResultlist.length > 0 ){
		 		$.each(data.traineeExamResultlist[0],function(key,value){
					//alert(key + "  : " + value); 
					var marks = data.traineeExamResultlist[0].marks;
					$("#score").text(marks);
					var numberofQues = data.traineeExamResultlist[0].numberofquestions;
					$("#numberofQues").text(numberofQues);
					var percentage = data.traineeExamResultlist[0].percentage;
					$("#percentage").text(percentage);
					var resultstatus = data.traineeExamResultlist[0].resultstatus;
					$("#status").text(resultstatus);
				});
    	      }}
  });     
</script>
<s:form name="examActionForm" id="examActionForm" theme="simple" action="">
<div align="left" class="swMain" id="examDiv"><br>
<s:hidden name="programId" id="programIdHid" /> 
</div>
<table width="90%">
<tr>
<td>
<fieldset style="border: 1px ridge #185994; "> <legend style="color: #fff; background: #185994; border: 1px solid #781351; padding: 1px 6px; " id="form_deliveryDetails-legend"><b>Result</b></legend> <br>
<table align ="left" style="padding-left: 3px">
<tr align="left"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Your score is<b>&nbsp;<span id="score"></span>&nbsp;</b> out of <b><span id="numberofQues"></span></b></td> </tr>
<tr align="left"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Your Exam percentage is <b><span id="percentage"></span> %</b></td></tr> 
<tr align="left"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Your Result Status is <b><span id="status" style="color:green"></span></b></td> </tr>
<tr align="left"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
</table>
<br>
</fieldset>
</td>
</tr>
</table>
</s:form>   
</html>