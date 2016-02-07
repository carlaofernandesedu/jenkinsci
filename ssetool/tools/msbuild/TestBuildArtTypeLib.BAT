@ECHO OFF
@ECHO realizando os testes no arquivo BuildArtTypeLib 
cd d:\Andre\devrepogit\prodesp\jenkinsci\ssetool\tools\msbuild
d:
@ECHO Excluindo arquivos publicados 
del C:\sse\work\jks\hom\rootdlls\publish\genericdao\*.* /q /s
rd  C:\sse\work\jks\hom\rootdlls\publish\genericdao\bin /s /q
call :testpos4
goto :fim

:testnegativos
@ECHO TESTES NEGATIVOS
@ECHO INFORMAR SISTEMA ERRADO 
C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe BuildArtTypeLib.proj /t:CopyBins,ShowVar /p:Sistema=genericdao1 /p:Ambiente=homologacao  /p:ZipName=genericdao
call :verificar 
@ECHO INFORMAR SISTEMA AMBIENTE ERRADO  
C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe BuildArtTypeLib.proj /t:CopyBins,ShowVar /p:Sistema=genericdao /p:Ambiente=homologacao1  /p:ZipName=genericdao
call :verificar
@ECHO NAO INFORMAR SISTEMA 
C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe BuildArtTypeLib.proj /t:CopyBins,ShowVar /p:Ambiente=homologacao1  /p:ZipName=genericdao  
call :verificar 
@ECHO NAO INFORMAR AMBIENTE  
C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe BuildArtTypeLib.proj /t:CopyBins,ShowVar /p:Sistema=genericdao   /p:ZipName=genericdao
call :verificar
@ECHO NAO INFORMAR NOMEDOZIP 
C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe BuildArtTypeLib.proj /t:CopyBins,ZipBuildPdb,ZipBuild,ShowVar /p:Sistema=genericdao /p:Ambiente=homologacao  
call :verificar
GOTO :fim

:testpos1
@ECHO TESTE PADRAO UM ARQUIVO 
del C:\sse\work\jks\hom\rootdlls\publish\genericdao\*.* /q
rd  C:\sse\work\jks\hom\rootdlls\publish\genericdao\bin /s /q
C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe BuildArtTypeLib.proj /t:CopyBins,DeletePDB,ZipBuild,PackNuget /p:Sistema=genericdao /p:Ambiente=homologacao  /p:ZipName=genericdao
call :verificar
GOTO :fim

:testpos2
@ECHO TESTE PADRAO SELECIONANDO TODOS OS ARQUIVOS  
del C:\sse\work\jks\hom\rootdlls\publish\genericdao\*.* /q
rd  C:\sse\work\jks\hom\rootdlls\publish\genericdao\bin /s /q
C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe BuildArtTypeLib.proj /t:CopyBins,DeletePDB,ZipBuild,PackNuget /p:Sistema=genericdao /p:Ambiente=homologacao  /p:ZipName=genericdao
call :verificar
GOTO :fim

:testpos3
@ECHO TESTE PADRAO COM DEPLOY  
del C:\sse\work\jks\hom\rootdlls\publish\genericdao\*.* /q
rd  C:\sse\work\jks\hom\rootdlls\publish\genericdao\bin /s /q
C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe BuildArtTypeLib.proj /t:CopyBins,DeletePDB,ZipBuild,PackNuget,CopyToDeploy /p:Sistema=genericdao /p:Ambiente=homologacao  /p:ZipName=genericdao
call :verificar
GOTO :fim

:testpos4
@ECHO TESTE COM DEPLOY PARA VSO  
del C:\VSOAgent\_work\4\d\*.* /q
rd  C:\VSOAgent\_work\4\d\bin /s /q
C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe BuildArtTypeLib.proj /t:CopyBins,DeletePDB,ZipBuild /p:Sistema=genericdao /p:Ambiente=homologacao /p:ZipName=genericdao /p:ServerBuild=vso /p:BinFolder="C:\VSOAgent\_work\4\s\bin" /p:BuildFolder="C:\VSOAgent\_work\4\d"
dir C:\VSOAgent\_work\4\d\*.* /s
PAUSE 
GOTO :fim

:verificar
dir C:\sse\work\jks\hom\rootdlls\publish\genericdao\*.* /s 
PAUSE
CLS 

:fim
