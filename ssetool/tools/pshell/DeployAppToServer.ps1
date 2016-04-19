﻿[CmdletBinding()]
Param(
   [Parameter(Mandatory=$True,Position=0,HelpMessage="nome do sistema")]
   [string]$Sistema,
   
   [Parameter(Mandatory=$True,Position=1,HelpMessage="nome do ambiente")]
   [string]$Ambiente

)


function Deploy-Website($Package, $Server, $DestDeploy, $Username, $Password,$PathTools) 
{

try 
{

    $InstallPath = $PathTools + '\msdeploy.exe'
    if(!$InstallPath -or !(Test-Path $InstallPath)) {
       throw "Could not find MSDeploy. Use Web Platform Installer to install the 'Web Deployment Tool' and re-run this command"
    }
    $IISSite = 'Default%20Web%20Site'
    $PublishUrl = "https://$($Server):8172/MSDeploy.axd?site=$($IISSite)"

    # DEPLOY!
    Write-Host "Deploying package de ($Package)  para  ($DestDeploy) "
    #-verb:sync -source:package='$(DropFolder)\$(ZipName).zip' -dest:contentPath='$(DestDeploy)',computerName='https://10.200.240.19:8172/msdeploy.axd?site=Default%20Web%20Site',UserName='tfsdeploy',Password='Desp@2015',AuthType='NTLM' -allowUntrusted -enableRule:DoNotDeleteRule
    $arguments = [string[]]@(
        "-verb:sync",
        "-source:package='$Package'",
        "-dest:contentPath='$DestDeploy',computerName='$PublishUrl',userName='$UserName',password='$Password',authtype='NTLM'",
        "-allowUntrusted",
        "-enableRule:DoNotDeleteRule")
    
    Write-Host $InstallPath $arguments
    #Start-Process $InstallPath -ArgumentList $arguments -NoNewWindow -Wait
    #& $InstallPath $arguments 
    exit 0 
}
catch [Exception]
    {
        Write-Host 'ERRO NA EXECUCAO DO SCRIPT:' $_.Exception.Message
        exit 1 
        return 
    }    

}


$Server = "10.200.240.19"
$User = "tfsdeploy"
$Pwd = "Desp@2015"
$InstallMS = "C:\vsoagent\tools\msdeploy"
$SistemaValido = $false 

$Source = "c:\sse\work\jks\release\" + ($Sistema)  +  "\drop\"  + ($Sistema)  +  ".zip"

if($Sistema -eq "genericdao")
{
    $Destdeploy = 'd:\' + ($Ambiente) + '\portalnet'
    $SistemaValido = $true 

}

if ($SistemaValido)
{
   Deploy-Website $Source $Server $DestDeploy  $User $Pwd  $InstallMS
}
else 
{
    Write-Host "Sistema nao cadastrado! Favor verificar" 
    exit 1 
}