﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Word9.aspx.cs" Inherits="InsertSeal_Word_AddSeal9_Word9" %>

<!DOCTYPE html>
<html>
	<head>
		<title>9.删除印章</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

	</head>
	<body>
		<br />
			<script type="text/javascript">
			    function Save() {
			        document.getElementById("PageOfficeCtrl1").WebSave();
			    }

			    var strSealName = "公司公章";//指定印章名称
			    function InsertSeal() {
			        try {
			            //第一个参数，必填项，标识印章名称（当存在重名的印章时，默认选取第一个印章），且该印章签章人的签章类型方式必须为用户名+密码；第二个参数，可选项，标识是否保护文档，为null时保护文档，为空字符串时不保护文档；第三个参数，可选项，标识盖章指定位置名称，须为英文或数字，不区分大小写
			            document.getElementById("PageOfficeCtrl1").ZoomSeal.AddSealByName(strSealName, null);
			        } catch (e) { }
			    }

			    function DeleteSeal() {
			        var iCount = document.getElementById("PageOfficeCtrl1").ZoomSeal.Count;//获取加盖的印章数量
			        var strTempSealName = "";
			        if (iCount > 0) {
			            for (var i = 0; i < iCount; i++) {
			                strTempSealName = document.getElementById("PageOfficeCtrl1").ZoomSeal.Item(i).SealName;//获取加盖的印章名称
			                if (strTempSealName == strSealName) {
			                    document.getElementById("PageOfficeCtrl1").ZoomSeal.Item(i).DeleteSeal();//删除印章
			                    alert("成功删除了“" + strSealName + "”");
			                    break;
			                }
			            }
			        } else {
			            alert("请先在文档中加盖印章后，再执行当前操作。");
			        }
			    }

			    function DeleteAllSeal() {
			        var iCount = document.getElementById("PageOfficeCtrl1").ZoomSeal.Count;//获取加盖的印章数量
			        if (iCount > 0) {
			            for (var i = iCount - 1; i >= 0; i--) {
			                strTempSealName = document.getElementById("PageOfficeCtrl1").ZoomSeal.Item(i).SealName;//获取加盖的印章名称
			                document.getElementById("PageOfficeCtrl1").ZoomSeal.Item(i).DeleteSeal();//删除印章
			            }
			        } else {
			            alert("请先在文档中加盖印章后，再执行当前操作。");
			        }
			    }

			    function ChangePsw() {
			        document.getElementById("PageOfficeCtrl1").ZoomSeal.ShowSettingsBox();
			    }
			</script>
	 <form id="form1" runat="server">
       <div style="width:auto; height: 700px;" >
         <%=PageOfficeCtrl1.GetHtmlCode("PageOfficeCtrl1")%>
       </div>
    </form>
	</body>

</html>
