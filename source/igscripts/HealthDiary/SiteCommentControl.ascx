<%@ Control Language="vb" AutoEventWireup="false" Codebehind="SiteCommentControl.ascx.vb" Inherits="ShitalShah.SiteCommentControl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<asp:panel id="formInputPanel" Height="265px" runat="server">
	<asp:Label id="Label1" runat="server">I'll be glad to hear from you (comments, rants, blahs, surprises, screams for help... whatever). </asp:Label>
	<BR>
	<asp:TextBox id="txtComment" runat="server" Height="158px" Width="495px" ForeColor="Blue" BackColor="#FFFFC0"
		Rows="6" TextMode="MultiLine"></asp:TextBox>
	<BR>
	<asp:Label id="Label2" runat="server">Your name:</asp:Label>
	<asp:TextBox id="txtEmail" runat="server" Width="352px"></asp:TextBox>
	<BR>
	<asp:Label id="Label3" runat="server">Your email (if you want reply):</asp:Label>
	<asp:TextBox id="txtName" runat="server" Width="357px"></asp:TextBox>
	<BR>
	<asp:Button id="btnSend" runat="server" Width="492px" ForeColor="#00C000" BackColor="#FFFFC0"
		Text="Click Here To Send!" Font-Bold="True" Font-Italic="True" BorderColor="#FFFFC0" BorderStyle="Outset"></asp:Button>
	<P></P>
</asp:panel>
<asp:Panel id="formSubmitPanel" Height="107px" runat="server" Visible="False">Thanlks for sending us comment! We'll attempt our best to 
respond to it - whether in good or bad way. If you don't hear from us, keep 
pinching.</asp:Panel>
