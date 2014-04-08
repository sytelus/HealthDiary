Imports Sytel.SyFastPage
Imports Sytel


Public Class diary
    Inherits HealthDiaryPageBase


#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Calendar1 As System.Web.UI.WebControls.Calendar
    Protected WithEvents ActivityLogGrid As Infragistics.WebUI.UltraWebGrid.UltraWebGrid
    Protected WithEvents RangeValidator1 As System.Web.UI.WebControls.RangeValidator
    Protected WithEvents SaveChangesButton As System.Web.UI.WebControls.Button

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region
    Dim m_pageDataSet As DataSet
    Dim m_pageDataInfoRow As DataRow
    Dim m_dataInstance As New AppData
    Private Const PageTableName As String = "DailyLogPhysicalActivity"

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.PageHeading = "My Health Diary"
        Me.PageTitle = "Activity Log"

        'Get the goal data for current user
        m_pageDataSet = m_dataInstance.GetTableData(PageTableName, New String() {"UserAccountID"}, New Object() {Me.GetUserAccountID})

        ActivityLogGrid.DataSource = m_pageDataSet
        ActivityLogGrid.DataMember = "DailyLogPhysicalActivity"

        Dim activitiesDataSet As DataSet = m_dataInstance.GetTableData("PhysicalActivity")
        ActivityLogGrid.Columns(0).ValueList.DataSource = activitiesDataSet
        ActivityLogGrid.Columns(0).ValueList.DisplayMember = "PhysicalActivity"
        ActivityLogGrid.Columns(0).ValueList.DisplayMember = "DisplayName"
        ActivityLogGrid.Columns(0).ValueList.ValueMember = "ID"
        ActivityLogGrid.Columns(0).ValueList.DataBind()

        ActivityLogGrid.DataBind()

        ActivityLogGrid.Bands(0).AddButtonCaption = "Add a new diary entry"
        ActivityLogGrid.Bands(0).AddButtonToolTipText = "Click here to record an entry for th physical activity you performed"
    End Sub

    Private Sub ActivityLogGrid_InitializeLayout(ByVal sender As System.Object, ByVal e As Infragistics.WebUI.UltraWebGrid.LayoutEventArgs) Handles ActivityLogGrid.InitializeLayout

    End Sub

    Private Sub ActivityLogGrid_ClickCellButton(ByVal sender As Object, ByVal e As Infragistics.WebUI.UltraWebGrid.CellEventArgs) Handles ActivityLogGrid.ClickCellButton
        If e.Cell.Column Is ActivityLogGrid.Columns(3) Then
            e.Cell.Row.Delete()
        End If
    End Sub


    Private Sub SaveChangesButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SaveChangesButton.Click

    End Sub
End Class
