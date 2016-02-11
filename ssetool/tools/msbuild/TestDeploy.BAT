@ECHO OFF
@ECHO realizando os testes no arquivo DeployArtToServer 
cd c:\Andre\devrepogit\prodesp\jenkinsci\ssetool\tools\msbuild
c:
@ECHO Executando o deploy 
call :testpos1
goto :fim

:testnegativos
@ECHO TESTES NEGATIVOS
@ECHO INFORMAR SISTEMA ERRADO 
C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe DeployArtToServer.proj /t:WebDeploy /p:Sistema=genericdao1 /p:Ambiente=homologacao  /p:ZipName=genericdao
@ECHO INFORMAR SISTEMA AMBIENTE ERRADO  
C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe DeployArtToServer.proj /t:WebDeploy /p:Sistema=genericdao /p:Ambiente=homologacao1  /p:ZipName=genericdao
@ECHO NAO INFORMAR SISTEMA 
C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe DeployArtToServer.proj /t:WebDeploy /p:Ambiente=homologacao1  /p:ZipName=genericdao  
@ECHO NAO INFORMAR AMBIENTE  
C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe DeployArtToServer.proj /t:WebDeploy /p:Sistema=genericdao   /p:ZipName=genericdao
@ECHO NAO INFORMAR NOMEDOZIP 
C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe DeployArtToServer.proj /t:WebDeploy /p:Sistema=genericdao /p:Ambiente=homologacao  
GOTO :fim

:testpos1
@ECHO TESTE PADRAO UM ARQUIVO 
C:\Andre\devrepogit\prodesp\jenkinsci\msb\MSBuild.exe DeployArtToServer.proj /t:WebDeploy /p:Sistema=genericdao /p:Ambiente=teste  
call :verificar
GOTO :fim

:verificar
PAUSE
CLS 

:fim
