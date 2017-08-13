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

	if($('[name="questype"]:checked').length ==0){
		 $("#subjective").hide();  
    	 $("#subAnswer").hide();  
         $("#objective1").hide(); 
         $("#objective2").hide(); 
         $("#objective3").hide(); 
         $("#objective4").hide(); 
         $("#objAnswer").hide();     
     	//var selValue = $('input[name=questype]:checked').val()=="objective"; 
     	//alert(selValue);
     }else if($('[name="questype1"]:checked').length ==true){
         //alert("zero value");
    	 $("#ans1").val("");
   	  	$("#ans2").val("");
   	 	 $("#ans3").val("");
   	 	 $("#ans4").val(""); 
   		  //$("#corans").val("");  
     	 $("#subjective").hide();  
    	 $("#subAnswer").hide();  
         $("#objective1").hide(); 
         $("#objective2").hide(); 
         $("#objective3").hide(); 
         $("#objective4").hide(); 
         $("#objAnswer").hide();         
     }

	
 $('input:radio[name="questype"]').change(function(){ 
		   
		         if ($('input[name=questype]:checked').val()=="objective") {
		                      $("#subjective").hide();  
		                  		$("#subAnswer").hide();  
		                       $("#objective1").show(); 
		                       $("#objective2").show();  
		                       $("#objective3").show();  
		                       $("#objective4").show(); 
		                       $("#objAnswer").show();              
		          }else {
		        	  $("#ans1").val("");
		        	  $("#ans2").val("");
		        	  $("#ans3").val("");
		        	  $("#ans4").val(""); 
		        	  //$("#corans").val("");  
		         	 $("#subjective").show();  
		         	 $("#subAnswer").show();  
		              $("#objective1").hide();
		              $("#objective2").hide();
		              $("#objective3").hide();
		              $("#objective4").hide();  
		              $("#objAnswer").hide(); 
		             
		           } 		         
		         
	}); 
});
 </script>

<body>
<form id="form3" name="form3">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
     	<tr><td class="title"><font color="blue" class="title" /> Post Questions </font></td></tr>
 </table><br>

<div align="center">

<table border="0">
      <tr><td>Course</td><td><select id ="subCourseList" name="subCourseList" list="subCourseList" cssStyle="width:180px"/></td></tr>   
       <tr><td>&nbsp;</td></tr>
       
       <tr><td>&nbsp;</td></tr>
      <tr><td>Question: </td><td><textarea id="question" name="question" rows="4" cols="30" maxlength="500"></textarea></td></tr>      
      <tr><td>&nbsp;</td></tr>
      <tr><td><input type="radio" name="subjective" id="questype" />&nbsp;Subjective</td>
   			<td><input type="radio" name="objective" id="questype1" />&nbsp;Objective</td></tr>
       
 	<tr><td>&nbsp;</td></tr>
      <tr id="objective1"><td>object A:</td><td><input id="ans1" type="text" name="ans1" size="30" maxlength="300"/></td></tr>
      <tr id="objective2"><td>object B:</td><td><input id="ans2" type="text" name="ans2" size="30" maxlength="300"/></td></tr>
      <tr id="objective3"><td>object C:</td><td><input id="ans3" type="text" name="ans3" size="30" maxlength="300"/></td></tr>
      <tr id="objective4"><td>object D:</td><td><input id="ans4" type="text" name="ans4" size="30" maxlength="300"/></td></tr>
      <tr><td>&nbsp;</td></tr>
      <tr id="objAnswer">
      	<td>Answer:</td>
       <td>
	    <input type="radio" name="corans" id="corans" value="a"/><label for="objectivea">A</label>
		<input type="radio" name="corans" id="corans" value="b"/><label for="objectiveb">B</label>
		<input type="radio" name="corans" id="corans" value="c"/><label for="objectivec">C</label>
		<input type="radio" name="corans" id="corans" value="d"/><label for="objectived">D</label>
      </td>
      </tr>   
      </table>    
<br>
<table>
<tr id="insQuestion">
      <td>&nbsp;</td>
      <td><input type="button" name="btnPostSubmit" id="btnPostSubmit" value="Submit" class="ui-button ui-widget ui-state-default ui-corner-all"/>
      <input type="button" name="btnPostClear" id="btnPostClear" value="Clear" class="ui-button ui-widget ui-state-default ui-corner-all"/>
      </td>
      </tr>
</table>
</div>

</form>
</body>  
</html>