[CmdletBinding()]
Param(
   [Parameter(Mandatory=$True,Position=0,HelpMessage="caminho do codigo fonte")]
   [string]$sourcerootfolder,
   
   [Parameter(Mandatory=$True,Position=1,HelpMessage="nome do modulo usado para compor a pasta de publicacao e arquivo zip")]
   [string]$appname,

   [Parameter(Mandatory=$True,Position=2,HelpMessage="arquivos array das pasta bin que serao enviados")]
   [string[]]$keepbinfiles

)


$publishrootfolder = 'c:\pst\destino'
#$publishrootfolder = 'c:\sse\work\jks\dev\' + $appname  +  '\drop'
#$publishrootfolder = 'c:\sse\work\jks\dev\genericdao\drop'


Write-host 'source:' $sourcerootfolder
Write-host 'publish:' $publishrootfolder
Write-host 'aplicacao:' $appname
Write-host 'keppbinfiles:' $keepbinfiles


function ZIP-AppLib($SourceFolder,$PubRootFolder,$Sistema,$KeepBINFiles)
{
    try 
    {
        #Verificando a pasta de publicacao
        if(Test-Path $PubRootFolder)
        {
            #Apagar dados gerados de geracao anterior 
            $FilesPubRootFolder = $PubRootFolder + '\*.*'
            Write-Host 'Excluindo arquivos build anterior'  $FilesPubRootFolder
            Remove-Item $FilesPubRootFolder            
            #Copiar os arquivos gerados no pasta source
            Write-Host 'Copiando arquivos de' $SourceFolder 'para' $PubRootFolder
            Copy-Item $SourceFolder $PubRootFolder -Force -Recurse
            #Verificar restrição de arquivos definidos para o pacote 
            $FolderBINExclusao = $PubRootFolder + '\bin\*.*'
            Write-Host 'Excluindo os arquivos da pasta' $FolderBINExclusao 'mantendo os arquivos' $KeepBINFiles
            Remove-Item $FolderBINExclusao -Exclude $KeepBINFiles 
            #Gerar o arquivo zip 
            $ZipFile = $PubRootFolder + '\' + $Sistema + '.zip'
            Write-Host 'Gerando o arquivo ZIP' $ZipFile
            $FolderBINExclusao = $PubRootFolder + '\bin'
            Compress-ZIPFile $PubRootFolder $ZipFile
            #Remover os arquivos desnecessários
        
                Foreach($ItemRootExclusao in (Get-ChildItem $PubRootFolder -Recurse -File))
                { 
                    if($ZipFile -ne $ItemRootExclusao.FullName)
                    {
                        Write-Host 'Removendo o arquivo' $ItemRootExclusao.FullName
                        Remove-Item $ItemRootExclusao.FullName 
                    }
                }
                Foreach($ItemRootExclusao in (Get-ChildItem $PubRootFolder -Directory))
                { 
                    Write-Host 'Removendo o diretorio' $ItemRootExclusao.FullName
                    Remove-Item $ItemRootExclusao.FullName -Recurse 
                }
                exit 0         
        }
        else 
        {
          Write-Host 'Caminho de publicacao informado incorretamente' $PubRootFolder
          exit 1
          return  
        }

    }
    catch [Exception]
    {
        Write-Host 'ERRO NA EXECUCAO DO SCRIPT:' $_.Exception.Message
        exit 1 
        return 
    }      
}

