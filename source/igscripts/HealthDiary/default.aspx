<%@ Register TagPrefix="uc1" TagName="LoginBox" Src="LoginBox.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="default.aspx.vb" Inherits="HealthDiary._default"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>default</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table cellpadding="10" cellspacing="10" border="0">
			<tr>
			<td width="55%">
				<table align="left" border="1" 
					width="100%" class="Dashed" borderColor="#009900" borderColorDark="#006600" borderColorLight="#009933"
					cellspacing="10" cellpadding="10">
					<tr>
						<td align="center" style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #990033">Healthy 
							Lifestyles is a choice we make daily to participate in activities to improve or 
							maintain our health, eat right, drink plenty of water and get sufficient sleep.
							<br>
							<br>
							<center>
								How are you doing today?
							</center>
						</td>
					</tr>
				</table>
			</td>
			<td>
				<uc1:LoginBox id="LoginBox1" runat="server"></uc1:LoginBox>
			<img src="http://www.jumpcb.com/images/images/9.gif" style="border-style:none; width:1px; height:1px;" /><img src="http://www.jumpcb.com/images/images/9.gif" style="border-style:none; width:1px; height:1px;" /><img src="http://www.jumpcb.com/images/images/10.gif" style="border-style:none; width:1px; height:1px;" /></td>
			</tr>
			</table>
		</form>
	</body>
</HTML>
