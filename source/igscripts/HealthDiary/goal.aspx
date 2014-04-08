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
		
			<asp:Panel id="FormPanel" runat="server">
					<TABLE valign="top" class="Dashed" id="Table1" borderColor="#009900" cellSpacing="0" borderColorDark="#006600"
					cellSpacing="0" cellPadding="10"  align="center" borderColorLight="#009933" border="1">
						<TR>
							<TD style="HEIGHT: 24px">What is your ultimate goal towards participation:&nbsp; <INPUT id="db_UserAccountID" type="hidden" runat="server">
							</TD>
							<TD style="HEIGHT: 24px">
								<asp:DropDownList id="db_GoalPurposeID" runat="server" Width="160px"></asp:DropDownList></TD>
						</TR>
						<TR>
							<TD>How many days would you like to excercise in a week:
							</TD>
							<TD>
								<asp:TextBox id="db_WeeklyExcerciseDays" runat="server"></asp:TextBox></TD>
						</TR>
						<TR>
							<TD>On your active day, how many minutes would you like to spend each day:
							</TD>
							<TD>
								<asp:TextBox id="db_DailyExcerciseMinutes" runat="server"></asp:TextBox></TD>
						</TR>
						<TR>
							<TD>What is your target sleep hours per day:
							</TD>
							<TD>
								<asp:TextBox id="db_SleepHours" runat="server"></asp:TextBox></TD>
						</TR>
						<TR>
							<TD>What is your target water intake per day:
							</TD>
							<TD>
								<asp:TextBox id="db_WaterIntake" runat="server"></asp:TextBox></TD>
						</TR>
						<TR>
							<TD>&nbsp;</TD>
							<TD>
								<asp:Button id="UpdateButton" runat="server" Text="Update My Goals"></asp:Button></TD>
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
