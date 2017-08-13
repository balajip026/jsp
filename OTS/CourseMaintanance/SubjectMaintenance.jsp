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
  function chekvalid(value,subjapp,description ) 
    {
    if (value == ""  || value =="null") 
        return [false,"Please Enter Description."];
        else 
           return [true,""];
     }
 function PlatformValue(value,subjplatform ) {
		if (value == ""  || value =="null")
		   return [false,"Please Enter PlatformCode."];
		   else
			   return [true,""];
			}
 
 function DomainValue(value,subjdomain ) {
		if (value == ""  || value =="null")
		   return [false,"Please Enter DomainCode."];
		   else
			   return [true,""];
			}
 function AppValue(value,subjapp ) {
		if (value == ""  || value =="null")
		   return [false,"Please Enter AppCode."];
		   else
			   return [true,""];
			}
 function SubCatCodeValue(value,subjcategory ) {
		if (value == ""  || value =="null")
		   return [false,"Please Enter SubCatCode."];
		   else
			   return [true,""];
			}	
 function SubCodeValue(value,subjectCode ) {
		if (value == ""  || value =="null")
		   return [false,"Please Enter SubjectCode."];
		   else
			   return [true,""];
			}
 // platForm Select Start
 var platFormSelect = ""; 
 platFormSelect =  $.ajax({url:"platFormDropDown",
	 	 async: false, 
	 	 type: "POST", 
	 	 success:	function(data){}
       }).responseText;
 var platFormResponse = $.parseJSON(platFormSelect);
 var platFormCodes = "";
 var platFormIds = "";

 if (platFormResponse != null) {
	// alert("inside if ");
     for ( var i = 0, l = platFormResponse.model.length; i < l; i++) {
    // alert("**PLATFORM IDS**"+platFormResponse.model[i].platformId);    
     var platformid = platFormResponse.model[i].platformId;
     var ri = platFormResponse.model[i].platFormCode;
     if(platFormCodes.length >0){
    	 platFormCodes+=";";	
     }
     platFormCodes +=  platformid	+ ':'+ ri;
     //alert("plaform CODES::"+platFormCodes);
     //alert("PLATFORM ID :: "+platFormCodes.platformId+"PLATFORM CODE :: "+platFormCodes.platFormCode);
     }
 }
	var defSelect = ":--select--;";
	var naString = "NA:NA;";
	platFormCodes = defSelect + naString + platFormCodes;
	//alert("plaform CODES::"+platFormCodes);
	
//platForm Select End

//bhargavi write code for select
// Domain Select Start
 var DomainSelect = ""; 
 DomainSelect =  $.ajax({url:"DomainDropDown",
	 	 async: false, 
	 	 type: "POST", 
	 	 success:	function(data){}
       }).responseText;
 var DomainResponse = $.parseJSON(DomainSelect);
 //alert("DomainResponse============"+DomainResponse);
 var DomainCodes = "";
 if (DomainResponse != null) {
     for ( var j = 0, k = DomainResponse.model.length; j < k; j++) {
     var domainid = DomainResponse.model[j].domainId;
     var riD = DomainResponse.model[j].domainCode;
    // alert("ri==========="+ri);
     if(DomainCodes.length >0){
    	 DomainCodes+=";";	
     }
     DomainCodes +=  domainid	+ ':'+ riD;
     }
 }
	var defSelect = ":--select--;";
	DomainCodes = defSelect + naString + DomainCodes;
 //alert(DomainCodes);
//Domain Select End

// Business Select Start
 var BusinessSelect = ""; 
 BusinessSelect =  $.ajax({url:"busnDropDown",
	 	 async: false, 
	 	 type: "POST", 
	 	 success:	function(data){}
       }).responseText;
 var BusinessResponse = $.parseJSON(BusinessSelect);
 //alert("BusinessResponse============"+BusinessResponse);
 var BusinessCodes = "";
 if (BusinessResponse != null) {
	  for ( var m = 0, n = BusinessResponse.model.length; m < n; m++) {
		     var appid = BusinessResponse.model[m].appId;
		     var rib = BusinessResponse.model[m].APP_CODE;
		     //alert("ri==========="+rib);
		     if(BusinessCodes.length >0){
		    	 BusinessCodes+=";";
		     }
		     BusinessCodes +=  appid	+ ':'+ rib;
		     }
 }
 var defSelect = ":--select--;";
 BusinessCodes = defSelect + naString + BusinessCodes;
 //alert(BusinessCodes);
//Business Select End



// Subject  Catagory Select Start
var SubjectCatgorySelect = ""; 
SubjectCatgorySelect =  $.ajax({url:"subCatDropDown",
	 	 async: false, 
	 	 type: "POST", 
	 	 success:	function(data){}
      }).responseText;
