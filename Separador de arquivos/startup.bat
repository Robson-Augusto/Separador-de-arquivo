@echo off
setlocal enabledelayedexpansion

REM ========= CONFIGURACAO =========
set "TXT=./nomes.txt"
set "ORIGEM=./
set "DESTINO=./DEST"

set "LOG_OK=./movidos.log"
set "LOG_FAIL=./nao_encontrados.log"

REM Criar pasta destino se nao existir
if not exist "%DESTINO%" mkdir "%DESTINO%"

REM Limpar logs antigos
break > "%LOG_OK%"
break > "%LOG_FAIL%"

echo ===============================
echo COMO USAR: 
echo ===============================
echo - Utilize o arquivo "nomes.txt" para adicionar os nomes dos arquivos que deseja buscar
echo - Lembre se de separar os nomes dos arquivos por ponto e virgula. 
echo - Edite o arquivo 'startup' para especificar os caminhos para o TXT, Origem e destino;
echo - Os arquivos encontrados na origem serão movidos para pasta 'DEST'
echo ===============================
echo PARAMETROS CONFIGURADOS:
echo ===============================
echo Arquivo de leitura: %TXT%
echo Origem da busca: %ORIGEM%
echo Destino dos arquivos encontrados: %DESTINO%

echo ===============================
echo INICIANDO PROCESSAMENTO
echo ===============================


REM Lendo o arquivo TXT. Usamos delims= para pegar a linha toda, mesmo com ;
for /f "usebackq tokens=* delims=" %%L in ("%TXT%") do (
    set "linha=%%L"
    
    REM Substituindo todos os ";" por espacos para que o FOR possa separar os nomes
    set "linha=!linha:;= !"

    REM Agora percorremos cada nome separado por espaco
    for %%A in (!linha!) do (
        set "nome_sem_extensao=%%A"
        set "encontrado=0"

        echo Procurando: !nome_sem_extensao!.*

        REM Busca na ORIGEM por qualquer arquivo que comece com o nome e tenha qualquer extensao
        for /f "delims=" %%X in ('dir /b /s "%ORIGEM%\!nome_sem_extensao!.*" 2^>nul') do (
            
            REM Evita mover arquivos que ja estao na pasta DESTINO ou o proprio arquivo TXT
            echo %%X | findstr /i "%DESTINO%" >nul
            if errorlevel 1 (
                if /i not "%%~nxX"=="nomes.txt" (
                    set "encontrado=1"
                    echo [OK] Movendo: %%~nxX
                    move /y "%%X" "%DESTINO%\" >nul
                    echo %%~nxX >> "%LOG_OK%"
                )
            )
        )

        if !encontrado! EQU 0 (
            echo [!] NAO ENCONTRADO: !nome_sem_extensao!
            echo !nome_sem_extensao! >> "%LOG_FAIL%"
        )
    )
)

echo.
echo ===============================
echo PROCESSO FINALIZADO
echo ===============================
pause