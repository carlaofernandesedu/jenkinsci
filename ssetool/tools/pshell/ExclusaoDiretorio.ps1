function Excluir-Conteudo($DirExclusao)
{
    
    try 
    {
        #Verificando a pasta de publicacao
        if(Test-Path $DirExclusao)
        {
            #Remover os arquivos desnecessários
				Write-Host "Excluindo os arquivos da pasta:" $DirExclusao
                Foreach($ItemRootExclusao in (Get-ChildItem $DirExclusao -Recurse -File))
                { 
                    if($ZipFile -ne $ItemRootExclusao.FullName)
                    {
                        Write-Host 'Removendo o arquivo' $ItemRootExclusao.FullName
                        Remove-Item $ItemRootExclusao.FullName 
                    }
                }
				Write-Host "Excluindo os diretorios da pasta:" $DirExclusao
                Foreach($ItemRootExclusao in (Get-ChildItem $DirExclusao -Directory))
                { 
                    Write-Host 'Removendo o diretorio' $ItemRootExclusao.FullName
                    Remove-Item $ItemRootExclusao.FullName -Recurse 
                }
				Write-Host "Processo Concluido"
                exit 0         
        }
        else 
        {
          Write-Host 'Caminho de exclusao informado incorretamente' $DirExclusao
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

Excluir-Conteudo "d:\sourcegmud\homologacao\portalnet"
Excluir-Conteudo "d:\sourcegmud\producao\portalnet"

