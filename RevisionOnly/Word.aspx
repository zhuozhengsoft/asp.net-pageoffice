﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Word.aspx.cs" Inherits="RevisionOnly_Word" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>XX文档系统</title>
<link rel="stylesheet" href="css/style.css"  type="text/css">
 <style>
#main{
	width:1040px;
	height:890px;
	border:#83b3d9 2px solid;
	background:#f2f7fb;	
}
#shut{
	width:45px;
	height:30px;
	float:right;
	margin-right:-1px;
}
#shut:hover{
	}
</style>
</head >
<body style="margin:0; padding:0;border:0px; overflow:hidden" >
    <script type="text/javascript">
	    function Save() {
		    document.getElementById("PageOfficeCtrl1").WebSave();
		}

	    function showRevision() {
		    document.getElementById("PageOfficeCtrl1").ShowRevisions = true;
		}

	    function hideRevision() {
		    document.getElementById("PageOfficeCtrl1").ShowRevisions = false;
	    }
    </script>
<div id="main">
<div id="content"  style="height:850px;width:1036px;overflow:hidden;">
        <%=PageOfficeCtrl1.GetHtmlCode("PageOfficeCtrl1")%>
    </div>
</div>
</body>
</html>