var SubjectSelectResponse = $.parseJSON(SubjectCatgorySelect);
var SubjectCatoryCodes = "";
//alert("SUBJECT CATEGORY RESPONSE:::  "+SubjectSelectResponse.model.length);
if (SubjectSelectResponse != null) {
    for ( var p = 0, q = SubjectSelectResponse.model.length; p < q; p++) {
        //alert("CATEGORY ID :: "+SubjectSelectResponse.model[p].subjcatId);
        //alert("CATEGORY CODE :: "+SubjectSelectResponse.model[p].subjcatcode);
    var subjcatid = SubjectSelectResponse.model[p].subjcatId;
    var risc = SubjectSelectResponse.model[p].subjcatcode;
    if(SubjectCatoryCodes.length >0){
    	SubjectCatoryCodes+=";";	
    }
    SubjectCatoryCodes +=  subjcatid	+ ':'+ risc;
    
    }
}
var defSelect = ":--select--;";
SubjectCatoryCodes = defSelect + naString + SubjectCatoryCodes;
//Subject Catagory Select End

//alert(SUBJECTCodes);
//SUBJECT Select End


function getHidShowIcons(){
var selRowIds = $('#SubjectsTBL').jqGrid('getGridParam', 'selarrrow');
if(selRowIds.length > 1){
         $("td#edit_SubjectsTBL").attr("disabled","disabled");
         $("td#view_SubjectsTBL").attr("disabled","disabled");
         $("td#edit_SubjectsTBL").find("div").addClass("ui-pg-button ui-corner-all ui-state-disabled");
         $("td#view_SubjectsTBL").find("div").addClass("ui-pg-button ui-corner-all ui-state-disabled");
		 }
	else{
         $("td#edit_SubjectsTBL").removeAttr("disabled");
         $("td#view_SubjectsTBL").removeAttr("disabled");
         $("td#edit_SubjectsTBL").find("div").removeClass("ui-pg-button ui-corner-all ui-state-disabled");
         $("td#view_SubjectsTBL").find("div").removeClass("ui-pg-button ui-corner-all ui-state-disabled");
		}
}
function validate_add(postdata)
{
	 //var characterReg = /^\s*[a-zA-Z0-9,\s]+\s*$/;
	 //var spaceReg = /^[a-zA-Z0-9]{1,20}$/;
	 var specialReg = /^[a-zA-Z0-9\_\-\~]+$/;
	 if (postdata == ""  || postdata =="null")
		   return [false,"Please Enter Subject Code."];
	 
	// if(!specialReg.test(postdata)) {
	 //    return [false,"Special characters (~, -, _) are only allowed for Subject Code."];
	// }

	 if (postdata.length >= 20 )
	 {
		 return [false,"Please Enter Subject Code with size less than 20 characters."];
	 }
	 return [true,""];
}
$("#SubjectsTBL").jqGrid({
	url : 'listSubjects',
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
	colNames:['subjectId','Subject Code','Subject Category Code','Domain Code','Business Appl Code','Platform Code','Description', 'Updated User', 'Updated TimeStamp'], 
	colModel : [
{   name : 'subjectId',
	index : 'subjectId',
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
	name : 'subjectCode',
	index : 'subjectCode',  
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
	}
},
{
	name : 'subjcatId.subjcatcode',
	index : 'subjcatId.subjcatcode',  
	align : "center",
	editable : true,
	edittype : 'select',
	editoptions : {},
	editrules : {
		custom : true,
		custom_func : SubCatCodeValue
	}
},
	
{
	name : 'subjdomain.domainCode',
	index : 'subjdomain.domainCode',  
	align : "center",
	editable : true,
	edittype : 'select',
	  editoptions : {
	  },
	editrules : {
		custom : true,
		custom_func : DomainValue
	}
},
{
	name : 'subjAppId.APP_CODE',
	index : 'subjAppId.APP_CODE',  
	align : "center",
	editable : true,
	edittype : 'select',
	editoptions : {},
	editrules : {
		custom : true,
		custom_func : AppValue
	}
},
	
			 { name : 'subjplatform.platFormCode', 
                index : 'subjplatform.platFormCode', 
                align : "center", 
                editable : true,
		        edittype : 'select', 
                editoptions : {},
		editrules : { custom : true, 
                              custom_func : PlatformValue }
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
				editrules : {
					custom : true,
					custom_func : chekvalid
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
			},{
				name : 'updateTimestamp',
				index : 'updateTimestamp',  
				align : "center",
				editable : false,
				hidden : true,
				editoptions : {
					size : 20
				}
			}

			  ],
						rowNum : 15,
						rowList : [ 15, 20, 30 ],
						pager : '#SubTBLPageDiv',
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
						sortname : 'subjectCode',
						caption : "Toolbar Searching",
						sortorder : "desc",
						caption : "&nbsp; Subject Details",
						editurl : "saveOrUpdateSubjects",
						onSelectRow : function(id) {
							getHidShowIcons();
							},
						onSelectAll : function(aRowids, status) {
							getHidShowIcons();
						},
						width : 1000,
						// Every Edit slelect Field should be assigned with corresponding Variable 
						loadComplete: function() {
					   		$("#SubjectsTBL").setColProp('subjplatform.platFormCode', { editoptions: { value: platFormCodes} });
					   		$("#SubjectsTBL").setColProp('subjdomain.domainCode', { editoptions: {value: DomainCodes} });
					   		$("#SubjectsTBL").setColProp('subjAppId.APP_CODE', { editoptions: { value: BusinessCodes} });
					   		$("#SubjectsTBL").setColProp('subjcatId.subjcatcode', { editoptions: { value: SubjectCatoryCodes} });
					   		}
					   								
					});

	$('#SubjectsTBL').jqGrid('filterToolbar', {
		searchOnEnter : true,
		enableClear : false,
		beforeSearch : function(value) {
			$("#SubjectsTBL").jqGrid('setGridParam', {
				url : "listSubjects?filters="
			});
		}
	});

	$("#SubjectsTBL").jqGrid('navGrid','#SubTBLPageDiv',
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
				width:360,
				height:260,
				beforeShowForm : function(SubjectsTBL){
				$(".navButton").hide(); 
				$("#subjectCode").attr("disabled","disabled");
			}
		}, // edit options
			{
				reloadAfterSubmit : true,
				closeAfterAdd : true,
				closeOnEscape : true,
				onclickSubmit : function(rp_ge, postdata) {
			//$('select#subjcatId.subjcatcode option:selected').val();
				
				var subjcatid = $("#subjcatId.subjcatcode").val();
				var domainid = $('#subjdomain.domainCode').val();
				var appid = $('#subjAppId.APP_CODE').val();
				var platformid = $('#subjplatform.platFormCode').val();
				//alert("Adding Row with sub category Id :: "+subjcatid);
				rp_ge.url = "saveSubjects?postdata="+postdata;
					// rp_ge.url = "saveSubjects?platformid="+platformid+"&subjcatid="+subjcatid+"&domainid="+domainid+"&appid="+appid;
				 	},
				afterShowForm : function(){
				 		$("#tr_subjectCode td.CaptionTD span").hasClass("required") ? "" : $("#tr_subjectCode td.CaptionTD").append('<span class="required"> *</span>');
				 		$("#tr_subjcatId\\.subjcatcode td.CaptionTD span").hasClass("required") ? "" : $("#tr_subjcatId\\.subjcatcode td.CaptionTD").append('<span class="required"> *</span>');
				 		$("#tr_subjdomain\\.domainCode td.CaptionTD span").hasClass("required") ? "" : $("#tr_subjdomain\\.domainCode td.CaptionTD").append('<span class="required"> *</span>');
				 		$("#tr_subjAppId\\.APP_CODE td.CaptionTD span").hasClass("required") ? "" : $("#tr_subjAppId\\.APP_CODE td.CaptionTD").append('<span class="required"> *</span>');
				 		$("#tr_subjplatform\\.platFormCode td.CaptionTD span").hasClass("required") ? "" : $("#tr_subjplatform\\.platFormCode td.CaptionTD").append('<span class="required"> *</span>');
						$("#tr_description td.CaptionTD span").hasClass("required") ? "" : $("#tr_description td.CaptionTD").append('<span class="required"> *</span>');
						$("#subjectCode").removeAttr("disabled");
					},
				onClickButton : function() {
					//alert("Adding Row");
				},
				width:360,
				height:260
			}, // add options
			// Multi Delete By Uday Please Check Apply Same in All Pages 
			{
			mtype : "POST",	
			reloadAfterSubmit : true,
			onclickSubmit : function(rp_ge, postdata) {
				var parameter = "subjectId="+postdata;
				$.post('deleteSubjects', parameter, function(data){
					$("#SubjectsTBL").trigger("reloadGrid");
					var message = data.message;
				//	var finalmsg = message.substring(2);
					if(message != null && message != "" ){									
						jAlert(message);
					}
				});
			//rp_ge.url = "deleteSubjects?subjectId="+subjectId;
			
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
					//alterations would be here
				/* alert("hi");
				 alert(postdata);
				 $("#query").val($(".query").html());
				 alert($("#query").val());
				 $("#SubjectsTBL").jqGrid('setGridParam', { url: "listSubjects?query="+$("#query").val() }).trigger("reloadGrid");
				 
				},*/
					
				$("#gs_subjplatformCode").val("");
				$("#gs_subjdomainCode").val("");
				$("#gs_subjappCode").val("");
				$("#gs_subjectCatageryCode").val("");
				$("#gs_subjectCode").val("");
				$("#gs_description").val("");
				$("#gs_updateUser").val("");
				$("#gs_updateTimestamp").val("");
				
				$("#SubjectsTBL").jqGrid('setGridParam', {
					url : "listSubjects"
				});
			},
			reloadAfterSearch : true
			},// search options
			{
				closeOnEscape : true,
				width:350,
				height:190,
				beforeShowForm : function(){
				$(".navButton").hide();

				//Edit and Delte functionality in view form
	              if($("#cust-edit").length==0){
	                    $('<a href="#" class="btnEditDel" id="cust-edit">Edit<span class="ui-icon ui-icon-pencil"></span></a>')
	                    //Edit in view
	                     .click(function() {
	                            $('#cData').trigger('click');
	                            $('#edit_SubjectsTBL').trigger('click');
	                           
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
	                        $('#del_SubjectsTBL').trigger('click');
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
<table id="SubjectsTBL" width="100%"></table>
<div id="SubTBLPageDiv"></div>
</div>
<br>
</body>
</html>