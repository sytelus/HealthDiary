Imports Sytel.SyFastPage
Imports Sytel
Imports Infragistics.WebUI.UltraWebGrid

Public Class diary
    Inherits HealthDiaryPageBase

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents ActivityLogGrid As Infragistics.WebUI.UltraWebGrid.UltraWebGrid
    Protected WithEvents RangeValidator1 As System.Web.UI.WebControls.RangeValidator
    Protected WithEvents SaveChangesButton As System.Web.UI.WebControls.Button
    Protected WithEvents DiaryCalendar As Infragistics.WebUI.WebSchedule.WebCalendar
    Protected WithEvents LinkButton1 As System.Web.UI.WebControls.LinkButton
    Protected WithEvents WebCombo1 As Infragistics.WebUI.WebCombo.WebCombo

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private Const PageTableName As String = "DailyLogPhysicalActivity"

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.PageHeading = "My Health Diary"
        Me.PageTitle = "Activity Log"

        If Me.IsPostBack = False Then
            DiaryCalendar.SelectedDate = Now.Date
            LoadActivityGridForSelectedDate()
        End If
    End Sub

    Private Sub LoadActivityGridForSelectedDate()
        Dim pageDataSet As DataSet
        Dim pageDataInfoRow As DataRow
        Dim dataInstance As New AppData

        'Get the goal data for current user
        pageDataSet = dataInstance.GetTableData(PageTableName, New String() {"UserAccountID", "LogDate"}, New Object() {Me.GetUserAccountID, DiaryCalendar.SelectedDate})

        Dim activitiesDataSet As DataSet = dataInstance.GetTableData("PhysicalActivity")
        ActivityLogGrid.Columns(0).ValueList.DataSource = activitiesDataSet
        ActivityLogGrid.Columns(0).ValueList.DisplayMember = "PhysicalActivity"
        ActivityLogGrid.Columns(0).ValueList.DisplayMember = "DisplayName"
        ActivityLogGrid.Columns(0).ValueList.ValueMember = "ID"
        ActivityLogGrid.Columns(0).ValueList.DataBind()

        If pageDataSet.Tables(PageTableName).Rows.Count = 0 Then
            pageDataSet.Tables(PageTableName).Rows.Add(pageDataSet.Tables(PageTableName).NewRow)
            pageDataSet.Tables(PageTableName).Rows.Add(pageDataSet.Tables(PageTableName).NewRow)
            pageDataSet.Tables(PageTableName).Rows.Add(pageDataSet.Tables(PageTableName).NewRow)
        End If
        ActivityLogGrid.DataSource = pageDataSet
        ActivityLogGrid.DataMember = PageTableName
        ActivityLogGrid.DataBind()

        ActivityLogGrid.Bands(0).AddButtonCaption = "Add a new diary entry"
        ActivityLogGrid.Bands(0).AddButtonToolTipText = "Click here to record an entry for th physical activity you performed"
    End Sub

    Private Function SafeValue(ByVal oldValue As Object, ByVal alternateValue As Object) As Object
        If oldValue Is Nothing Then
            Return alternateValue
        Else
            Return oldValue
        End If
    End Function

    Private Sub SaveChangesButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SaveChangesButton.Click
        Dim pageDataSet As DataSet
        Dim pageDataInfoRow As DataRow
        Dim dataInstance As New AppData

        'Get the goal data for current user
        'TODO : Multi user scenarios not programmed
        pageDataSet = dataInstance.GetTableData(PageTableName, New String() {"UserAccountID", "LogDate"}, New Object() {Me.GetUserAccountID, DiaryCalendar.SelectedDate})

        For Each gridRow As UltraGridRow In ActivityLogGrid.Rows
            Dim dataRow As DataRow = Nothing

            Dim newID As String = CType(SafeValue(gridRow.Cells.FromKey("ID").Value, ""), String)
            Dim newPhysicalActivityID As Integer = CType(SafeValue(gridRow.Cells.FromKey("PhysicalActivityID").Value, -1), Integer)
            Dim newMinutes As Integer = CType(SafeValue(gridRow.Cells.FromKey("Minutes").Value, -1), Integer)
            Dim newNotes As String = CType(SafeValue(gridRow.Cells.FromKey("Notes").Value, ""), String)
            Dim isDeleted As Boolean = CType(SafeValue(gridRow.Cells.FromKey("Delete").Value, False), Boolean)

            If newID = "" Then
                'New row
                If (newPhysicalActivityID <> -1) AndAlso (Not isDeleted) Then
                    'New row is not deleted, so add this row
                    dataRow = pageDataSet.Tables(PageTableName).NewRow
                    dataRow("LogDate") = DiaryCalendar.SelectedDate
                    dataRow("UserAccountID") = Me.GetUserAccountID
                    dataRow("ID") = Guid.NewGuid.ToString   ' dataRow("UserAccountID").ToString + DiaryCalendar.SelectedDate.ToString("yyyyMMDD")
                    pageDataSet.Tables(PageTableName).Rows.Add(dataRow)
                Else
                    'Ignore uninitialised or deleted new rows
                    dataRow = Nothing
                End If
            Else
                'This is existing row
                'TODO : multiuser scenario
                dataRow = pageDataSet.Tables(PageTableName).Select("ID = '" + newID.ToString + "'")(0)
            End If

            'Operate on the row
            If (Not (dataRow Is Nothing)) Then
                If (Not isDeleted) Then
                    'Lets see if row values were changed
                    If (dataRow.RowState = DataRowState.Added) OrElse (CType(dataRow("PhysicalActivityID"), Integer) <> newPhysicalActivityID) Then
                        dataRow("PhysicalActivityID") = newPhysicalActivityID
                    End If
                    If (dataRow.RowState = DataRowState.Added) OrElse (CType(dataRow("Minutes"), Integer) <> newMinutes) Then
                        dataRow("Minutes") = newMinutes
                    End If
                    If (dataRow.RowState = DataRowState.Added) OrElse (dataRow("Notes").ToString <> newNotes) Then
                        dataRow("Notes") = newNotes
                    End If
                Else
                    dataRow.Delete()
                End If
            Else
                'Unused rows
            End If
        Next

        dataInstance.UpdateTableData(pageDataSet, PageTableName)

        LoadActivityGridForSelectedDate()
    End Sub

    Private Sub DiaryCalendar_ValueChanged(ByVal sender As System.Object, ByVal e As Infragistics.WebUI.WebSchedule.ValueChangedEventArgs) Handles DiaryCalendar.ValueChanged
        LoadActivityGridForSelectedDate()
    End Sub

    Private Sub DiaryCalendar_VisibleMonthChanged(ByVal sender As Object, ByVal e As Infragistics.WebUI.WebSchedule.VisibleMonthChangedEventArgs) Handles DiaryCalendar.VisibleMonthChanged

    End Sub

    Private Sub LinkButton1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        Response.Redirect("evaluatenow.aspx")
    End Sub
End Class
