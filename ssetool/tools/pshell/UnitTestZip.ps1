#Script para execucao de testes unitarios 
#LIB - Caso Teste Negativo ZIP-AppLib arquivos selecionados
C:\andre\devrepogit\github\jenkinsci\ssetool\tools\pshell\ScriptZip.ps1 
#LIB - Caso 1 Teste Sucesso ZIP-AppLib arquivos selecionados
clear
remove-item c:\pst -Force -Recurse
new-item 'c:\pst\origem' -ItemType directory -Force
new-item 'c:\pst\origem\bin' -ItemType directory -Force
new-item 'c:\pst\origem\subpasta' -ItemType directory -Force
new-item 'c:\pst\destino' -ItemType directory -Force
new-item 'c:\pst\origem\bin\lib1.txt' -Value 'lib1'  -ItemType file -Force
new-item 'c:\pst\origem\bin\modulo.txt' -Value 'modulo'  -ItemType file -Force
new-item 'c:\pst\origem\bin\lib3.txt' -Value 'lib3'  -ItemType file -Force
new-item 'c:\pst\origem\bin\lib4.txt' -Value 'lib4'  -ItemType file -Force
C:\andre\devrepogit\github\jenkinsci\ssetool\tools\pshell\ScriptZip.ps1 "c:\pst\origem\bin" "sistema" "modulo.txt"


#LIB - Caso 2 Teste Sucesso ZIP-AppLib arquivos selecionados + de um arquivo
clear
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
C:\andre\devrepogit\github\jenkinsci\ssetool\tools\pshell\ScriptZip.ps1 "c:\pst\origem\bin" "sistema" @('modulo.txt','lib1.txt')


#LIB - Caso 3 Teste Sucesso ZIP-AppLib arquivos selecionados *.txt
clear
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
C:\andre\devrepogit\github\jenkinsci\ssetool\tools\pshell\ScriptZip.ps1 "c:\pst\origem\bin" "sistema" @('*.txt')


#LIB - Caso 4 Teste Sucesso ZIP-AppLib arquivos selecionados *.*
clear
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
C:\andre\devrepogit\github\jenkinsci\ssetool\tools\pshell\ScriptZip.ps1 "c:\pst\origem\bin" "sistema" @('*.*')




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

