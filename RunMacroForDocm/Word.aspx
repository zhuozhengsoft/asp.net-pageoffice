﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Word.aspx.cs" Inherits="RunMacroForDocm_Word" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <script type="text/javascript">
        function Button1_onclick() {
            /**
             * document.getElementById("PageOfficeCtrl1").RunMacro( MacroName, MacroScript );.
             * MacroName	字符串类型，表示宏指令名称。
             * MacroScript	字符串类型，表示要执行的宏指令代码，可选。
             */
             //运行文档中的无返回值的宏命令
            document.getElementById("PageOfficeCtrl1").RunMacro("myFunc1", "");
        }

        function Button2_onclick() {
            //运行文档中的有返回值的宏命令
            var value = document.getElementById("PageOfficeCtrl1").RunMacro("myFunc2", "");
            document.getElementById("PageOfficeCtrl1").Alert("myFunc2宏的返回值是：" + value);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="font-size: 12px; line-height: 20px; border-bottom: dotted 1px #ccc; border-top: dotted 1px #ccc;
        padding: 5px;">
        注意：<span style="background-color: Yellow;">可通过本地双击打开此docm文件，点击“视图”→“宏”→“查看宏”→“myFunc1”→编辑”，查看myFunc1和myFunc2的具体内容。
        <br/>设置步骤如下：打开一个Word文档，点击“文件”→“选项”→“信任中心”→“信任中心设置”→“宏设置”→勾选上“信任对VBA工程对象模型的访问（V）”</span>
    </div>
    <input id="Button1" type="button" value="执行无返回值宏myFunc1" onclick="return Button1_onclick()"/>
    <input id="Button2" type="button" value="执行有返回值宏myFunc2" onclick="return Button2_onclick()"/>
       <div style=" height:800px;width:auto;">
        <%=PageOfficeCtrl1.GetHtmlCode("PageOfficeCtrl1")%>
    </div>
    </form>
</body>
</html>
