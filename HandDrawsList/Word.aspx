﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Word.aspx.cs" Inherits="HandDrawsList_Word" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
<body>
    <script type="text/javascript">
        function Save() {
            document.getElementById("PageOfficeCtrl1").WebSave();
        }

        function StartHandDraw() {
            document.getElementById("PageOfficeCtrl1").HandDraw.Start();
        }

        //设置线宽
        function SetPenWidth() {
            document.getElementById("PageOfficeCtrl1").HandDraw.SetPenWidth(5);
        }

        //设置颜色
        function SetPenColor() {

            document.getElementById("PageOfficeCtrl1").HandDraw.SetPenColor(5292104);
        }

        //设置笔型
        function SetPenType() {

            document.getElementById("PageOfficeCtrl1").HandDraw.SetPenType(1);
        }

        //设置缩放
        function SetPenZoom() {

            document.getElementById("PageOfficeCtrl1").HandDraw.SetPenZoom(50);
        }

        //撤销最近一次手写
        function UndoHandDraw() {

            document.getElementById("PageOfficeCtrl1").HandDraw.Undo();
        }

        //退出手写
        function ExitHandDraw() {

            document.getElementById("PageOfficeCtrl1").HandDraw.Exit();
        }

        function AfterDocumentOpened() {
            refreshList();
        }

        function refreshList() {
            document.getElementById("PageOfficeCtrl1").HandDraw.Refresh();
            var i;
            document.getElementById("ul_Comments").innerHTML = "";
            if (document.getElementById("PageOfficeCtrl1").HandDraw.Count != 0) {
                for (i = 0; i < document.getElementById("PageOfficeCtrl1").HandDraw.Count; i++) {
                    handDraw = document.getElementById("PageOfficeCtrl1").HandDraw.Item(i);
                    var str = "";
                    str = str + "第" + handDraw.PageNumber + "页" + ", " + handDraw.UserName + " , " + handDraw.DateTime;
                    document.getElementById("ul_Comments").innerHTML += "<li><a href='#' onclick='goToHandDraw(" + i + ")'>" + str + "</a></li>";
                   }

             } else {
                document.getElementById("PageOfficeCtrl1").Alert("当前文档没有手写批注!");
             }
        }

        //定位到当前手写批注
        function goToHandDraw(index) {
            document.getElementById("PageOfficeCtrl1").HandDraw.Item(index).Locate();

        }

        function refresh_click() {
            //刷新手写批注集合
            refreshList();
        }
    </script>
    <form id="form1" runat="server">
    <div  style=" width:1380px; height:700px;">
        <div id="Div_Comments" style=" float:left; width:300px; height:700px; border:solid 1px red;">
        <h3>手写批注列表</h3>
        <input type="button" name="refresh" value="刷新"onclick="return refresh_click()"/>
        <ul id="ul_Comments">
        </ul>
        </div>
        <div style=" width:1000px; height:700px; float:right;">
             <%=PageOfficeCtrl1.GetHtmlCode("PageOfficeCtrl1")%>
        </div>
    </div>
    </form>
</body>
</html>


