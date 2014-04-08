Public Class _default
    Inherits Sytel.SyFastPage.PageTemplate

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    Protected WithEvents LoginBox1 As LoginBox

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
        Me.PageHeading = "Welcome"
        Me.PageTitle = "Home"
    End Sub

    Private Sub LoginBox1_AuthenticationSuccess(ByVal userAccountID As String) Handles LoginBox1.AuthenticationSuccess
        Select Case DirectCast(DirectCast(Session("UserInfoRow"), DataRow)("SetupState"), Integer)
            Case 0  'No goals setup
                Response.Redirect("goal.aspx")
            Case 1  'No pre-assess setup
                Response.Redirect("Preassessment.aspx")
            Case Else   'Everything setup
                Response.Redirect("evaluatenow.aspx")
                Response.Redirect("diary.aspx")
        End Select
    End Sub
End Class
