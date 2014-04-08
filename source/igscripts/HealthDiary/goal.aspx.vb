Imports Sytel.SyFastPage
Imports Sytel

Public Class goal
    Inherits HealthDiaryPageBase

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents db_GoalPurposeID As System.Web.UI.WebControls.DropDownList
    Protected WithEvents db_WeeklyExcerciseDays As System.Web.UI.WebControls.TextBox
    Protected WithEvents db_SleepHours As System.Web.UI.WebControls.TextBox
    Protected WithEvents db_WaterIntake As System.Web.UI.WebControls.TextBox
    Protected WithEvents UpdateButton As System.Web.UI.WebControls.Button
    Protected WithEvents db_UserAccountID As System.Web.UI.HtmlControls.HtmlInputHidden
    Protected WithEvents FormPanel As System.Web.UI.WebControls.Panel
    Protected WithEvents UpdatePreAssessmentsLinkButton As System.Web.UI.WebControls.LinkButton
    Protected WithEvents UpdateDiaryLinkButton As System.Web.UI.WebControls.LinkButton
    Protected WithEvents UpdateSuccessPanel As System.Web.UI.WebControls.Panel
    Protected WithEvents db_DailyExcerciseMinutes As System.Web.UI.WebControls.TextBox

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Dim m_goalDataSet As DataSet
    Dim m_goalInfoRow As DataRow
    Dim m_dataInstance As New AppData

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.PageHeading = "Set Your Goals"
        Me.PageTitle = "Goals"

        'Get the goal data for current user
        m_goalDataSet = m_dataInstance.GetTableData("Goal", New String() {"UserAccountID"}, New Object() {Me.GetUserAccountID})

        If m_goalDataSet.Tables("Goal").Rows.Count = 0 Then
            m_goalInfoRow = m_goalDataSet.Tables("Goal").NewRow
            m_goalDataSet.Tables("Goal").Rows.Add(m_goalInfoRow)
            'Setup default values
            DataCommon.LoadRowValues(m_goalInfoRow, New String() {"UserAccountID", "WaterIntake", "SleepHours", "GoalPurposeID"}, New Object() {Me.GetUserAccountID, 10, 9, 2})
        Else
            m_goalInfoRow = m_goalDataSet.Tables("Goal").Rows(0)
        End If

        If Me.IsPostBack = False Then
            WebUIHelper.FillListFromDataBase(db_GoalPurposeID, m_dataInstance, "GoalPurpose", "ID", "Purpose")
            WebUIHelper.SetControlValuesFromRow(m_goalInfoRow)
        End If
    End Sub

    Private Sub UpdateButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles UpdateButton.Click
        WebUIHelper.SetControlValuesToRow(m_goalInfoRow)
        m_dataInstance.UpdateTableData(m_goalDataSet, "Goal")
        If Me.GetCurrentUserSetupState = 0 Then
            Me.UpdateUserAccountSetupState(m_dataInstance, 1)
            Response.Redirect("PreAssessment.aspx")
        Else
            FormPanel.Visible = False
            UpdateSuccessPanel.Visible = True
        End If
    End Sub

    Private Sub UpdateDiaryLinkButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles UpdateDiaryLinkButton.Click
        Response.Redirect("diary.aspx")
    End Sub

    Private Sub UpdatePreAssessmentsLinkButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles UpdatePreAssessmentsLinkButton.Click
        Response.Redirect("preassessment.aspx")
    End Sub
End Class
