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
	
	function domainCodeValue(value,colname ) {
		if (value == ""  || value =="null")
		   return [false,"Please Enter DomainCode."];
		   else
			   return [true,""];
			}

	function domainDescvalue(value,colname ) {
		if (value == ""  || value =="null")
		   return [false,"Please Enter Domain Description."];
		   else
			   return [true,""];
			}

	function getHidShowIcons(){
   		 var selRowIds = $('#domainMaitenanceTBL').jqGrid('getGridParam', 'selarrrow');
         if(selRowIds.length > 1){
           $("td#edit_domainMaitenanceTBL").attr("disabled","disabled");
           $("td#view_domainMaitenanceTBL").attr("disabled","disabled");
           $("td#edit_domainMaitenanceTBL").find("div").addClass("ui-pg-button ui-corner-all ui-state-disabled");
           $("td#view_domainMaitenanceTBL").find("div").addClass("ui-pg-button ui-corner-all ui-state-disabled");
        }
         else{
              $("td#edit_domainMaitenanceTBL").removeAttr("disabled");
              $("td#view_domainMaitenanceTBL").removeAttr("disabled");
              $("td#edit_domainMaitenanceTBL").find("div").removeClass("ui-pg-button ui-corner-all ui-state-disabled");
              $("td#view_domainMaitenanceTBL").find("div").removeClass("ui-pg-button ui-corner-all ui-state-disabled");
        }
 		}

	function validate_add(postdata)
	 {
		// var characterReg = /^\s*[a-zA-Z0-9,\s]+\s*$/;
		// var spaceReg = /^[a-zA-Z0-9]{1,20}$/;
		var specialReg = /^[a-zA-Z0-9\_\-\~]+$/;

		 if (postdata == ""  || postdata =="null")
			   return [false,"Please Enter Domain Code."];
		 
		 //if(!specialReg.test(postdata)) {
		  //   return [false,"Special characters (~, -, _) are only allowed for Domain Code."];
		// }

		 if (postdata.length >= 20 )
		 {
			 return [false,"Please Enter Domain Code with size less than 20 characters."];
		 }
		 return [true,""];
	 }
	
