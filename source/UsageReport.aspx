<%@ Page Language="vb" AutoEventWireup="false" Codebehind="UsageReport.aspx.vb" Inherits="HealthDiary.UsageReport"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>UsageReport</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<asp:Label id="Label1" runat="server" Font-Bold="True">Total Numbers of Users:   </asp:Label>
			<asp:Label id="UserCountLabel" runat="server">Label</asp:Label>
			<HR width="100%" SIZE="1">
			<asp:DataGrid id="UserAccountDataGrid" runat="server" Caption="<b>User Accounts Information</b><br><br>"
				CaptionAlign="Left" Width="95%">
				<HeaderStyle Font-Bold="True" CssClass="TableHeading" BackColor="#AAFF88"></HeaderStyle>
			</asp:DataGrid>
		</form>
	</body>
</HTML>
