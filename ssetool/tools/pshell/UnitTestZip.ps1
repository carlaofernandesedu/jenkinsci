#Script para execucao de testes unitarios 
#LIB - Caso 1 Teste Sucesso ZIP-AppLib arquivos selecionados

remove-item c:\pst -Force -Recurse
new-item 'c:\pst\origem' -ItemType directory -Force
new-item 'c:\pst\origem\bin' -ItemType directory -Force
new-item 'c:\pst\origem\subpasta' -ItemType directory -Force
new-item 'c:\pst\destino' -ItemType directory -Force
new-item 'c:\pst\origem\bin\lib1.txt' -Value 'lib1'  -ItemType file -Force
new-item 'c:\pst\origem\bin\modulo.txt' -Value 'modulo'  -ItemType file -Force
new-item 'c:\pst\origem\bin\lib3.txt' -Value 'lib3'  -ItemType file -Force
new-item 'c:\pst\origem\bin\lib4.txt' -Value 'lib4'  -ItemType file -Force
$pPubRootFolder = 'c:\pst\destino'
$pSourceFolder = 'c:\pst\origem\bin'
$pSistema = 'sistema'
$pKeepBINFiles = @('modulo.txt')
ZIP-AppLib $pSourceFolder $pPubRootFolder $pSistema $pKeepBINFiles
#LIB - Caso 2 Teste Sucesso ZIP-AppLib arquivos selecionados + de um arquivo
remove-item c:\pst -Force -Recurse
new-item 'c:\pst\origem' -ItemType directory -Force
new-item 'c:\pst\origem\bin' -ItemType directory -Force
new-item 'c:\pst\origem\subpasta' -ItemType directory -Force
new-item 'c:\pst\destino' -ItemType directory -Force
new-item 'c:\pst\origem\bin\lib1.txt' -Value 'lib1'  -ItemType file -Force
new-item 'c:\pst\origem\bin\modulo.txt' -Value 'modulo'  -ItemType file -Force
new-item 'c:\pst\origem\bin\lib3.txt' -Value 'lib3'  -ItemType file -Force
new-item 'c:\pst\origem\bin\lib4.txt' -Value 'lib4'  -ItemType file -Force
new-item 'c:\pst\origem\bin\arq1.log' -Value 'arq1'  -ItemType file -Force
$pPubRootFolder = 'c:\pst\destino'
$pSourceFolder = 'c:\pst\origem\bin'
$pSistema = 'sistema'
$pKeepBINFiles = @('modulo.txt','lib1.txt')
ZIP-AppLib $pSourceFolder $pPubRootFolder $pSistema $pKeepBINFiles
#>

#LIB - Caso 3 Teste Sucesso ZIP-AppLib arquivos selecionados *.txt
<#
remove-item c:\pst -Force -Recurse
new-item 'c:\pst\origem' -ItemType directory -Force
new-item 'c:\pst\origem\bin' -ItemType directory -Force
new-item 'c:\pst\origem\subpasta' -ItemType directory -Force
new-item 'c:\pst\destino' -ItemType directory -Force
new-item 'c:\pst\origem\bin\lib1.txt' -Value 'lib1'  -ItemType file -Force
new-item 'c:\pst\origem\bin\modulo.txt' -Value 'modulo'  -ItemType file -Force
new-item 'c:\pst\origem\bin\lib3.txt' -Value 'lib3'  -ItemType file -Force
new-item 'c:\pst\origem\bin\lib4.txt' -Value 'lib4'  -ItemType file -Force
new-item 'c:\pst\origem\bin\arq1.log' -Value 'arq1'  -ItemType file -Force
$pPubRootFolder = 'c:\pst\destino'
$pSourceFolder = 'c:\pst\origem\bin'
$pSistema = 'sistema'
$pKeepBINFiles = @('*.txt')
ZIP-AppLib $pSourceFolder $pPubRootFolder $pSistema $pKeepBINFiles
#>

#LIB - Caso 4 Teste Sucesso ZIP-AppLib arquivos selecionados *.*
<#
remove-item c:\pst -Force -Recurse
new-item 'c:\pst\origem' -ItemType directory -Force
new-item 'c:\pst\origem\bin' -ItemType directory -Force
new-item 'c:\pst\origem\subpasta' -ItemType directory -Force
new-item 'c:\pst\destino' -ItemType directory -Force
new-item 'c:\pst\origem\bin\lib1.txt' -Value 'lib1'  -ItemType file -Force
new-item 'c:\pst\origem\bin\modulo.txt' -Value 'modulo'  -ItemType file -Force
new-item 'c:\pst\origem\bin\lib3.txt' -Value 'lib3'  -ItemType file -Force
new-item 'c:\pst\origem\bin\lib4.txt' -Value 'lib4'  -ItemType file -Force
new-item 'c:\pst\origem\bin\arq1.log' -Value 'arq1'  -ItemType file -Force
$pPubRootFolder = 'c:\pst\destino'
$pSourceFolder = 'c:\pst\origem\bin'
$pSistema = 'sistema'
$pKeepBINFiles = @('*.*')
ZIP-AppLib $pSourceFolder $pPubRootFolder $pSistema $pKeepBINFiles
#>

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
$pPubRootFolder = 'd:\pst\destino'
$pSourceFolder = 'd:\pst\origem\bin'
$pSistema = 'sistema'
$pKeepBINFiles = @('modulo.txt')
ZIP-AppLib $pSourceFolder $pPubRootFolder $pSistema $pKeepBINFiles
#>

#WEB - Caso 3 Teste Sucesso ZIP-AppWeb
<#
remove-item d:\pst -Force -Recurse
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
$pPubRootFolder = 'd:\pst\destino'
$pSourceFolder = 'd:\pst\origem'
$pSistema = 'sistema'
$pKeepBINFiles = @('modulo.txt')
#ZIP-AppLib $pSourceFolder $pPubRootFolder $pSistema $pKeepBINFiles
ZIP-AppWeb $pSourceFolder $pPubRootFolder $pSistema $pKeepBINFiles
#>

