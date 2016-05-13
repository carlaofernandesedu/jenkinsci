[CmdletBinding()]
Param(
   [Parameter(Mandatory=$True,Position=0,HelpMessage="caminho da pasta para o zip")]
   [string]$folder,

   [Parameter(Mandatory=$True,Position=1,HelpMessage="nome do zip")]
   [string]$zipname,
      
   [Parameter(Mandatory=$True,Position=2,HelpMessage="numero do build")]
   [string]$buildnumber
)


function Extract-ZIPFile($SourceFolderZip, $DestFolderZip)
{
    Add-Type -AssemblyName "system.io.compression.filesystem"
    [io.compression.zipfile]::ExtractToDirectory((Get-ChildItem $SourceFolderZip)[0].FullName, $DestFolderZip) 
}
function Compress-ZIPFile($FolderToZip, $PathFileZip,$IncluirDir)
{
    Add-Type -AssemblyName "system.io.compression.filesystem"
    [io.compression.zipfile]::CreateFromDirectory($FolderToZip, $PathFileZip, "optimal", $IncluirDir) 
}

$ErrorActionPreference = 'Stop'

$ZipDir = "d:\"
$ZipFile = $ZipDir + "" +  $zipname + '.zip'
$FileLog = "d:\" + $zipname + "_" + $buildnumber + ".txt" 
$shordate = (Get-Date).toString("yyyyMMdd_hhmmss")


Write-Host "zipfile:"  ($Zipfile)
Write-Host "foldertozip:"  $folder
Write-Host "zipname:"  $zipname
Write-Host "buildnumber:"  $buildnumber 
Write-Host "filelog:"  ($Filelog)
Write-Host "short:" $shordate

Write-Host "===================================================================================="
Write-Host "Obtendo as informações da pasta a ser compactada -> "  $folder
Write-Host "===================================================================================="
Write-Host " "
Write-Host "Arquivos existentes no pacote"
$listdlls = $folder + '\bin\*.dll'
$listfolders = $folder +  '\paginas'
get-Childitem $listdlls 
get-ChildItem -Directory -Path $listfolders 
Write-Host "===================================================================================="
Write-Host "Gerando o arquivo de Log "  $FileLog  " a partir do conteudo da pasta:" $folder
Write-Host "===================================================================================="
if (Test-Path $Zipfile) 
{
    Write-Host " " 
    Write-Host "===================================================================================="
    Write-Host 'Excluindo arquivo zip do build anterior info:'  $Zipfile
    Write-Host "===================================================================================="
    Remove-Item $Zipfile
}

Get-ChildItem  -Path $folder -Recurse  >> $FileLog
Write-Host "===================================================================================="
Write-Host "Iniciando a compressao da pasta " ($folder)  "..."
Write-Host "===================================================================================="
Compress-ZIPFile $folder $ZipFile $True 
Write-Host "===================================================================================="
Write-Host "Compressao da pasta concluida." 
Write-Host "===================================================================================="
Write-Host "O Arquivo" (Get-Item $ZipFile).FullName " foi criado em " (Get-Item $ZipFile).LastWriteTime  " com tamanho " (Get-Item $ZipFile).Length
Write-Host "===================================================================================="

