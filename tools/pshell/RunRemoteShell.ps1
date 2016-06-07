[CmdletBinding()]
Param(
   [Parameter(Mandatory=$True,Position=1,HelpMessage="comando")]
   [string]$Comando,
   
   [Parameter(Mandatory=$True,Position=2,HelpMessage="numero build")]
   [string]$NumeroBuild

)

$ErrorActionPreference = 'Stop'

function Deploy-Website($Package, $Server, $DestDeploy, $Username, $Password,$PathTools,$Comando) 
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
        "-enableRule:DoNotDeleteRule",
        "-postSync:runCommand='$InfoComando',waitInterval=150000,waitAttempts=1")
    
    Write-Host $InstallPath $arguments
    $process = Start-Process $InstallPath -ArgumentList $arguments -NoNewWindow -PassThru -Wait
    exit $process.ExitCode 
    #& $InstallPath $arguments 
    #exit 0
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
$InstallMS = "C:\sse\tools\msdeploy"
$Source = "c:\sse\work\jks\compress\1.zip"
$Destdeploy = 'd:\sourcegmud\pacotes'
$InfoComando = 'd:\ci\pshell\' + ($Comando) + " " + ($NumeroBuild)


Write-host 'comando:' $InfoComando
Write-host 'numerobuild:' $NumeroBuild
Write-host 'source:' $Source 
Write-host 'destdeploy:' $Destdeploy

Deploy-Website $Source $Server $DestDeploy  $User $Pwd  $InstallMS


