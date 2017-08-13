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
	// Validation Function 
		
	function appValue(value,APP_CODE ) {
				if (value == ""  || value =="null")
				   return [false,"Please Enter AppCode."];
				   else
					   return [true,""];
					}

	function desValue(value,DESCRIPTION ) {
				if (value == ""  || value =="null")
				   return [false,"Please Enter Description."];
				   else
					   return [true,""];
					}
	function getHidShowIcons(){
		var selRowIds = $('#BusinessApplicationTBL').jqGrid('getGridParam', 'selarrrow');
        if(selRowIds.length > 1){
		         $("td#edit_BusinessApplicationTBL").attr("disabled","disabled");
		         $("td#view_BusinessApplicationTBL").attr("disabled","disabled");
		         $("td#edit_BusinessApplicationTBL").find("div").addClass("ui-pg-button ui-corner-all ui-state-disabled");
		         $("td#view_BusinessApplicationTBL").find("div").addClass("ui-pg-button ui-corner-all ui-state-disabled");
     		 }
     	else{
                 $("td#edit_BusinessApplicationTBL").removeAttr("disabled");
                 $("td#view_BusinessApplicationTBL").removeAttr("disabled");
                 $("td#edit_BusinessApplicationTBL").find("div").removeClass("ui-pg-button ui-corner-all ui-state-disabled");
                 $("td#view_BusinessApplicationTBL").find("div").removeClass("ui-pg-button ui-corner-all ui-state-disabled");
     		}
	}	 
	function validate_add(postdata)
	 {
		 //var characterReg = /^\s*[a-zA-Z0-9,\s]+\s*$/;
		 //var spaceReg = /^[a-zA-Z0-9]{1,20}$/;
		 var specialReg = /^[a-zA-Z0-9\_\-\~]+$/;
		 if (postdata == ""  || postdata =="null")
			   return [false,"Please Enter Application Code."];
		 
		// if(!specialReg.test(postdata)) {
		 //    return [false,"Special characters (~, -, _) are only allowed for Application Code."];
		// }

		 if (postdata.length >= 20 )
		 {
			 return [false,"Please Enter Application Code with size less than 20 characters."];
		 }
		 return [true,""];
	 }
			$("#BusinessApplicationTBL").jqGrid( {
				url : 'listBussApp',
				datatype : "json",
				jsonReader : {
						repeatitems : false,
						root : 'model',
						page : function(obj) 
						 {
						    return obj.page;
						 },
						total : function(obj) 
						  {
	                        return obj.total;
						  },
						records : function(obj) 
						  {
							return obj.records;
						  }
				},
				colNames : [ 'appId', 'Application Code', 'Description' , 'Updated User' ],
				colModel : [ 
							{ name : 'appId',
							  index : 'appId',  searchoptions: { defaultValue:'Filter...'}, 
							  search : true, filter : true, align : "center", editable : true,
							  editoptions : { size : 20 },hidden : true, key: true},
							
							{ name : 'APP_CODE', index : 'APP_CODE',
					           search : true, filter : true,
							   align : "center",  editable : true,
							   editoptions : { size : 20 },
					           editrules : {custom : true,	custom_func : validate_add}}, 
					         { name : 'DESCRIPTION',index : 'DESCRIPTION',
							   align : "center", editable : true,
					           edittype : "textarea",
					           editoptions : { rows : "3", cols : "40" },
					           editrules : {custom : true, custom_func : desValue }}, 
					         { name : 'UPDATE_USER', index : 'UPDATE_USER',
							   align : "center", editable : false, hidden : true,
					           editoptions : { size : 20 }} ],
				            rowNum : 15,
							rowList : [ 15, 20, 30 ],
							pager : '#BussAppTBLPageDiv',
							sortname : 'APP_CODE',
							loadatonce : true,
							viewrecords : true,
							mtype : "GET",
							//rownumbers: true,
							multiselect : true,
							toolbar:[true,"top"],
							height: 255,
							width: 'auto',
							//footerrow: true,
							gridview : true,
							sortname : 'APP_CODE',
							caption : "Toolbar Searching",
							sortorder : "desc",
							caption : "&nbsp; Business Application Details",
							editurl : "saveOrUpdateBusApp",
						    onSelectRow: function(id){
									getHidShowIcons();
							       },
							onSelectAll: function(aRowids,status){
							    	   getHidShowIcons();
							       },
							width : 1000

					});

			$('#BusinessApplicationTBL').jqGrid('filterToolbar', {
				searchOnEnter : true, enableClear : false,
				beforeSearch : function(value) {
					$("#BusinessApplicationTBL").jqGrid('setGridParam', { url : "listBussApp?filters=" });
				}
			});

			$("#BusinessApplicationTBL").jqGrid('navGrid','#BussAppTBLPageDiv',					 
									{
										edit : true,
										add : true,
										del : true,
										search : true,
										view : true
										
									}, //options
									{
										reloadAfterSubmit : true,
										closeAfterEdit : true,
										closeOnEscape : true,
										width:350,
										height:190,
										afterShowForm : function() {
											$(".navButton").hide();
											$("#APP_CODE").attr("disabled","disabled");
											//$('#editmodBusinessApplicationTBL').position({my:'center', at:'center', of:window, collision: 'fit'});
										}
									}, // edit options

									{
										reloadAfterSubmit : true,
										closeAfterAdd : true,
										closeOnEscape : true,
										width:350,
										height:170,
										onclickSubmit : function(rp_ge, postdata) {
											 rp_ge.url = "saveBusApp?postdata="+postdata;
										 },
										afterShowForm : function(){
											 $("#tr_APP_CODE td.CaptionTD span").hasClass("required") ? "" : $("#tr_APP_CODE td.CaptionTD").append('<span class="required"> *</span>');
											 $("#tr_DESCRIPTION td.CaptionTD span").hasClass("required") ? "" : $("#tr_DESCRIPTION td.CaptionTD").append('<span class="required"> *</span>');
											$("#APP_CODE").removeAttr("disabled");
										 }
									}, // add options
									// now define settings for Delete dialog
							// Multi Delete By Uday Please Check Apply Same in All Pages 
				{ // now define settings for Delete dialog
					mtype : "POST",	reloadAfterSubmit : true,
					onclickSubmit : function(rp_ge, postdata) {
					//rp_ge.url = "deleteBussApp?appId="+postdata;
					var parameter = "appId=" + postdata;
							$.post('deleteBussApp', parameter, function(data){
								var message = data.message;
								if(message != null && message != "" ){									
									jAlert(message);
								}
							});
					},
					afterComplete :function(response,postdata){
						var responseMessage = $.parseJSON(response.responseText);
						var message = responseMessage.message;
						if(message != null && message !=""){
						jAlert(message,"Information");
						}
					},
					closeOnEscape : true,
					serializeDelData : function(postdata) {
						return "";
					}
					
				/*	beforeShowForm : function(domainMaitenanceTBL) {
			             //     $('#delmoddomainMaitenanceTBL').position({my:'center', at:'center', of:window, collision: 'fit'});
			                  var top_rowid = $('#mygrid tbody:first-child tr:first').attr('id');
							  var dlgDiv = $("#delmodBusinessApplicationTBL");
			                  var parentDiv = dlgDiv.parent(); 
			                  var dlgWidth = dlgDiv.width();
			                  var parentWidth = parentDiv.width();
			                  var dlgHeight = dlgDiv.height();
			                  var parentHeight = parentDiv.height();
			                  dlgDiv[0].style.top = Math.round(1.8*(parentHeight-dlgHeight)) + "px";
			                  //alert("dlgDiv[0].style.top===>>> "+dlgDiv[0].style.top);
			                  dlgDiv[0].style.left = Math.round((parentWidth-dlgWidth)/2) + "px";
					}*/
				}, // del options
				// Multi Delete By Uday END 
									{
										multipleSearch : true,
										closeOnEscape : true,
										closeAfterSearch:true,
										groupOps : [ {
											op : "AND",
											text : "AND"
										}, {
											op : "OR",
											text : "OR"
										} ],
										matchText : "Find",
										rulesText : " matches",
										sopt : [ 'cn', 'bw', 'eq', 'ne', 'lt',
												'le', 'gt', 'ge', 'ew' ],
										onSearch : function(params, postdata) {

											$("#gs_APP_CODE").val("");
											$("#gs_DESCRIPTION").val("");
											$("#gs_UPDATE_USER").val("");
											$("#BusinessApplicationTBL")
													.jqGrid('setGridParam', {
														url : "listBussApp"
													});
										},
										reloadAfterSearch : true
									},// search options
									{
										closeOnEscape : true,
										beforeShowForm : function() {
											$(".navButton").hide();
											/*  var top_rowid = $('#mygrid tbody:first-child tr:first').attr('id');
											  var dlgDiv = $("#viewmodBusinessApplicationTBL");
							                  var parentDiv = dlgDiv.parent(); 
							                  var dlgWidth = dlgDiv.width();
							                  var parentWidth = parentDiv.width();
							                  var dlgHeight = dlgDiv.height();
							                  var parentHeight = parentDiv.height();
							                  dlgDiv[0].style.top = Math.round(1.8*(parentHeight-dlgHeight)) + "px";
							                  //alert("dlgDiv[0].style.top===>>> "+dlgDiv[0].style.top);
							                  dlgDiv[0].style.left = Math.round((parentWidth-dlgWidth)/2) + "px";*/
											//Edit and Delte functionality in view form
											  if ($("#cust-edit").length == 0) {
												 $('<a href="#" class="btnEditDel" id="cust-edit">Edit<span class="ui-icon ui-icon-pencil"></span></a>')
														//Edit in view
														.click(function() {
																	$('#cData').trigger('click');
																	$('#edit_BusinessApplicationTBL').trigger('click');

																}).addClass("fm-button ui-state-default ui-corner-all fm-button-icon-left")
														          .prependTo("#Act_Buttons>td.EditButton");
											}
											if ($("#cust-delete").length == 0) {
														$('<a href="#" class="btnEditDel" id="cust-delete">Delete<span class=" ui-icon ui-icon-trash"></span></a>')
																//Delete in view
																.click(function() {
																			//  alert(postdata);
																			$(	'#cData').trigger('click');
																			// rp_ge.url = "deletePlatForm?platFormCode=" + postdata;
																			$('#del_BusinessApplicationTBL').trigger('click');
																		}).addClass("fm-button ui-state-default ui-corner-all fm-button-icon-left")
																          .prependTo("#Act_Buttons>td.EditButton");
											}
										}

									});

				});
	function radio(value, options, rowObject) {
		var radioHtml = '<input type="radio" value=' + value + ' name="radioid" />';
		return radioHtml;
	}
</SCRIPT>
<body>
<div align="center" width="100%" >
<br>
<div id="heading" class="title" align="left">Course Maintenance</div>
<br>
<table id="BusinessApplicationTBL" width="100%"></table>
<div id="BussAppTBLPageDiv"></div>
</div>
<input type="hidden" id="query" value="">
<br>
</body>
</html>