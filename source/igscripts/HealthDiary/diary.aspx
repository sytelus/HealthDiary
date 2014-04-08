<%@ Register TagPrefix="igcmbo" Namespace="Infragistics.WebUI.WebCombo" Assembly="Infragistics.WebUI.WebCombo.v3" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="diary.aspx.vb" Inherits="HealthDiary.diary"%>
<%@ Register TagPrefix="igsch" Namespace="Infragistics.WebUI.WebSchedule" Assembly="Infragistics.WebUI.WebDateChooser.v1.1" %>
<%@ Register TagPrefix="igtbl" Namespace="Infragistics.WebUI.UltraWebGrid" Assembly="Infragistics.WebUI.UltraWebGrid.v3" %>
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
			<igcmbo:WebCombo id="WebCombo1" runat="server" Width="200px" BackColor="White" BorderStyle="Solid"
				BorderWidth="1px" ForeColor="Black" BorderColor="LightGray" Height="22px" Version="2.00" SelBackColor="DarkBlue"
				SelectedIndex="-1" SelForeColor="White" Visible="False">
				<DropDownLayout DropdownWidth="325px" BorderCollapse="Separate" RowHeightDefault="20px" HeaderClickAction="Select"
					DropdownHeight="130px" TableLayout="Fixed">
					<RowStyle BorderWidth="1px" BorderColor="Gray" BorderStyle="Solid" BackColor="White">
						<BorderDetails WidthLeft="0px" WidthTop="0px"></BorderDetails>
					</RowStyle>
					<SelectedRowStyle ForeColor="White" BackColor="DarkBlue"></SelectedRowStyle>
					<HeaderStyle BorderStyle="Solid" BackColor="LightGray">
						<BorderDetails ColorTop="White" WidthLeft="1px" WidthTop="1px" ColorLeft="White"></BorderDetails>
					</HeaderStyle>
					<FrameStyle Width="100%" Cursor="Default" BorderWidth="2px" Font-Size="10pt" Font-Names="Verdana"
						BorderStyle="Ridge" BackColor="Silver" Height="100%"></FrameStyle>
				</DropDownLayout>
				<ExpandEffects ShadowColor="LightGray"></ExpandEffects>
			</igcmbo:WebCombo>
			<TABLE class="Dashed" id="Table1" borderColor="#009900" cellSpacing="0" borderColorDark="#006600"
				cellPadding="10" align="center" borderColorLight="#009933" border="1">
				<tr>
					<td>
						<igsch:webcalendar id="DiaryCalendar" runat="server" ImageDirectory="igscripts/webschedule1/" JavaScriptFileName="igscripts/webschedule1/ig_calendar.js"
							JavaScriptFileNameCommon="igscripts/scripts/ig_csom.js">
							<Layout DayNameFormat="FirstLetter" FooterFormat="Today: {0:d}" CellSpacing="1" ShowTitle="False"
								ShowFooter="False">
								<DayStyle BackColor="#FFFFCC"></DayStyle>
								<SelectedDayStyle Font-Bold="True" BackColor="#CCCCFF"></SelectedDayStyle>
								<OtherMonthDayStyle ForeColor="#CC9966"></OtherMonthDayStyle>
								<NextPrevStyle Font-Size="9pt" Font-Bold="True" ForeColor="#FFFFCC"></NextPrevStyle>
								<CalendarStyle BorderWidth="1px" Font-Size="8pt" Font-Names="Verdana" BorderColor="#FFCC66" BorderStyle="Solid"
									ForeColor="#663399" BackColor="#FFCC66"></CalendarStyle>
								<TodayDayStyle ForeColor="White" BackColor="#FFCC66"></TodayDayStyle>
								<DropDownStyle BorderStyle="Solid"></DropDownStyle>
								<DayHeaderStyle Height="1pt" BackColor="#FFCC66"></DayHeaderStyle>
								<TitleStyle Height="18pt" Font-Size="9pt" Font-Bold="True" ForeColor="#FFFFCC" BackColor="#990000"></TitleStyle>
							</Layout>
							<AutoPostBack VisibleMonthChanged="True" ValueChanged="True"></AutoPostBack>
						</igsch:webcalendar>
					</td>
					<td>
						<igtbl:ultrawebgrid id="ActivityLogGrid" runat="server" Width="100%">
							<DisplayLayout AllowDeleteDefault="Yes" ColFootersVisibleDefault="Yes" JavaScriptFileName="igscripts/WebGrid3/ig_WebGrid.js"
								AutoGenerateColumns="False" AllowAddNewDefault="Yes" JavaScriptFileNameCommon="igscripts/Scripts/ig_csom.js"
								RowHeightDefault="20px" RowSizingDefault="Free" Version="3.00" EnableInternalRowsManagement="True"
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
								<FrameStyle Width="100%" BorderWidth="1px" Font-Size="8pt" Font-Names="Verdana" BorderStyle="Solid"></FrameStyle>
								<FooterStyleDefault BorderWidth="1px" BorderStyle="Solid" BackColor="LightGray">
									<BorderDetails ColorTop="White" WidthLeft="1px" WidthTop="1px" ColorLeft="White"></BorderDetails>
								</FooterStyleDefault>
								<ClientSideEvents AfterExitEditModeHandler="HandleExitEditMode"></ClientSideEvents>
								<EditCellStyleDefault BorderWidth="0px" BorderStyle="None"></EditCellStyleDefault>
								<RowStyleDefault BorderWidth="1px" BorderColor="Gray" BorderStyle="Solid">
									<Padding Left="3px"></Padding>
									<BorderDetails WidthLeft="0px" WidthTop="0px"></BorderDetails>
								</RowStyleDefault>
								<ImageUrls ImageDirectory="igscripts/WebGrid3/"></ImageUrls>
							</DisplayLayout>
							<Bands>
								<igtbl:UltraGridBand AddButtonCaption="Add a new diary entry" ColFootersVisible="No" AllowUpdate="Yes"
									AllowAdd="Yes" AllowDelete="Yes">
									<Columns>
										<igtbl:UltraGridColumn HeaderText="Activity" Key="PhysicalActivityID" Width="40%" Type="DropDownList" BaseColumnName="PhysicalActivityID">
											<ValueList DataMember="PhysicalActivity" DisplayMember="DisplayName" ValueMember="ID"></ValueList>
										</igtbl:UltraGridColumn>
										<igtbl:UltraGridColumn HeaderText="Time Spent (Minutes)" Key="Minutes" Width="20%" Format="#########" BaseColumnName="Minutes"
											FooterText="">
											<FooterStyle BorderStyle="Solid"></FooterStyle>
											<Validators>
												<igtbl:ValidatorItem Value="RangeValidator1"></igtbl:ValidatorItem>
											</Validators>
										</igtbl:UltraGridColumn>
										<igtbl:UltraGridColumn HeaderText="Notes" Key="Notes" Width="40%" BaseColumnName="Notes" CellMultiline="Yes"></igtbl:UltraGridColumn>
										<igtbl:UltraGridColumn HeaderText="Delete" Key="Delete" Type="CheckBox" BaseColumnName="">
											<CellButtonStyle Width="15px" Cursor="Hand" BorderStyle="None" HorizontalAlign="Center"></CellButtonStyle>
											<CellStyle Width="10%" HorizontalAlign="Center"></CellStyle>
											<HeaderStyle Width="10%" HorizontalAlign="Center"></HeaderStyle>
										</igtbl:UltraGridColumn>
										<igtbl:UltraGridColumn Key="ID" Hidden="True" BaseColumnName="ID"></igtbl:UltraGridColumn>
									</Columns>
								</igtbl:UltraGridBand>
							</Bands>
						</igtbl:ultrawebgrid><asp:button id="SaveChangesButton" runat="server" Text="Save Changes" Width="344px"></asp:button><asp:rangevalidator id="RangeValidator1" runat="server" ErrorMessage="Value must be a number" Type="Integer"
							MinimumValue="0" MaximumValue="600" ControlToValidate="ActivityLogGrid" Font-Names="Verdana" Font-Size="X-Small" BorderWidth="1px" BorderStyle="Solid" BackColor="#FFFFC0"></asp:rangevalidator>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<asp:LinkButton id="LinkButton1" runat="server">How am I doing?</asp:LinkButton>
					</td>
				</tr>
			</TABLE>
		</form>
	</body>
</HTML>
