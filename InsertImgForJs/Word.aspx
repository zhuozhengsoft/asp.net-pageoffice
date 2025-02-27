﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Word.aspx.cs" Inherits="InsertImgForJs_Word" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>JS给文件插入图片</title>
    <script type="text/javascript">
    function AfterDocumentOpened(){
            /**  
              *document.getElementById("PageOfficeCtrl1").InsertWebImage( ImageURL, Transparent, Position );
              *ImageURL  字符串类型，图片的路径。 
              *Transparent  布尔类型，可选参数，图片是否透明。默认值：FALSE，图片不透明；TRUE表示图片透明。注意：透明色为白色。
              *Position  整数类型，可选参数，浮于文字上方还是下方。默认值：4，图片浮于文字上方。 5，表示图片衬于文字下方。
              */
            //该方法默认插入图片到当前光标处，如果想插入到文档指定位置，可以在文档中插入一个书签来设置位置，然后先定位光标到书签处再插入图片
            locateBookMark();
            document.getElementById("PageOfficeCtrl1").InsertWebImage("doc/logo.jpg", false, 4);
        }

        //定位书签到光标处
        function locateBookMark() {
            //获取书签名称
            var bkName = "PO_logo";
            //将光标定位到书签所在的位置
            var mac = "Function myfunc()" + " \r\n"
                    + "  ActiveDocument.Bookmarks(\"" + bkName + "\").Select " + " \r\n"
                    + "End Function " + " \r\n";
            document.getElementById("PageOfficeCtrl1").RunMacro("myfunc", mac);
        }     
    </script>  
</head>
<body>
   <form id="form1" runat="server">
    <div style=" width:auto; height:700px;">
         <%=PageOfficeCtrl1.GetHtmlCode("PageOfficeCtrl1")%>
    </div>
    </form>
</body>
</html>

