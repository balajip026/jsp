<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../CommonJSs.jsp" %>
<script type="text/javascript">
function validateForm(){
	if(document.addQuestionsbulk.fileBrowse.value == ""){
		jAlert("Please choose a file to submit");
	}else{
		document.addQuestionsbulk.submit();
	}
	}
function SearchQuestions(){
    document.serachquetionsform.submit();
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
    .box-shadow {
      -moz-box-shadow: 0 5px 10px #ccc;
      -webkit-box-shadow: 0 5px 10px #ccc;
      box-shadow: 0 5px 10px #ccc;
      zoom: 1;
      filter:
          progid:DXImageTransform.Microsoft.Shadow(color=#ffffff,direction=0,strength=1),
          progid:DXImageTransform.Microsoft.Shadow(color=#ffffff,direction=45,strength=1),
          progid:DXImageTransform.Microsoft.Shadow(color=#ffffff,direction=90,strength=2),
          progid:DXImageTransform.Microsoft.Shadow(color=#ffffff,direction=135,strength=3),
          progid:DXImageTransform.Microsoft.Shadow(color=#cccccc,direction=180,strength=10),
          progid:DXImageTransform.Microsoft.Shadow(color=#ffffff,direction=225,strength=3),
          progid:DXImageTransform.Microsoft.Shadow(color=#ffffff,direction=270,strength=2),
          progid:DXImageTransform.Microsoft.Shadow(color=#ffffff,direction=315,strength=1);
}
    body:last-child .box-shadow {
      /* Remove filter from IE9 */
      filter: none;
    }
    </style>
</head>

<body>
<form id="addQuestionsbulk" name="addQuestionsbulk" action="bulkQuetionsUpload.action" target="_self">

<div align="center" width="100%">
<br>
<div id="heading" class="title" align="left">Post Questions</div>
<br>
<table width="100%">
<tr>
<td width="20%">&nbsp</td>
<td>
<fieldset style="border: 2px ridge #185994; "> 
<legend style="color: #fff; background: #185994; border: 1px solid #781351; padding: 2px 6px; "><b>File Upload</b></legend>

<table align="center">
	<tr><td><label style="font-size:11px; font-family:Verdana">Upload your file here:</label></td><td align="left"></td></tr>
	<tr>
		<td>
			<input type="file" name="fileBrowse" id="fileBrowse" class="fm-button ui-state-default ui-corner-all fm-button-icon-left box-shadow"/>
		</td>
	</tr>
	<tr>
		<td>
			<input type="button" name="upload" id="upload" value="Upload" class="fm-button ui-state-default ui-corner-all fm-button-icon-left box-shadow" onclick="validateForm()"/>
		&nbsp;&nbsp;
			<input type="button" name="cancel" id="upload" value="Cancel" class="fm-button ui-state-default ui-corner-all fm-button-icon-left box-shadow"  onclick="SearchQuestions()"/>
		</td>
	</tr>
</table>

</fieldset>

</td><td width="20%">&nbsp</td></tr>
<tr>
<td><br></td></tr>
<tr>
<td><br></td></tr>
<tr>
<td width="20%">&nbsp</td>
<td>
<a href="Quetions_Bulk_Upload.xls" class="box-shadow">Download xls template here</a>
</td>
<td width="20%">&nbsp</td>
</tr></table>
</div>
</form>
<form name="serachquetionsform" action="SearchQuestions.action"></form>
</body>
</html>