<%@ Control Language="vb" AutoEventWireup="false" Codebehind="LoginBox.ascx.vb" Inherits="HealthDiary.LoginBox" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table cellSpacing="0" cellPadding="10" align="center" class="FlatContainer">
	<tr>
		<td><asp:panel id="NoLoginPanel" runat="server">
				<asp:Label id="LoginErrorLabel" runat="server" Visible="False" ForeColor="Red" Font-Bold="True"
					Font-Size="Smaller" Width="214px">Email or password you typed is incorrect.  Please try again. </asp:Label>
				<BR>
				<asp:HyperLink id="HyperLink1" runat="server" NavigateUrl="register.aspx">Create Your Free Account</asp:HyperLink>
				<HR class="FlatDashedLine">
				<BR>
				<STRONG>Please sign in</STRONG>
				<BR>
				<TABLE cellSpacing="8" cellPadding="0" align="center">
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
							<asp:TextBox id="PasswordTextBox" runat="server" CssClass="FlatTextBox" TextMode="Password"></asp:TextBox></TD>
					</TR>
					<TR>
						<TD colSpan="2">
							<HR class="FlatLine">
							<asp:Button id="Button1" runat="server" CssClass="FlatButton" Text="Login"></asp:Button></TD>
					</TR>
				</TABLE>
			</asp:panel><asp:panel id="LoggedOnPanel" runat="server" Visible="False">
				<P>You are currently logged on as
					<asp:Label id="LogOnNameLabel" runat="server">Label</asp:Label></P>
				<P>
					<asp:LinkButton id="SignOutLinkButton" runat="server">Sign out and login as a different user</asp:LinkButton></P>
			</asp:panel></td>
	</tr>
</table>
