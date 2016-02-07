IF NOT EXIST c:\sse\work\jks\%1\rootldlls\source\%2  mkdir c:\sse\work\jks\%1\rootldlls\source\%2
IF NOT EXIST c:\sse\work\jks\%1\rootldlls\publish\%2 mkdir c:\sse\work\jks\%1\rootldlls\publish\%2 
del c:\sse\work\jks\%1\root\publish\%2\*.* /s /q
