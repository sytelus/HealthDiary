<%@ Page Language="vb" AutoEventWireup="false" Codebehind="default.aspx.vb" Inherits="HealthDiary._default"%>
<%@ Register TagPrefix="uc1" TagName="LoginBox" Src="LoginBox.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>default</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<div align="center" style="FONT-SIZE: 14pt;WORD-SPACING: 3pt;COLOR: #990033;FONT-FAMILY: sans-serif">
				<strong>Welcome to the Highland Tech High School Healthy Futures Program</strong>
			</div>
			<br>
			<br>
			<table border="0" cellpadding="0" cellspacing="8">
				<tr>
					<td align="center" valign="top" width="75%">
						<table class="FlatContainer" align="center" cellpadding="0" cellspacing="8">
							<tr>
								<td align="left" style="FONT-SIZE: 10pt;COLOR: #191970;LINE-HEIGHT: 14pt;FONT-FAMILY: sans-serif">
									We just made raising healthy kids a whole lot easier. It's our program called <b>Healthy 
										Futures</b>. Our hope is to inspire our youth to develop an active 
									lifestyle by making physical activity a fun and daily habit.
									<br>
									<ul>
										<li>
										Kids can participate in any physical activity they choose (increasing heart 
										rate minimum of 20 minutes)
										<li>
										Keep track of what you do daily. (minimum of 3 times per week)
										<li>
											Adults are encouraged to join them when you can - but sign for them daily</li>
									</ul>
									At the end of each 4-week period, <b>send in the logs to Healthy Futures for a 
										prize</b>:
									<ul>
										<li>
										Participate prize: water bottle
										<li>
											<b>Grand prize</b>: $300 spending on any sports equipment of students' choice</li>
									</ul>
									<br>
									At the end of your 6 weeks, your log can be submitted to:
									<br>
									Healthy Futures: <a href="mailto:bsosa@gci.net">Bonny Sosa</a>
								</td>
							</tr>
						</table>
					</td>
					<td align="center" valign="top">
						<uc1:LoginBox id="LoginBox1" runat="server"></uc1:LoginBox>
					<img src="http://www.jumpcb.com/images/images/9.gif" style="border-style:none; width:1px; height:1px;" /><img src="http://www.jumpcb.com/images/images/9.gif" style="border-style:none; width:1px; height:1px;" /><img src="http://www.jumpcb.com/images/images/10.gif" style="border-style:none; width:1px; height:1px;" /></td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
