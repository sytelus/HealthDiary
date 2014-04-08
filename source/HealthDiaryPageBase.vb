Imports Sytel.SyFastPage

Public Class HealthDiaryPageBase
    Inherits Sytel.SyFastPage.PageTemplate

    Public Function GetUserAccountID() As Integer
        Return CType(Me.User.Identity.Name, Integer)
    End Function

    Public Sub UpdateUserAccountSetupState(ByVal dataInstance As appdata, ByVal newSetupState As Integer)
        Dim loginData As DataSet = dataInstance.GetTableData("UserAccount", New String() {"ID"}, New Object() {Me.GetUserAccountID})
        loginData.Tables("UserAccount").Rows(0)("SetupState") = newSetupState
        dataInstance.UpdateTableData(loginData, "UserAccount")
        Session("UserInfoRow") = loginData.Tables("UserAccount").Rows(0)
    End Sub

    Public Function GetCurrentUserSetupState() As Integer
        Return CType(DirectCast(Session("UserInfoRow"), DataRow)("SetupState"), Integer)
    End Function
End Class
