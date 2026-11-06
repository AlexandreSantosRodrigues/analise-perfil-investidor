# Metodologia e dicionário de dados

## Pergunta de investigação

Quais padrões **descritivos** aparecem nas respostas sobre preferências, objetivos e comportamento de investimento? Quatro recortes foram definidos: (1) ranking de preferência por ouro de 1 a 4; (2) monitoramento diário/semanal; (3) modalidades escolhidas em duas faixas etárias; e (4) fontes de informação.

## Fonte e unidade de observação

A unidade é **uma resposta individual** da pesquisa *Finance Data*, disponibilizada por Nitin Datta no [Kaggle](https://www.kaggle.com/datasets/nitindatta/finance-data). O arquivo de trabalho é `finance_data.csv`, com delimitador **ponto e vírgula (`;`)**.

São **40 registros válidos** (25 respostas `Male`, 15 `Female`), com 24 campos. Existem linhas adicionais após o último participante, incluindo uma linha de médias, linhas vazias e um valor estatístico isolado. Essas linhas **não** compõem a amostra.

**Não existe campo temporal individual** e o período exato da coleta não pode ser reconstruído apenas pelo arquivo. O tamanho da amostra é pequeno e não há informação suficiente para tratá-la como amostra probabilística representativa de qualquer população.

## Regra de seleção

Na importação, os campos podem ser interpretados como texto. Para evitar falha de cast causada por valores auxiliares como `27,8`, utilizar `TRY_CAST` nos campos numéricos. As análises restringem-se a linhas com `gender` igual a `Male` ou `Female` e idade numérica válida:

~~~sql
SELECT COUNT(*) AS participantes
FROM workspace.default.finance_data_raw
WHERE LOWER(TRIM(gender)) IN ('male', 'female')
  AND TRY_CAST(age AS INT) BETWEEN 21 AND 35;
~~~

**Resultado esperado:** 40. As consultas analíticas são somente leitura (`SELECT`).

## Dicionário das 24 colunas

| Coluna do CSV | Interpretação operacional |
|---|---|
| `gender` | Gênero declarado |
| `age` | Idade declarada |
| `Investment_Avenues` | Resposta Sim/Não à pergunta geral sobre investimentos |
| `Mutual_Funds` | Ranking de preferência: fundos mútuos |
| `Equity_Market` | Ranking de preferência: mercado de ações |
| `Debentures` | Ranking de preferência: debêntures |
| `Government_Bonds` | Ranking de preferência: títulos governamentais |
| `Fixed_Deposits` | Ranking de preferência: depósitos a prazo |
| `PPF` | Ranking de preferência: Public Provident Fund |
| `Gold` | Ranking de preferência: ouro |
| `Stock_Market` | Resposta Sim/Não sobre mercado de ações |
| `Factor` | Fator declarado na decisão: retorno, risco ou prazo de bloqueio |
| `Objective` | Objetivo declarado de investimento |
| `Purpose` | Finalidade declarada |
| `Duration` | Horizonte de investimento declarado |
| `Invest_Monitor` | Frequência declarada de monitoramento |
| `Expect` | Faixa de retorno **esperado**, não realizado |
| `Avenue` | Modalidade de investimento indicada pelo respondente |
| `What are your savings objectives?` | Objetivo da poupança |
| `Reason_Equity` | Justificativa relacionada a ações |
| `Reason_Mutual` | Justificativa relacionada a fundos mútuos |
| `Reason_Bonds` | Justificativa relacionada a títulos |
| `Reason_FD` | Justificativa relacionada a depósitos a prazo |
| `Source` | Fonte de informação financeira declarada |

As sete colunas de ranking (`Mutual_Funds`, `Equity_Market`, `Debentures`, `Government_Bonds`, `Fixed_Deposits`, `PPF` e `Gold`) usam escala de **1 (maior preferência) a 7 (menor preferência)**. Elas não são valores monetários e não provam posse do ativo.

A coluna `Avenue` é **diferente** das sete colunas de ranking. Não interpretar `Factor = Risk` como classificação formal de tolerância ao risco. Também não deduzir que `Expect = 20%-30%` represente retorno anual ou efetivamente obtido, pois a base não estabelece esse detalhamento.

## Critérios das quatro análises

1. **Ouro:** `TRY_CAST(Gold AS INT) <= 4`; **n = 4**.
2. **Acompanhamento:** `Invest_Monitor` em `Daily` e `Weekly`; **n = 11**, sendo 4 diários e 7 semanais.
3. **Idade e modalidade:** 21–27 anos (**n = 21**) e 28–35 anos (**n = 19**); a modalidade é `Avenue`. As consultas de detalhamento preservam todas as 24 colunas usando `SELECT *`.
4. **Informação:** agrupamento por `Source`; **n = 40**.

Os percentuais das análises de grupo usam denominador **do próprio grupo**, salvo quando o texto indica percentual da amostra total.

## Limitações analíticas

- Amostra pequena (e subgrupos ainda menores), sem teste de representatividade.
- Dados declarados por questionário, sem comprovação de alocação ou rentabilidade.
- Não há data por pessoa: não é possível demonstrar evolução temporal.
- Associações observadas não permitem inferir causalidade.
- A terminologia da base é de um contexto distinto do brasileiro (por exemplo, `PPF`); não traduzir mecanicamente esses instrumentos como produtos locais equivalentes.
