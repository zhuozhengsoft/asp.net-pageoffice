﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Excel.aspx.cs" Inherits="JsOpXlsCellText_Excel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>js获取和设置Excel文件中单元格的值</title>
</head>
<body>
    <script type="text/javascript">
        function setCellValue(sheet, cell, value) {
            var sMac = "function myfunc()" + "\r\n"
                        + "Application.Sheets(\"" + sheet + "\").Range(\"" + cell + "\").Value = \"" + value + "\" \r\n"
                        + "End function";
            return document.getElementById("PageOfficeCtrl1").RunMacro("myfunc", sMac);
        }

        function getCellValue(sheet, cell) {
            var sMac = "function myfunc()" + "\r\n"
                        + "myfunc = Application.Sheets(\"" + sheet + "\").Range(\"" + cell + "\").Text \r\n"
                        + "End function";
            return document.getElementById("PageOfficeCtrl1").RunMacro("myfunc", sMac);
        }

        function Button1_onclick() {
            document.getElementById("PageOfficeCtrl1").Alert(getCellValue("Sheet1", "B4"));
        }

        function Button2_onclick() {
            setCellValue("Sheet1", "C4", "100");
        }
    </script>
    <div style="font-size:12px; line-height:20px; border-bottom:dotted 1px #ccc;border-top:dotted 1px #ccc; padding:5px;">
     <span style="color:red;">操作说明：</span>请点击按钮。
        <input id="Button1" type="button" value="获取Sheet1中B4单元格的值" onclick="return Button1_onclick()" />
        <input id="Button2" type="button" value="设置Sheet1中C4单元格的值为：100" onclick="return Button2_onclick()" />
     <br />
    关键代码：点右键，选择“查看源文件”，看js函数<span style="background-color:Yellow;">getCellValue(sheet, cell)&nbsp;&nbsp; setCellValue(sheet, cell, value)</span></div><br />
    
    <form id="form1" runat="server">
    <div style=" width:auto; height:700px;">
        <%=PageOfficeCtrl1.GetHtmlCode("PageOfficeCtrl1")%>
    </div>
    </form>
</body>
</html>
