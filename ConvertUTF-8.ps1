#region Parameters
param(
 # (Optional) The directory
 [string]$Dir = "."
)
#endregion
 
# You'll need to have your console set to CP 65001 AND use NSimSun as your
# font if you want any hope of displaying CJK characters in your console...
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
 
$files = Get-ChildItem -File -Path $Dir -Recurse -Name
 
foreach ($f in $files) {
  $bytes = [System.Text.Encoding]::GetEncoding(1252).GetBytes($f)
  $nf = [io.path]::GetFileName([System.Text.Encoding]::UTF8.GetString($bytes))
  Write-Host "$f" ? "$nf" # [$hex]
  # Must use -LiteralPath else files that contain '[' or ']' in their name produce an 
  error
  Rename-Item -LiteralPath "$f" -NewName "$nf"
}
 
# Produce a "Press any key" message when ran with right click
$auxRegKey='\SOFTWARE\Classes\Microsoft.PowerShellScript.1\Shell\0\Command'
$auxRegVal=(get-itemproperty -literalpath HKLM:$auxRegKey).'(default)'
$auxRegCmd=$auxRegVal.Split(' ',3)[2].Replace('%1', $MyInvocation.MyCommand.Definition)
if ("`"$($myinvocation.Line)`"" -eq $auxRegCmd) {
  Write-Host "`nPress any key to exit..."
  $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
}