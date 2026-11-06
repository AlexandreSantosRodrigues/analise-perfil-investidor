# Documentação — Análise de Perfil do Investidor (Databricks SQL)

Este diretório documenta uma **etapa exploratória em Databricks SQL** sobre a base `finance_data.csv`. O foco é descrever respostas de uma pesquisa, não estimar perfis de risco formais, prever rendimentos ou recomendar ativos.

## Navegação

| Arquivo | Conteúdo |
|---|---|
| [METODOLOGIA.md](METODOLOGIA.md) | Fonte, escopo, dicionário de 24 colunas, limpeza e cuidados de interpretação |
| [GUIA_DATABRICKS.md](GUIA_DATABRICKS.md) | Importação, validação, tratamento do CSV e instruções para executar SQL |
| [RESULTADOS.md](RESULTADOS.md) | Quatro análises descritivas, resultados conferidos e limitações |
| [../sql/consultas.sql](../sql/consultas.sql) | Consultas SQL utilizadas (somente leitura) |
| [../notebooks/finance_data.ipynb](../notebooks/finance_data.ipynb) | Cópia das consultas do notebook Databricks fornecido, sem os resultados HTML incorporados |

## Base e escopo

- Dados locais do repositório: [finance_data.csv](../finance_data.csv).
- Origem declarada: [Finance Data — Nitin Datta, Kaggle](https://www.kaggle.com/datasets/nitindatta/finance-data).
- **40 respostas válidas**, **24 colunas**, idades de **21 a 35 anos**.
- O CSV do repositório contém linhas auxiliares após os 40 registros; não são respondentes.
- Não há coluna de data individual das respostas. O período exato de coleta não foi validado neste projeto.
- Tabela usada no ambiente de estudo: `workspace.default.finance_data_raw` (nome dependente do workspace).

## Versões do projeto

O `README.md` continua descrevendo uma etapa anterior baseada em Excel. A documentação desta pasta descreve a **etapa posterior em Databricks SQL**, construída a partir das consultas do notebook fornecido. Esses contextos não devem ser confundidos.

**Importante:** o `README.md` não foi modificado para criar esta documentação. Os arquivos Excel mencionados nele não estavam presentes na raiz quando esta documentação foi elaborada.

## Reprodutibilidade

As contagens publicadas em `RESULTADOS.md` foram recalculadas a partir do CSV e confrontadas com as consultas SQL disponibilizadas. A disponibilização de código e resultados conferidos não equivale a afirmar que um novo workspace Databricks tenha sido executado automaticamente.
