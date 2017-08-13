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
	var moduleSelect = ""; 
	 moduleSelect =  $.ajax({url:"listModules",
		 	 async: false, 
		 	 type: "POST", 
		 	 success:	function(data){}
	       }).responseText;
	 var modulesResponse = $.parseJSON(moduleSelect);
	 var moduleCodes = "";
	 if (modulesResponse != null) {
	     for ( var i = 0, l = modulesResponse.model.length; i < l; i++) {
	     var ri = modulesResponse.model[i].moduleCode;
	     if(moduleCodes.length >0){
	    	 moduleCodes+=";";	
	     }
	     moduleCodes +=  ri	+ ':'+ ri;
	     }
	 }
var data ;
	function getHidShowIcons(){
		var selRowIds = $('#ParameterTBL').jqGrid('getGridParam', 'selarrrow');
        if(selRowIds.length > 1){
		         $("td#edit_ParameterTBL").attr("disabled","disabled");
		         $("td#view_ParameterTBL").attr("disabled","disabled");
		         $("td#edit_ParameterTBL").find("div").addClass("ui-pg-button ui-corner-all ui-state-disabled");
		         $("td#view_ParameterTBL").find("div").addClass("ui-pg-button ui-corner-all ui-state-disabled");
     		 }
     	else{
                 $("td#edit_ParameterTBL").removeAttr("disabled");
                 $("td#view_ParameterTBL").removeAttr("disabled");
                 $("td#edit_ParameterTBL").find("div").removeClass("ui-pg-button ui-corner-all ui-state-disabled");
                 $("td#view_ParameterTBL").find("div").removeClass("ui-pg-button ui-corner-all ui-state-disabled");
     		}
	}

	/*function validate_add(postdata)
	 {
		
		 var characterReg = /^\s*[a-zA-Z0-9,\s]+\s*$/;
		 var spaceReg = /^[a-zA-Z0-9]{1,20}$/;

		 if (postdata == ""  || postdata =="null")
			   return [false,"Please Enter Parameter Code."];
		 
		 if(!spaceReg.test(postdata)) {
		     return [false,"Please enter Parameter Code without special characters."];
		 }
		 return [true,""];
	 }*/


$("#ParameterTBL").jqGrid({
	   url : 'listParameters',
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
			    colNames : [ 'Module', 'Code', 'Value','Description','parameterId'],
				colModel : [ 
							{ name : 'moduleCode.moduleCode',index : 'moduleCode.moduleCode', editable : true,edittype:'select'}, 
	                		{ name : 'parameterCode',index : 'parameterCode',editable : true},
		             		{ name : 'parameterValue',index : 'parameterValue',editable : true}, 
			                { name : 'parameterDesc',index : 'parameterDesc',editable : true},
			                { name : 'parameterId',index : 'parameterId',editable : false,hidden:true,key:true} 
			         		],
			rowNum : 15,
			rowList : [ 15, 20, 30 ],
			pager : '#ParameterTblPgr',
			sortname : 'moduleCode.moduleCode',
			viewrecords : true,
			gridview : true,
			loadatonce : false,
			//multiselect : true,
			toolbar:[true,"top"],
			height: 255,
			width: 'auto',
			sortorder : "desc",
			caption : "&nbsp; Parameter",
			editurl:"saveOrUpdateParameter",
			width : 1000,
			onSelectRow: function(id){
					getHidShowIcons();
			       },
			       onSelectRow: function(id){
		    			checkedVal = id;
	    				},
		       
			onSelectAll: function(aRowids,status){
			    	   getHidShowIcons();
			       },
			viewrecords : true,
			loadComplete: function() {
		   		$("#ParameterTBL").setColProp('moduleCode.moduleCode', { editoptions: { value: moduleCodes} });
		   		}

		});
		//$('#ParameterTBL').jqGrid('filterToolbar', {
		//	searchOnEnter : true,
		//	enableClear : false,
		//	beforeSearch : function(value) {
		//		$("#ParameterTBL").jqGrid('setGridParam', {
		//			url : "listParameters?filters="
		//		});
		//	}
		//});
		$("#ParameterTBL").jqGrid('navGrid', '#ParameterTblPgr', {
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
			  
			  afterShowForm : function(domainMaitenanceTBL) {
							$(".navButton").hide();
							//$("#parameterCode").attr("disabled","disabled");
			          
					}
			}, // edit options
			{
				reloadAfterSubmit : true,
				closeOnEscape : true,
				closeAfterAdd : true,
				width:350,
				height:170,
			
				
				 onclickSubmit : function(rp_ge, postdata) {

					 rp_ge.url = "saveParameter?postdata="+postdata;
				 	}
				 }, // add options
			
				{ // now define settings for Delete dialog
					mtype : "POST",	reloadAfterSubmit : true,
					onclickSubmit : function(rp_ge, postdata) {
					rp_ge.url = "deleteParameter?moduleCode.moduleCode="+postdata;
					
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
					closeOnEscape : true,
					closeAfterSearch : true,
					groupOps : [ { op : "AND", text : "AND"}, { op : "OR", text : "OR" } ],
					matchText : "Find",
					rulesText : " matches",
					sopt : [ 'cn','bw', 'eq', 'ne', 'lt', 'le', 'gt', 'ge', 'ew' ],
					onSearch : function(params, postdata) {
					
					//$("#gs_updatedUser").val("");
					//$("#gs_parameterCode").val("");
					$("#ParameterTBL").jqGrid('setGridParam', {url : "listParameters"});
				},
				reloadAfterSearch : true
				},// search options
				{
					closeOnEscape : true,
					beforeShowForm : function(ParameterTBL){
					$(".navButton").hide();
				
		             if($("#cust-edit").length==0){
			              //alert("=======bbb====="+$("#cust-edit").length);
		                    $('<a href="#" class="btnEditDel" id="cust-edit">Edit<span class="ui-icon ui-icon-pencil"></span></a>')
		                    //Edit in view
		                     .click(function() {
		                            $('#cData').trigger('click');
		                            $('#edit_ParameterTBL').trigger('click');
		                           
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
		                        $('#del_ParameterTBL').trigger('click');
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
<div id="heading" class="title" align="left">Parameter Screen</div>

<br>
<table b id="ParameterTBL" width="100%"></table>
<div id="ParameterTblPgr"></div>
</div>
<input type="hidden" id="query" value="">
<br>
</form>
</body>
</html>