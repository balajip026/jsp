<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@include file="../CommonJSs.jsp" %>
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
    <SCRIPT type="text/javascript">
    function SearchQuestions(){
        document.serachquetionsform.submit();
    }
    </SCRIPT>
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
	<tr>
		<td>
			Your request of uploading bulk questions to data base is <s:property value="fileUploadStatus"/>
		</td>
	</tr>
	<tr>
		<td>
			click here to <a href="bulkUploadComponent.action">upload</a> file again
		</td>
	</tr>
	<tr><td>&nbsp</td></tr>
	<tr><td>&nbsp</td></tr>
	<tr align="right">
		<td>Back to :</td>
		<td>
			<input type="button" name="qbank" id="qbank" value="Quetion Bank" class="fm-button ui-state-default ui-corner-all fm-button-icon-left box-shadow" onclick="SearchQuestions()"/>
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
</tr></table>
</div>
</form>
<form name="serachquetionsform" action="SearchQuestions.action"></form>
</body>
</html>