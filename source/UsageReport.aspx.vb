Imports Sytel.SyFastPage
Imports Sytel


Public Class UsageReport
    Inherits HealthDiaryPageBase

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents UserAccountDataGrid As System.Web.UI.WebControls.DataGrid
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents UserCountLabel As System.Web.UI.WebControls.Label

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
        Me.PageHeading = "Usage Report"
        Me.PageTitle = "Usage Report"

        Dim dataInstance As New AppData
        Dim userData As DataSet = dataInstance.GetTableData("sql:SELECT UserAccount.FullName, UserAccount.Email, Choose([SetupState]+1,""Account Created"",""Pre-Assessment Complete"",""Diary Entries Made"") AS [Account Status],   (SELECT COUNT(*) FROM DAILYLogPhysicalActivity WHERE UserAccountID =UserAccount.ID) AS [Number Of Entries],  (SELECT MAX(LogDate) FROM DAILYLogPhysicalActivity WHERE UserAccountID = UserAccount.ID) AS [Last Entry On] FROM UserAccount", "UserAccountsInfo")

        UserAccountDataGrid.DataSource = userData.Tables("UserAccountsInfo")
        UserAccountDataGrid.DataBind()

        UserCountLabel.Text = userData.Tables("UserAccountsInfo").Rows.Count.ToString
    End Sub

End Class
