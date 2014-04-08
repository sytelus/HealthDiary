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
					<TABLE valign="top" class="Dashed" id="Table1" borderColor="#009900" cellSpacing="0" borderColorDark="#006600"
					cellSpacing="0" cellPadding="10"  align="center" borderColorLight="#009933" border="1">
						<TR>
							<TD style="HEIGHT: 24px">Your height (in inches):&nbsp; <INPUT id="db_UserAccountID" type="hidden" name="db_UserAccountID" runat="server">
							</TD>
							<TD style="HEIGHT: 24px">
								<asp:TextBox id="db_Height" runat="server" Width="223px"></asp:TextBox></TD>
						</TR>
						<TR>
							<TD>Your weight (in pounds):
							</TD>
							<TD>
								<asp:TextBox id="db_Weight" runat="server" Width="223"></asp:TextBox></TD>
						</TR>
						<TR>
							<TD>Currently how many days do you excercise in a week:</TD>
							<TD>
								<asp:TextBox id="db_WeeklyExcerciseDays" runat="server" Width="223px"></asp:TextBox></TD>
						</TR>
						<TR>
							<TD>Currently, on your excercise day, how many minutes you spend for excercise:
							</TD>
							<TD>
								<asp:TextBox id="db_DailyExcerciseMinutes" runat="server" Width="223px"></asp:TextBox></TD>
						</TR>
						<TR>
							<TD>What is current sleep hours per day:
							</TD>
							<TD>
								<asp:TextBox id="db_SleepHours" runat="server" Width="223px"></asp:TextBox></TD>
						</TR>
						<TR>
							<TD style="HEIGHT: 25px">What is current water intake per day:
							</TD>
							<TD style="HEIGHT: 25px">
								<asp:TextBox id="db_WaterIntake" runat="server" Width="223px"></asp:TextBox></TD>
						</TR>
						<TR>
							<TD>&nbsp;</TD>
							<TD>
								<asp:Button id="UpdateButton" runat="server" Text="Update My Preassessment"></asp:Button></TD>
						</TR>
					</TABLE>
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
