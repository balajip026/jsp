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
	function getHidShowIcons(){
		var selRowIds = $('#platformMaitenanceTBL').jqGrid('getGridParam', 'selarrrow');
        if(selRowIds.length > 1){
		         $("td#edit_platformMaitenanceTBL").attr("disabled","disabled");
		         $("td#view_platformMaitenanceTBL").attr("disabled","disabled");
		         $("td#edit_platformMaitenanceTBL").find("div").addClass("ui-pg-button ui-corner-all ui-state-disabled");
		         $("td#view_platformMaitenanceTBL").find("div").addClass("ui-pg-button ui-corner-all ui-state-disabled");
     		 }
     	else{
                 $("td#edit_platformMaitenanceTBL").removeAttr("disabled");
                 $("td#view_platformMaitenanceTBL").removeAttr("disabled");
                 $("td#edit_platformMaitenanceTBL").find("div").removeClass("ui-pg-button ui-corner-all ui-state-disabled");
                 $("td#view_platformMaitenanceTBL").find("div").removeClass("ui-pg-button ui-corner-all ui-state-disabled");
     		}
	}

	function validate_add(postdata)
	 {
		// alert("plat form postdata"+postdata);
		 //var characterReg = /^\s*[a-zA-Z0-9,\s]+\s*$/;
		// var spaceReg = /^[a-zA-Z0-9]{1,20}$/;
		 var specialReg = /^[a-zA-Z0-9\_\-\~]+$/;
		 
		 if (postdata == ""  || postdata =="null")
			   return [false,"Please Enter Platform Code."];
		 
		// if(!specialReg.test(postdata)) {
		 //    return [false,"Special characters (~, -, _) are only allowed for Platform Code."];
		 //}

		 if (postdata.length >= 20 )
		 {
			 return [false,"Please Enter Platform Code with size less than 20 characters."];
		 }
		 return [true,""];
	 }

