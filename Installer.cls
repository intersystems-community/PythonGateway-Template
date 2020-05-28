Class App.Installer
{

XData setup
{
<Manifest>
  <Default Name="SourceDir" Value="#{$system.Process.CurrentDirectory()}src"/>
  <Default Name="Namespace" Value="PYTHON"/>
  <Namespace Name="${Namespace}" Create="no">
    <Import File="${SourceDir}" Flags="ck" Recurse="1"/>
  </Namespace>
  <RunInstall Class="App.Installer" Method="DefaultNS"/>
</Manifest>
}

ClassMethod setup(ByRef pVars, pLogLevel As %Integer = 3, pInstaller As %Installer.Installer, pLogger As %Installer.AbstractLogger) As %Status [ CodeMode = objectgenerator, Internal ]
{
  #; Let XGL document generate code for this method. 
  Quit ##class(%Installer.Manifest).%Generate(%compiledclass, %code, "setup")
}

ClassMethod DefaultNS(pVars, pLogLevel, tInstaller) As %Status
{
	Set Namespace = tInstaller.Evaluate("${Namespace}")
	Do tInstaller.PushNS("%SYS")
	For user = "UnknownUser", "Admin", "SuperUser", "_SYSTEM", $username {
		Set tProps("NameSpace") = Namespace
		Set tSC = ##class(Security.Users).Modify(user, .tProps)
	}
	Do tInstaller.PopNS()
	Quit tSC
}

}
