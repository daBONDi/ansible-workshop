＜powershell＞
  Invoke-WebRequest -Uri https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1 -OutFile ConfigureRemotingForAnsible.ps1
  powershell -ExecutionPolicy RemoteSigned .\ConfigureRemotingForAnsible.ps1
  $admin = [ADSI]("WinNT://./administrator, user")
  $admin.SetPassword("{{ administrator_password }}")
＜/powershell＞