$("#platformMaitenanceTBL").jqGrid({
			url:"listPlatformCodes", 
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
			colNames : [ 'Platform Id', 'Platform Code', 'Description', 'Updated User' ],
			colModel : [ { name : 'platformId',
						index : 'platformId',  searchoptions: { defaultValue:'Filter...'}, search : true, filter : true, align : "center", editable : true,
						editoptions : { size : 20 },hidden : true, key: true},
						{ name : 'platFormCode',
						index : 'platFormCode',  searchoptions: { defaultValue:'Filter...'}, search : true, filter : true, align : "center", editable : true,
						editoptions : { size : 20 }, editrules : {custom : true, custom_func : validate_add}}, 
						{ name : 'description',
						index : 'description',  searchoptions: { defaultValue:'Filter...'},
						align : "center",
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
						index : 'updatedUser',  searchoptions: { defaultValue:'Filter...'},
						align : "center",
						editable : false,
						hidden : true,
						editoptions : {	size : 20 }} ],
			rowNum : 15,
			rowList : [ 15, 20, 30 ],
			pager : '#pltMaintTBLPageDiv',
			sortname : 'platFormCode',
			viewrecords : true,
			gridview : true,
			loadatonce : false,
			multiselect : true,
			toolbar:[true,"top"],
			height: 255,
			width: 'auto',
			//bhargavi end
			sortorder : "desc",
			caption : "&nbsp; Platform Details",
			editurl : "saveOrUpdatePlatForm",
			width : 1000,
			onSelectRow: function(id){
					getHidShowIcons();
			       },
			onSelectAll: function(aRowids,status){
			    	   getHidShowIcons();
			       },
			viewrecords : true
			    				
		});
		$('#platformMaitenanceTBL').jqGrid('filterToolbar', {
			searchOnEnter : true,
			enableClear : false,
			beforeSearch : function(value) {
				$("#platformMaitenanceTBL").jqGrid('setGridParam', {
					url : "listPlatformCodes?filters="
				});
			}
		});
		$("#platformMaitenanceTBL").jqGrid('navGrid', '#pltMaintTBLPageDiv', {
			add : true,
			edit : true,
			del : true,
			search : true,
			view : true
		}, //{closeAfterAdd:true},//options
			{ 
			  reloadAfterSubmit : true, 
			  closeOnEscape : true, 
			  closeAfterEdit : true, 
			  // code for changing position of modal window by Ramana G on 19/11/12
			  afterShowForm : function(domainMaitenanceTBL) {
							$(".navButton").hide();
							$("#platFormCode").attr("disabled","disabled");
			               // $('#editmodplatformMaitenanceTBL').position({my:'center', at:'center', of:window, collision: 'fit'});
					}
			}, // edit options
			{
				reloadAfterSubmit : true,
				closeOnEscape : true,
				closeAfterAdd : true,
				width:350,
				height:170,
				onclickSubmit : function(rp_ge, postdata) {
					 rp_ge.url = "savePlatForm?postdata="+postdata;
				 },
				 afterShowForm : function() {
					 $("#tr_platFormCode td.CaptionTD span").hasClass("required") ? "" : $("#tr_platFormCode td.CaptionTD").append('<span class="required"> *</span>');
					 $("#tr_description td.CaptionTD span").hasClass("required") ? "" : $("#tr_description td.CaptionTD").append('<span class="required"> *</span>');
					 $("#platFormCode").removeAttr("disabled");
					}
				}, // add options
			// Multi Delete By Uday Please Check Apply Same in All Pages 
				{ // now define settings for Delete dialog
					mtype : "POST",	reloadAfterSubmit : true,
					onclickSubmit : function(rp_ge, postdata) {
					//rp_ge.url = "deletePlatForm?platformId="+postdata;
					var parameter = "platformId="+postdata;
					$.post('deletePlatForm', parameter, function(data){
						$("#platformMaitenanceTBL").trigger("reloadGrid");
						var message = data.message;
					//	var finalmsg = message.substring(2);
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
						//alterations would be here
					/* alert("hi");
					 alert($("#filters").val());
					 $("#query").val($("#filters").val());
					 alert($("#query").val());
					 $("#platformMaitenanceTBL").jqGrid('setGridParam', { url: "listPlatformCodes?query="+$("#query").val() }).trigger("reloadGrid");
					 */
					$("#gs_updatedUser").val("");
					$("#gs_platFormCode").val("");
					$("#platformMaitenanceTBL").jqGrid('setGridParam', {url : "listPlatformCodes"});
				},
				reloadAfterSearch : true
				},// search options
				{
					closeOnEscape : true,
					beforeShowForm : function(platformMaitenanceTBL){
					$(".navButton").hide();
		              if($("#cust-edit").length==0){
			              //alert("=======bbb====="+$("#cust-edit").length);
		                    $('<a href="#" class="btnEditDel" id="cust-edit">Edit<span class="ui-icon ui-icon-pencil"></span></a>')
		                    //Edit in view
		                     .click(function() {
		                            $('#cData').trigger('click');
		                            $('#edit_platformMaitenanceTBL').trigger('click');
		                           
		                        }).addClass("fm-button ui-state-default ui-corner-all fm-button-icon-left")
		                          .prependTo("#Act_Buttons>td.EditButton");
		              }
		              if($("#cust-delete").length==0){		            	
		                  $('<a href="#" class="btnEditDel" id="cust-delete">Delete<span class="ui-icon ui-icon-trash"></span></a>')
		                  //Delete in view
		                     .click(function() {
		                	 	//  alert(postdata);
		                        $('#cData').trigger('click');
		                         // rp_ge.url = "deletePlatForm?platFormCode=" + postdata;
		                        $('#del_platformMaitenanceTBL').trigger('click');
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
<form name="grid">
<div align="center" width="100%" >
<br>
<div id="heading" class="title" align="left">Course Maintenance</div>
<br>
<table b id="platformMaitenanceTBL" width="100%"></table>
<div id="pltMaintTBLPageDiv"></div>
</div>
<input type="hidden" id="query" value="">
<p class = "requiredfield"/>
<br>
</form>
</body>
</html>