<%@ Page Language="vb" AutoEventWireup="false" Codebehind="intro.aspx.vb" Inherits="HealthDiary.intro"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>intro</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<table width="80%" align="center" class="FlatContainer" cellpadding="0" cellspacing="8">
				<TBODY>
					<tr>
						<td colspan="2" align="left" style="FONT-SIZE: 11pt;COLOR: #191970;LINE-HEIGHT: 14pt;FONT-FAMILY: sans-serif">
							How is your health today? This web site is set up to help you track your 
							progress, as you state what you goal is for the next six weeks. It's simple.
							<br>
							<br>
							<ol>
								<li>
								Decide how much time you think you can/will spend on physical activities in a 
								week.
								<li>
								Log in to record what you are doing.
								<li>
									Check your progress.</li>
							</ol>
							<br>
							As a part of <strong>Healthy Futures</strong> our goal is to encourage every 
							person (especially our students at Highland) to get physical. At a minimum of 3 
							times per week, at least 20 minutes a day, you can choose an activity (or 
							activities) that you just did and record it. The computer keeps track of your 
							goals you set, and lets you know how you're doing. At the end of six weeks, you 
							can start again.
							<br>
							<br>
							As an added incentive, "Healthy Futures" is giving away prizes!
							<ul>
								<li>
								Participate prize: water bottle
								<li>
									<b>Grand prize</b>: $300 spending on any sports equipment of students' choice</li>
							</ul>
							<br>
							<hr class="FlatDashedLine">
						</td>
					</tr>
					<tr>
						<td>
							<asp:HyperLink id="Hyperlink5" runat="server" NavigateUrl="goal.aspx">Set Your Goals Now!</asp:HyperLink>
						</td>
						<td>
							<asp:HyperLink id="Hyperlink6" runat="server" NavigateUrl="activities.aspx">Check out activities!</asp:HyperLink>
						</td>
					</tr>
		</form>
		</TBODY></TABLE>
	</body>
</HTML>
