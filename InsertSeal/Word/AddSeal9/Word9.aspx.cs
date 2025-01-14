﻿using System;

public partial class InsertSeal_Word_AddSeal9_Word9 : System.Web.UI.Page
{
    public PageOffice.PageOfficeCtrl PageOfficeCtrl1 = new PageOffice.PageOfficeCtrl();
    protected void Page_Load(object sender, EventArgs e)
    {
        //设置服务器页面
        PageOfficeCtrl1.ServerPage = Request.ApplicationPath + "poserver.aspx";
        //添加自定义按钮
        PageOfficeCtrl1.AddCustomToolButton("保存", "Save", 1);
        PageOfficeCtrl1.AddCustomToolButton("加盖印章", "InsertSeal()", 2);
        PageOfficeCtrl1.AddCustomToolButton("删除指定印章", "DeleteSeal()", 21);
        PageOfficeCtrl1.AddCustomToolButton("清除所有印章", "DeleteAllSeal()", 21);
        //设置保存页面
        PageOfficeCtrl1.SaveFilePage = "SaveFile.aspx";
        //打开文件
        PageOfficeCtrl1.WebOpen("word9.doc", PageOffice.OpenModeType.docAdmin, "张佚名");
    } 
}