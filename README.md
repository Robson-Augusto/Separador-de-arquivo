<h1 align="center">
  <img src="https://cdn-icons-png.flaticon.com/512/3759/3759714.png" width="80" alt="Folder Icon"><br>
  File Separator
</h1>

<p align="center">
  <img src="https://img.shields.io/badge/Status-Est%C3%A1vel-brightgreen">
  <img src="https://img.shields.io/badge/Linguagem-Batch%20Script-blue">
  <img src="https://img.shields.io/badge/Vers%C3%A3o-1.0.0-orange">
</p>

<p align="center">
  <strong>Automação inteligente para separação e organização de arquivos em massa (CTEs, NFs, Documentos).</strong>
</p>

<hr>

## 📖 Sobre o Projeto

Este projeto nasceu de uma necessidade real: **otimizar o tempo de usuários** que perdiam horas buscando arquivos um a um em pastas densas para separá-los para auditoria ou envio.

O script automatiza a busca de uma lista de nomes fornecida em um arquivo `.txt`, localiza os arquivos correspondentes (independente da extensão) e os consolida em uma única pasta de destino.

## ✨ Diferenciais Técnicos

<table>
  <tr>
    <td width="50%">
      <b>🔍 Busca Inteligente</b><br>
      Localiza arquivos sem precisar da extensão (PDF, XML, JPG, etc).
    </td>
    <td width="50%">
      <b>📂 Busca Recursiva</b><br>
      Varre a pasta principal e todas as subpastas automaticamente.
    </td>
  </tr>
  <tr>
    <td>
      <b>✂️ Separador customizado</b><br>
      Suporte para listas em linha única separadas por ponto e vírgula (<code>;</code>).
    </td>
    <td>
      <b>📊 Logs de Auditoria</b><br>
      Geração de relatórios automáticos de sucesso e falha (Arquivos não encontrados).
    </td>
  </tr>
</table>

---

## 🚀 Como Utilizar

### 1. Preparação
No arquivo `nomes.txt`, insira os nomes dos arquivos desejados.
> **Exemplo:** `352401;352402;352403;352404`

### 2. Configuração
Edite as variáveis no início do script `.bat`:
```batch
set "TXT=./nomes.txt"      :: Caminho da lista
set "ORIGEM=./"           :: Onde procurar
set "DESTINO=./DEST"       :: Onde salvar

📁 Seu_Projeto/
├── 📄 nomes.txt           <-- Sua lista de busca
├── 📄 script.bat          <-- O motor do projeto
├── 📁 DEST/               <-- Arquivos encontrados e movidos
├── 📄 movidos.log         <-- Relatório de sucesso
└── 📄 nao_encontrados.log <-- Relatório de itens ausentes
