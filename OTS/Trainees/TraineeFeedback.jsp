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

	$("#TraineeFeedbackTBL").jqGrid({
		url : 'listTraineeFeedback',
		datatype : "json",
		jsonReader : { repeatitems : false,
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

		    colNames : [ 'ID', 'Nomination Id', 'Trainee User Id','Training Date','Feedback' ],
			colModel : [ { name : 'ID',index : 'ID', align : "center", editable : false,key : true, hidden : true },
		                 { name : 'NOMINATED_ID',index : 'NOMINATED_ID', align : "center", editable : false,key : true },  
						 { name : 'TRAINEE_USER_ID',index : 'TRAINEE_USER_ID', align : "center", editable : false,key : true },
						 { name : 'TRAINING_DATE',index : 'TRAINING_DATE', align : "center", editable : false,key : true },      
						 { name : 'FEEDBACK',index : 'FEEDBACK', align : "center", editable : false,key : true },
					   ],

						    rowNum : 15,
							rowList : [ 15, 20, 30 ],
							pager : '#TraineeFeedbackTBLPageDiv',
							loadatonce : false,
							viewrecords : true,
							mtype : "GET",
							//rownumbers: true,
							multiselect: true,
							gridview : true,
							sortname : 'NOMINATED_ID',
							sortorder : "asc",
							caption : "Toolbar Searching",
							sortorder : "desc",
							caption : "Feedback For Trainers",
							toolbar:[true,"top"],
							height: 255,
							width : 1000
	});

	$('#TraineeFeedbackTBL').jqGrid('filterToolbar', {
		searchOnEnter : true,
		enableClear : false
		/*beforeSearch : function(value) {
			$("#domainMaitenanceTBL").jqGrid('setGridParam', {
				url : "listDomain?filters="
			});*/
		}
	);

	$("#TraineeFeedbackTBL").jqGrid(
			'navGrid',
			'#TraineeFeedbackTBLPageDiv',
			{
				edit : false,
				add : false,
				del : false,
				search : true,
				view : true
			}, //options
			   {
				reloadAfterSubmit : true,
				closeAfterEdit : true,
				closeOnEscape : true,
				afterShowForm : function(domainMaitenanceTBL) {
					$(".navButton").hide();
	                 // $('#editmoddomainMaitenanceTBL').position({my:'center', at:'center', of:window, collision: 'fit'});
			    }

				}, // edit options
				{
					reloadAfterSubmit : true,
					closeAfterAdd : true,
					closeOnEscape : true
				},  //add options
				{
					
				},  //del options
				{
					multipleSearch : true,
					closeOnEscape : true,
					groupOps : [ {op : "AND", text : "AND" },
								 {op : "OR", text : "OR" } ],
					matchText : "Find",
					rulesText : " matches",
					sopt : [ 'cn', 'bw', 'eq', 'ne', 'lt', 'le', 'gt', 'ge', 'ew' ],
					reloadAfterSearch : true,
					onSearch : function(params,
							postdata) {
						//alterations would be here
						 		$("#query").val(
								$(".query").html());
						//alert($("#query").val());
						//$("#domainMaitenanceTBL").jqGrid('setGridParam', { url: "listDomain?query="+$("#query").val() }).trigger("reloadGrid");
						$("#TraineeFeedbackTBL")
								.jqGrid('setGridParam',
										{ url : "listTraineeFeedback" });
					}
				},
			
				{
						closeOnEscape : true,
						beforeShowForm : function(TraineeFeedbackTBL) {
								$(".navButton").hide();
				}
				});
					
					
});
</SCRIPT>

<body>
<form id="traineeFeedback">
<div align="center" >
<br>
<div id="heading" class="title" align="left">Trainee</div>
<br>
<table id="TraineeFeedbackTBL" width="100%"></table>
<div id="TraineeFeedbackTBLPageDiv"></div>
</div>
<br>
<br>
<input type="hidden" id="query" value="">
<br>
</form>
</body>
</html>