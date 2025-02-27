﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="InsertSeal_Word_BatchAddSeal_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>批量盖章</title>
		<script type="text/javascript">
			checkit = true;

			function selectall() {
				if(checkit) {
					var obj = document.all.check;
					for(var i = 0; i < obj.length; i++) {
						obj[i].checked = true;
						checkit = false;
					}
				} else {
					var obj = document.all.check;
					for(var i = 0; i < obj.length; i++) {
						obj[i].checked = false;
						checkit = true;
					}

				}

			}

			var count = 0;
			var filesCount = 0;
			var strLength = 0;
			var str = new Array();

			function addSeals() {
				showProgress();
				
				var ids = "";
				//循环获取选中checkbox的值
				var check = document.getElementsByName("check");
				for(var i = 0; i < check.length; i++) {
					if(check[i].checked) {
						ids += check[i].value + ",";
						filesCount++;
					}
				}

				if(ids == "" || ids == null || ids == "on,") {
					alert("请至少选择一个要盖章的文档！");
					return;

				}
				//去掉最后一个逗号
				ids = ids.substring(0, ids.length - 1);
				var i = ids.indexOf("on");
				if(i == 0 || i > 0) {
					//判读是否包含"on"，如果包含，则去掉
					ids = ids.replace("on,", "");
				}
				str = ids.split(",");
				if(count > 0) {
					alert("请刷新当前页面重新选择要盖章的文档!");
					return;
				}
			    //显示进度条
				document.getElementById("ProgressBarSide").style.visibility = "visible";
				document.getElementById("ProgressBar").style.width = "1%";
				document.getElementById("div_Progress").innerHTML = "正在加盖印章：共计 " + filesCount + "份文档.<br />";
			    //第一次自刷新
				document.getElementById("iframe1").src = "AddSeal.aspx?id=" + str[count];
				strLength = str.length;
			}

		    //isAddSealSuc 标识印章加盖是否成功
			function convert(isAddSealSuc) {
			    if (isAddSealSuc) {
			        count = count + 1;
			        document.getElementById("div_Progress").innerHTML += "第 " + count + "份加盖成功.<br />";
			        if (count < strLength) {
			            document.getElementById("iframe1").src = "AddSeal.aspx?id=" + str[count];

			            //设置进度条
			            var strResult = Math.round(count / strLength * 10000) / 100 + "%";
			            document.getElementById("ProgressBar").style.width = strResult;

			        } else {
			            //设置进度条						
			            document.getElementById("ProgressBar").style.width = "100%";

			            document.getElementById("div_Progress").innerHTML += "批量盖章完成！";
			            document.getElementById("aDiv").style.display = "";

			            //隐藏进度条div
			            document.getElementById("ProgressBarSide").style.visibility = "hidden";
			            //重置进度条
			            document.getElementById("ProgressBar").style.width = "0%";
			        }

			    } else {
			        count = count + 1;
			        document.getElementById("div_Progress").innerHTML += "第 " + count + "份加盖失败！代码无法继续执行<br />";
			        document.getElementById("aDiv").style.display = "";

			        //隐藏进度条div
			        document.getElementById("ProgressBarSide").style.visibility = "hidden";
			        //重置进度条
			        document.getElementById("ProgressBar").style.width = "0%";
			        return false;
			    }
			}

			function showProgress() {

			    document.getElementById("div_Progress").style.display = "";
			}
		</script>
	</head>
	<body>
		<div style="margin: 100px" align="center">
			<form id="form1" method="post">
				<table id="table1" style="border-spacing: 20px; border: 1px; background-color: darkgray; width: 600px;" cellpadding="3" cellspacing="1">
					<h2>
						文件列表
					</h2>
					<tr>
						<td>
							<input type="checkbox" onclick="selectall()" />
						</td>
						<td>
							序号
						</td>
						<td>
							文件名
						</td>
						<td>
							编辑
						</td>
					</tr>
					<tr>
						<td>
							<input name="check" type="checkbox" value="1" />
						</td>
						<td>
							01
						</td>
						<td>
							test1.doc
						</td>
						<td>
							<a href="Edit.aspx?id=1">编辑</a>
						</td>
					</tr>
					<tr>
						<td>
							<input name="check" type="checkbox" value="2" />
						</td>
						<td>
							02
						</td>
						<td>
							test2.doc
						</td>
						<td>
							<a href="Edit.aspx?id=2">编辑</a>
						</td>
					</tr>
					<tr>
						<td>
							<input name="check" type="checkbox" value="3" />
						</td>
						<td>
							03
						</td>
						<td>
							test3.doc
						</td>
						<td>
							<a href="Edit.aspx?id=3">编辑</a>
						</td>
					</tr>
					<tr>
						<td>
							<input name="check" type="checkbox" value="4" />
						</td>
						<td>
							04
						</td>
						<td>
							test4.doc
						</td>
						<td>
							<a href="Edit.aspx?id=4">编辑</a>
						</td>
					</tr>
				</table>
				
				<br>
				<input type="button" value="批量盖章" onclick="addSeals()" /><br>
                <br>
				<div id="ProgressBarSide" style="color: Silver; width: 200px; visibility: hidden;  margin-top: 10px; text-align: left;">
					<span style="color: gray; font-size: 12px; text-align: center;">正在盖章请稍后...</span><br />
					<div class="container" style="width:200px;  border:1px solid #6C9C2C;  height:16px;">
						<div id="ProgressBar" style="background-color: Green; height: 16px; width: 0%; border-width: 1px;
							border-style: Solid; ">
						</div>
					</div>
				</div>
				<div id="div_Progress" style="display:none;text-align: left;"></div><br>

				<div id="aDiv" style="display: none; color: Red; font-size: 15px; text-align: left;">
					<span>批量盖章完成，可在下面的地址中查看文件，具体的地址为:<%=url%></span>
				</div>
			</form>
		</div>
		<div style="width: 1px; height: 1px; overflow: hidden;">
			<iframe id="iframe1" name="iframe1" src=""></iframe>
		</div>
	</body>
</html>