function ZIP-AppWeb($SourceFolder,$PubRootFolder,$Sistema,$KeepBINFiles)
{
    try 
    {
        #Apagar dados gerados de geracao anterior 
        $FilesPubRootFolder = $PubRootFolder + '\*.*'
        Write-Host 'Excluindo arquivos build anterior'  $FilesPubRootFolder
        #Copiar os arquivos gerados na pasta source
        $PubStageFolder = $PubRootFolder + '\stage'
        Write-Host 'Copiando arquivos de' $SourceFolder 'para' $PubStageFolder
        Copy-Item $SourceFolder $PubStageFolder -Recurse
        #Verificar restrição de arquivos definidos para o pacote 
        $FolderBINExclusao = $PubStageFolder + '\bin\*.*'
        Write-Host 'Excluindo os arquivos da pasta' $FolderBINExclusao 'mantendo os arquivos' $KeepBINFiles
        Remove-Item $FolderBINExclusao -Exclude $KeepBINFiles 
        #Gerar o arquivo zip 
        $ZipFile = $PubRootFolder + '\' + $Sistema + '.zip'
        Write-Host 'Gerando o arquivo ZIP' $ZipFile
        Compress-ZIPFile $PubStageFolder $ZipFile
        #Remover os arquivos desnecessários
            Foreach($ItemRootExclusao in (Get-ChildItem $PubRootFolder -Recurse -File))
            { 
                if($ZipFile -ne $ItemRootExclusao.FullName)
                {
                    Write-Host 'Removendo o arquivo' $ItemRootExclusao.FullName
                    Remove-Item $ItemRootExclusao.FullName 
                }
            }
            Foreach($ItemRootExclusao in (Get-ChildItem $PubRootFolder -Directory))
            { 
                Write-Host 'Removendo o diretorio' $ItemRootExclusao.FullName
                Remove-Item $ItemRootExclusao.FullName -Recurse 
            }
            exit 0 
    }
    catch [Exception]
    {
        Write-Host 'ERRO NA EXECUCAO DO SCRIPT:' $_.Exception.Message
        exit 1 
        return 
    }      
    
}

function ZIP-AppModuloNet()
{
    try 
    {
        #Apagar dados gerados de geracao anterior 
        $FilesPubRootFolder = $PubRootFolder + '\*.*'
        Write-Host 'Excluindo arquivos build anterior'  $FilesPubRootFolder
        $FolderNet =  $PubRootFolder + '\paginas\' + $Modulo + '.Pages'
        $SourceBinFolder = $PubRootFolder + '\paginas\bin' 
        #Criar as pastas paginas/<Modulo>.Pages e bin
        Write-Host 'Criando a pasta' $FolderNet
        New-Item $FolderNet -ItemType directory -Force 
        #Copiar os arquivos binarios gerados no pasta \paginas\bin
        Copy-Item $SourceBinFolder $PubRootFolder -Force 
        #Verificar restrição de arquivos definidos para o pacote 
        $FolderBINExclusao = $PubRootFolder + '\bin\*.*'
        Write-Host 'Excluir os arquivos da pasta' $FolderBINExclusao 'mantendo os arquivos' $KeepBINFiles
        Remove-Item $FolderBINExclusao -Exclude $KeepBINFiles 
        #Gerar o arquivo zip 
        $ZipFile = $PubRootFolder + '\' + $Sistema + '.zip'
        Write-Host 'Gerando o arquivo ZIP' $ZipFile
        New-Item $ZipFile -ItemType File -Force 
        #Remover os arquivos desnecessários
            Foreach($ItemRootExclusao in (Get-ChildItem $PubRootFolder -Recurse -File))
            { 
                if($ZipFile -ne $ItemRootExclusao.FullName)
                {
                    Write-Host 'Removendo o arquivo' $ItemRootExclusao.FullName
                    Remove-Item $ItemRootExclusao.FullName 
                }
            }
            Foreach($ItemRootExclusao in (Get-ChildItem $PubRootFolder -Directory))
            { 
                Write-Host 'Removendo o diretorio' $ItemRootExclusao.FullName
                Remove-Item $ItemRootExclusao.FullName -Recurse 
            }
            exit 0 
    }
    catch [Exception]
    {
        Write-Host 'ERRO NA EXECUCAO DO SCRIPT:' $_.Exception.Message
        exit 1 
        return 
    }      

}

function Extract-ZIPFile($SourceFolderZip, $DestFolderZip)
{
    Add-Type -AssemblyName "system.io.compression.filesystem"
    [io.compression.zipfile]::ExtractToDirectory((Get-ChildItem $SourceFolderZip)[0].FullName, $DestFolderZip) 
}
function Compress-ZIPFile($FolderToZip, $PathFileZip)
{
    Add-Type -AssemblyName "system.io.compression.filesystem"
    [io.compression.zipfile]::CreateFromDirectory($FolderToZip, $PathFileZip) 
}


ZIP-AppLib $sourcerootfolder $publishrootfolder $appname $keepbinfiles



