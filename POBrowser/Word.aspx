﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Word.aspx.cs" Inherits="POBrowser_Word" %>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title> 选项卡</title>
    <style type="text/css">
     /* CSS样式制作 */  
     *{padding:0px; margin:0px;}
      a{ text-decoration:none; color:black;}
      a:hover{text-decoration:none; color:#336699;}
       #tab{width:auto; padding:5px;height:150px;margin:20px;}
       #tab ul{list-style:none; height:30px;line-height:30px; border-bottom:2px #C88 solid;}
       #tab ul li{background:#FFF;cursor:pointer;float:left;list-style:none ;line-height:29px;padding:0px 10px; margin:0px 3px; border:1px solid #BBB; border-bottom:2px solid #C88;}
       #tab ul li.on{border-top:2px solid Saddlebrown; border-bottom:2px solid #FFF;}
       #tab div{height:700px;width:auto; line-height:24px;border-top:none;  padding:1px; border:1px solid #336699;padding:10px;}
       .hide{display:none;}
       .show{ display:block;}
       .page{}
    </style>
	<script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript">
        // JS实现选项卡切换
        window.onload = function() {
            var myTab = document.getElementById("tab");    //整个div
            var myUl = myTab.getElementsByTagName("ul")[0]; //一个节点
            var myLi = myUl.getElementsByTagName("li");    //数组
            var myDiv = $(".page"); //myTab.getElementsByTagName("div"); //数组

            for (var i = 0; i < myLi.length; i++) {
                myLi[i].index = i;
                myLi[i].onclick = function() {
                    for (var j = 0; j < myLi.length; j++) {
                        myLi[j].className = "off";
                        myDiv[j].className = "hide";
                    }
                    this.className = "on";
                    myDiv[this.index].className = "show";
                }
            }
        }
    </script>
</head>
<body>

       <script type="text/javascript">
           function Save() {
               document.getElementById("PageOfficeCtrl1").WebSave();
           }
           function PrintSet() {
               document.getElementById("PageOfficeCtrl1").ShowDialog(5);
           }
           function PrintFile() {
               document.getElementById("PageOfficeCtrl1").ShowDialog(4);
           }
           function Close() {
               window.external.close();
           }
           function IsFullScreen() {
               document.getElementById("PageOfficeCtrl1").FullScreen = !document.getElementById("PageOfficeCtrl1").FullScreen;
           }
           //文档关闭前先提示用户是否保存
           function BeforeBrowserClosed() {
               if (document.getElementById("PageOfficeCtrl1").IsDirty) {
                   if (confirm("提示：文档已被修改，是否继续关闭放弃保存 ？")) {
                       return true;
                   } else {
                       return false;
                   }
               }
           }
	</script>	
	<div style=" text-align:center; margin:10px; background-color:#D19275; color:White; padding:8px;"><h1>某某Web办公系统</h1></div>
    <!-- HTML页面布局 -->
    <div id = "tab">
        <ul>
        <li class="on">Word文件</li>
        <li class="off">文档属性</li>
        <li class="off">XX选项卡</li>
        </ul>
    <div id="firstPage" class="page show">
        <%=PageOfficeCtrl1.GetHtmlCode("PageOfficeCtrl1")%>
    </div>
    <div id="secondPage" class="page hide" style="  ">
      <p style=" line-height:40px;">
        文件格式：word<br />
        作者：张三<br />
        XXXX：-----<br />
        XXXX：---<br />
        XXXX：------------------<br />
        XXXX：xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 
        xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
      </p> 
    </div>
    <div id="AAPage" class = "page hide">
        XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    </div>
</div>
</body>
</html>
