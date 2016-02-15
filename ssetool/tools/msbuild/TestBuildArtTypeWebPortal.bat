@ECHO OFF
@ECHO realizando os testes no arquivo BuildArtTypeWebPortal
cd c:\Andre\devrepogit\prodesp\jenkinsci\ssetool\tools\msbuild
c:
@ECHO Excluindo arquivos publicados 
del C:\sse\work\jks\hom\rootdlls\publish\alteracaoeventos\*.* /q /s
rd  C:\sse\work\jks\hom\rootdlls\publish\alteracaoeventos\bin /s /q
call :testpos5
goto :fim

:testnegativos
@ECHO TESTES NEGATIVOS
@ECHO INFORMAR SISTEMA ERRADO 
C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe BuildArtTypeWebPortal.proj /t:MovePages,ShowVar /p:Sistema=alteracaoeventos1 /p:Ambiente=homologacao  /p:ZipName=alteracaoeventos
call :verificar 
@ECHO INFORMAR SISTEMA AMBIENTE ERRADO  
C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe BuildArtTypeWebPortal.proj /t:MovePages,ShowVar /p:Sistema=alteracaoeventos /p:Ambiente=homologacao1  /p:ZipName=alteracaoeventos
call :verificar
@ECHO NAO INFORMAR SISTEMA 
C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe BuildArtTypeWebPortal.proj /t:MovePages,ShowVar /p:Ambiente=homologacao1  /p:ZipName=alteracaoeventos  
call :verificar 
@ECHO NAO INFORMAR AMBIENTE  
C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe BuildArtTypeWebPortal.proj /t:MovePages,ShowVar /p:Sistema=alteracaoeventos   /p:ZipName=alteracaoeventos
call :verificar
@ECHO NAO INFORMAR NOMEDOZIP 
C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe BuildArtTypeWebPortal.proj /t:MovePages,ZipBuildPdb,ZipBuild,ShowVar /p:Sistema=alteracaoeventos /p:Ambiente=homologacao  
call :verificar
GOTO :fim

:testpos1
@ECHO TESTE PADRAO UM ARQUIVO 
del C:\sse\work\jks\hom\rootdlls\publish\alteracaoeventos\*.* /q
rd  C:\sse\work\jks\hom\rootdlls\publish\alteracaoeventos\bin /s /q
C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe BuildArtTypeWebPortal.proj /t:MovePages,DeletePDB,ZipBuild,PackNuget /p:Sistema=alteracaoeventos /p:Ambiente=homologacao  /p:ZipName=alteracaoeventos
call :verificar
GOTO :fim

:testpos2
@ECHO TESTE PADRAO SELECIONANDO TODOS OS ARQUIVOS  
del C:\sse\work\jks\hom\rootdlls\publish\alteracaoeventos\*.* /q
rd  C:\sse\work\jks\hom\rootdlls\publish\alteracaoeventos\bin /s /q
C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe BuildArtTypeWebPortal.proj /t:MovePages,DeletePDB,ZipBuild,PackNuget /p:Sistema=alteracaoeventos /p:Ambiente=homologacao  /p:ZipName=alteracaoeventos
call :verificar
GOTO :fim

:testpos3
@ECHO TESTE PADRAO COM DEPLOY  
del C:\sse\work\jks\hom\rootdlls\publish\alteracaoeventos\*.* /q
rd  C:\sse\work\jks\hom\rootdlls\publish\alteracaoeventos\bin /s /q
C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe BuildArtTypeWebPortal.proj /t:MovePages,DeletePDB,ZipBuild,PackNuget,CopyToDeploy /p:Sistema=alteracaoeventos /p:Ambiente=homologacao  /p:ZipName=alteracaoeventos
call :verificar
GOTO :fim

:testpos4
@ECHO TESTE COM DEPLOY PARA VSO  
del C:\VSOAgent\_work\4\d\*.* /q
rd  C:\VSOAgent\_work\4\d\bin /s /q
C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe BuildArtTypeWebPortal.proj /t:MovePages,DeletePDB,ZipBuild /p:Sistema=alteracaoeventos /p:Ambiente=homologacao /p:ZipName=alteracaoeventos /p:ServerBuild=vso /p:BinFolder="C:\VSOAgent\_work\4\s\bin" /p:BuildFolder="C:\VSOAgent\_work\4\d"
dir C:\VSOAgent\_work\4\d\*.* /s
PAUSE 
GOTO :fim

:testpos5
@ECHO TESTE PARA PREPARACAO DO AMBIENTE
C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe BuildArtTypeWebPortal.proj /t:PrepAmbiente /p:Sistema=alteracaoeventos /p:Ambiente=homologacao /p:NameSln=alteracaoeventos
call :verificar
GOTO :fim


:verificar
dir C:\sse\work\jks\hom\rootdlls\publish\alteracaoeventos\*.* /s 
PAUSE
CLS 

:fim
