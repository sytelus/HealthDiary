Imports Sytel.SyFastPage
Imports System.Data
Imports System.Web.Security
Imports System.Web.UI

Public Class LoginBox
    Inherits System.Web.UI.UserControl

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents UserNameTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents PasswordTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents Button1 As System.Web.UI.WebControls.Button
    Protected WithEvents LoginErrorLabel As System.Web.UI.WebControls.Label
    Protected WithEvents NoLoginPanel As System.Web.UI.WebControls.Panel
    Protected WithEvents LoggedOnPanel As System.Web.UI.WebControls.Panel
    Protected WithEvents LogOnNameLabel As System.Web.UI.WebControls.Label
    Protected WithEvents SignOutLinkButton As System.Web.UI.WebControls.LinkButton
    Protected WithEvents HyperLink1 As System.Web.UI.WebControls.HyperLink

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Public Event AuthenticationSuccess(ByVal userAccountID As String)

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'If Request.UrlReferrer Is Nothing Then
        '    UserNameTextBox.Text = "sytelus@yahoo.com"
        '    PasswordTextBox.Text = "a"
        '    Button1_Click(Nothing, Nothing)
        'End If

        LoggedOnPanel.Visible = Me.Page.User.Identity.IsAuthenticated
        NoLoginPanel.Visible = Not Me.Page.User.Identity.IsAuthenticated
        If LoggedOnPanel.Visible = True Then
            LogOnNameLabel.Text = DirectCast(Session("UserInfoRow"), DataRow)("FullName").ToString
        End If
    End Sub

    Public Shared Function AuthenticateUser(ByVal loginName As String, ByVal password As String, ByVal thisPage As UI.Page) As Boolean
        Dim isAuthenticated As Boolean = False
        Dim dataInstance As New AppData
        Dim loginData As DataSet = dataInstance.GetTableData("UserAccount", New String() {"LoginName", "UserPassword"}, New Object() {loginName, password})
        If (loginData.Tables.Contains("UserAccount") = False) OrElse (loginData.Tables("UserAccount").Rows.Count = 0) Then
            isAuthenticated = False
        Else
            Dim userInfoRow As DataRow = loginData.Tables("UserAccount").Rows(0)
            FormsAuthentication.SetAuthCookie(userInfoRow("ID").ToString, False)
            thisPage.Session("UserInfoRow") = userInfoRow
            isAuthenticated = True
        End If
        Return isAuthenticated
    End Function


    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        If AuthenticateUser(UserNameTextBox.Text, PasswordTextBox.Text, Me.Page) = False Then
            LoginErrorLabel.Visible = True
        Else
            RaiseEvent AuthenticationSuccess(DirectCast(Session("UserInfoRow"), DataRow)("ID").ToString)
        End If
    End Sub

    Private Sub SignOutLinkButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SignOutLinkButton.Click
        Session.Remove("UserInfoRow")
        FormsAuthentication.SignOut()
        Session.Abandon()
    End Sub
End Class
