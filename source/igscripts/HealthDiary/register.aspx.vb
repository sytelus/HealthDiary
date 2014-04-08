Imports Sytel.SyFastPage
Imports Sytel
Imports System.Web.Security

Public Class register
    Inherits HealthDiaryPageBase

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents PasswordTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents UserNameTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents NoLoginPanel As System.Web.UI.WebControls.Panel
    Protected WithEvents FullNameTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents RetypePasswordTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents CreateAccountButton As System.Web.UI.WebControls.Button
    Protected WithEvents RequiredFieldValidator1 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents RequiredFieldValidator2 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents CompareValidator1 As System.Web.UI.WebControls.CompareValidator

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
        Me.PageHeading = "Create My Account"
        Me.PageTitle = "Register"
    End Sub

    Private Sub CreateAccountButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CreateAccountButton.Click
        Dim dataInstance As New AppData
        Dim userAccountData As DataSet = dataInstance.GetTableData("UserAccount", New String() {"ID"}, New Object() {-1})
        Dim newRow As DataRow = userAccountData.Tables("UserAccount").NewRow
        newRow("FullName") = FullNameTextBox.Text
        newRow("LoginName") = UserNameTextBox.Text
        newRow("Email") = UserNameTextBox.Text
        newRow("UserPassword") = PasswordTextBox.Text
        newRow("SetupState") = 0
        newRow("GroupID") = 1
        newRow("Notes") = ""
        userAccountData.Tables("UserAccount").Rows.Add(newRow)
        dataInstance.UpdateTableData(userAccountData, "UserAccount")

        If LoginBox.AuthenticateUser(UserNameTextBox.Text, PasswordTextBox.Text, Me) = True Then
            Response.Redirect("goal.aspx")
        End If
    End Sub
End Class
