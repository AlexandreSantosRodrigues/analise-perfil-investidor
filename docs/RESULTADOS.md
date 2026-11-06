# Resultados — Quatro análises descritivas

**Base:** [finance_data.csv](../finance_data.csv) · **Ferramenta:** Databricks SQL · **Amostra válida:** 40 respostas.

Os resultados abaixo foram conferidos contra o CSV do repositório. As consultas utilizadas estão em [sql/consultas.sql](../sql/consultas.sql), e a metodologia está em [METODOLOGIA.md](METODOLOGIA.md).

## Artigo 1 — Preferência relativa por ouro

**Questão:** como são os respondentes que posicionam o ouro entre os níveis 1 e 4 do ranking (1 = maior preferência)?

**Resultado:** 4 de 40 (10%) se enquadram no filtro `Gold <= 4`.

| Indicador | Resultado |
|---|---|
| Gênero | 2 mulheres e 2 homens |
| Idade | 24 a 34 anos; média 28 |
| Ranking do ouro | nível 2: 1; nível 3: 1; nível 4: 2 |
| Principal fator `Risk` | 3 de 4 |
| Objetivo `Capital Appreciation` | 3 de 4 |
| Modalidade `Mutual Fund` | 3 de 4 |
| Modalidade `Public Provident Fund` | 1 de 4 |
| Monitoramento mensal | 3 de 4 |

**Leitura:** o grupo é pequeno e heterogêneo. Uma posição relativamente alta do ouro no ranking não significa que a pessoa tenha ouro na carteira. O campo `Factor = Risk` não mede tolerância formal ao risco.

## Artigo 2 — Acompanhamento diário e semanal

**Questão:** quais características têm os respondentes que verificam investimentos diariamente ou semanalmente?

**Resultado:** 11 de 40 (27,5%). Desses, 4 monitoram diariamente e 7 semanalmente.

| Característica | Diário (n=4) | Semanal (n=7) |
|---|---:|---:|
| Idade média | 25,0 anos | 27,3 anos |
| Homens / mulheres | 2 / 2 | 5 / 2 |
| Modalidade mais citada | `Equity` (3) | `Mutual Fund` (4) |
| Principal fonte | `Internet` (3) | `Financial Consultants` (4) |
| Expectativa `20%-30%` | 2 | 7 |

**Leitura:** há diferenças entre as respostas desses dois subgrupos, sobretudo quanto a modalidades e fontes de informação. Não se pode inferir experiência, volume investido ou causalidade a partir da frequência de acompanhamento.

## Artigo 3 — Idade e modalidade de investimento

**Questão:** como a modalidade indicada em `Avenue` se distribui por duas faixas etárias?

**Resultado:** 21 participantes entre 21 e 27 anos e 19 entre 28 e 35 anos.

| Modalidade (`Avenue`) | 21–27 anos (n=21) | 28–35 anos (n=19) |
|---|---:|---:|
| `Mutual Fund` | 10 (47,6%) | 8 (42,1%) |
| `Equity` | 5 (23,8%) | 5 (26,3%) |
| `Fixed Deposits` | 3 (14,3%) | 6 (31,6%) |
| `Public Provident Fund` | 3 (14,3%) | 0 (0%) |
| **Total** | **21 (100%)** | **19 (100%)** |

**Leitura:** fundos mútuos são a modalidade mais indicada nas duas faixas; depósitos fixos têm proporção maior no grupo de 28–35 anos. As diferenças são descritivas e não demonstram que a idade cause mudanças na preferência.

## Artigo 4 — Fontes de informação

**Questão:** qual fonte de informação financeira cada respondente indicou?

| Fonte `Source` | Participantes | % do total |
|---|---:|---:|
| `Financial Consultants` | 16 | 40% |
| `Newspapers and Magazines` | 14 | 35% |
| `Television` | 6 | 15% |
| `Internet` | 4 | 10% |
| **Total** | **40** | **100%** |

**Leitura:** consultores financeiros e jornais/revistas representam, juntos, 75% das **fontes declaradas como categoria principal**. Isso não demonstra que os demais participantes nunca utilizem internet ou outros canais.

## Síntese e restrições comuns

Estas análises oferecem um **amostrativo de preferências e comportamentos declarados**. Não houve modelagem preditiva, teste de causalidade, classificação de perfil de risco segundo regras de suitability ou avaliação de retorno efetivo. Não há coluna de data individual; não interpretar os resultados como tendências históricas ou como retrato do mercado atual.
