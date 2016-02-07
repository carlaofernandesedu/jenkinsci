@ECHO OFF
@ECHO Criando os diretorios para o modulo %1
IF NOT EXIST c:\sse MKDIR C:\sse 
IF NOT EXIST c:\sse\work\jks MKDIR c:\sse\work\jks
IF NOT EXIST c:\sse\work\jks\hom MKDIR c:\sse\work\jks\hom
IF NOT EXIST c:\sse\work\jks\hom\rootdlls MKDIR c:\sse\work\jks\hom\rootdlls
IF NOT EXIST c:\sse\work\jks\hom\rootdlls\publish MKDIR c:\sse\work\jks\hom\rootdlls\publish
IF NOT EXIST c:\sse\work\jks\hom\rootdlls\source MKDIR c:\sse\work\jks\hom\rootdlls\source
IF NOT EXIST c:\sse\work\jks\hom\rootdlls\publish\%1 MKDIR c:\sse\work\jks\hom\rootdlls\publish\%1
IF NOT EXIST c:\sse\work\jks\hom\rootdlls\source\%1 MKDIR c:\sse\work\jks\hom\rootdlls\source\%1
@ECHO Diretorios criados

