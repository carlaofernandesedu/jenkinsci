[CmdletBinding()]
Param(
   [Parameter(Mandatory=$True,Position=0,HelpMessage="nome do sistema")]
   [string]$Sistema,
   
   [Parameter(Mandatory=$True,Position=1,HelpMessage="nome do ambiente")]
   [string]$Ambiente,
   
   [Parameter(Mandatory=$True,Position=2,HelpMessage="workspace")]
   [string]$FolderBkp,
   
   [Parameter(Mandatory=$True,Position=3,HelpMessage="numero build")]
   [string]$NumeroBuild,
   
   [Parameter(Mandatory=$True,Position=4,HelpMessage="destino")]
   [string]$Destdeploy
)

$ErrorActionPreference = 'Stop'

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
$shordate = (Get-Date).toString("yyyyMMdd")
$SistemaValido = $false 
$FileBkp =  $FolderBkp + "\" + ($shordate) + "_"  + ($Sistema) + "_" + ($NumeroBuild) + ".zip"
$DestdeployGMUD = ''




if(
$Sistema -eq "genericdao" -Or 
$Sistema -eq "prodesp.dataaccess" -Or  
$Sistema -eq "securitygdae" -Or 
$Sistema -eq "utils" -Or 
$Sistema -eq "utilscgrh"
)
{
    #$Destdeploy = 'd:\' + ($Ambiente) + '\portalnet'
	#$Destdeploy = 'd:\' + ($Ambiente) + '\portalnet'
    $Source = "c:\sse\work\jks\release\" + ($Sistema)  +  "\drop\"  + ($Sistema)  +  ".zip"
    $SistemaValido = $true 

}
else
 {
    #$Destdeploy = 'd:\' + ($Ambiente) + '\portalnet'
	#$Destdeploy = 'd:\' + ($Ambiente) + '\portalnet'
    $Source = "c:\sse\work\jks\release\" + ($Sistema)  +  "\drop\portalnet.zip"
    $SistemaValido = $true 
}


Write-host 'sistema:' $Sistema
Write-host 'ambiente:' $Ambiente
Write-host 'numerobuild:' $NumeroBuild
Write-host 'source:' $Source 
Write-host 'filebkp:' $FileBkp
Write-host 'destdeploy:' $Destdeploy




if ($SistemaValido)
{
   if(Test-Path $FileBkp)
   {
     Write-Host "Usando o backup do pacote para deploy"
	 $Source = $FileBkp
   }
   else 
   {
	 Write-Host "Fazendo o backup do pacote"
     Copy-Item $Source $FileBkp -Force -Recurse
   }
   Write-Host "Fazendo o deploy"
   Deploy-Website $Source $Server $DestDeploy  $User $Pwd  $InstallMS
   
}
else 
{
    Write-Host "Sistema nao cadastrado! Favor verificar" 
    exit 1 
}