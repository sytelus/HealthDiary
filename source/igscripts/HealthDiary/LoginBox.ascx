<%@ Control Language="vb" AutoEventWireup="false" Codebehind="LoginBox.ascx.vb" Inherits="HealthDiary.LoginBox" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table class="Dashed" borderColor="#009900" borderColorDark="#006600" borderColorLight="#009933" cellSpacing="0" cellPadding="10" align="center" border="1">
	<tr>
		<td><asp:panel id="NoLoginPanel" runat="server">
				<asp:Label id="LoginErrorLabel" runat="server" Visible="False" ForeColor="Red" Font-Bold="True"
					Font-Size="Smaller" Width="214px">Email or password you typed is incorrect.  Please try again. <BR><BR></asp:Label>
					<TABLE class="Dashed" id="Table1" borderColor="#009900" cellSpacing="0" borderColorDark="#006600"
					cellSpacing="0" cellPadding="10"  align="center" borderColorLight="#009933" border="1">
					<TR>
						<TD>
							<asp:Label id="Label1" runat="server">Email:</asp:Label></TD>
						<TD>
							<asp:TextBox id="UserNameTextBox" runat="server"></asp:TextBox></TD>
					</TR>
					<TR>
						<TD>
							<asp:Label id="Label2" runat="server">Password:</asp:Label></TD>
						<TD>
							<asp:TextBox id="PasswordTextBox" runat="server"></asp:TextBox></TD>
					</TR>
					<TR>
						<TD></TD>
						<TD><BR>
							<asp:Button id="Button1" runat="server" Text="Login" BorderStyle="Solid" BorderColor="#009900"
								BackColor="#AAFF88"></asp:Button></TD>
					</TR>
				</TABLE>
			</asp:panel><asp:panel id="LoggedOnPanel" runat="server" Visible="False">
				<P>You are currently logged on as
					<asp:Label id="LogOnNameLabel" runat="server">Label</asp:Label></P>
				<P>
					<asp:LinkButton id="SignOutLinkButton" runat="server">Sign out and login as a different user</asp:LinkButton></P>
			</asp:panel></td>
	</tr>
	<tr>
		<td align="right"><asp:hyperlink id="HyperLink1" runat="server" NavigateUrl="register.aspx">Create Your Free Account</asp:hyperlink></td>
	</tr>
</table>
