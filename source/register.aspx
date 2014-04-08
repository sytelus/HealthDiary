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
				<asp:Label id="RegisterErrorLabel" runat="server" ForeColor="Red" Visible="False">Someone else has already created account for this email address. </asp:Label>
				<TABLE class="FlatContainer" cellSpacing="0" cellPadding="10" align="center">
					<TR>
						<TD>Full Name:</TD>
						<TD>
							<asp:TextBox id="FullNameTextBox" runat="server" CssClass="FlatTextBox"></asp:TextBox></TD>
					</TR>
					<TR>
						<TD>
							<asp:Label id="Label1" runat="server">Email:</asp:Label></TD>
						<TD>
							<asp:TextBox id="UserNameTextBox" runat="server" CssClass="FlatTextBox"></asp:TextBox></TD>
					</TR>
					<TR>
						<TD>
							<asp:Label id="Label2" runat="server">Password:</asp:Label></TD>
						<TD>
							<asp:TextBox id="PasswordTextBox" runat="server" TextMode="Password" CssClass="FlatTextBox"></asp:TextBox></TD>
					</TR>
					<TR>
						<TD>Retype Password:</TD>
						<TD>
							<asp:TextBox id="RetypePasswordTextBox" runat="server" TextMode="Password" CssClass="FlatTextBox"></asp:TextBox></TD>
					</TR>
					<TR>
						<TD align="right" colSpan="2">
							<HR class="FlatLine">
							<asp:CompareValidator id="CompareValidator1" runat="server" ControlToValidate="PasswordTextBox" ErrorMessage="Password doesn't match"
								ControlToCompare="RetypePasswordTextBox"></asp:CompareValidator>
							<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ControlToValidate="UserNameTextBox"
								ErrorMessage="Email is required"></asp:RequiredFieldValidator>
							<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ControlToValidate="FullNameTextBox"
								ErrorMessage="Full name is required"></asp:RequiredFieldValidator>
							<asp:Button id="CreateAccountButton" runat="server" Text="Create My Account" CssClass="FlatButton"></asp:Button></TD>
					</TR>
				</TABLE>
				<br><br><br><br>
				<font style="FONT-SIZE: xx-small">
				<strong>Privacy Policy:</strong> All your personal information entered through this website will always remain confidential. We respect your privacy. Any data provided through this website will not be sold, leased, shared with anyone outside of Healthy Futures.
				</font>
			</asp:panel>&nbsp;
		</form>
	</body>
</HTML>
