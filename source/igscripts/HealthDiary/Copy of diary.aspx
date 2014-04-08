<%@ Register TagPrefix="igtbl" Namespace="Infragistics.WebUI.UltraWebGrid" Assembly="Infragistics.WebUI.UltraWebGrid.v3" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="diary.aspx.vb" Inherits="HealthDiary.diary"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>diary</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body XMLNS:igtbl="http://schemas.infragistics.com/ASPNET/WebControls/UltraWebGrid">
		<form id="Form1" method="post" runat="server">
			<asp:calendar id="Calendar1" runat="server"></asp:calendar><igtbl:ultrawebgrid id="ActivityLogGrid" runat="server" Width="100%" Height="200px">
				<DisplayLayout AllowDeleteDefault="Yes" ColFootersVisibleDefault="Yes" AutoGenerateColumns="False"
					AllowAddNewDefault="Yes" RowHeightDefault="20px" RowSizingDefault="Free" Version="3.00" EnableInternalRowsManagement="True"
					Name="ActivityLogGrid" CellClickActionDefault="Edit" NoDataMessage="You do not have any diary entry. To add a new entry, click above Add New link."
					AllowUpdateDefault="Yes">
					<AddNewBox Hidden="False" Prompt="">
						<Style BorderWidth="1px" BorderStyle="Solid" BackColor="LightGray">

<BorderDetails ColorTop="White" WidthLeft="1px" WidthTop="1px" ColorLeft="White">
</BorderDetails>

						</Style>
						<ButtonStyle Cursor="Hand" Font-Underline="True" Font-Bold="True" BorderStyle="None" ForeColor="HotTrack">
							<Padding Bottom="3px" Left="3px" Top="2px" Right="3px"></Padding>
						</ButtonStyle>
					</AddNewBox>
					<Pager>
						<Style BorderWidth="1px" BorderStyle="Solid" BackColor="LightGray">

<BorderDetails ColorTop="White" WidthLeft="1px" WidthTop="1px" ColorLeft="White">
</BorderDetails>

						</Style>
					</Pager>
					<HeaderStyleDefault BorderStyle="Solid" BackColor="LightGray">
						<BorderDetails ColorTop="White" WidthLeft="1px" WidthTop="1px" ColorLeft="White"></BorderDetails>
					</HeaderStyleDefault>
					<FrameStyle Width="100%" BorderWidth="1px" Font-Size="8pt" Font-Names="Verdana" BorderStyle="Solid"
						Height="200px"></FrameStyle>
					<FooterStyleDefault BorderWidth="1px" BorderStyle="Solid" BackColor="LightGray">
						<BorderDetails ColorTop="White" WidthLeft="1px" WidthTop="1px" ColorLeft="White"></BorderDetails>
					</FooterStyleDefault>
					<EditCellStyleDefault BorderWidth="0px" BorderStyle="None"></EditCellStyleDefault>
					<RowStyleDefault BorderWidth="1px" BorderColor="Gray" BorderStyle="Solid">
						<Padding Left="3px"></Padding>
						<BorderDetails WidthLeft="0px" WidthTop="0px"></BorderDetails>
					</RowStyleDefault>
				</DisplayLayout>
				<Bands>
					<igtbl:UltraGridBand AddButtonCaption="Add a new diary entry" AllowUpdate="Yes" AllowAdd="Yes" AllowDelete="Yes">
						<Columns>
							<igtbl:UltraGridColumn HeaderText="Activity" Key="" Width="40%" Type="DropDownList" BaseColumnName="PhysicalActivityID">
								<ValueList DataMember="PhysicalActivity" DisplayMember="DisplayName" ValueMember="ID"></ValueList>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn HeaderText="Time Spent (Minutes)" Key="" Width="20%" Format="#########" BaseColumnName="Minutes"
								FooterTotal="Sum" FooterText="Total:">
								<FooterStyle BorderStyle="Solid" ForeColor="InfoText" BackColor="Info"></FooterStyle>
								<Validators>
									<igtbl:ValidatorItem Value="RangeValidator1"></igtbl:ValidatorItem>
								</Validators>
							</igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn HeaderText="Notes" Key="" Width="35%" BaseColumnName="Notes" CellMultiline="Yes"></igtbl:UltraGridColumn>
							<igtbl:UltraGridColumn HeaderText="Del" Key="" Type="Button" BaseColumnName="">
								<CellButtonStyle Width="15px" Cursor="Hand" BorderStyle="None" HorizontalAlign="Center" BackgroundImage="delete_icon.gif"></CellButtonStyle>
								<CellStyle Width="10%"></CellStyle>
								<HeaderStyle Width="10%" HorizontalAlign="Center"></HeaderStyle>
							</igtbl:UltraGridColumn>
						</Columns>
					</igtbl:UltraGridBand>
				</Bands>
			</igtbl:ultrawebgrid>
			<asp:RangeValidator id="RangeValidator1" runat="server" ErrorMessage="Value must be a number" Type="Integer"
				MinimumValue="0" MaximumValue="600" ControlToValidate="ActivityLogGrid" BackColor="#FFFFC0" BorderStyle="Solid"
				BorderWidth="1px" Font-Names="Verdana" Font-Size="X-Small"></asp:RangeValidator>
			<asp:Button id="SaveChangesButton" runat="server" Text="Save Changes"></asp:Button></form>
	</body>
</HTML>
