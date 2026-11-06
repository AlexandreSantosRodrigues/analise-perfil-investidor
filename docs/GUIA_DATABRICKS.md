# Guia para reproduzir as consultas no Databricks SQL

## Pré-requisitos

- Um workspace Databricks com permissão para importar arquivos e consultar tabelas.
- O CSV [finance_data.csv](../finance_data.csv) disponível localmente.
- SQL Warehouse ou compute compatível, conforme o ambiente.

## 1. Importação do CSV

Na interface Databricks, acesse **New → Add or upload data → Create or modify a table from files** e selecione `finance_data.csv`.

Configuração utilizada nesta etapa do projeto:

| Configuração | Valor |
|---|---|
| Catalog | `workspace` |
| Schema | `default` |
| Table | `finance_data_raw` |
| Delimitador | `;` (ponto e vírgula) |
| Primeira linha é cabeçalho | Sim |
| Tipagem automática | Preferencialmente desativada inicialmente; validar tipos antes de analisar |

**Verifique a prévia:** o CSV deve se dividir em **24 colunas**, começando por `gender`, `age` e `Investment_Avenues`. Se aparecer uma coluna única contendo ponto e vírgula, a configuração de delimitador está incorreta.

A criação efetiva da tabela depende das permissões e do catálogo disponíveis no workspace. Se escolher outros nomes, adapte as referências nas consultas.

## 2. Verificação da tabela

~~~sql
SELECT current_catalog() AS catalogo, current_schema() AS esquema;
SHOW TABLES IN workspace.default;
~~~

Depois da importação:

~~~sql
SELECT COUNT(*) AS participantes
FROM workspace.default.finance_data_raw
WHERE LOWER(TRIM(gender)) IN ('male', 'female')
  AND TRY_CAST(age AS INT) BETWEEN 21 AND 35;
~~~

**Esperado: 40 participantes válidos.** Um `COUNT(*)` sem filtros pode incluir médias e linhas auxiliares, portanto não é critério suficiente.

## 3. Atenção à coluna de idade

O CSV contém uma linha de média com idade escrita como `27,8`. Se `age` for importada como texto, uma condição como `age BETWEEN 21 AND 27` pode gerar `CAST_INVALID_INPUT`. Use:

~~~sql
WHERE TRY_CAST(age AS INT) BETWEEN 21 AND 27
  AND gender IN ('Male', 'Female')
~~~

Essa estratégia ignora valores não convertíveis sem modificar os dados de origem.

## 4. Execução das análises

As consultas estão em [sql/consultas.sql](../sql/consultas.sql). Cole **uma instrução SELECT por célula** em um notebook SQL Databricks ou rode as instruções individualmente no editor SQL.

O arquivo [notebooks/finance_data.ipynb](../notebooks/finance_data.ipynb) preserva as seis consultas SQL do notebook fornecido para esta documentação, mas sem armazenar saídas HTML. A tabela `workspace.default.finance_data_raw` não é criada pelo notebook: importe o CSV antes.

## 5. Conferência rápida

| Verificação | Esperado |
|---|---:|
| Pessoas válidas | 40 |
| Preferência por ouro (`Gold <= 4`) | 4 |
| Monitoramento diário | 4 |
| Monitoramento semanal | 7 |
| Idades 21–27 | 21 |
| Idades 28–35 | 19 |
| Fonte: consultores financeiros | 16 |
| Fonte: jornais e revistas | 14 |
| Fonte: televisão | 6 |
| Fonte: internet | 4 |

Se os resultados divergirem, confira o separador `;`, o cabeçalho, a importação em 24 colunas, o nome da tabela, os valores de `gender` e as linhas auxiliares.

## Escopo e segurança

Todas as consultas versionadas são **somente leitura**. Não há instruções `DROP`, `UPDATE`, `DELETE`, `TRUNCATE` ou criação de tabelas via SQL.
