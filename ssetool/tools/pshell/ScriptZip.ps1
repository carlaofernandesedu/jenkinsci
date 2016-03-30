function ZIP-AppLib($SourceFolder,$PubRootFolder,$Sistema,$KeepBINFiles)
{
#Copiar os arquivos gerados no pasta source
Write-Host 'Copiar arquivos de' $SourceFolder 'para' $PubRootFolder
Copy-Item $SourceFolder $PubRootFolder -Force -Recurse
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

}

function ZIP-AppWeb($SourceFolder,$PubRootFolder,$Sistema,$KeepBINFiles)
{
#Copiar os arquivos gerados na pasta source
Write-Host 'Copiar arquivos de' $SourceFolder 'para' $PubRootFolder
Copy-Item $SourceFolder $PubRootFolder -Force 
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
}

function ZIP-AppModuloNet()
{
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
}



#LIB - Caso 1 Teste Sucesso ZIP-AppLib arquivos selecionados
remove-item d:\pst -Force -Recurse
new-item 'd:\pst\origem' -ItemType directory -Force
new-item 'd:\pst\origem\bin' -ItemType directory -Force
new-item 'd:\pst\origem\subpasta' -ItemType directory -Force
new-item 'd:\pst\destino' -ItemType directory -Force
new-item 'd:\pst\origem\bin\lib1.txt' -Value 'lib1'  -ItemType file -Force
new-item 'd:\pst\origem\bin\modulo.txt' -Value 'modulo'  -ItemType file -Force
new-item 'd:\pst\origem\bin\lib3.txt' -Value 'lib3'  -ItemType file -Force
new-item 'd:\pst\origem\bin\lib4.txt' -Value 'lib4'  -ItemType file -Force

#LIB - Caso 2 Teste Sucesso ZIP-AppLib arquivos todos
<#
remove-item d:\pst -Force -Recurse
new-item 'd:\pst\origem' -ItemType directory -Force
new-item 'd:\pst\origem\bin' -ItemType directory -Force
new-item 'd:\pst\origem\subpasta' -ItemType directory -Force
new-item 'd:\pst\destino' -ItemType directory -Force
new-item 'd:\pst\origem\bin\lib1.txt' -Value 'lib1'  -ItemType file -Force
new-item 'd:\pst\origem\bin\modulo.txt' -Value 'modulo'  -ItemType file -Force
new-item 'd:\pst\origem\bin\lib3.txt' -Value 'lib3'  -ItemType file -Force
new-item 'd:\pst\origem\bin\lib4.txt' -Value 'lib4'  -ItemType file -Force
#>


#WEB - Caso 2 Teste Sucesso ZIP-AppWeb
<#
new-item 'd:\pst\origem' -ItemType directory -Force
new-item 'd:\pst\origem\subpasta' -ItemType directory -Force
new-item 'd:\pst\origem\bin' -ItemType directory -Force
new-item 'd:\pst\destino' -ItemType directory -Force
new-item 'd:\pst\origem\web1.aspx' -Value 'webpage1'  -ItemType file -Force
new-item 'd:\pst\origem\web2.aspx' -Value 'webpage2'  -ItemType file -Force
new-item 'd:\pst\origem\web.config' -Value 'webconfig'  -ItemType file -Force
new-item 'd:\pst\origem\subpasta\web3.aspx' -Value 'webpage3'  -ItemType file -Force
new-item 'd:\pst\origem\bin\modulo.txt' -Value 'modulo'  -ItemType file -Force
new-item 'd:\pst\origem\bin\libweb2.txt' -Value 'libweb2'  -ItemType file -Force
new-item 'd:\pst\origem\bin\libweb3.txt' -Value 'libweb3'  -ItemType file -Force
#>

$pPubRootFolder = 'd:\pst\destino'
$pSourceFolder = 'd:\pst\origem\bin'
$pSistema = 'sistema'
$pKeepBINFiles = @('modulo.txt')

ZIP-AppLib $pSourceFolder $pPubRootFolder $pSistema $pKeepBINFiles

