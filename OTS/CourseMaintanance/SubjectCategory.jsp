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
 function chekvalid(value,subjcatcode,description ) 
    {
    if (value == ""  || value =="null") 
        return [false,"Please Enter Description."];
        else 
           return [true,""];
     } 
 function getHidShowIcons(){
	 var selRowIds = $('#subjectCategoryTBL').jqGrid('getGridParam', 'selarrrow');
     if(selRowIds.length > 1){
	           $("td#edit_subjectCategoryTBL").attr("disabled","disabled");
	           $("td#view_subjectCategoryTBL").attr("disabled","disabled");
	           $("td#edit_subjectCategoryTBL").find("div").addClass("ui-pg-button ui-corner-all ui-state-disabled");
	           $("td#view_subjectCategoryTBL").find("div").addClass("ui-pg-button ui-corner-all ui-state-disabled");
      	}
     else{
            $("td#edit_subjectCategoryTBL").removeAttr("disabled");
            $("td#view_subjectCategoryTBL").removeAttr("disabled");
            $("td#edit_subjectCategoryTBL").find("div").removeClass("ui-pg-button ui-corner-all ui-state-disabled");
            $("td#view_subjectCategoryTBL").find("div").removeClass("ui-pg-button ui-corner-all ui-state-disabled");
      	}
 }
 function validate_add(postdata)
 {   
	 //var characterReg = /^\s*[a-zA-Z0-9,\s]+\s*$/;
	 //var spaceReg = /^[a-zA-Z0-9]{1,20}$/;
	 var specialReg = /^[a-zA-Z0-9\_\-\~]+$/;

	 if (postdata == ""  || postdata =="null")
		   return [false,"Please Enter Subject Category Code."];
	 
	 //if(!specialReg.test(postdata)) {
	  //   return [false,"Special characters (~, -, _) are only allowed for Subject Category Code."];
	// }

	 if (postdata.length >= 20 )
	 {
		 return [false,"Please Enter Subject Category Code with size less than 20 characters."];
	 }
	 return [true,""];
 }


