Imports Sytel.SyFastPage
Imports Sytel


Public Class PreAssessment
    Inherits HealthDiaryPageBase


#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents UpdateButton As System.Web.UI.WebControls.Button
    Protected WithEvents db_WaterIntake As System.Web.UI.WebControls.TextBox
    Protected WithEvents db_SleepHours As System.Web.UI.WebControls.TextBox
    Protected WithEvents FormPanel As System.Web.UI.WebControls.Panel
    Protected WithEvents db_UserAccountID As System.Web.UI.HtmlControls.HtmlInputHidden
    Protected WithEvents UpdatePreAssessmentsLinkButton As System.Web.UI.WebControls.LinkButton
    Protected WithEvents UpdateDiaryLinkButton As System.Web.UI.WebControls.LinkButton
    Protected WithEvents UpdateSuccessPanel As System.Web.UI.WebControls.Panel
    Protected WithEvents db_Weight As System.Web.UI.WebControls.TextBox
    Protected WithEvents db_Height As System.Web.UI.WebControls.TextBox
    Protected WithEvents db_WeeklyExcerciseDays As System.Web.UI.WebControls.TextBox
    Protected WithEvents db_DailyExcerciseMinutes As System.Web.UI.WebControls.TextBox
    Protected WithEvents RangeValidator4 As System.Web.UI.WebControls.RangeValidator
    Protected WithEvents RangeValidator3 As System.Web.UI.WebControls.RangeValidator
    Protected WithEvents RangeValidator2 As System.Web.UI.WebControls.RangeValidator
    Protected WithEvents RangeValidator1 As System.Web.UI.WebControls.RangeValidator
    Protected WithEvents RangeValidator5 As System.Web.UI.WebControls.RangeValidator
    Protected WithEvents RangeValidator6 As System.Web.UI.WebControls.RangeValidator

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
    Private Const PageTableName As String = "PreAssessment"

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.PageHeading = "My Preassessment"
        Me.PageTitle = "Preassessment"

        'Get the goal data for current user
        m_pageDataSet = m_dataInstance.GetTableData(PageTableName, New String() {"UserAccountID"}, New Object() {Me.GetUserAccountID})

        If m_pageDataSet.Tables(PageTableName).Rows.Count = 0 Then
            m_pageDataInfoRow = m_pageDataSet.Tables(PageTableName).NewRow
            m_pageDataSet.Tables(PageTableName).Rows.Add(m_pageDataInfoRow)
            'Set default values
            DataCommon.LoadRowValues(m_pageDataInfoRow, New String() {"UserAccountID", "WaterIntake", "SleepHours"}, New Object() {Me.GetUserAccountID, 75, 9})
        Else
            m_pageDataInfoRow = m_pageDataSet.Tables(PageTableName).Rows(0)
        End If

        If Me.IsPostBack = False Then
            WebUIHelper.SetControlValuesFromRow(m_pageDataInfoRow)
        End If
    End Sub

    Private Sub UpdatePreAssessmentsLinkButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles UpdatePreAssessmentsLinkButton.Click
        response.Redirect("goal.aspx")
    End Sub

    Private Sub UpdateDiaryLinkButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles UpdateDiaryLinkButton.Click
        Response.Redirect("diary.aspx")
    End Sub

    Private Sub UpdateButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles UpdateButton.Click
        WebUIHelper.SetControlValuesToRow(m_pageDataInfoRow)
        m_dataInstance.UpdateTableData(m_pageDataSet, PageTableName)
        If Me.GetCurrentUserSetupState < 2 Then
            Me.UpdateUserAccountSetupState(m_dataInstance, 2)
            Response.Redirect("diary.aspx")
        Else
            FormPanel.Visible = False
            UpdateSuccessPanel.Visible = True
        End If
    End Sub
End Class
