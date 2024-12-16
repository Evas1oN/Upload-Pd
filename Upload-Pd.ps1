
<#PSScriptInfo

.VERSION 0.0.1

.GUID a05c3f15-0307-436d-9788-f2d59a78225f

.AUTHOR Evas1oN <evas1on.xd@gmail.com>

.COMPANYNAME

.COPYRIGHT

.TAGS pixeldrain file

.LICENSEURI

.PROJECTURI https://github.com/Evas1oN/Upload-Pd

.ICONURI

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES


.PRIVATEDATA

#>

<# 

.DESCRIPTION 
 Upload files with PowerShell to Pixeldrain 

#> 
Param
(
    [Parameter(Mandatory=$true)]
    [String] $FilePath,

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [String] $ApiKey = $env:PIXELDRAIN_API_KEY
)

$EncodedKey = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes(":$ApiKey"))

$Headers = @{
  Authorization = "Basic $EncodedKey"
}

$File = Get-Item($FilePath)

$Form = @{
  name = $File.Name;
  file = $File
}

$Response = (Invoke-WebRequest -Uri "https://pixeldrain.com/api/file" -Headers $Headers -Method "Post" -Form $Form)
Write-Output $Response

$FileId = ($Response.Content | ConvertFrom-Json).id

Set-Clipboard -Value "https://pixeldrain.com/u/$FileId"

