<%@ Page Language="vb" AutoEventWireup="false" Codebehind="goal.aspx.vb" Inherits="HealthDiary.goal"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>goal</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<asp:Panel id="WaterIntakeCalculationPanel" runat="server" Visible="False">
				<TABLE class="FlatContainer" align="center" cellSpacing="8" cellPadding="0">
					<TR>
						<TD>What is current weight in pounds:</TD>
						<TD>
							<asp:TextBox id="WeightTextBox" runat="server"></asp:TextBox></TD>
					</TR>
					<TR>
						<TD>I'm planning to remain active:</TD>
						<TD>
							<asp:CheckBox id="IsActivePersonCheckBox" runat="server" Checked="True"></asp:CheckBox></TD>
					</TR>
					<TR>
						<TD>I often feel dry weather in my area:</TD>
						<TD>
							<asp:CheckBox id="IsDryAreaCheckBox" runat="server"></asp:CheckBox></TD>
					</TR>
					<TR>
						<TD colSpan="2">To find out more, <A href="http://www.naturodoc.com/library/nutrition/water.htm" target="new">
								click here.</A>
						</TD>
					</TR>
					<TR>
						<TD align="right" colSpan="2">
							<HR class="FlatLine">
							<asp:RangeValidator id="RangeValidator6" runat="server" ErrorMessage="Please enter proper weight in pounds"
								ControlToValidate="WeightTextBox" MinimumValue="1" MaximumValue="1000" Type="Integer"></asp:RangeValidator>
							<asp:Button id="CalculateWaterButton" runat="server" Text="Calculate My Water Intake"></asp:Button></TD>
					</TR>
				</TABLE>
				<BR>
				<br>			
			</asp:Panel>
			<asp:Panel id="FormPanel" runat="server">
				<TABLE class="FlatContainer" width="90%" cellSpacing="8" cellPadding="0" align="center">
					<TR>
						<TD >What is your ultimate goal towards participation:&nbsp; <INPUT id="db_UserAccountID" type="hidden" runat="server">
						</TD>
						<TD style>
							<asp:DropDownList id="db_GoalPurposeID" runat="server" CssClass="FlatTextBox"></asp:DropDownList></TD>
					</TR>
					<TR>
						<TD>How many days would you like to excercise in a week:
						</TD>
						<TD>
							<asp:TextBox id="db_WeeklyExcerciseDays" runat="server" CssClass="FlatTextBox"></asp:TextBox></TD>
					</TR>
					<TR>
						<TD>On your active day, how many minutes would you like to spend each day:
						</TD>
						<TD>
							<asp:TextBox id="db_DailyExcerciseMinutes" runat="server" CssClass="FlatTextBox"></asp:TextBox></TD>
					</TR>
					<TR>
						<TD>What is your target sleep hours per day:
						</TD>
						<TD>
							<asp:TextBox id="db_SleepHours" runat="server" CssClass="FlatTextBox"></asp:TextBox></TD>
					</TR>
					<TR>
						<TD>What is your target water intake per day (in oz):<br>
							<FONT style="FONT-SIZE: x-small; COLOR: Fuchsia">1 cup = 8 ounces</FONT>
						<TD>
							<asp:TextBox id="db_WaterIntake" runat="server" CssClass="FlatTextBox"></asp:TextBox>
							<br>							<asp:LinkButton id="CalculateWaterIntakeLinkButton" runat="server">Help me calculate my goal!</asp:LinkButton>
							</TD>
					</TR>
					<TR>
						<TD align="right" colSpan="2">
							<HR class="FlatLine">
							<asp:RangeValidator id="RangeValidator1" runat="server" ErrorMessage="Numbers of days/week must be between 1 and 7"
								ControlToValidate="db_WeeklyExcerciseDays" MinimumValue="1" MaximumValue="7" Type="Integer"></asp:RangeValidator>
							<asp:RangeValidator id="RangeValidator2" runat="server" ErrorMessage="Number of minues must be between 5 and 400"
								ControlToValidate="db_DailyExcerciseMinutes" MinimumValue="5" MaximumValue="400" Type="Integer"></asp:RangeValidator>
							<asp:RangeValidator id="RangeValidator3" runat="server" ErrorMessage="Number of sleep hours must be between 1 and 16"
								ControlToValidate="db_SleepHours" MinimumValue="1" MaximumValue="16" Type="Integer"></asp:RangeValidator>
							<asp:RangeValidator id="RangeValidator4" runat="server" ErrorMessage="Water intake must be between 1 and 10000"
								ControlToValidate="db_WaterIntake" MinimumValue="1" MaximumValue="10000" Type="Integer"></asp:RangeValidator>
							<asp:Button id="UpdateButton" runat="server" CssClass="FlatButton" Text="Update My Goals"></asp:Button></TD>
					</TR>
				</TABLE>
			</asp:Panel>
			<asp:Panel id="UpdateSuccessPanel" runat="server" Visible="False">
				<P>Your goals have been updated successfully!</P>
				<P>
					<asp:LinkButton id="UpdateDiaryLinkButton" runat="server">Update your health diary logs</asp:LinkButton></P>
				<P>
					<asp:LinkButton id="UpdatePreAssessmentsLinkButton" runat="server">Update your pre-assessment</asp:LinkButton></P>
			</asp:Panel>
		</form>
	</body>
</HTML>
