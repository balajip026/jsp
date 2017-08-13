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

	function topicCodeValue(value,colname ) {
		if (value == ""  || value =="null")
		   return [false,"Please enter topicCode."];
		   else
			   return [true,""];
			}

	function topicDescValue(value,colname ) {
		if (value == ""  || value =="null")
		   return [false,"Please enter description."];
		   else
			   return [true,""];
			}
	function subjectCodeValue(value,colname ) {
		if (value == ""  || value =="null")
		   return [false,"Please enter subjectCode."];
		   else
			   return [true,""];
			}
	function topicCategoryValue(value,colname ) {
		if (value == ""  || value =="null")
		   return [false,"Please select topicCategory."];
		   else
			   return [true,""];
			}
	// Subject Select Start
	 var SubjectSelect = ""; 
	 SubjectSelect =  $.ajax({url:"subjectDropDown",
		 	 async: false, 
		 	 type: "POST", 
		 	 success:	function(data){}
	       }).responseText;
	 var SubjectResponse = $.parseJSON(SubjectSelect);
	// alert("**model object**"+SubjectResponse.model);
	 var SubjectCodes = "";
	 if (SubjectResponse != null) {
	     for ( var i = 0, l = SubjectResponse.model.length; i < l; i++) {
	     var subjectid = SubjectResponse.model[i].subjectId;
	     var ri = SubjectResponse.model[i].subjectCode;
	    // alert("##ri value##"+ri);
	     if(SubjectCodes.length >0){
	    	// SubjectCodes = option
	    	 SubjectCodes+=";";	
	     }
	     SubjectCodes +=  subjectid	+ ':'+ ri;
	     }
	 }
	var defSelect = ":--select--;";
	SubjectCodes = defSelect + SubjectCodes;
	//Subject Select End	
	
	function getHidShowIcons(){
	var selRowIds = $('#topicMaitenanceTBL').jqGrid('getGridParam', 'selarrrow');
    if(selRowIds.length > 1){
	         $("td#edit_topicMaitenanceTBL").attr("disabled","disabled");
	         $("td#view_topicMaitenanceTBL").attr("disabled","disabled");
	         $("td#edit_topicMaitenanceTBL").find("div").addClass("ui-pg-button ui-corner-all ui-state-disabled");
	         $("td#view_topicMaitenanceTBL").find("div").addClass("ui-pg-button ui-corner-all ui-state-disabled");
 		 }
 	else{
             $("td#edit_topicMaitenanceTBL").removeAttr("disabled");
             $("td#view_topicMaitenanceTBL").removeAttr("disabled");
             $("td#edit_topicMaitenanceTBL").find("div").removeClass("ui-pg-button ui-corner-all ui-state-disabled");
             $("td#view_topicMaitenanceTBL").find("div").removeClass("ui-pg-button ui-corner-all ui-state-disabled");
 		}
	}
	function validate_add(postdata)
	 {
		 //var characterReg = /^\s*[a-zA-Z0-9,\s]+\s*$/;
		 //var spaceReg = /^[a-zA-Z0-9]{1,20}$/;
		 var specialReg = /^[a-zA-Z0-9\_\-\~]+$/;

		 if (postdata == ""  || postdata =="null")
			   return [false,"Please Enter Topic Code."];
		 
		 //if(!specialReg.test(postdata)) {
		 //    return [false,"Special characters (~, -, _) are only allowed for Topic Code."];
		 //}

		 if (postdata.length >= 20 )
		 {
			 return [false,"Please Enter Topic Code with size less than 20 characters."];
		 }
		 return [true,""];
	 }
