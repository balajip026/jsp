<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<!-- from previous page before getting setId -->
<%
String setId=request.getParameter("setId");
String programId=request.getParameter("programId");
String freezeQuestionSet=request.getParameter("freezeQuestionSet");
%>
<input type="hidden" id="setIdDirect" name="setIdDirect" value="<%=setId%>">
<input type="hidden" id="programIdDirect" name="programIdDirect" value="<%=programId%>">
<input type="hidden" id="freezeQuestionSet" name="freezeQuestionSet" value="<%=freezeQuestionSet%>">
<!-- from previous page before getting setId -->
<STYLE type="text/css">
fieldset.form
{
	width: 200px;
	height: 250px;
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
.leftnav {
height:270px;
   float: left;
   width:275px;
    border-right: 1px solid #003D7A;
}

.rightContent {
   min-height: 400px;
   float:left;
}
</STYLE>
<SCRIPT type="text/javascript">

$(document).ready(function(){
//alert("on ready in QuestionSetTrainer");
   var setIdPage=$("#setIdDirect").val();
   var programIdPage=$("#programIdDirect").val();
   var freezeQuestionSet=$("#freezeQuestionSet").val();
  // alert("freezeQuestionSet---------- in QuestionTrainer.jsp============="+freezeQuestionSet);
		$.ajax({
			url:"SetIDDetails.action?&programId="+programIdPage,//"SetIDDetails.action",
			type: "POST", 
			success:function(data){
		     var setidSelect = $('#setIDs').empty();
		     //alert("setidSelect======"+setidSelect);
		     setidSelect.append( '<option value=>--Select--</option>'); 
	        setidData = data.setidsList;
	       // alert("setidData============="+setidsList.setId);
	        $.each(data.setidsList, function(locObject) {
	        	setidSelect.append( '<option value="'
	                                 + data.setidsList[locObject].setId+"-"+data.setidsList[locObject].setName
	                                 + '">'
	                                 + data.setidsList[locObject].setId+"-"+data.setidsList[locObject].setName
	                                 + '</option>' );
              });
			},
			async:false
		});
 	//before setting id based details showing start
		$.ajax({		             
        url: "QuestionSetTrainerDetails.action?&id="+setIdPage+'&programId='+programIdPage,
       // data:serialiseData,
        cache : false,
        success: function(data){
        //alert("success======="+data.setidsList);
        $.each(data.setidsList, function(locObject) {
		 if(data.setidsList[locObject].setId!=" " && data.setidsList[locObject].setId!="null"){  
		         $('#setIDs').attr("value",data.setidsList[locObject].setId+"-"+data.setidsList[locObject].setName);
		  	 }
         if(data.setidsList[locObject].setName!=" " && data.setidsList[locObject].setName!="null"){  
         $('#setName').val(data.setidsList[locObject].setName);
        	 }
         if(data.setidsList[locObject].courseName!=" " && data.setidsList[locObject].courseName!="null"){	 
         $('#courseName').val(data.setidsList[locObject].coursesForQuestionSet.courseName);
         }
         if(data.setidsList[locObject].setNoQuestions!=" " && data.setidsList[locObject].setNoQuestions!="null"){
         $('#setNoQuestions').val(data.setidsList[locObject].setNoQuestions);
         }else{
        	 $('#setNoQuestions').val(0);
             }
         if(data.setidsList[locObject].sWeightage!=" " && data.setidsList[locObject].sWeightage!="null"){
         $('#sWeightage').val(data.setidsList[locObject].SWeightage);
         }else{
        	 $('#sWeightage').val(0);
             }
         if(data.setidsList[locObject].MWeightage!=" " && data.setidsList[locObject].MWeightage!="null"){
         $('#mWeightage').val(data.setidsList[locObject].MWeightage);
         }else{
        	 $('#mWeightage').val(0);
             }
         if(data.setidsList[locObject].CWeightage!=" " && data.setidsList[locObject].CWeightage!="null"){
         $('#cWeightage').val(data.setidsList[locObject].CWeightage);
         }else{
        	 $('#cWeightage').val(0);
	         }
       
         
        });
        },
         error:function(data){
         alert("Error :: "+data);
       }});

//before setting id based details showing end

//don't change based on selecting
if(setIdPage == 0 || freezeQuestionSet == ""){
	//don't change based on selecting
	 	 $('#setIDs').change(function() {
	 		var selectedvalue=$(this).val();
	 		//alert("selectedvalue========="+selectedvalue);
	 		var  index=selectedvalue.indexOf('-');
	 		//alert("index==========="+index);
	 		var substr = selectedvalue.substring(0, index);
	 		//alert("substr=========="+substr);
	 		
	 		$.ajax({		             
	            url: "QuestionSetTrainerDetails.action?&id="+substr+'&programId='+programIdPage,
	           // data:serialiseData,
	            cache : false,
	            success: function(data){
	            //alert("success======="+data.setidsList);
	            $.each(data.setidsList, function(locObject) {

	             if(data.setidsList[locObject].setName!=" " && data.setidsList[locObject].setName!="null"){  
	             $('#setName').val(data.setidsList[locObject].setName);
	            	 }
	             if(data.setidsList[locObject].courseName!=" " && data.setidsList[locObject].courseName!="null"){	 
	             $('#courseName').val(data.setidsList[locObject].coursesForQuestionSet.courseName);
	             }
	             if(data.setidsList[locObject].setNoQuestions!=" " && data.setidsList[locObject].setNoQuestions!="null"){
		         $('#setNoQuestions').val(data.setidsList[locObject].setNoQuestions);
	             }else{
	            	 $('#setNoQuestions').val(0);
	                 }
	             if(data.setidsList[locObject].sWeightage!=" " && data.setidsList[locObject].sWeightage!="null"){
		         $('#sWeightage').val(data.setidsList[locObject].SWeightage);
	             }else{
	            	 $('#sWeightage').val(0);
	                 }
	             if(data.setidsList[locObject].MWeightage!=" " && data.setidsList[locObject].MWeightage!="null"){
		         $('#mWeightage').val(data.setidsList[locObject].MWeightage);
	             }else{
	            	 $('#mWeightage').val(0);
	                 }
		         if(data.setidsList[locObject].CWeightage!=" " && data.setidsList[locObject].CWeightage!="null"){
		         $('#cWeightage').val(data.setidsList[locObject].CWeightage);
		         }else{
		        	 $('#cWeightage').val(0);
			         }
	            });
	            },
		         error:function(data){
		         alert("Error :: "+data);
		       }});  
	 	 		   });
//}//inner if
}//if
//------------END----setid Name---------------------------------------------------
});//end document.onready

</script>
<form name="Trainer_Question_Set_form" id="Trainer_Question_Set_form" theme="simple"> 
<div style="float: left;" class="leftnav">
<fieldset class="form" ><legend style="color: #fffFFF; background: #185994; border: 1px solid #781351; padding: 2px 8px; "><b>Avalible Question Sets</b></legend>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<select  size="6"  style="width:150px;height:150px;float:center" id="setIDs" name="setIDs"><option></option></select>
</fieldset>
</div>
       <!--  field set start -->			
<div style="float: right;">
<fieldset class="form" ><legend style="color: #fffFFF; background: #185994; border: 1px solid #781351; padding: 2px 8px; "><b>Set Details</b></legend>
<table align="right" width="100%" border="0">
 	 <tr><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td></tr>
      <tr><td align="left">Set Name:</td><td><input type="text" id="setName"  name="setName" style="width:90px;" disabled="disabled"></td>
     </tr>
      <!-- two empty rows -->
     <tr> <td align="left" style="width:90px" >Course Name:</td><td><input type="text" id="courseName"  name="courseName"  style="width:90px;" disabled="disabled"></td></tr>
      <tr></tr>
     <tr><td align="left" >No of Questions:</td><td><input type="text" id="setNoQuestions"  name="setNoQuestions" style="width:90px;" disabled="disabled"></td></tr>
     <!-- two empty rows -->
      <tr><td align="left" >Simple:</td><td><input type="text" id="sWeightage"  name="sWeightage" style="width:90px;" disabled="disabled"></td></tr>
      <tr><td align="left" >Medium:</td><td><input type="text" id="mWeightage"  name="mWeightage" style="width:90px;" disabled="disabled"></td></tr>
      <tr>
      <td align="left">Complex:</td><td><input type="text" id="cWeightage"  name="cWeightage" style="width:90px;" disabled="disabled"></td>
      </tr>
     
    
     <tr><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td></tr>
</table>
</fieldset>
<!--  field set end -->
</div>
<input type="hidden" id="freezeQuestion"  name="freezeQuestion" value='<s:property value="%{freezeFlag}"/>'></form> 
</html>