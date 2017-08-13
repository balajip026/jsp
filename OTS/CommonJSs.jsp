<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<SCRIPT type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jQGrid/jquery-1.7.2.min.js"></SCRIPT>
<SCRIPT type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jQGrid/jquery.jqGrid.js"></SCRIPT>
<SCRIPT type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jQGrid/grid.locale-en.js"></SCRIPT>
<SCRIPT type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jQGrid/jquery-ui-custom.min.js"></SCRIPT>
<SCRIPT type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jQGrid/jquery.contextmenu.js"></SCRIPT>
<SCRIPT type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jQGrid/jquery.layout.js"></SCRIPT>
<SCRIPT type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jQGrid/jquery.infieldlabel.js"></SCRIPT>
<SCRIPT type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jQGrid/grid.inlinedit.js"></SCRIPT>
<SCRIPT type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/JQCustomAlertJS/jquery.alerts.js"></SCRIPT>
<SCRIPT type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/wizard/jquery.smartWizard.js"></SCRIPT>
<SCRIPT type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/widgets/jquery.ui.datepicker.js"></SCRIPT>
<SCRIPT type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/widgets/jquery.selectBoxIt.min.js"></SCRIPT>
<SCRIPT type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/widgets/date.js"></SCRIPT>
<SCRIPT type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/widgets/jquery.countdown.js"></SCRIPT>
<SCRIPT type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/widgets/jquery-ui.multidatespicker.js"></SCRIPT>

<!--DialogBox JS List   -->

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jQGrid/jquery.ui.core.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jQGrid/jquery.ui.widget.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jQGrid/jquery.ui.mouse.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jQGrid/jquery.ui.button.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jQGrid/jquery.ui.position.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jQGrid/jquery.ui.resizable.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jQGrid/jquery.ui.dialog.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jQGrid/json2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jQGrid/jquery.jqtransform.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jQGrid/jquery-plugin-validation.js"></script>
<style type="text/css">
@import url("${pageContext.request.contextPath}/stylesheet/style.css");
@import url("${pageContext.request.contextPath}/stylesheet/Jquery/jquery-ui-custom.css");
@import url("${pageContext.request.contextPath}/stylesheet/Jquery/ui.jqgrid.css");
@import url("${pageContext.request.contextPath}/stylesheet/mainstyle.css");
@import url("${pageContext.request.contextPath}/stylesheet/Jquery/jquery.alerts.css");
@import url("${pageContext.request.contextPath}/stylesheet/jqtransform.css");
</style>
<script language="javascript">
	   $.ajaxSetup ({
    	    // Disable caching of AJAX responses
    	    cache: false
    	});

       //for trim equavlent in  IE(this mehtod used remove space for object answers in QuestionBank)
		if(!String.prototype.trim) {
		   	  String.prototype.trim = function () {
		   	    return this.replace(/^\s+|\s+$/g,'');
		   	  };
		   	}
		   	
</script>
</head>
<body>

<!-- Test Check in-->
</body>
</html>