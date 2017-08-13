<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@include file="../CommonJSs.jsp" %>
<SCRIPT type="text/javascript">
$(document).ready(function(){
var data ;
var selectedSetId;
var CourseNameEdit;
	function getHidShowIcons(){
		var selRowIds = $('#SetQuestionsTBL').jqGrid('getGridParam', 'selarrrow');
        if(selRowIds.length > 1){
		         $("td#editSetQuestion").attr("disabled","disabled");
		         $("td#viewSetQuestion").attr("disabled","disabled");
		         $("td#editSetQuestion").find("div").addClass("ui-pg-button ui-corner-all ui-state-disabled");
		         $("td#viewSetQuestion").find("div").addClass("ui-pg-button ui-corner-all ui-state-disabled");
     		 }
     	else{
                 $("td#editSetQuestion").removeAttr("disabled");
                 $("td#viewSetQuestion").removeAttr("disabled");
                 $("td#editSetQuestion").find("div").removeClass("ui-pg-button ui-corner-all ui-state-disabled");
                 $("td#viewSetQuestion").find("div").removeClass("ui-pg-button ui-corner-all ui-state-disabled");
     		}
	}

	function validate_add(postdata)
	 {
		 
		// alert("plat form postdata"+postdata);
		 var characterReg = /^\s*[a-zA-Z0-9,\s]+\s*$/;
		 var spaceReg = /^[a-zA-Z0-9]{1,20}$/;

		 if (postdata == ""  || postdata =="null")
			   return [false,"Please Enter all fields."];
		 
		 if(!spaceReg.test(postdata)) {
		     return [false,"Please enter all fields without special characters."];
		 }
		 return [true,""];
	 }

$("#SetQuestionsTBL").jqGrid({
			url:"listSetQuestions", 
			datatype: "json",
			jsonReader: {
					repeatitems : false,
					root : 'model',
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
				colNames : [ 'ID', 'Name', 'Course Name' ,'Description','User','Update TimeStamp','Course ID'],
				colModel : [ { name : 'setId',index : 'setId',   align : "center", editable : true, hidden : true,
					//searchoptions: { defaultValue:'Filter...'}, search : true, filter : true,
					editoptions : { size : 20 }, key : true ,editrules : {required : true }}, 
						
						{ name : 'setName',
							index : 'setName',  
							align : "left",
							editable : true,
							editrules : {
							required : true,
							edithidden : true
							},
							edittype : "textarea",
							hidden : false,
							editoptions : { rows : "3",	cols : "40" }},
							{ name : 'coursesForQuestionSet.courseName',
								index : 'coursesForQuestionSet.courseName',  
								align : "left",
								editable : true,
								editrules : {
								required : true,
								edithidden : true
								},
								edittype : "textarea",
								hidden : false,
								editoptions : { rows : "3",	cols : "40" }
								},

								{ name : 'setDescription', index : 'setDescription',  
								align : "left",
								editable : true,
								editrules : {
								required : true,
								edithidden : true
								},
								edittype : "textarea",
								hidden : false,
								editoptions : { rows : "3",	cols : "40" }
								}, {
							name : 'updatedUser',
							index : 'updatedUser',  
							align : "left",
							editable : false,
							hidden : true,
							editoptions : {	size : 20 }}, {
								name : 'updateTimestamp',
								index : 'updateTimestamp', 
								align : "left",
								editable : false,
								hidden : true,
								editoptions : {	size : 20 }},
								{ name : 'coursesForQuestionSet.courseId',
									index : 'coursesForQuestionSet.courseId',  
									align : "left",
									editable : false,
									hidden : true,
									ditoptions : {	size : 20 }}],
			rowNum : 15,
			rowList : [ 15, 20, 30 ],
			pager : '#SetQuestionsTBLPageDiv',
			sortname : 'setId',
			viewrecords : true,
			gridview : true,
			loadatonce : false,
			multiselect : true,
			toolbar:[true,"top"],
			height: 255,
			width: 'auto',
			sortorder : "desc",
			caption : "&nbsp;Set Questions",
			editurl : "saveOrUpdateSetQuestions",
			width : 1000,
			onSelectRow: function(id){
					selectedSetId = id;	
					var gridObject = $("#SetQuestionsTBL");
					var selRowId = gridObject.jqGrid ('getGridParam', 'selrow');
					CourseNameEdit  = gridObject.jqGrid ('getCell', selRowId, 'coursesForQuestionSet.courseId');
					//alert("CourseNameEdit======"+CourseNameEdit);
					$("#CourseNameEdit").attr("value",CourseNameEdit);
					$("#selectedSetId").attr("value",selectedSetId);
					getHidShowIcons();
			       },
			onSelectAll: function(aRowids,status){
			    	   selectedSetId = id;	
					$("#selectedSetId").attr("value",selectedSetId);
			    	   getHidShowIcons();
			       },
			viewrecords : true

		});

		$('#SetQuestionsTBL').jqGrid('filterToolbar', {
			searchOnEnter : true,
			enableClear : false,
			beforeSearch : function(value) {
				$("#SetQuestionsTBL").jqGrid('setGridParam', {
					url : "listSetQuestions?filters="
				});
			}
		});
		
		$("#SetQuestionsTBL").jqGrid('navGrid', '#SetQuestionsTBLPageDiv', {
			add : false,
			edit : false,
			del : false,
			search : true,
			view : false
		}, //{closeAfterAdd:true},//options
			{ 
			  reloadAfterSubmit : true, 
			  closeOnEscape : true, 
			  closeAfterEdit : true, 
			  // code for changing position of modal window by Ramana G on 19/11/12
			  afterShowForm : function(domainMaitenanceTBL) {
							$(".navButton").hide();
							$("#setName").attr("disabled","disabled");
			               // $('#editmodSetQuestionsTBL').position({my:'center', at:'center', of:window, collision: 'fit'});
					}
			},  // add options
				{ // now define settings for Delete dialog
					mtype : "POST",	reloadAfterSubmit : true,
					onclickSubmit : function(rp_ge, postdata) {
					rp_ge.url = "deleteSetQuestions?setId="+postdata;
					/*var parameter = "setName=" + postdata;
							$.post('deletePlatForm', parameter, function(data){
								var message = data.message;
								if(message != null && message != "" ){	
									jAlert(message,"Information");
								}
							});*/
					},
					afterComplete :function(response,postdata){
						var responseMessage = $.parseJSON(response.responseText);
						var message = responseMessage.message;
						if(message != null && message !=""){
						jAlert(message,"Information");
						}
					},
					serializeDelData : function(postdata) {
						return "";
					},
					closeOnEscape : true
		
				}, // del options
				// Multi Delete By Uday END 
				{
					multipleSearch : true,
					closeOnEscape : true,
					closeAfterSearch : true,
					groupOps : [ { op : "AND", text : "AND"}, { op : "OR", text : "OR" } ],
					matchText : "Find",
					rulesText : " matches",
					sopt : [ 'cn','bw', 'eq', 'ne', 'lt', 'le', 'gt', 'ge', 'ew' ],
					onSearch : function(params, postdata) {
					
					$("#gs_updatedUser").val("");
					$("#gs_setName").val("");
					$("#SetQuestionsTBL").jqGrid('setGridParam', {url : "listSetQuestions"});
				},
				reloadAfterSearch : true
				}

				//our own custom retrieve action for view
				).jqGrid('navButtonAdd',"#SetQuestionsTBLPageDiv",
				{
				title:"View",
				buttonicon : "ui-icon ui-icon-document",
				id:'viewSetQuestion',
				position: "first", 
				caption : "",
				onClickButton : function(){
					var selectedRows = $('#SetQuestionsTBL').jqGrid('getGridParam', 'selarrrow');
					if(selectedRows.length == 0) {
						jAlert("Please,select row","Warning");
						return false;
					}
					$("#setQuestionDeatilsForm").attr("action", "ViewSetQuestionAction");
					$("#setQuestionDeatilsForm").submit();
				}
		     })//Add SetQuestionAddAction//EditSetQuestionAction
		     
		   //our own custom functionalities   for edit  
			.jqGrid('navButtonAdd',"#SetQuestionsTBLPageDiv",
				{
				title:"Edit",
				buttonicon : "ui-icon ui-icon-pencil",
				id:'editSetQuestion',
				position: "first", 
				caption : "",
				onClickButton : function(){
				var selectedRows = $('#SetQuestionsTBL').jqGrid('getGridParam', 'selarrrow');
				if(selectedRows.length == 0) {
					jAlert("Please,select row","Warning");
					return false;
				}
					$("#setQuestionDeatilsForm").attr("action", "EditSetQuestionAction");
					$("#setQuestionDeatilsForm").submit();
				}
		     })//Add SetQuestionAddAction
		     .jqGrid('navButtonAdd',"#SetQuestionsTBLPageDiv",
				{
				title:"Add",
				buttonicon : "ui-icon ui-icon-plus",
				id:'addSetQuestion',
				position: "first", 
				caption : "",
				onClickButton : function(){
					$("#setQuestionDeatilsForm").attr("action", "SetQuestionAddAction");
					$("#setQuestionDeatilsForm").submit();
				}
		     });
});
</SCRIPT>
<body>
<form id="setQuestionDeatilsForm" action="">

<div align="center" width="100%" >
<br>
<div id="heading" class="title" align="left">SetQuestions</div>
<br>
<table id="SetQuestionsTBL" width="100%"></table>
<div id="SetQuestionsTBLPageDiv"></div>
</div>
<input type="hidden" id="query" value="">
<br>
<input type="hidden" name="selectedSetId" id="selectedSetId" value="">
<input type="hidden" name="CourseNameEdit" id="CourseNameEdit" value='<s:property value="%{CourseNameEdit}"/>'>
</form>
</body>
</html>