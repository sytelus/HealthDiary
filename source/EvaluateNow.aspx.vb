Imports Sytel.SyFastPage
Imports Sytel

Public Class EvaluateNow
    Inherits HealthDiaryPageBase

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents PerformanceChart As Infragistics.WebUI.UltraWebChart.UltraChart
    Protected WithEvents WeeklySummaryChart As Infragistics.WebUI.UltraWebChart.UltraChart
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents goalWeeklyAverageHours As System.Web.UI.WebControls.Label
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents currentWeeklyAverageHours As System.Web.UI.WebControls.Label
    Protected WithEvents GoalStateImage As System.Web.UI.WebControls.Image
    Protected WithEvents GoalStateLabel As System.Web.UI.WebControls.Label

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.PageHeading = "How Am I Doing?"
        Me.PageTitle = "Evaluation"

        Dim dataInstance As New AppData
        Dim userData As DataSet = dataInstance.GetTableData("Goal", New String() {"UserAccountID"}, New Object() {Me.GetUserAccountID})

        Dim goalWeeklyExcerciseDays As Integer = 0
        Dim goalDailyExcerciseMinutes As Integer = 0
        If userData.Tables("Goal").Rows.Count > 0 Then
            If userData.Tables("Goal").Rows(0)("WeeklyExcerciseDays").ToString <> "" Then
                goalWeeklyExcerciseDays = CType(userData.Tables("Goal").Rows(0)("WeeklyExcerciseDays"), Integer)
            End If
            If userData.Tables("Goal").Rows(0)("DailyExcerciseMinutes").ToString <> "" Then
                goalDailyExcerciseMinutes = CType(userData.Tables("Goal").Rows(0)("DailyExcerciseMinutes"), Integer)
            End If
        End If

        dataInstance.GetTableData("sql:Select Format(LogDate, 'MM/DD') As LogDateString, SUM(Minutes) As MinutesPerDay, " + goalDailyExcerciseMinutes.ToString + " As GoalMinutesPerDay, LogDate  From DailyLogPhysicalActivity WHERE UserAccountID = " + Me.GetUserAccountID.ToString + " Group BY LogDate ORDER BY LogDate", userData, Nothing, Nothing, "LogSummary")

        PerformanceChart.Data.DataSource = userData
        PerformanceChart.Data.DataMember = "LogSummary"
        PerformanceChart.Data.IncludeColumn(2, False)
        PerformanceChart.Data.IncludeColumn(3, False)
        PerformanceChart.Data.UseRowLabelsColumn = True
        PerformanceChart.Data.RowLabelsColumn = 0
        PerformanceChart.Data.SwapRowsAndColumns = True
        PerformanceChart.Data.ZeroAligned = True
        '        PerformanceChart.Axis.Y.StripLines.Visible = True
        '       PerformanceChart.Axis.Y.StripLines.PE.FillGradientStyle = Infragistics.UltraChart.[Shared].Styles.GradientStyle.ForwardDiagonal
        PerformanceChart.Data.DataBind()

        Dim weeklyAveragesTable As DataTable = userData.Tables.Add("WeeklyAverages")
        weeklyAveragesTable.Columns.Add("WeekNumber", GetType(String))
        weeklyAveragesTable.Columns.Add("WeekHoursTotal", GetType(Double))
        weeklyAveragesTable.Columns.Add("WeekDaysTotal", GetType(Integer))
        weeklyAveragesTable.Columns.Add("WeekAverageHours", GetType(Double))

        Dim weekStartedOn As Date = Date.MinValue
        Dim dailyExcerciseMinutesTotalForWeeklyAverage As Double
        Dim daysSinceWeekStarted As Integer = 0
        Dim weekCount As Integer = 0
        Dim minutesGrandTotal As Double = 0
        Dim daysGrandTotal As Integer = 0
        Dim firstDay As Date = Date.MinValue
        Dim lastDay As Date = Date.MinValue
        For rowIndex As Integer = 0 To userData.Tables("LogSummary").Rows.Count - 1
            Dim thisDate As Date = CType(userData.Tables("LogSummary").Rows(rowIndex)("LogDate"), Date)
            If (weekStartedOn = Date.MinValue) Then
                weekStartedOn = thisDate
                firstDay = thisDate
            End If
            If thisDate.Subtract(weekStartedOn).Days >= 7 Then
                CreateWeeklyAverageRow(weeklyAveragesTable, weekCount, dailyExcerciseMinutesTotalForWeeklyAverage, daysSinceWeekStarted)
                weekCount += 1
                'Reset vars
                weekStartedOn = thisDate
                dailyExcerciseMinutesTotalForWeeklyAverage = 0
                daysSinceWeekStarted = 0
            End If
            dailyExcerciseMinutesTotalForWeeklyAverage += CType(userData.Tables("LogSummary").Rows(rowIndex)("MinutesPerDay"), Double)
            daysSinceWeekStarted += 1
            minutesGrandTotal += CType(userData.Tables("LogSummary").Rows(rowIndex)("MinutesPerDay"), Double)
            daysGrandTotal += 1
            lastDay = thisDate
        Next
        CreateWeeklyAverageRow(weeklyAveragesTable, weekCount, dailyExcerciseMinutesTotalForWeeklyAverage, daysSinceWeekStarted)

        WeeklySummaryChart.Data.DataSource = userData
        WeeklySummaryChart.Data.DataMember = "WeeklyAverages"
        WeeklySummaryChart.Data.UseRowLabelsColumn = True
        WeeklySummaryChart.Data.RowLabelsColumn = 0
        WeeklySummaryChart.Data.SwapRowsAndColumns = True
        WeeklySummaryChart.Data.ZeroAligned = True
        '      WeeklySummaryChart.Axis.Y.StripLines.Visible = True
        '     WeeklySummaryChart.Axis.Y.StripLines.PE.FillGradientStyle = Infragistics.UltraChart.[Shared].Styles.GradientStyle.ForwardDiagonal
        WeeklySummaryChart.Data.DataBind()

        Dim grandMinutesAverageOnActiveDays As Double = minutesGrandTotal / daysGrandTotal
        Dim grandMinutesAverageOverPeriod As Double = minutesGrandTotal / (lastDay.Subtract(firstDay).Days + 1)

        goalWeeklyAverageHours.Text = ((goalDailyExcerciseMinutes * goalWeeklyExcerciseDays) / 60).ToString("#.##")
        currentWeeklyAverageHours.Text = (grandMinutesAverageOverPeriod / 60).ToString("#.##")

        Dim ratio As Double = grandMinutesAverageOverPeriod / (goalDailyExcerciseMinutes * goalWeeklyExcerciseDays)
        Dim goalStateText As String
        Dim goalState As Integer = 3
        If grandMinutesAverageOverPeriod = Double.PositiveInfinity Then
            goalState = 1
            goalStateText = "You haven't entered more entries in your health diary. Please enter some more and see where you stand!"
        Else
            Select Case ratio
                Case Is < 0.25
                    goalState = 0
                    goalStateText = "You are far behind your goals. Unless you take little more incentives for your health, you might as well end up like a fat lazy cat"
                Case Is < 0.5
                    goalState = 1
                    goalStateText = "You have just barely started working for your goals but you have still a way to go. Please speed up before you are just another fat kid!"
                Case Is < 0.75
                    goalState = 2
                    goalStateText = "You are trying and there is no denying. But Your goal ain't still close yet."
                Case Is < 1.0
                    goalState = 3
                    goalStateText = "Wow. You have been indeed working towards your goals. You still have to touch them but hey, looks like you are getting there!"
                Case Is < 1.25
                    goalState = 4
                    goalStateText = "Thumbs up for your great work. Keep it up!"
                Case Is < 1.5
                    goalState = 5
                    goalStateText = "You are a roll model for all others! Way to go!"
                Case Else
                    goalState = 6
                    goalStateText = "You have outdone yourself. How do you do that?"
            End Select
        End If
        GoalStateImage.ImageUrl = "goalstate" + goalState.ToString + ".gif"
        GoalStateLabel.Text = goalStateText
    End Sub

    Private Sub CreateWeeklyAverageRow(ByVal weeklyAveragesTable As DataTable, ByVal weekCount As Integer, ByVal dailyExcerciseMinutesTotal As Double, ByVal activeDaysCountInWeek As Integer)
        Dim newRow As DataRow = weeklyAveragesTable.NewRow
        weeklyAveragesTable.Rows.Add(newRow)

        newRow("WeekNumber") = weekCount.ToString
        newRow("WeekHoursTotal") = dailyExcerciseMinutesTotal
        newRow("WeekDaysTotal") = activeDaysCountInWeek
        newRow("WeekAverageHours") = dailyExcerciseMinutesTotal / activeDaysCountInWeek
    End Sub
End Class

