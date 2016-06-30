[CmdletBinding()]
Param(
   [Parameter(Mandatory=$True,Position=1,HelpMessage="dirorigem")]
   [string]$dirorigem,
   [Parameter(Mandatory=$True,Position=2,HelpMessage="dirdestino")]
   [string]$dirdestino
)

$ErrorActionPreference = 'Stop'

function Gravar-Backup($origem,$destino)
{
   #Verificando a pasta de publicacao

   $fdata =  get-date -uformat "%Y%m%d"
   $arquivozip = $destino + '\backup' + $fdata + '.zip'
   if(Test-Path $arquivozip)
   {
        Remove-Item $arquivozip
   }
   if(Test-Path $origem)
   {
     Compress-ZIPFile $origem $arquivozip $False
   }
   
}

function Compress-ZIPFile($FolderToZip, $PathFileZip,$IncluirDir)
{
    Add-Type -AssemblyName "system.io.compression.filesystem"
    [io.compression.zipfile]::CreateFromDirectory($FolderToZip, $PathFileZip, "optimal", $IncluirDir) 
}

Gravar-Backup $dirorigem $dirdestino