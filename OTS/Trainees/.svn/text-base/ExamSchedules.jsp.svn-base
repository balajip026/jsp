<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.vit.bean.ots.trainer.TrainerNominate"%>
<%@ page import="com.vit.bean.ots.trainer.EmpMaster"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<SCRIPT type="text/javascript">
$(document).ready(function(){

var checkedVal; 
var programId = $("#programId").val();
var setId = $("#setIdHid").val();
var data = $("#selectDiv").html();
	$("#examScheduleTBL").jqGrid({
				
				url:'viewExamSchedules.action?programId='+programId,
				datatype: "json",
				jsonReader: {
					repeatitems : false,
					root : 'examList',
					page : function(obj) {
						return obj.page;
					},
					total : function(obj) {
						return obj.total;
					},
					records : function(obj) {
						return obj.records;
					}
				}, 
				colNames : ['Exam Date', 'Exam Open Time', 'Exam Close Time'],
						
		        colModel : [ { name : 'examDate',index : 'examDate', align : "center", editable : true, formatter:'date', "formatoptions":{"srcformat":"Y-m-d", "newformat":"d-M-Y"}},
		    		         { name : 'examOpenTime',index : 'examOpenTime', align : "center",editable : true,editoptions : {size : 20}},
		                     { name : 'examCloseTime',index : 'examCloseTime', align : "center",editable : true,editoptions : {size : 20}}],
		        rowNum : 4,
				//rowList : [ 10, 20, 30 ],
				pager : '#examSchedulesNav',
				loadatonce : true,
				viewrecords : true,
				height : 93,
				sortorder : "desc",
				sortname : "examDate",
				onSelectRow : function(location){
				}

			}); 

						     	 
});			
</SCRIPT>
</head>
<body>
<br>
<table id="examScheduleTBL"></table>
<br>
<s:hidden id="programId"  name="programId" key="programId" ></s:hidden> 
</body>
<s:form name="ExamSchedule" id="TrainerFreeze" theme="simple"> 
<div align="left">
</div>
</s:form>

</html>
