﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="DefinedNameTable_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head> 
    <title>自定义Excel模板</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head> 
  <body style="text-align:center;">
  	<div style="text-align:left;margin-top:30px;">
  	    <span>1、演示给Excel模板中定义了名称的一块区域赋值，保存时可获取此区域内各单元格的数据：</span><br/><br/>
    	<a href="ExcelFill.aspx">openTableByDefinedName方法的简单使用</a>
  	</div>
    <div style="text-align:left; margin-top:30px;">
    	<span>2、演示如何在不修改代码的情况下，填充数据到用户自定义的两个不同的Excel模板，显示出不同的效果：</span><br/><br/>
    	<a href="ExcelFill2.aspx?temp=temp1.xls">自定义Excel模板一显示效果</a><br/><br/>
    	<a href="ExcelFill2.aspx?temp=temp2.xls">自定义Excel模板二显示效果</a>
    </div>
    <div style="text-align:left; margin-top:30px;">
    	<span>3、演示openTable与openTableByDefinedName方法填充数据到相同Excel模板，在动态填充的数据按实际数据行数自动扩展的情况下，生成的文件显示出不同的效果：</span><br/><br/>
    	<a href="ExcelFill6.aspx">打开模板（test4.xls）</a><br/><br/>
    	<a href="ExcelFill4.aspx">用openTable填充数据到模板（test4.xls）后的效果——出现表格重叠的问题</a><br/><br/>
    	<a href="ExcelFill5.aspx">用openTableByDefinedName填充数据到模板（test4.xls）后的效果——表格互不影响</a>
    </div>
  </body>
</html>


