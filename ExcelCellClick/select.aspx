﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Select.aspx.cs" Inherits="select" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body style="margin:0; padding:0;border-style:none; font-size:12px;overflow:hidden">
    <script language="javascript" type="text/javascript">
        function CheckValue(theForm) {
            window.external.DialogResult = theForm.WordList.value; //设置ShowHtmlModalDialog的返回值
            window.opener = null; 
            window.open('', '_self');
            window.close();
            return;
        }
	</script>
    <form id="form1" runat="server">
    <div  style=" margin:0; padding:0; height:25px; background-color:lightGreen; line-height:25px; border: solid 1px blue; text-align:right; padding:0 10px;">
        <a href="#" onclick="window.opener=null;window.open('','_self');window.close();" style=" font-size:18px; text-decoration:none;">×</a>
    </div>
    <div  id="rect1" style=" margin:0; padding:0; height:200px; border: solid 1px blue;">
        <br />
        可以自己定义这个页面的样子，比如像弹出的div一样。
        <br /><br />
        <select name="WordList" style='width:240 px;'>
            <option value='行政部'>行政部</option>
            <option value='财务部'>财务部</option>
            <option value='市场一部'>市场一部</option>
            <option value='市场二部'>市场二部</option>
            <option value='市场三部'>市场三部</option>
            <option value='市场四部'>市场四部</option>
        </select>
        <button type="button" onclick="CheckValue(form1);">确定</button>
        <button type="button" onclick="window.opener=null;window.open('','_self');window.close();">取消</button>
    </div>
    </form>
    <script language="javascript" type="text/javascript">
        document.getElementById("rect1").style.height = document.body.clientHeight - 30;
	</script>
</body>
</html>