$("#domainMaitenanceTBL").jqGrid({ 
		url:'listDomain', 
		datatype: "json", 
		jsonReader: {
			repeatitems: false,
			root: 'model',
			page: function (obj) {
			
				return obj.page; },
					total: function (obj) { 
						
							return obj.total ; 
						},
			records: function (obj) { 
			    				return obj.records; }
		
				},
	
		colNames:['Domain Id','Domain Code','Description', 'Updated User'], 
		colModel:[
				 { 
				  name : 'domainId',
				  index : 'domainId',
				  searchoptions: { defaultValue:'Filter...'}, 
				  search : true, 
				  filter : true, 
				  align : "center", 
				  editable : true,
				  editoptions : { size : 20 },
				  hidden : true, 
				  key: true
				 },
			    {
				name : 'domainCode',
				index : 'domainCode',  
				align : "center",
				editable : true,
				editoptions : {
					size : 20
					//disabled:"disabled"
				},
				sortable : true,
				editrules : {
					custom : true,
					custom_func : validate_add
				}
			    }, 
			    {
				name : 'description',
				index : 'description', 
				align : "center",
				editable : true,
				edittype : "textarea",
				editoptions : {
				rows : "3",
				cols : "40"
				},
				sortable : true,
				editrules : {
					custom : true,
					custom_func : domainDescvalue
				}
			}, {
				name : 'updatedUser',
				index : 'updatedUser', 
				align : "center",
				editable : false,
				hidden : true,
				editoptions : {
					size : 20
				}
			} ],
			rowNum : 15,
			rowList : [ 15, 20, 30 ],
			pager : '#domainMainTBLPageDiv',
			sortname : 'domainCode',
			sortorder : "asc",
			viewrecords : true,
			gridview : true,
			multiselect : true,
			toolbar:[true,"top"],
			height: 255,
			width: 'auto',
			//footerrow: true,
			loadatonce : true,
			caption : "&nbsp; Domain Details",
			editurl : "saveOrUpdateDomain",
			onSelectRow: function(id){
				getHidShowIcons();
		       },
		    onSelectAll: function(aRowids,status){
		    	   getHidShowIcons();
		       },
			width : 1000
		});

			$('#domainMaitenanceTBL').jqGrid('filterToolbar', {
				searchOnEnter : true,
				enableClear : false,
				beforeSearch : function(value) {
					$("#domainMaitenanceTBL").jqGrid('setGridParam', {
						url : "listDomain?filters="
					});
				}
			});

			$("#domainMaitenanceTBL").jqGrid(
					'navGrid',
					'#domainMainTBLPageDiv',
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
						afterShowForm : function(domainMaitenanceTBL) {
							$(".navButton").hide();
							$("#domainCode").attr("disabled","disabled");
			                 // $('#editmoddomainMaitenanceTBL').position({my:'center', at:'center', of:window, collision: 'fit'});
					    }

						}, // edit options
						{
							reloadAfterSubmit : true,
							closeAfterAdd : true,
							closeOnEscape : true,
							width:350,
							height:170,
							afterShowForm : function(){
							$("#tr_domainCode td.CaptionTD span").hasClass("required") ? "" : $("#tr_domainCode td.CaptionTD").append('<span class="required"> *</span>');
							$("#tr_description td.CaptionTD span").hasClass("required") ? "" : $("#tr_description td.CaptionTD").append('<span class="required"> *</span>');
							$("#domainCode").removeAttr("disabled");
							},
							onclickSubmit : function(rp_ge, postdata) {

								 rp_ge.url = "saveDomain?postdata="+postdata;
							 	},
							onClickButton : function() {
								//alert("Adding Row");

							}

							/*afterShowForm : function(domainMaitenanceTBL) {
								var top_rowid = $('#mygrid tbody:first-child tr:first').attr('id');
								var dlgDiv = $("#editmoddomainMaitenanceTBL");
				                  var parentDiv = dlgDiv.parent(); 
				                  var dlgWidth = dlgDiv.width();
				                  var parentWidth = parentDiv.width();
				                  var dlgHeight = dlgDiv.height();
				                  var parentHeight = parentDiv.height();
				               // TODO: change position of popup modal window
				                  dlgDiv[0].style.top = Math.round((parentHeight-dlgHeight)) + "px";
				                  dlgDiv[0].style.left = Math.round((parentWidth-dlgWidth)/2) + "px";
							 }*/
						}, // add options
						// Multi Delete By Uday Please Check Apply Same in All Pages 
						{ // now define settings for Delete dialog
							mtype : "POST",	reloadAfterSubmit : true,
							onclickSubmit : function(rp_ge, postdata) {
							rp_ge.url = "deleteDomain?domainId="+postdata;
							
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
							/*beforeShowForm : function(domainMaitenanceTBL) {
								  var top_rowid = $('#mygrid tbody:first-child tr:first').attr('id');
								  var dlgDiv = $("#delmoddomainMaitenanceTBL");
				                  var parentDiv = dlgDiv.parent(); 
				                  var dlgWidth = dlgDiv.width();
				                  var parentWidth = parentDiv.width();
				                  var dlgHeight = dlgDiv.height();
				                  var parentHeight = parentDiv.height();
				               // TODO: change position of popup modal window
				                  dlgDiv[0].style.top = Math.round(1.8*(parentHeight-dlgHeight)) + "px";
				                  dlgDiv[0].style.left = Math.round((parentWidth-dlgWidth)/2) + "px";
						}*/
						}, // del options
						
						{
							multipleSearch : true,
							closeOnEscape : true,
							groupOps : [ {op : "AND", text : "AND" },
										 {op : "OR", text : "OR" } ],
							matchText : "Find",
							rulesText : " matches",
							sopt : [ 'cn', 'bw', 'eq', 'ne', 'lt', 'le', 'gt', 'ge', 'ew' ],
							reloadAfterSearch : true,
							closeAfterSearch:true,
							onSearch : function(params,
									postdata) {
								//alterations would be here
								 		$("#query").val(
										$(".query").html());
								//alert($("#query").val());
								//$("#domainMaitenanceTBL").jqGrid('setGridParam', { url: "listDomain?query="+$("#query").val() }).trigger("reloadGrid");
								$("#domainMaitenanceTBL")
										.jqGrid('setGridParam',
												{ url : "listDomain" });
							}
							
						},// search options
						{
							closeOnEscape : true,
							beforeShowForm : function(domainMaitenanceTBL) {
									$(".navButton").hide();
								/*	var top_rowid = $('#mygrid tbody:first-child tr:first').attr('id');
									var dlgDiv = $("#viewmoddomainMaitenanceTBL");
					                var parentDiv = dlgDiv.parent(); 
					                var dlgWidth = dlgDiv.width();
					                var parentWidth = parentDiv.width();
					                var dlgHeight = dlgDiv.height();
					                var parentHeight = parentDiv.height();
					             // TODO: change position of popup modal window
					                dlgDiv[0].style.top = Math.round(1.8*(parentHeight-dlgHeight)) + "px";
					                dlgDiv[0].style.left = Math.round((parentWidth-dlgWidth)/2) + "px"; */
							
								//Edit and Delte functionality in view form
								if ($("#cust-edit").length == 0) {
									$('<a href="#" class="btnEditDel" id="cust-edit-dm">Edit<span class="ui-icon ui-icon-pencil"></span></a>')
											//Edit in view
											.click(function() {
														$('#cData').trigger('click');
														$('#edit_domainMaitenanceTBL').trigger('click');
													}).addClass("fm-button ui-state-default ui-corner-all fm-button-icon-left")
											          .prependTo("#Act_Buttons>td.EditButton");
								}
								if ($("#cust-delete").length == 0) {
									reloadAfterSubmit: true,
									$('<a href="#" class="btnEditDel" id="cust-delete-dm">Delete<span class=" ui-icon ui-icon-trash"></span></a>')
													//Delete in view
									.click(function() {
									//  alert(postdata);
									$('#cData').trigger('click');
									// rp_ge.url = "deletePlatForm?platFormCode=" + postdata;
									$('#del_domainMaitenanceTBL').trigger('click');
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
<table id="domainMaitenanceTBL" width="100%"></table>
<div id="domainMainTBLPageDiv"></div>
</div>
<input type="hidden" id="query" value="">
<br>
</body>
</html>