$("#topicMaitenanceTBL").jqGrid({ 
		url:'listTopic', 
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
	
		colNames:['Topic Id','Topic Code','Topic Category', 'Subject Code','Description','Updated User'], 
		colModel:[ 
						{   name : 'topicId',
							index : 'topicId',
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
							name : 'topicCode',
							index : 'topicCode',  
							align : "center",
							editable : true,
							editoptions : {
							size : 20
							//disabled:"disabled"
							},
							editrules : {
								custom : true,
								custom_func : validate_add
							}
						},
						
						{
							name : 'topicCategory',
							index : 'topicCategory',  
							align : "center",
							editable : true,
							editoptions : {
								size : 20
							},
							key : true,
							edittype : 'select',
							editrules : {
								custom : true,
								custom_func : topicCategoryValue
							}
						},
						{
							name : 'topicSubj.subjectCode',
							index : 'topicSubj.subjectCode',  
							align : "center",
							editable : true,
							editoptions : {
								size : 20
							},
							key : true,
							edittype : 'select',
							editoptions : {
							},
							editrules : {
								custom : true,
								custom_func : subjectCodeValue
							}
						},{
							name : 'description',
							index : 'description',  
							align : "center",
							editable : true,
							edittype : "textarea",
							editoptions : {
							rows : "3",
							cols : "40"
							},
							editrules : {
								custom : true,
								custom_func : topicDescValue
							}
						}, {
							name : 'updateUser',
							index : 'updateUser', 
							align : "center",
							editable : false,
							hidden : true,
							editoptions : {
								size : 20
							}
						} ],
						rowNum : 15,
						rowList : [ 15, 20, 30 ],
						pager : '#topicMaintTBLPageDiv',
						sortname : 'topicCode',
						sortorder : "asc",
						viewrecords : true,
						gridview : true,
						loadatonce : true,
						multiselect : true,
						toolbar:[true,"top"],
						height: 255,
						width: 'auto',
						//footerrow: true,
						caption : "&nbsp; Topic Details",
						editurl : "saveOrUpdateTopic",
						width : 1000,
						onSelectRow: function(id){
							getHidShowIcons();
				       		},
				       	onSelectAll: function(aRowids,status){
					        getHidShowIcons();
					       },
						viewrecords : true,
						loadComplete: function() {
					    	   $("#topicMaitenanceTBL").setColProp('topicCategory', { editoptions: { value: ": -- select -- ;Technical:Technical;Functional:Functional" }});
						   		$("#topicMaitenanceTBL").setColProp('topicSubj.subjectCode', { editoptions: { value: SubjectCodes} });
						   		
						   		}

					});
						$('#topicMaitenanceTBL').jqGrid('filterToolbar', {
							searchOnEnter : true,
							enableClear : false,
							onclickEnter : function(value) {
								//	alert("hi");
						}
						});

						$("#topicMaitenanceTBL").jqGrid(
								'navGrid',
								'#topicMaintTBLPageDiv',
								{
									edit : true,
									add : true,
									del : true,
									search : true,
									view : true
								},//{closeAfterAdd:true},//options
								{
									reloadAfterSubmit : true,
									closeAfterEdit : true,
									closeOnEscape : true,
									width:350,
									height:190, 
									afterShowForm : function(topicMaitenanceTBL) {
									$("#tr_topicCode td.CaptionTD span").hasClass("required") ? "" : $("#tr_topicCode td.CaptionTD").append('<span class="required"> *</span>');
									$("#tr_topicCategory td.CaptionTD span").hasClass("required") ? "" : $("#tr_topicCategory td.CaptionTD").append('<span class="required"> *</span>');
									$("#tr_topicSubj\\.subjectCode td.CaptionTD span").hasClass("required") ? "" : $("#tr_topicSubj\\.subjectCode td.CaptionTD").append('<span class="required"> *</span>');
									$("#tr_description td.CaptionTD span").hasClass("required") ? "" : $("#tr_description td.CaptionTD").append('<span class="required"> *</span>');
										$(".navButton").hide();
										$("#topicCode").attr("disabled","disabled");
						                 // $('#editmodtopicMaitenanceTBL').position({my:'center', at:'center', of:window, collision: 'fit'});
								    }
							}, // edit options
								{
									reloadAfterSubmit : true,
									closeAfterAdd : true,
									closeOnEscape : true,
									width:350,
									height:210,
									onClickButton : function() {
										//alert("Adding Row");
									},
									afterShowForm : function(){
										$("#tr_topicCode td.CaptionTD span").hasClass("required") ? "" : $("#tr_topicCode td.CaptionTD").append('<span class="required"> *</span>');
										$("#tr_topicCategory td.CaptionTD span").hasClass("required") ? "" : $("#tr_topicCategory td.CaptionTD").append('<span class="required"> *</span>');
										$("#tr_topicSubj\\.subjectCode td.CaptionTD span").hasClass("required") ? "" : $("#tr_topicSubj\\.subjectCode td.CaptionTD").append('<span class="required"> *</span>');
										$("#tr_description td.CaptionTD span").hasClass("required") ? "" : $("#tr_description td.CaptionTD").append('<span class="required"> *</span>');
										$("#topicCode").removeAttr("disabled");
									},
									onclickSubmit : function(rp_ge, postdata) {
										 rp_ge.url = "saveTopic?postdata="+postdata;
									 	}
								}, // add options
								{ // now define settings for Delete dialog


									mtype : "POST",	reloadAfterSubmit : true,
									//onclickSubmit : function(rp_ge, postdata) {
									//rp_ge.url = "deleteTopic?postdata="+postdata;
									//},
									onclickSubmit : function(rp_ge, postdata) {
									var parameter = "postdata="+postdata;
									$.post('deleteTopic', parameter, function(data){
										$("#topicMaitenanceTBL").trigger("reloadGrid");
										var message = data.message;
										//var finalmsg = message.substring(2);
										if(message != null && message != "" ){									
											jAlert(message);
										}
									});
									//rp_ge.url = "deleteSubjects?subjectId="+subjectId;
			
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
								{
									multipleSearch : true,
									closeAfterSearch:true,
									showQuery : false,
									closeOnEscape : true,
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
										//alterations would be here
									// alert(postdata);
									$("#query").val($(".query").html());
									// alert($("#query").val());
									$("#topicMaitenanceTBL").jqGrid(
											'setGridParam',
											{
												url : "listTopic?query="
														+ $("#query").val()
											}).trigger("reloadGrid");
								},
								reloadAfterSearch : true
								},// search options
								{
									closeOnEscape : true,
									beforeShowForm : function(){
									$(".navButton").hide();
						              if($("#cust-edit").length==0){
						                    $('<a href="#" class="btnEditDel" id="cust-edit">Edit<span class="ui-icon ui-icon-pencil"></span></a>')
						                    //Edit in view
						                     .click(function() {
						                            $('#cData').trigger('click');
						                            $('#edit_topicMaitenanceTBL').trigger('click');
						                           
						                        }).addClass("fm-button ui-state-default ui-corner-all fm-button-icon-left")
						                          .prependTo("#Act_Buttons>td.EditButton");
						              }
						              if($("#cust-delete").length==0){
						            	  reloadAfterSubmit : true,
						                  $('<a href="#" class="btnEditDel" id="cust-delete">Delete<span class=" ui-icon ui-icon-trash"></span></a>')
						                  //Delete in view
						                                     .click(function() {
						                	 //  alert(postdata);
						                          $('#cData').trigger('click');
						                         // rp_ge.url = "deletePlatForm?platFormCode=" + postdata;
						                        $('#del_topicMaitenanceTBL').trigger('click');
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
<table id="topicMaitenanceTBL" width="100%"></table>
<div id="topicMaintTBLPageDiv"></div>
</div>
<input type="hidden" id="query" value="">
<br>
</body>
</html>