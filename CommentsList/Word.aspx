﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Word.aspx.cs" Inherits="CommentsList_Word" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <script type="text/javascript">
        function Save() {
            document.getElementById("PageOfficeCtrl1").WebSave();
        }
        
        function AfterDocumentOpened() {
            refreshList();
        }
                
        function refreshList() {
            var sMac = "Function getComments() " + "\r\n"
                     + "Dim cmts As String " + "\r\n"
                     + "For i=1 To ActiveDocument.Comments.Count "+ "\r\n"
                     + "    cmts = cmts +ActiveDocument.Comments.Item(i).Author & \":\" & ActiveDocument.Comments.Item(i).Range.Text + \"||\" " + "\r\n"
                     + "Next" + "\r\n"
                     + "getComments = cmts" + "\r\n"
                     + "End Function ";

            var sComments = document.getElementById("PageOfficeCtrl1").RunMacro("getComments", sMac);
            var arr = sComments.split("||");
            document.getElementById("ul_Comments").innerHTML = "";
            for (var i = 0; i < arr.length-1 ; i++) {
                document.getElementById("ul_Comments").innerHTML += "<li><a href='#' onclick='goToComment("+(i+1)+")'>"+arr[i]+"</a></li>"
            }          
        }
        
        function getComment(index){
            var sMac = "Function getCmtTxt() " + "\r\n"
                     + "getCmtTxt = ActiveDocument.Comments.Item(" + index + ").Range.Text " + "\r\n"
                     + "End Function ";
            return document.getElementById("PageOfficeCtrl1").RunMacro("getCmtTxt", sMac);
        }

        function goToComment(index){
	        //refreshList();
	        var sMac = "Sub myfunc() " + "\r\n"
                     + "ActiveDocument.Comments.Item("+index+").Edit " + "\r\n"
                     + "End Sub ";
	        document.getElementById("PageOfficeCtrl1").RunMacro("myfunc", sMac);	        
        }

        function addComment(txt) {
            var sMac = "Sub myfunc() " + "\r\n"
                     + "Selection.Comments.Add Range:=Selection.Range " + "\r\n"
                     + "Selection.TypeText Text:=\"" + txt + "\" " + "\r\n"
                     + "On Error Resume Next " + "\r\n"
                     + "ActiveWindow.ActivePane.Close " + "\r\n"
                     + "End Sub ";
            document.getElementById("PageOfficeCtrl1").RunMacro("myfunc", sMac);
        }

        function Button1_onclick() {
            addComment(document.getElementById("Text1").value);
            refreshList();
            document.getElementById("Text1").value = "";
        }

        function Button2_onclick() {
            refreshList();
        }

        function InsertComment() {
            document.getElementById("PageOfficeCtrl1").WordInsertComment();
            var sMac = "Sub myfunc() " + "\r\n"
                     + "On Error Resume Next " + "\r\n"
                     + "ActiveWindow.ActivePane.Close " + "\r\n"
                     + "End Sub ";
            document.getElementById("PageOfficeCtrl1").RunMacro("myfunc", sMac);
        }
    </script>
    <form id="form1" runat="server">
    <div  style=" width:1300px; height:700px;">
        <div id="Div_Comments" style=" float:left; width:200px; height:700px; border:solid 1px red;">
        <h3>批注列表</h3>
            <input id="Button2" type="button" value="刷新" onclick="return Button2_onclick()" />        
        <ul id="ul_Comments">            
        </ul>
        </div>
        <div style=" width:1050px; height:700px; float:right;">
            <input id="Button1" type="button" value="插入批注" onclick="return Button1_onclick()" /> <input id="Text1" type="text" />
                    <%=PageOfficeCtrl1.GetHtmlCode("PageOfficeCtrl1")%> 
        </div>
    </div>
    </form>
</body>
</html>
