File Separator 📁🚀
Este script em Batch (.bat) foi desenvolvido para automatizar a separação de arquivos em massa (como CTe, Notas Fiscais, etc.). Ele elimina a necessidade de busca manual, permitindo que o usuário forneça uma lista de nomes e o script localize e mova esses arquivos automaticamente para uma pasta de destino.

📋 O Problema
Muitas vezes, usuários recebem listas de nomes de arquivos (em Excel ou TXT) e precisam separar esses arquivos específicos de uma pasta que contém milhares de itens. Fazer isso manualmente é demorado e sujeito a erros.

✅ A Solução
O script lê um arquivo de texto configurável, identifica os nomes (mesmo sem a extensão ou separados por ponto e vírgula) e realiza a busca recursiva em subpastas, movendo tudo o que for encontrado para um local centralizado.

🛠️ Como Usar
1. Preparação dos arquivos
Certifique-se de que os nomes dos arquivos que você deseja buscar estão no arquivo nomes.txt.

Os nomes devem estar separados por ponto e vírgula (;).

Exemplo: 12345;67890;77412;99854

2. Configuração
Abra o arquivo .bat (ou o arquivo de configuração startup, se você o separou) e ajuste os caminhos:

TXT: Caminho do arquivo com a lista de nomes.

ORIGEM: Pasta onde os arquivos estão "espalhados".

DESTINO: Pasta onde os arquivos encontrados serão concentrados.

3. Execução
Execute o arquivo .bat. O script irá:

Criar a pasta de destino (se não existir).

Buscar cada item do TXT na pasta de origem e em todas as suas subpastas.

Mover os arquivos encontrados para a pasta DEST.

Gerar logs automáticos para conferência.

📊 Logs de Processamento
Após o término, o script gera dois arquivos de log no mesmo diretório:

movidos.log: Lista de todos os arquivos encontrados e movidos com sucesso.

nao_encontrados.log: Lista dos nomes que constavam no TXT, mas não foram localizados na origem.

⚙️ Funcionalidades Técnicas
Busca por Curinga: O script localiza o arquivo independente da extensão (ex: se buscar por Nota123, ele encontrará Nota123.pdf, Nota123.xml, etc).

Separação por Delimitador: Trata listas contínuas separadas por ;.

Busca Recursiva: Procura dentro de todas as subpastas da origem definida.

Prevenção de Erros: Não move o próprio script ou o arquivo de chaves, e evita loops caso a pasta de destino esteja dentro da pasta de origem.
