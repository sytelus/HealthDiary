<%@ Page Language="vb" AutoEventWireup="false" Codebehind="PreAssessment.aspx.vb" Inherits="HealthDiary.PreAssessment"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>PreAssessment</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<asp:Panel id="FormPanel" runat="server">
				<TABLE class="FlatContainer" cellSpacing="8" cellPadding="0" width="90%" align="center">
					<TR>
						<TD>Your height (in inches):&nbsp; <INPUT id="db_UserAccountID" type="hidden" name="db_UserAccountID" runat="server">
						</TD>
						<TD>
							<asp:TextBox id="db_Height" runat="server" Width="223px" CssClass="FlatTextBox"></asp:TextBox></TD>
					</TR>
					<TR>
						<TD>Your weight (in pounds):
						</TD>
						<TD>
							<asp:TextBox id="db_Weight" runat="server" Width="223" CssClass="FlatTextBox"></asp:TextBox></TD>
					</TR>
					<TR>
						<TD>Currently how many days do you excercise in a week:</TD>
						<TD>
							<asp:TextBox id="db_WeeklyExcerciseDays" runat="server" Width="223px" CssClass="FlatTextBox"></asp:TextBox></TD>
					</TR>
					<TR>
						<TD>Currently, on your excercise day, how many minutes you spend for excercise:
						</TD>
						<TD>
							<asp:TextBox id="db_DailyExcerciseMinutes" runat="server" Width="223px" CssClass="FlatTextBox"></asp:TextBox></TD>
					</TR>
					<TR>
						<TD>What is your current sleep hours per day:
						</TD>
						<TD>
							<asp:TextBox id="db_SleepHours" runat="server" Width="223px" CssClass="FlatTextBox"></asp:TextBox></TD>
					</TR>
					<TR>
						<TD>What is your&nbsp;current water intake per day (in oz):<BR>
							<FONT style="FONT-SIZE: x-small; COLOR: Fuchsia">1 cup = 8 ounces</FONT>
						</TD>
						<TD>
							<asp:TextBox id="db_WaterIntake" runat="server" Width="223px" CssClass="FlatTextBox"></asp:TextBox></TD>
					</TR>
					<TR>
						<TD align="right" colSpan="2">
							<HR class="FlatLine">
							<asp:RangeValidator id="RangeValidator1" runat="server" MaximumValue="7" MinimumValue="0" ControlToValidate="db_WeeklyExcerciseDays"
								ErrorMessage="Numbers of days/week must be between 1 and 7" Type="Integer"></asp:RangeValidator>
							<asp:RangeValidator id="RangeValidator2" runat="server" MaximumValue="400" MinimumValue="0" ControlToValidate="db_DailyExcerciseMinutes"
								ErrorMessage="Number of minutes must be between 5 and 400" Type="Integer"></asp:RangeValidator>
							<asp:RangeValidator id="RangeValidator3" runat="server" MaximumValue="16" MinimumValue="1" ControlToValidate="db_SleepHours"
								ErrorMessage="Number of sleep hours must be between 1 and 16" Type="Integer"></asp:RangeValidator>
							<asp:RangeValidator id="RangeValidator4" runat="server" MaximumValue="10000" MinimumValue="1" ControlToValidate="db_WaterIntake"
								ErrorMessage="Water intake must be between 1 and 10000" Type="Integer"></asp:RangeValidator>
							<asp:RangeValidator id="RangeValidator5" runat="server" MaximumValue="10000" MinimumValue="1" ControlToValidate="db_Height"
								ErrorMessage="Please enter a proper hight in inches" Type="Integer"></asp:RangeValidator>
							<asp:RangeValidator id="RangeValidator6" runat="server" MaximumValue="1000" MinimumValue="1" ControlToValidate="db_Weight"
								ErrorMessage="Please enter proper weight in pounds" Type="Integer"></asp:RangeValidator>
							<asp:Button id="UpdateButton" runat="server" CssClass="FlatButton" Text="Update My Preassessment"></asp:Button></TD>
					</TR>
				</TABLE>
				<br><br><br><br>
				<font style="FONT-SIZE: xx-small">
				<strong>Privacy Policy:</strong> All your personal information entered through this website will always remain confidential. We respect your privacy. Any data provided through this website will not be sold, leased, shared with anyone outside of Healthy Futures.
				</font>
			</asp:Panel>
			<asp:Panel id="UpdateSuccessPanel" runat="server" Visible="False">
				<P>Your&nbsp;preassessment have been updated successfully!</P>
				<P>
					<asp:LinkButton id="UpdateDiaryLinkButton" runat="server">Update your health diary logs</asp:LinkButton></P>
				<P>
					<asp:LinkButton id="UpdatePreAssessmentsLinkButton" runat="server">Update your goals</asp:LinkButton></P>
			</asp:Panel>
		</form>
	</body>
</HTML>
