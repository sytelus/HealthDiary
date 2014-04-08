<%@ Register TagPrefix="igchart" Namespace="Infragistics.WebUI.UltraWebChart" Assembly="Infragistics.WebUI.UltraWebChart.v4" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="EvaluateNow.aspx.vb" Inherits="HealthDiary.EvaluateNow"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>EvaluateNow</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body XMLNS:igchart="http://schemas.infragistics.com/ASPNET/WebControls/WebChart">
		<form id="Form1" method="post" runat="server">
			<TABLE class="FlatContainer" cellSpacing="8" cellPadding="0" width="90%" align="center">
				<tr>
					<td>
						<asp:Image id="GoalStateImage" runat="server" Height="122px" ImageAlign="Left" Width="127px"></asp:Image>
						<asp:Label id="GoalStateLabel" runat="server">Label</asp:Label><br>
						<br>
						<asp:Label id="Label1" runat="server">Your target hours/week is:</asp:Label>
						<strong>
							<asp:Label id="goalWeeklyAverageHours" runat="server">Label</asp:Label></strong>
						<br>
						<asp:Label id="Label3" runat="server">Your current hours/week is:</asp:Label>
						<strong>
							<asp:Label id="currentWeeklyAverageHours" runat="server">Label</asp:Label></strong>
					</td>
				</tr>
				<tr>
					<br>
					<td><STRONG>Your Daily Graph:</STRONG>
						<br>
						<br>
						<P>
							<igchart:UltraChart id="PerformanceChart" runat="server" ChartType="ColumnChart" EmptyChartText="You haven't made any entry in to your health diary yet!"
								Width="480px" Height="320px" JavaScriptFileName="igscripts/webchart4/ig_webchart.js">
								<ColumnChart SeriesSpacing="1" ColumnSpacing="0" NullHandling="Zero"></ColumnChart>
								<ColorModel ColorBegin="DarkGoldenrod" ColorEnd="Navy" AlphaLevel="150" ModelStyle="PureRandom"
									Grayscale="False" Scaling="None">
									<Skin ApplyRowWise="True"></Skin>
								</ColorModel>
								<TitleTop Font="Microsoft Sans Serif, 7.8pt" Visible="True" Text="" FontSizeBestFit="False"
									Orientation="Horizontal" WrapText="False" Extent="0" FontColor="Black" HorizontalAlign="Near"
									VerticalAlign="Center" Location="Top">
									<Margins Bottom="5" Left="5" Top="5" Right="5"></Margins>
								</TitleTop>
								<Border CornerRadius="0" DrawStyle="Solid" Raised="False" Color="Black" Thickness="1"></Border>
								<TitleBottom Font="Microsoft Sans Serif, 7.8pt" Visible="True" Text="" FontSizeBestFit="False"
									Orientation="Horizontal" WrapText="False" Extent="0" FontColor="Black" HorizontalAlign="Far"
									VerticalAlign="Center" Location="Bottom">
									<Margins Bottom="0" Left="0" Top="0" Right="0"></Margins>
								</TitleBottom>
								<Axis BackColor="Cornsilk">
									<Y LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="True" RangeMin="0" LineColor="Black"
										RangeType="Automatic" TickmarkInterval="0" LineThickness="2" Extent="80" LogBase="10"
										RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="15" NumericAxisType="Linear">
										<StripLines Interval="2" Visible="False">
											<PE Fill="Transparent" StrokeOpacity="255" FillGradientStyle="None" ElementType="SolidFill"
												FillOpacity="255" FillStopColor="Transparent" Hatch="None" FillStopOpacity="255"
												ImageWrapMode="Tile" ImageFitStyle="Tiled" StrokeWidth="1" Stroke="Transparent"></PE>
										</StripLines>
										<ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
										<Labels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Far" WrapText="False"
											SeriesFormatString="&lt;SERIES_LABEL&gt;" FontSizeBestFit="False" ClipText="True" ItemFormatString="&lt;DATA_VALUE:00.00&gt;"
											Flip="False" ItemFormat="DataValue" VerticalAlign="Center" FontColor="Black" Orientation="Horizontal"
											OrientationAngle="0"></Labels>
										<MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True" Thickness="1"></MajorGridLines>
										<MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False" Thickness="1"></MinorGridLines>
										<TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
									</Y>
									<Y2 LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="False" RangeMin="0" LineColor="Black"
										RangeType="Automatic" TickmarkInterval="0" LineThickness="2" Extent="80" LogBase="10"
										RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="10" NumericAxisType="Linear">
										<StripLines Interval="2" Visible="False">
											<PE Fill="Transparent" StrokeOpacity="255" FillGradientStyle="None" ElementType="SolidFill"
												FillOpacity="255" FillStopColor="Transparent" Hatch="None" FillStopOpacity="255"
												ImageWrapMode="Tile" ImageFitStyle="Tiled" StrokeWidth="1" Stroke="Transparent"></PE>
										</StripLines>
										<ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
										<Labels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Near" WrapText="False"
											SeriesFormatString="&lt;SERIES_LABEL&gt;" FontSizeBestFit="False" ClipText="True" ItemFormatString="&lt;DATA_VALUE:00.00&gt;"
											Flip="False" ItemFormat="DataValue" VerticalAlign="Center" FontColor="Black" Orientation="Horizontal"
											OrientationAngle="0"></Labels>
										<MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True" Thickness="1"></MajorGridLines>
										<MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False" Thickness="1"></MinorGridLines>
										<TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
									</Y2>
									<X2 LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="False" RangeMin="0" LineColor="Black"
										RangeType="Automatic" TickmarkInterval="0" LineThickness="2" Extent="0" LogBase="10"
										RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="10" NumericAxisType="Linear">
										<StripLines Interval="2" Visible="False">
											<PE Fill="Transparent" StrokeOpacity="255" FillGradientStyle="None" ElementType="SolidFill"
												FillOpacity="255" FillStopColor="Transparent" Hatch="None" FillStopOpacity="255"
												ImageWrapMode="Tile" ImageFitStyle="Tiled" StrokeWidth="1" Stroke="Transparent"></PE>
										</StripLines>
										<ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
										<Labels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Far" WrapText="False"
											SeriesFormatString="&lt;SERIES_LABEL&gt;" FontSizeBestFit="False" ClipText="True" ItemFormatString="&lt;ITEM_LABEL&gt;"
											Flip="False" ItemFormat="ItemLabel" VerticalAlign="Center" FontColor="Black" Orientation="VerticalLeftFacing"
											OrientationAngle="0"></Labels>
										<MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True" Thickness="1"></MajorGridLines>
										<MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False" Thickness="1"></MinorGridLines>
										<TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
									</X2>
									<Z2 LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="True" RangeMin="0" LineColor="Black"
										RangeType="Automatic" TickmarkInterval="0" LineThickness="2" Extent="80" LogBase="10"
										RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="10" NumericAxisType="Linear">
										<StripLines Interval="2" Visible="False">
											<PE Fill="Transparent" StrokeOpacity="255" FillGradientStyle="None" ElementType="SolidFill"
												FillOpacity="255" FillStopColor="Transparent" Hatch="None" FillStopOpacity="255"
												ImageWrapMode="Tile" ImageFitStyle="Tiled" StrokeWidth="1" Stroke="Transparent"></PE>
										</StripLines>
										<ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
										<Labels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Near" WrapText="False"
											SeriesFormatString="" FontSizeBestFit="False" ClipText="True" ItemFormatString="" Flip="False"
											ItemFormat="None" VerticalAlign="Center" FontColor="Black" Orientation="Horizontal"
											OrientationAngle="0"></Labels>
										<MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True" Thickness="1"></MajorGridLines>
										<MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False" Thickness="1"></MinorGridLines>
										<TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
									</Z2>
									<Z LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="False" RangeMin="0" LineColor="Black"
										RangeType="Automatic" TickmarkInterval="0" LineThickness="2" Extent="80" LogBase="10"
										RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="10" NumericAxisType="Linear">
										<StripLines Interval="2" Visible="False">
											<PE Fill="Transparent" StrokeOpacity="255" FillGradientStyle="None" ElementType="SolidFill"
												FillOpacity="255" FillStopColor="Transparent" Hatch="None" FillStopOpacity="255"
												ImageWrapMode="Tile" ImageFitStyle="Tiled" StrokeWidth="1" Stroke="Transparent"></PE>
										</StripLines>
										<ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
										<Labels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Near" WrapText="False"
											SeriesFormatString="" FontSizeBestFit="False" ClipText="True" ItemFormatString="&lt;DATA_VALUE:00.00&gt;"
											Flip="False" ItemFormat="DataValue" VerticalAlign="Center" FontColor="Black" Orientation="Horizontal"
											OrientationAngle="0"></Labels>
										<MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True" Thickness="1"></MajorGridLines>
										<MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False" Thickness="1"></MinorGridLines>
										<TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
									</Z>
									<X LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="True" RangeMin="0" LineColor="Black"
										RangeType="Automatic" TickmarkInterval="0" LineThickness="2" Extent="80" LogBase="10"
										RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="10" NumericAxisType="Linear">
										<StripLines Interval="2" Visible="False">
											<PE Fill="Transparent" StrokeOpacity="255" FillGradientStyle="None" ElementType="SolidFill"
												FillOpacity="255" FillStopColor="Transparent" Hatch="None" FillStopOpacity="255"
												ImageWrapMode="Tile" ImageFitStyle="Tiled" StrokeWidth="1" Stroke="Transparent"></PE>
										</StripLines>
										<ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
										<Labels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Near" WrapText="False"
											SeriesFormatString="&lt;SERIES_LABEL&gt;" FontSizeBestFit="False" ClipText="True" ItemFormatString="&lt;ITEM_LABEL&gt;"
											Flip="False" ItemFormat="ItemLabel" VerticalAlign="Center" FontColor="Black" Orientation="VerticalLeftFacing"
											OrientationAngle="0"></Labels>
										<MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True" Thickness="1"></MajorGridLines>
										<MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False" Thickness="1"></MinorGridLines>
										<TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
									</X>
								</Axis>
								<Data DataMember="" SwapRowsAndColumns="False" UseMinMax="False" UseRowLabelsColumn="True"
									MinValue="-1.7976931348623157E+308" RowLabelsColumn="0" ZeroAligned="False" MaxValue="1.7976931348623157E+308"></Data>
								<Legend Font="Microsoft Sans Serif, 7.8pt" Visible="False" AlphaLevel="150" BorderThickness="1"
									BorderStyle="Solid" SpanPercentage="25" BorderColor="Navy" FontColor="Black" BackgroundColor="FloralWhite"
									DataAssociation="DefaultData" Location="Right" FormatString="&lt;ITEM_LABEL&gt;">
									<Margins Bottom="5" Left="5" Top="5" Right="5"></Margins>
								</Legend>
								<Tooltips BorderThickness="1" FormatString="&lt;DATA_VALUE:00.00&gt;" EnableFadingEffect="False"
									Format="DataValue" FontColor="Black" BorderColor="Black" Display="MouseMove" BackColor="AntiqueWhite"
									Padding="0"></Tooltips>
								<TitleRight Font="Microsoft Sans Serif, 7.8pt" Visible="False" Text="UltraChart for .NET is #1 !"
									FontSizeBestFit="False" Orientation="VerticalRightFacing" WrapText="False" Extent="0" FontColor="Black"
									HorizontalAlign="Near" VerticalAlign="Center" Location="Right">
									<Margins Bottom="5" Left="5" Top="5" Right="5"></Margins>
								</TitleRight>
								<TitleLeft Font="Microsoft Sans Serif, 7.8pt" Visible="False" Text="Component Market" FontSizeBestFit="False"
									Orientation="VerticalLeftFacing" WrapText="False" Extent="0" FontColor="Black" HorizontalAlign="Near"
									VerticalAlign="Center" Location="Left">
									<Margins Bottom="5" Left="5" Top="5" Right="5"></Margins>
								</TitleLeft>
								<DeploymentScenario Scenario="FileSystem" ImageURL="ChartImages/Chart_#SEQNUM(100).jpg" ImageType="Png"
									FilePath="ChartImages"></DeploymentScenario>
							</igchart:UltraChart>
						</P>
					</td>
				</tr>
				<tr>
					<br>
					<td><STRONG>Your Weekly Graph:</STRONG>
						<br>
						<br>
						<P>
							<igchart:UltraChart id="WeeklySummaryChart" runat="server" Height="320px" Width="480px" EmptyChartText="You haven't made any entry in to your health diary yet!"
								ChartType="ColumnChart" JavaScriptFileName="igscripts/webchart4/ig_webchart.js">
								<ColumnChart SeriesSpacing="1" ColumnSpacing="0" NullHandling="Zero"></ColumnChart>
								<ColorModel ColorBegin="DarkGoldenrod" ColorEnd="Navy" AlphaLevel="150" ModelStyle="PureRandom"
									Grayscale="False" Scaling="None">
									<Skin ApplyRowWise="True"></Skin>
								</ColorModel>
								<TitleTop Font="Microsoft Sans Serif, 7.8pt" Visible="True" Text="" FontSizeBestFit="False"
									Orientation="Horizontal" WrapText="False" Extent="0" FontColor="Black" HorizontalAlign="Near"
									VerticalAlign="Center" Location="Top">
									<Margins Bottom="5" Left="5" Top="5" Right="5"></Margins>
								</TitleTop>
								<Border CornerRadius="0" DrawStyle="Solid" Raised="False" Color="Black" Thickness="1"></Border>
								<TitleBottom Font="Microsoft Sans Serif, 7.8pt" Visible="True" Text="" FontSizeBestFit="False"
									Orientation="Horizontal" WrapText="False" Extent="0" FontColor="Black" HorizontalAlign="Far"
									VerticalAlign="Center" Location="Bottom">
									<Margins Bottom="0" Left="0" Top="0" Right="0"></Margins>
								</TitleBottom>
								<Axis BackColor="Cornsilk">
									<Y LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="True" RangeMin="0" LineColor="Black"
										RangeType="Automatic" TickmarkInterval="0" LineThickness="2" Extent="80" LogBase="10"
										RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="15" NumericAxisType="Linear">
										<StripLines Interval="2" Visible="False">
											<PE Fill="Transparent" StrokeOpacity="255" FillGradientStyle="None" ElementType="SolidFill"
												FillOpacity="255" FillStopColor="Transparent" Hatch="None" FillStopOpacity="255"
												ImageWrapMode="Tile" ImageFitStyle="Tiled" StrokeWidth="1" Stroke="Transparent"></PE>
										</StripLines>
										<ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
										<Labels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Far" WrapText="False"
											SeriesFormatString="&lt;SERIES_LABEL&gt;" FontSizeBestFit="False" ClipText="True" ItemFormatString="&lt;DATA_VALUE:00.00&gt;"
											Flip="False" ItemFormat="DataValue" VerticalAlign="Center" FontColor="Black" Orientation="Horizontal"
											OrientationAngle="0"></Labels>
										<MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True" Thickness="1"></MajorGridLines>
										<MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False" Thickness="1"></MinorGridLines>
										<TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
									</Y>
									<Y2 LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="False" RangeMin="0" LineColor="Black"
										RangeType="Automatic" TickmarkInterval="0" LineThickness="2" Extent="80" LogBase="10"
										RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="10" NumericAxisType="Linear">
										<StripLines Interval="2" Visible="False">
											<PE Fill="Transparent" StrokeOpacity="255" FillGradientStyle="None" ElementType="SolidFill"
												FillOpacity="255" FillStopColor="Transparent" Hatch="None" FillStopOpacity="255"
												ImageWrapMode="Tile" ImageFitStyle="Tiled" StrokeWidth="1" Stroke="Transparent"></PE>
										</StripLines>
										<ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
										<Labels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Near" WrapText="False"
											SeriesFormatString="&lt;SERIES_LABEL&gt;" FontSizeBestFit="False" ClipText="True" ItemFormatString="&lt;DATA_VALUE:00.00&gt;"
											Flip="False" ItemFormat="DataValue" VerticalAlign="Center" FontColor="Black" Orientation="Horizontal"
											OrientationAngle="0"></Labels>
										<MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True" Thickness="1"></MajorGridLines>
										<MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False" Thickness="1"></MinorGridLines>
										<TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
									</Y2>
									<X2 LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="False" RangeMin="0" LineColor="Black"
										RangeType="Automatic" TickmarkInterval="0" LineThickness="2" Extent="0" LogBase="10"
										RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="10" NumericAxisType="Linear">
										<StripLines Interval="2" Visible="False">
											<PE Fill="Transparent" StrokeOpacity="255" FillGradientStyle="None" ElementType="SolidFill"
												FillOpacity="255" FillStopColor="Transparent" Hatch="None" FillStopOpacity="255"
												ImageWrapMode="Tile" ImageFitStyle="Tiled" StrokeWidth="1" Stroke="Transparent"></PE>
										</StripLines>
										<ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
										<Labels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Far" WrapText="False"
											SeriesFormatString="&lt;SERIES_LABEL&gt;" FontSizeBestFit="False" ClipText="True" ItemFormatString="&lt;ITEM_LABEL&gt;"
											Flip="False" ItemFormat="ItemLabel" VerticalAlign="Center" FontColor="Black" Orientation="VerticalLeftFacing"
											OrientationAngle="0"></Labels>
										<MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True" Thickness="1"></MajorGridLines>
										<MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False" Thickness="1"></MinorGridLines>
										<TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
									</X2>
									<Z2 LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="True" RangeMin="0" LineColor="Black"
										RangeType="Automatic" TickmarkInterval="0" LineThickness="2" Extent="80" LogBase="10"
										RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="10" NumericAxisType="Linear">
										<StripLines Interval="2" Visible="False">
											<PE Fill="Transparent" StrokeOpacity="255" FillGradientStyle="None" ElementType="SolidFill"
												FillOpacity="255" FillStopColor="Transparent" Hatch="None" FillStopOpacity="255"
												ImageWrapMode="Tile" ImageFitStyle="Tiled" StrokeWidth="1" Stroke="Transparent"></PE>
										</StripLines>
										<ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
										<Labels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Near" WrapText="False"
											SeriesFormatString="" FontSizeBestFit="False" ClipText="True" ItemFormatString="" Flip="False"
											ItemFormat="None" VerticalAlign="Center" FontColor="Black" Orientation="Horizontal"
											OrientationAngle="0"></Labels>
										<MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True" Thickness="1"></MajorGridLines>
										<MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False" Thickness="1"></MinorGridLines>
										<TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
									</Z2>
									<Z LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="False" RangeMin="0" LineColor="Black"
										RangeType="Automatic" TickmarkInterval="0" LineThickness="2" Extent="80" LogBase="10"
										RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="10" NumericAxisType="Linear">
										<StripLines Interval="2" Visible="False">
											<PE Fill="Transparent" StrokeOpacity="255" FillGradientStyle="None" ElementType="SolidFill"
												FillOpacity="255" FillStopColor="Transparent" Hatch="None" FillStopOpacity="255"
												ImageWrapMode="Tile" ImageFitStyle="Tiled" StrokeWidth="1" Stroke="Transparent"></PE>
										</StripLines>
										<ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
										<Labels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Near" WrapText="False"
											SeriesFormatString="" FontSizeBestFit="False" ClipText="True" ItemFormatString="&lt;DATA_VALUE:00.00&gt;"
											Flip="False" ItemFormat="DataValue" VerticalAlign="Center" FontColor="Black" Orientation="Horizontal"
											OrientationAngle="0"></Labels>
										<MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True" Thickness="1"></MajorGridLines>
										<MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False" Thickness="1"></MinorGridLines>
										<TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
									</Z>
									<X LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="True" RangeMin="0" LineColor="Black"
										RangeType="Automatic" TickmarkInterval="0" LineThickness="2" Extent="80" LogBase="10"
										RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="10" NumericAxisType="Linear">
										<StripLines Interval="2" Visible="False">
											<PE Fill="Transparent" StrokeOpacity="255" FillGradientStyle="None" ElementType="SolidFill"
												FillOpacity="255" FillStopColor="Transparent" Hatch="None" FillStopOpacity="255"
												ImageWrapMode="Tile" ImageFitStyle="Tiled" StrokeWidth="1" Stroke="Transparent"></PE>
										</StripLines>
										<ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
										<Labels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Near" WrapText="False"
											SeriesFormatString="&lt;SERIES_LABEL&gt;" FontSizeBestFit="False" ClipText="True" ItemFormatString="&lt;ITEM_LABEL&gt;"
											Flip="False" ItemFormat="ItemLabel" VerticalAlign="Center" FontColor="Black" Orientation="VerticalLeftFacing"
											OrientationAngle="0"></Labels>
										<MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True" Thickness="1"></MajorGridLines>
										<MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False" Thickness="1"></MinorGridLines>
										<TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
									</X>
								</Axis>
								<Data DataMember="" SwapRowsAndColumns="False" UseMinMax="False" UseRowLabelsColumn="True"
									MinValue="-1.7976931348623157E+308" RowLabelsColumn="0" ZeroAligned="False" MaxValue="1.7976931348623157E+308"></Data>
								<Legend Font="Microsoft Sans Serif, 7.8pt" Visible="False" AlphaLevel="150" BorderThickness="1"
									BorderStyle="Solid" SpanPercentage="25" BorderColor="Navy" FontColor="Black" BackgroundColor="FloralWhite"
									DataAssociation="DefaultData" Location="Right" FormatString="&lt;ITEM_LABEL&gt;">
									<Margins Bottom="5" Left="5" Top="5" Right="5"></Margins>
								</Legend>
								<Tooltips BorderThickness="1" FormatString="&lt;DATA_VALUE:00.00&gt;" EnableFadingEffect="False"
									Format="DataValue" FontColor="Black" BorderColor="Black" Display="MouseMove" BackColor="AntiqueWhite"
									Padding="0"></Tooltips>
								<TitleRight Font="Microsoft Sans Serif, 7.8pt" Visible="False" Text="UltraChart for .NET is #1 !"
									FontSizeBestFit="False" Orientation="VerticalRightFacing" WrapText="False" Extent="0" FontColor="Black"
									HorizontalAlign="Near" VerticalAlign="Center" Location="Right">
									<Margins Bottom="5" Left="5" Top="5" Right="5"></Margins>
								</TitleRight>
								<TitleLeft Font="Microsoft Sans Serif, 7.8pt" Visible="False" Text="Component Market" FontSizeBestFit="False"
									Orientation="VerticalLeftFacing" WrapText="False" Extent="0" FontColor="Black" HorizontalAlign="Near"
									VerticalAlign="Center" Location="Left">
									<Margins Bottom="5" Left="5" Top="5" Right="5"></Margins>
								</TitleLeft>
								<DeploymentScenario Scenario="FileSystem" ImageURL="ChartImages/Chart_#SEQNUM(100).jpg" ImageType="Png"
									FilePath="ChartImages"></DeploymentScenario>
							</igchart:UltraChart>
						</P>
					</td>
				</tr>
			</TABLE>
		</form>
	</body>
</HTML>
