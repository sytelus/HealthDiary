<%@ Page Language="vb" AutoEventWireup="false" Codebehind="register.aspx.vb" Inherits="HealthDiary.register"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>register</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<asp:panel id="NoLoginPanel" runat="server">
				<TABLE class="Dashed" id="Table1" borderColor="#009900" cellSpacing="0" borderColorDark="#006600"
					cellSpacing="0" cellPadding="10"  align="center" borderColorLight="#009933" border="1">
					<TR>
						<TD>Full Name:</TD>
						<TD>
							<asp:TextBox id="FullNameTextBox" runat="server" Width="156"></asp:TextBox>
							<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="Full name is required"
								ControlToValidate="FullNameTextBox"></asp:RequiredFieldValidator></TD>
					</TR>
					<TR>
						<TD>
							<asp:Label id="Label1" runat="server">Email:</asp:Label></TD>
						<TD>
							<asp:TextBox id="UserNameTextBox" runat="server" Width="156"></asp:TextBox>
							<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ErrorMessage="Email is required" ControlToValidate="UserNameTextBox"></asp:RequiredFieldValidator></TD>
					</TR>
					<TR>
						<TD>
							<asp:Label id="Label2" runat="server">Password:</asp:Label></TD>
						<TD>
							<asp:TextBox id="PasswordTextBox" runat="server" Width="156px" TextMode="Password"></asp:TextBox>
							<asp:CompareValidator id="CompareValidator1" runat="server" ErrorMessage="Password doesn't match" ControlToValidate="PasswordTextBox"
								ControlToCompare="RetypePasswordTextBox"></asp:CompareValidator></TD>
					</TR>
					<TR>
						<TD>Retype Password:</TD>
						<TD>
							<asp:TextBox id="RetypePasswordTextBox" runat="server" Width="157" TextMode="Password"></asp:TextBox></TD>
					</TR>
					<TR>
						<TD>&nbsp;</TD>
						<TD><BR>
							<asp:Button id="CreateAccountButton" runat="server" Width="157px" Text="Create My Account"></asp:Button></TD>
					</TR>
				</TABLE>
			</asp:panel>&nbsp;
		</form>
	</body>
</HTML>