var data;
$("#subjectCategoryTBL").jqGrid({ 
		url:'listsubjCategoryCodes', 
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
    				 return obj.records;  				
    				 }			},
			colNames:['subjcatId', 'Subject Category Code','Description', 'Updated User'], 
			colModel:[ 
								{ name : 'subjcatId',
								  index : 'subjcatId',  
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
									name : 'subjcatcode',
									index : 'subjcatcode',  
									search : true,
									filter : true,
									align : "center",
									editable : true,
									editoptions : {
										size : 20
									},
									editrules : {
										custom : true,
										custom_func : validate_add
									},
									key : true
								}, {
									name : 'description',
									index : 'description',  
									align : "center",
									search : true,
									editable : true,
									edittype : "textarea",
									editoptions : {
										rows : "3",
										cols : "40"
									},
									editrules : {
										custom : true,
										custom_func : chekvalid
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
								rowNum : 10,
								rowList : [ 10, 20, 30 ],
								pager : '#subCatTBLPageDiv',
								sortname : 'subjcatcode',
								loadatonce : true,
								viewrecords : true,
								mtype : "GET",
								multiselect: true,
								toolbar:[true,"top"],
								height: 255,
								width: 'auto',
								//footerrow: true,
								gridview : true,
								sortname : 'subjcatcode',
								caption : "Toolbar Searching",
								sortorder : "desc",
								caption : "&nbsp; Subject Category Details",
								editurl : "saveOrUpdatesubjcategory",
								onSelectRow: function(id){
    							getHidShowIcons();
    				       		},
    				    		onSelectAll: function(aRowids,status){
    				    	    getHidShowIcons();
    				       		},
    											
								//emptyrecords: "No records to view",
								//multiselect: true,
								navigator : true,
								//multiboxonly: true,
								// height: 'auto',
								width : 1000,
								viewrecords : true

							});

					$('#subjectCategoryTBL').jqGrid('filterToolbar', {
						searchOnEnter : true,
						enableClear : false,
						onclickEnter : function(value) {
							//alert("hi");
						}
					});
					$("#subjectCategoryTBL")
							.jqGrid('navGrid',
									'#subCatTBLPageDiv',
									{
										add : true,
										edit : true,
										del : true,
										search : true,
										view : true,
										closeAfterAdd : true
									},//options
									{
										reloadAfterSubmit : true,
										closeOnEscape : true,
										closeAfterEdit : true, 
										afterShowForm : function(){
										$(".navButton").hide();
										$("#subjcatcode").attr("disabled","disabled");
										//$('#editmodsubjectCategoryTBL').position({my:'center', at:'center', of:window, collision: 'fit'}); 
									}
								}, // edit options
									{
										reloadAfterSubmit : true,
										closeOnEscape : true,
										closeAfterAdd : true,
										width:360,
										height:170,
										onclickSubmit : function(rp_ge, postdata) {

											 rp_ge.url = "saveSubjectCategory?postdata="+postdata;
										 	},
										afterShowForm : function(){
										 		
										 		$("#tr_subjcatcode td.CaptionTD span").hasClass("required") ? "" : $("#tr_subjcatcode td.CaptionTD").append('<span class="required"> *</span>');
												 $("#tr_description td.CaptionTD span").hasClass("required") ? "" : $("#tr_description td.CaptionTD").append('<span class="required"> *</span>');
												$("#subjcatcode").removeAttr("disabled");
											},
										onClickButton : function() {
											// alert("Adding Row");

										}
									/*	afterShowForm : function(subjectCategoryTBL) {
											  var top_rowid = $('#mygrid tbody:first-child tr:first').attr('id');
											  var dlgDiv = $("#editmodsubjectCategoryTBL");
							                  var parentDiv = dlgDiv.parent(); 
							                  var dlgWidth = dlgDiv.width();
							                  var parentWidth = parentDiv.width();
							                  var dlgHeight = dlgDiv.height();
							                  var parentHeight = parentDiv.height();
							                  dlgDiv[0].style.top = Math.round((parentHeight-dlgHeight)) + "px";
							                  //alert("dlgDiv[0].style.top===>>> "+dlgDiv[0].style.top);
							                  dlgDiv[0].style.left = Math.round((parentWidth-dlgWidth)/2) + "px";
											  
							                  // TODO: change position of popup modal window
							               
									}*/
									}, // add options

									{ // now define settings for Delete dialog
										mtype : "POST",
										reloadAfterSubmit : true,
										onclickSubmit : function(rp_ge,postdata) {
										var parameter = "subjcatId="+postdata;
										$.post('deleteSubjCategory', parameter, function(data){
											$("#subjectCategoryTBL").trigger("reloadGrid");
											var message = data.message;
											if(message != null && message != "" ){									
												jAlert(message);
											}
										});
										},
										serializeDelData : function(postdata) {
											return "";
										},
										closeOnEscape : true
									/*	beforeShowForm : function(subjectCategoryTBL) {
								             //     $('#delmoddomainMaitenanceTBL').position({my:'center', at:'center', of:window, collision: 'fit'});
								                  var top_rowid = $('#mygrid tbody:first-child tr:first').attr('id');
												  var dlgDiv = $("#delmodsubjectCategoryTBL");
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
									//del multirecords

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
										sopt : [ 'cn','bw', 'eq', 'ne', 'lt', 'le',
												'gt', 'ge', 'ew' ],
										onSearch : function(params, postdata) {
											//alterations would be here
										/* alert("hi");
										 alert($("#filters").val());
										 $("#query").val($("#filters").val());
										 alert($("#query").val());
										 $("#platformMaitenanceTBL").jqGrid('setGridParam', { url: "listPlatformCodes?query="+$("#query").val() }).trigger("reloadGrid");
										 */
										$("#gs_updatedUser").val("");
										$("#gs_subjcatcode").val("");
										$("#subjectCategoryTBL")
												.jqGrid(
														'setGridParam',
														{
															url : "listsubjCategoryCodes"
														});
									},
									reloadAfterSearch : true
									}, {
										closeOnEscape : true,
										beforeShowForm : function(){
										  $(".navButton").hide();
										/*  var top_rowid = $('#mygrid tbody:first-child tr:first').attr('id');
										  var dlgDiv = $("#viewmodsubjectCategoryTBL");
						                  var parentDiv = dlgDiv.parent(); 
						                  var dlgWidth = dlgDiv.width();
						                  var parentWidth = parentDiv.width();
						                  var dlgHeight = dlgDiv.height();
						                  var parentHeight = parentDiv.height();
						                  dlgDiv[0].style.top = Math.round(1.8*(parentHeight-dlgHeight)) + "px";
						                  //alert("dlgDiv[0].style.top===>>> "+dlgDiv[0].style.top);
						                  dlgDiv[0].style.left = Math.round((parentWidth-dlgWidth)/2) + "px";*/
					     //Edit and Delte functionality in view form
							      if($("#cust-edit").length==0){
							                    $('<a href="#" class="btnEditDel" id="cust-edit">Edit<span class="ui-icon ui-icon-pencil"></span></a>')
							                    //Edit in view
							                     .click(function() {
							                            $('#cData').trigger('click');
							                            $('#edit_subjectCategoryTBL').trigger('click');
							                           
							                        }).addClass("fm-button ui-state-default ui-corner-all fm-button-icon-left")
							                          .prependTo("#Act_Buttons>td.EditButton");
							              }
							              if($("#cust-delete").length==0){
							                  $('<a href="#" class="btnEditDel" id="cust-delete">Delete<span class=" ui-icon ui-icon-trash"></span></a>')
							                  //Delete in view
							                                     .click(function() {
							                	 //  alert(postdata);
							                          $('#cData').trigger('click');
							                         // rp_ge.url = "deletePlatForm?platFormCode=" + postdata;
							                        $('#del_subjectCategoryTBL').trigger('click');
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
<table id="subjectCategoryTBL" width="100%"></table>
<div id="subCatTBLPageDiv"></div>
<div class="contextMenu" id="myMenu1" style="display:none">
    <ul style="width: 200px">
        <li id="add">
           <span class="ui-icon ui-icon-plus" style="float:left"></span>
           <span style="font-size:11px; font-family:Verdana">Add</span>
        </li>
        <li id="edit">
            <span class="ui-icon ui-icon-pencil" style="float:left"></span>
            <span style="font-size:11px; font-family:Verdana">Edit</span>
        </li>
        <li id="del">
            <span class="ui-icon ui-icon-trash" style="float:left"></span>
            <span style="font-size:11px; font-family:Verdana">Delete</span>
        </li>
    </ul>
</div>
</div>
<input type="hidden" id="query" value="">
<br></form>
</body>
</html>