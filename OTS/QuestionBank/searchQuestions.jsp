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
  var selectRowDeatils = new Array();
  var selectRowDets = new Array();
  var selectedQuesId;
  var subjectCode;
  var topicCode;
  var jsonObj = []; 
  function getHidShowIcons(){
	  var selectedRows = $('#PostQuestionTBL').jqGrid('getGridParam', 'selarrrow');
		 if(selectedRows.length > 1){
	         $("#editQuestionbutton").attr("disabled","disabled");
	         $("#viewQuestion").attr("disabled","disabled");
	         $("#editQuestionbutton").find("div").addClass("ui-pg-button ui-corner-all ui-state-disabled");
	         $("#viewQuestion").find("div").addClass("ui-pg-button ui-corner-all ui-state-disabled");
		 }
	else{
           $("#editQuestionbutton").removeAttr("disabled");
           $("#viewQuestion").removeAttr("disabled");
           $("#editQuestionbutton").find("div").removeClass("ui-pg-button ui-corner-all ui-state-disabled");
           $("#viewQuestion").find("div").removeClass("ui-pg-button ui-corner-all ui-state-disabled");
		}
	  }
$("#PostQuestionTBL").jqGrid({
	url : 'listSearchQuestions',
	datatype : "json",
	jsonReader : {
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
	colNames : [ 'Qid','Subject', 'Topic','Complexity','Question','Question Type','Objective-A','Objective-B','Objective-C','Objective-D','Objective Answer','Subjective Answer'],
	colModel : [{name : 'qid',index : 'qid',editable: true,align : "center",key : true, hidden : true,align : "left"}, 
	        	{name : 'subjectsForQuestionBabk.subjectCode', index : 'subjectsForQuestionBabk.subjectCode', 
				 searchoptions: { defaultValue:'Filter...'}, search : true, filter : true, align : "center",editable : true,edittype : 'select',editrules : {required : true},align : "left"}, 	
				 {name : 'topicsForQuestionBank.topicCode', index : 'topicsForQuestionBank.topicCode', 
					 searchoptions: { defaultValue:'Filter...'}, search : true, filter : true, align : "center",editable : true,edittype : 'select',editrules : {required : true},align : "left"}, 		
					 	  
				{name : 'complexity',index : 'complexity',align : "center",editable : true,align : "left",
					formatter:function(cellvalue, options, rowObject){
		              if (cellvalue == 's' || cellvalue == 'S') {
			              cellvalue="Simple";
					      } else if(cellvalue == 'm' || cellvalue == 'M') {
		            		  cellvalue="Medium";
		              }else{
			              cellvalue="Complex";
		              }return cellvalue;  }},
				{name : 'question',index : 'question',align : "center",editable : true,edittype : 'textarea',align : "left"}, 
				{name : 'questiontype',index : 'questiontype',align : "center",	hidden : true, editable : true,align : "left",
						formatter:function(cellvalue, options, rowObject){
			              if (cellvalue == 's') {
				              cellvalue="Subjective";
						      } else if(cellvalue == 'o') {
			            		  cellvalue="Objective";
			              }return cellvalue;
			              }},
				{name : 'objectiveA',index : 'objectiveA',align : "center",editable : true,hidden : true ,edittype : 'textarea',align : "left"},
				{name : 'objectiveB',index : 'objectiveB',align : "center",editable : true,hidden : true ,	edittype : 'textarea',align : "left"},
				{name : 'objectiveC',index : 'objectiveC',align : "center",editable : true,hidden : true ,edittype : 'textarea',align : "left"},
				{name : 'objectiveD',index : 'objectiveD',align : "center",editable : true,hidden : true ,edittype : 'textarea',align : "left"},
				{name : 'objectiveAnswer',index : 'objectiveAnswer',align : "center",editable : true,align : "left"},
				{name : 'subjectAnswer',index : 'subjectAnswer',align : "center",editable : true,hidden : true,align : "left"}
				//{name : 'subjectsForQuestionBabk.subjectId', index : 'subjectsForQuestionBabk.subjectId', hidden :true,
					//    align : "center",editable : false,edittype : 'select',editrules : {required : true},align : "left"}, 	
					// {name : 'topicsForQuestionBank.topicId', index : 'topicsForQuestionBank.topicId', hidden :true,
					//	  align : "center",editable : false,edittype : 'select',editrules : {required : true},align : "left"}
						  ],
					rowNum : 15,
					rowList : [ 15, 20, 30 ],
					pager : '#PostQuestionTBLPageDiv',
					loadatonce : false,
					viewrecords : true,
					mtype : "POST",
					multiselect: true,
					toolbar:[true,"top"],
					height: 255,
					width: 950,
					gridview : true,
					sortname : 'qid',
					caption : "Toolbar Searching",
					sortorder : "asc",
					caption : "&nbsp; Questions Details",
					editurl : "saveOrUpdateSearchQuestions",
					onSelectRow : function(id,object,status) {
						selectedQuesId = id;
						var gridObject = $("#PostQuestionTBL");
						var selRowId = gridObject.jqGrid ('getGridParam', 'selrow');
						var qid  = gridObject.jqGrid ('getCell', selRowId, 'qid');
						 subjectCode  = gridObject.jqGrid ('getCell', selRowId, 'subjectsForQuestionBabk.subjectId');//internally it sends value
						 topicCode  = gridObject.jqGrid ('getCell', selRowId, 'topicsForQuestionBank.topicId');
						//here ambiguity removed(new issue resloved 17th in sheet2)
						selectedQuesId=qid;
						getHidShowIcons();
						
					},
					onSelectAll: function(aRowids,status){
				    	   getHidShowIcons();
				       }
				});
	$('#PostQuestionTBL').jqGrid('filterToolbar', {
		searchOnEnter : true,
		enableClear : false,
		beforeSearch : function(value) {
			$("#PostQuestionTBL").jqGrid('setGridParam', {
				url : "listSearchQuestions?filters="
			});
		}
	});
	$("#PostQuestionTBL").jqGrid('navGrid','#PostQuestionTBLPageDiv',
			{
				edit : false,
				add : false,
				del : true,
				search : false,
				view : false
			}, //options
			{}, 
			{},
			  {
				 // now define settings for Delete dialog
				mtype : "POST",	reloadAfterSubmit : true,
				onclickSubmit : function(rp_ge, postdata) {
				rp_ge.url = "deletePostQuestion?postid="+postdata;
				var parameter= "postid="+postdata;
				/* $.post('deletePostQuestion', parameter, function(data){
					var message = data.message;
					alert("message"+message);
					if(message != null && message != "" ){									
						jAlert(message);
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
			}, // del options in buit delete
			{
				multipleSearch : true,
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
				$("#gs_qid").val("");
				$("#gs_subjectCode").val("");
				$("#gs_topicCode").val("");
				$("#gs_complexity").val("");
				$("#gs_question").val("");
				$("#gs_questiontype").val("");
				$("#gs_objectiveA").val("");
				$("#gs_objectiveB").val("");
				$("#gs_objectiveC").val("");
				$("#gs_objectiveD").val("");
				$("#gs_objectiveAnswer").val("");
				$("#gs_subjectAnswer").val("");
				$("#PostQuestionTBL").jqGrid('setGridParam', {
					url : "listSearchQuestions" 
						
				});
			},
			reloadAfterSearch : true
			})
			//our own View Custom page
			     .jqGrid('navButtonAdd',"#PostQuestionTBLPageDiv",
				{
				title:"View",
				add:false,
				addtext:'View Question',
				buttonicon : "ui-icon ui-icon-document",
				id:"viewQuestion",
				position: "first", 
				caption : "",
				onClickButton : function(){
			    
			    	 var selectedRows = $('#PostQuestionTBL').jqGrid('getGridParam', 'selarrrow');
						if(selectedRows.length == 0) {
							jAlert("Please,select row","Warning");
							return false;
						}
					$('#PostQuestion').dialog({  
					    title: 'View Question',  
					    width: 700,  
					    height: 550,  
					    closed: false,  
					    cache: false,  
					    modal: true  
					});  
					var parameter = $('#PostQuestionTBL').jqGrid('getGridParam', 'selarrrow');
					//$('#editQuestion').dialog('refresh', 'postEditQuestions.jsp');

					 
					//for View Post Question Jsp
					 $.ajax({url: "dialogViewPostQuestion.action?qid="+selectedQuesId,
						 data: parameter,
                         cahce : true,
                         success: function(data){
        				 var count = 0;			        	       
                         $('#PostQuestion').html(data);
                         },
            	         error:function(data){
                        	 jAlert("Error :: "+data.message);
            	       }            
            		});  
					  
					}
			     })
			  //our own edit custom button   
			.jqGrid('navButtonAdd',"#PostQuestionTBLPageDiv",
				{
				buttonicon : "ui-icon ui-icon-pencil",
				id:"editQuestionbutton",
				position: "first", 
				caption : "",
				onClickButton : function(){
				/*var gridDataIDs = $('#PostQuestionTBL').jqGrid('getDataIDs');
				for(var row = 0; row < gridDataIDs.length; row++ ) {
					//alert(gridDataIDs[row]);
					//var gridRowData =  $('#PostQuestionTBL').jqGrid('getRowData', gridDataIDs[row]);
				}*/
				var selectedRows = $('#PostQuestionTBL').jqGrid('getGridParam', 'selarrrow');
				if(selectedRows.length == 0) {
					jAlert("Please,select row","Warning");
					return false;
				}
				
					$('#PostQuestion').dialog({  
					    title: 'Edit Question',  
					    width: 650,  
					    height: 480,  
					    closed: false,  
					    cache: false,  
					    modal: true  
					});  
					var parameter = $('#PostQuestionTBL').jqGrid('getGridParam', 'selarrrow');
					  //for jsp
					 $.ajax({url: "dialogEditPostQuestion.action?qid="+selectedQuesId+'&subjectCode='+subjectCode+'&topicCode='+topicCode,
                         //data: parameter,
                         cahce : false,
                         success: function(data){
        				 var count = 0;			        	       
                         $('#PostQuestion').html(data);
                         },
            	         error:function(data){
            	         jAlert("Error :: "+data.message);
            	       }            
            		});   
					 
			}
			     })
			//our own custom functionalities     
			.jqGrid('navButtonAdd',"#PostQuestionTBLPageDiv",
				{
				title:"Add",
				add:false,
				addtext:'postQuestions',
				buttonicon : "ui-icon ui-icon-plus",
				position: "first", 
				caption : "",
				onClickButton : function(){
					$('#PostQuestion').dialog({  
					    title: 'Post Question',  
					    width: 600,  
					    height: 480,  
					    closed: false,  
					    cache: false,  
					    modal: true  
					});  
					//for jsp
					 $.ajax({url: "dialogPostQuestion.action",
                         cahce : true,
                         success: function(data){
        				 var count = 0;			        	       
                         $('#PostQuestion').html(data);
                         },
            	         error:function(data){
                        	jAlert("Error :: "+data.message);
            	       }            
            		});     
					}
			     }).jqGrid('navButtonAdd',"#PostQuestionTBLPageDiv",
							{title:"Bulk Upload",
						add:false,
						addtext:'postQuestions',
						buttonicon : "upload-icon.jpg",
						position: "last", 
						caption : "Bulk Upload",
						onClickButton : function(){
						document.bulkuploadForm.submit();
			     }
						     });
	
});//document

</SCRIPT>
<body>
<form id="setQuestionsDeatilsForm">
<div align="center" >
<br>
<div id="heading" class="title" align="left">View Questions</div>
<br>
<table id="PostQuestionTBL" width="100%"></table>
<div id="PostQuestionTBLPageDiv"></div>
</div>
<br> <div id="PostQuestion"  style="width: 700px;height:400px;"></div>  
</form>
<form name="bulkuploadForm" action="bulkUploadComponent">
</form>
</body>
</html>