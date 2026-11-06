# Análise de Perfil do Investidor | Databricks SQL

Análise exploratória de uma pesquisa sobre **preferências e hábitos de investimento**, desenvolvida com **Databricks SQL**. O objetivo é apresentar um amostrativo descritivo dos participantes: quais modalidades indicam, com que frequência acompanham investimentos e onde buscam informações financeiras.

O projeto **não classifica formalmente o perfil de risco**, não recomenda ativos e não busca prever retornos.

## Visão geral

| Indicador | Base analisada |
|---|---:|
| Participantes válidos | **40** |
| Variáveis | **24 colunas** |
| Idades observadas | **21 a 35 anos** |
| Recortes descritivos documentados | **4** |
| Linguagem de análise | **SQL (Databricks)** |

**Dados:** [`finance_data.csv`](finance_data.csv) · **Origem declarada:** [Finance Data — Nitin Datta (Kaggle)](https://www.kaggle.com/datasets/nitindatta/finance-data).

A base contém respostas de pesquisa e **não possui uma coluna com a data de cada resposta**. O período exato de coleta não foi confirmado pelos registros. Não se trata de uma amostra representativa do mercado financeiro atual.

## Análises realizadas

### 1. Preferência relativa por ouro

Usando a coluna `Gold`, **4 dos 40 participantes (10%)** atribuíram ao ouro uma posição de **1 a 4** no ranking, em que **1 representa maior preferência**. Nesse grupo, três citaram `Risk` como fator importante na decisão de investimento.

> Estar bem posicionado no ranking não significa que o participante efetivamente possua ouro.

### 2. Frequência de acompanhamento

**11 participantes (27,5%)** informaram acompanhar seus investimentos diariamente ou semanalmente:

| Frequência | Participantes |
|---|---:|
| Diariamente (`Daily`) | 4 |
| Semanalmente (`Weekly`) | 7 |

Entre os quatro que monitoram diariamente, três indicaram `Equity` como modalidade; no grupo semanal, quatro dos sete indicaram `Mutual Fund`. Esses resultados são descritivos e não demonstram causalidade.

### 3. Idade e modalidade escolhida

As respostas foram separadas em **duas faixas etárias**, mantendo os dados originais de cada participante nas consultas de detalhamento.

| Modalidade (`Avenue`) | 21–27 anos (n=21) | 28–35 anos (n=19) |
|---|---:|---:|
| Fundos mútuos (`Mutual Fund`) | 10 (47,6%) | 8 (42,1%) |
| Ações (`Equity`) | 5 (23,8%) | 5 (26,3%) |
| Depósitos a prazo (`Fixed Deposits`) | 3 (14,3%) | 6 (31,6%) |
| `Public Provident Fund` (PPF) | 3 (14,3%) | 0 (0%) |
| **Total** | **21** | **19** |

Fundos mútuos foram a modalidade mais citada em ambas as faixas. Depósitos a prazo aparecem proporcionalmente mais entre participantes de 28 a 35 anos.

### 4. Fontes de informação financeira

| Fonte declarada (`Source`) | Participantes | Percentual |
|---|---:|---:|
| Consultores financeiros | 16 | 40% |
| Jornais e revistas | 14 | 35% |
| Televisão | 6 | 15% |
| Internet | 4 | 10% |
| **Total** | **40** | **100%** |

Consultores financeiros e jornais/revistas somam **75% das fontes declaradas**. Isso não significa que os respondentes deixem de usar outras fontes no cotidiano.

**Resultados detalhados e cuidados de interpretação:** [`docs/RESULTADOS.md`](docs/RESULTADOS.md).

## Metodologia

1. **Importação:** leitura do `finance_data.csv` como arquivo delimitado por **ponto e vírgula (`;`)**.
2. **Validação:** identificação de **40 registros válidos**; descarte analítico de linhas auxiliares do CSV (médias, linhas vazias e cálculo isolado), sem alterar o arquivo original.
3. **Consultas SQL:** filtros, `CASE`, `COUNT`, `GROUP BY` e ordenação para produzir os quatro recortes descritivos.
4. **Interpretação:** comparação de frequências e proporções dentro de cada grupo, sem inferências causais ou classificação de suitability.

As colunas `Gold`, `Mutual_Funds`, `Equity_Market` e outras modalidades ranqueadas usam **1 = maior preferência e 7 = menor preferência**. A coluna `Avenue` representa a modalidade **indicada** pelo respondente e não equivale ao ranking.

## Como reproduzir no Databricks

1. Baixe [`finance_data.csv`](finance_data.csv) e importe-o por **Add or upload data → Create or modify a table from files**.
2. Configure o delimitador **`;`**, o cabeçalho na primeira linha e confira se a prévia exibe **24 colunas**.
3. Crie a tabela em um catálogo/esquema com acesso. No ambiente usado neste estudo, seu nome foi `workspace.default.finance_data_raw`.
4. Execute a validação inicial:

```sql
SELECT COUNT(*) AS participantes_validos
FROM workspace.default.finance_data_raw
WHERE LOWER(TRIM(gender)) IN ('male', 'female')
  AND TRY_CAST(age AS INT) BETWEEN 21 AND 35;
```

**Resultado esperado: 40.** A conversão segura `TRY_CAST` evita erros com valores auxiliares do CSV, como `27,8`.

5. Execute as consultas de [`sql/consultas.sql`](sql/consultas.sql) individualmente, ou consulte o [notebook SQL](notebooks/finance_data.ipynb). Se importar a tabela com outro nome, adapte as referências.

> O notebook contém as consultas, mas **não cria automaticamente a tabela nem incorpora uma execução validada em um novo workspace**. As contagens publicadas foram confrontadas com o CSV do repositório.

Para um passo a passo completo, consulte o [guia de Databricks](docs/GUIA_DATABRICKS.md).

## Estrutura do repositório

```text
analise-perfil-investidor/
├── README.md                 # Apresentação principal
├── finance_data.csv          # Dados da pesquisa
├── notebooks/
│   └── finance_data.ipynb    # Notebook SQL, sem resultados HTML
├── sql/
│   └── consultas.sql         # Consultas SQL somente leitura
├── docs/
│   ├── INDICE.md             # Navegação pela documentação
│   ├── METODOLOGIA.md        # Fonte, dicionário e limitações
│   ├── GUIA_DATABRICKS.md    # Importação e reprodução
│   └── RESULTADOS.md         # Quatro análises descritivas
└── Relatório de Análise de Perfil do Investidor
    e Preferências de Alocação de Ativos.pdf  # Relatório anterior
```

O PDF na raiz corresponde a um **material anterior** do projeto. A etapa atual, documentada neste README, utiliza **Databricks SQL**. Não há planilha Excel versionada no repositório.

## Limitações

- **40 respostas** não permitem generalizar os resultados para todos os investidores.
- Não há datas individuais de coleta, série temporal nem informação confiável de retorno realizado.
- Preferência declarada por um ativo **não comprova posse ou alocação financeira**.
- A indicação de `Risk` como fator de escolha **não define** um perfil conservador, moderado ou arrojado.
- O questionário contém produtos e nomenclaturas de outro contexto financeiro (como `PPF`); as interpretações devem respeitar as categorias originais.

---

**Documentação completa:** [Índice](docs/INDICE.md) · [Metodologia](docs/METODOLOGIA.md) · [Resultados](docs/RESULTADOS.md) · [Consultas SQL](sql/consultas.sql)
