<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@include file="../CommonJSs.jsp"%>
<SCRIPT type="text/javascript">
var statusMap;
function setStatusMaptoArray(statusMapgot){
	statusMap = $.parseJSON(statusMapgot);
	
}

function getLabel(value, options, rowObject) {
	  //alert("22"+statusMap);
	var topicArr = rowObject.topicNames.split(",");
	var finalStr="<label>";
	for(var i=0;i<topicArr.length;i++){
		//alert(topicArr[i]);
		finalStr= finalStr+statusMap[topicArr[i]]+",";	
		//alert(finalStr);
	}
	finalStr = finalStr.substring(0, finalStr.length -1);
	finalStr=finalStr+"</label>";
	 return  finalStr;
}
$(document).ready(function(){
 // Validation Function 
 function validate_add(postdata)
 {
 	 if (postdata == ""  || postdata =="null")
 		   return [false,"Please Enter Course Name."];
 	 
	 if (postdata.length >= 20 )
	 {
		 return [false,"Please Enter Course Name with size less than 20 characters."];
	 }
 	 return [true,""];
 }
	
 function SubCodeValue(value,subjectCode ) {
		if (value == ""  || value =="null")
		   return [false,"Please select SubjectCode."];
		   else
			   return [true,""];
			}
 function TopicCodeValue(value,topicCode ) {
		if (value == ""  || value =="null")
		   return [false,"Please select TopicCode(s)."];
		   else
			   return [true,""];
			}
var SUBJECTSelect = "";
SUBJECTSelect =  $.ajax({url:"subjectDropDown",
	 	 async: false, 
	 	 type: "POST", 
	 	 success:	function(data){}
      }).responseText;
var SUBJECTSelectResponse = $.parseJSON(SUBJECTSelect);
//alert("SUBJECTSelectResponse============"+SUBJECTSelectResponse);
var SUBJECTCodes = "'':-- select --";
if (SUBJECTSelectResponse != null) {
	  for ( var r = 0, s = SUBJECTSelectResponse.model.length; r < s; r++) {
		  var subjectid = SUBJECTSelectResponse.model[r].subjectId;
		     var ris = SUBJECTSelectResponse.model[r].subjectCode;
		   // alert("ris==========="+ris);
		     if(SUBJECTCodes.length >0){
		    	 SUBJECTCodes+=";";	
		     }
		     SUBJECTCodes +=  subjectid	+ ':'+ ris;
		     }
}
//alert(SUBJECTCodes);
//SUBJECT Select End

var TopicCodes = ': -- select -- ';
var newOptions="";
getTopicsBySubjectCode = function getTopicsBySubjectCode(subjectId,subjectElem){
	var $subjectElem = $(subjectElem);
	//var $subjectId = $(subjectId);
// Topic Select Start
var TopicSelect = "";
newOptions="";
TopicSelect =  $.ajax({url:"TopicDropDown?subjectId="+subjectId,
	 	 async: false, 
	 	 type: "POST", 
	 	 success:	function(data){}
      }).responseText;

var TopicSelectResponse = $.parseJSON(TopicSelect);
if (TopicSelectResponse != null) {
	//alert("inside getTopicsBySubjectCode"+TopicSelectResponse);
	var myGrid = $('#CoursesTBL');
	var selRowId = myGrid.jqGrid ('getGridParam', 'selrow');
    var celValue = myGrid.jqGrid ('getCell', selRowId, 'topicCode');
    for ( var x = 0, y = TopicSelectResponse.topicDetails.length; x< y; x++) {
    	var topicid = TopicSelectResponse.topicDetails[x].topicId;
    	var tis = TopicSelectResponse.topicDetails[x].topicCode;
    	 var selected=false;
          if(celValue){
        	 var celValueArray = celValue.split(',');
    		 for ( var i = 0; i < celValueArray.length; i++){
    			 if(celValueArray[i]==topicid){
    				 selected=true;
    			 }
    		 }
    	 }
     	 if(selected){
          newOptions += '<option role="option" selected="selected" value="' + topicid + '">' +
          tis + '</option>';
     	 }else{
    		newOptions += '<option role="option" value="' + topicid + '">' + tis + '</option>';
    	}
    }
    $subjectElem.closest('form.FormGrid').find("select#topicCode.FormElement").html(newOptions);
}
};
//platForm Select End
function getHidShowIcons(){
var selRowIds = $('#CoursesTBL').jqGrid('getGridParam', 'selarrrow');
if(selRowIds.length > 1){
         $("td#edit_CoursesTBL").attr("disabled","disabled");
         $("td#view_CoursesTBL").attr("disabled","disabled");
         $("td#edit_CoursesTBL").find("div").addClass("ui-pg-button ui-corner-all ui-state-disabled");
         $("td#view_CoursesTBL").find("div").addClass("ui-pg-button ui-corner-all ui-state-disabled");
		 }
	else{
         $("td#edit_CoursesTBL").removeAttr("disabled");
         $("td#view_CoursesTBL").removeAttr("disabled");
         $("td#edit_CoursesTBL").find("div").removeClass("ui-pg-button ui-corner-all ui-state-disabled");
         $("td#view_CoursesTBL").find("div").removeClass("ui-pg-button ui-corner-all ui-state-disabled");
		}
}
var subjectId;
$("#CoursesTBL").jqGrid({
	url : 'listCourses',
	datatype : "json",
	jsonReader : {
		repeatitems : false,
		root : 'model',
		page : function(obj) {
	     setStatusMaptoArray(obj.jsonText);
	    	return obj.page;
		},
		total : function(obj) {
			return obj.total;
		},
		records : function(obj) {
			return obj.records;
		}
	},
	colNames : [ 'Course Id','Course Name','Subject Code','Topic Code', 'Updated User'],
	colModel : [
			{   name : 'courseId',
				index : 'courseId',
				searchoptions: { defaultValue:'Filter...'}, 
				search : true, 
				filter : true, 
				align : "center", 
				editable : true,
				editoptions : { size : 20 },
				hidden : true, 
				key: true
				},
			 {  name : 'courseName',
				index : 'courseName',  
				align : "center",
				editable : true,
				editoptions : {
				dataInit: function(elem) {
		   	        $(elem).width(200);  // set the width which you need
		   	    }
					
				},
				editrules : {
					custom : true,
					custom_func : validate_add
				}
			},
			{
				name : 'courseSubjectObj.subjectCode',
				index : 'courseSubjectObj.subjectCode',  
				align : "center",
				editable : true,
				edittype : 'select',
				editoptions : {},
				editrules : {
					custom : true,
					custom_func : SubCodeValue
				}
			},
			{
				name : 'topicCode',
				index : 'topicCode', 
				align : "center",
				formatter:getLabel,
				editable : true,
				edittype : 'select',
				//search : false,
				//sortable : false,
				editoptions : {
				},
				editrules : {
					custom : true,
					custom_func : TopicCodeValue
				}
			},
			{
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
						pager : '#CourseTBLPageDiv',
						loadatonce : false,
						viewrecords : true,
						mtype : "POST",
						// rownumbers: true,
						multiselect: true,
						toolbar:[true,"top"],
						height: 255,
						width: 'auto',
						//footerrow: true,
						gridview : true,
						sortname : 'courseName',
						caption : "Toolbar Searching",
						sortorder : "desc",
						caption : "&nbsp; Course Details",
						editurl : "saveOrUpdateCourses",
						onSelectRow : function(id) {
							var myGrid = $('#CoursesTBL');
                            var selRowId = myGrid.jqGrid ('getGridParam', 'selrow');
                             subjectId = myGrid.jqGrid ('getCell', selRowId, 'courseSubjectObj.subjectId');
							//alert("subjectId"+subjectId);
							getHidShowIcons();
							},
						onSelectAll : function(aRowids, status) {
							getHidShowIcons();
						},
						width : 1000,
						// Every Edit slelect Field should be assigned with corresponding Variable 
						loadComplete: function() {
							var subjid = $('#courseSubjectObj.subjectId').val();
							//alert(subjid);
					   		$("#CoursesTBL").setColProp('courseSubjectObj.subjectCode', { editoptions: { 
					   			dataEvents :[{ 
							   		 type: 'change', fn: function(e) {
					   				$("#courseSubjectObj\\.subjectCode").closest('form.FormGrid').find("select#topicCode.FormElement").html('');
									getTopicsBySubjectCode($(e.target).val(),e.target);
									}//end func
									} // end type
									], // dataevents
									dataInit: function(elem) {
							   	        $(elem).width(200);  // set the width which you need
							   	    },
						   		value: SUBJECTCodes} });
					   		$("#CoursesTBL").setColProp('topicCode', { editoptions: {
					   			dataInit: function(elem) {
					   	        $(elem).width(200);  // set the width which you need
					   	     $(elem).height(100);
					   	    },multiple:true,value: TopicCodes} });
					   		}
					   								
					});
	$('#CoursesTBL').jqGrid('filterToolbar', {
		searchOnEnter : true,
		enableClear : false,
		beforeSearch : function(value) {
			$("#CoursesTBL").jqGrid('setGridParam', {
				url : "listCourses?filters="
			});
		}
	});

	$("#CoursesTBL").jqGrid('navGrid','#CourseTBLPageDiv',
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
				beforeShowForm : function(){
				$(".navButton").hide(); 
				$("#courseName").attr("disabled","disabled");
				getTopicsBySubjectCode($("#courseSubjectObj\\.subjectCode").val(),$("#courseSubjectObj\\.subjectCode")[0]);
				$("#courseSubjectObj\\.subjectCode").closest('form.FormGrid').find("select#topicCode.FormElement").html(newOptions);
			},onClose: function () {
				 $("#courseSubjectObj\\.subjectCode").closest('form.FormGrid').find("select#topicCode.FormElement").html('');
					
            },onCancel: function () {
				 $("#courseSubjectObj\\.subjectCode").closest('form.FormGrid').find("select#topicCode.FormElement").html('');
					
            }
			
		}, // edit options
			{
				reloadAfterSubmit : true,
				closeAfterAdd : true,
				closeOnEscape : true,
				onclickSubmit : function(rp_ge, postdata) {
					 rp_ge.url = "saveCourse?postdata="+postdata;
				 	},
					beforeShowForm : function(){
						$("#courseSubjectObj\\.subjectCode").closest('form.FormGrid').find("select#topicCode.FormElement").html('');
					},
				afterShowForm : function(){
						$("#tr_courseName td.CaptionTD span").hasClass("required") ? "" : $("#tr_courseName td.CaptionTD").append('<span class="required"> *</span>');
						$("#tr_courseSubjectObj\\.subjectCode td.CaptionTD span").hasClass("required") ? "" : $("#tr_courseSubjectObj\\.subjectCode td.CaptionTD").append('<span class="required"> *</span>');
						$("#tr_topicCode td.CaptionTD span").hasClass("required") ? "" : $("#tr_topicCode td.CaptionTD").append('<span class="required"> *</span>');
						$("#courseName").removeAttr("disabled");
					},
				onClickButton : function() {
					//alert("Adding Row");
				},onClose: function () {
					 $("#courseSubjectObj\\.subjectCode").closest('form.FormGrid').find("select#topicCode.FormElement").html('');
				
                }
			}, // add options
			
			// Multi Delete By Uday Please Check Apply Same in All Pages 
			{
			mtype : "POST",	
			reloadAfterSubmit : true,
			onclickSubmit : function(rp_ge, postdata) {
			rp_ge.url = "deleteCourses?postdata="+postdata;
			},
			serializeDelData : function(postdata) {
				return "";
			},
			afterComplete :function(response,postdata){
				var responseMessage = $.parseJSON(response.responseText);
				var message = responseMessage.message;
				if(message != null && message !=""){
				jAlert(message,"Information");
				}
			},
			closeOnEscape : true
		},
		// Multi Delete By Uday END 
			{
				multipleSearch : true,
				closeAfterSearch:true,
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
				sopt : [ 'cn', 'bw', 'eq', 'ne', 'lt', 'le',
						'gt', 'ge', 'ew' ],
				onSearch : function(params, postdata) {
				$("#gs_courseName").val("");
				$("#gs_courseSubjectObj\\.subjectCode").val("");
		  		$("#gs_topicCode").val("");
				$("#gs_updateUser").val("");
				$("#CoursesTBL").jqGrid('setGridParam', {
					url : "listCourses"
				});
			},
			reloadAfterSearch : true
			},// search options
			{
				closeOnEscape : true,
				beforeShowForm : function(){
				$(".navButton").hide();

				//Edit and Delte functionality in view form
	              if($("#cust-edit").length==0){
	                    $('<a href="#" class="btnEditDel" id="cust-edit">Edit<span class="ui-icon ui-icon-pencil"></span></a>')
	                    //Edit in view
	                     .click(function() {
	                            $('#cData').trigger('click');
	                            $('#edit_CoursesTBL').trigger('click');
	                           
	                        }).addClass("fm-button ui-state-default ui-corner-all fm-button-icon-left")
	                          .prependTo("#Act_Buttons>td.EditButton");
	              }
	              if($("#cust-delete").length==0){
	            	//Delete in view
	                  $('<a href="#" class="btnEditDel" id="cust-delete">Delete<span class=" ui-icon ui-icon-trash"></span></a>')
	                       .click(function() {
	                	 //  alert(postdata);
	                          $('#cData').trigger('click');
	                         // rp_ge.url = "deletePlatForm?platFormCode=" + postdata;
	                        $('#del_CoursesTBL').trigger('click');
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
<div align="center" width="100%"><br>
<div id="heading" class="title" align="left">Course Maintenance</div>
<br>
<table id="CoursesTBL" width="100%"></table>
<div id="CourseTBLPageDiv"></div>

</div>
<br>
</body>
</html>