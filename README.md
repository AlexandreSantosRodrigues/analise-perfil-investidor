# 📊 Análise de Perfil de Investidor com Excel

Este projeto consiste em uma análise exploratória de dados (EDA) sobre preferências de investimento, realizada inteiramente no Microsoft Excel. O foco foi transformar dados brutos de pesquisa em insights visuais utilizando estatística descritiva e ferramentas de análise de dados.

## 🎯 Objetivo
Identificar padrões de comportamento financeiro, tolerância ao risco e correlações entre ativos, utilizando recursos nativos do Excel para processamento e visualização.

## 🛠 Ferramentas e Fórmulas Utilizadas
O projeto explora recursos avançados do Excel, sem uso de macros (VBA), focado em análise puramente analítica:

* **Tabelas Dinâmicas (Pivot Tables):** Para segmentação de dados (ex: Cruzamento de Idade vs. Objetivos).
* **Fórmulas Estatísticas:**
    * `=MÉDIA()`: Para calcular o ranking médio de preferência de cada ativo.
    * `=CORREL()`: Para construir a matriz de correlação entre os diferentes tipos de investimentos.
* **Formatação Condicional:** Utilizada para criar Mapas de Calor (Heatmaps) na matriz de correlação.
* **Gráficos Avançados:**
    * **Radar:** Comparativo de perfil de risco por Gênero.
    * **Caixa e Bigode (Boxplot):** Análise de dispersão de idade por objetivo.
    * **Rosca e Colunas 100% Empilhadas:** Análise de fontes de informação e monitoramento.

## 📂 Estrutura do Projeto
* `finance_data.csv`: Base de dados original (fonte).
* `Analise_Investimentos.xlsx`: Planilha contendo o tratamento de dados, cálculos, tabelas dinâmicas e o Dashboard final.
* `Relatório_Final.pdf`: Exportação dos resultados apresentados na planilha.

## 🔍 Principais Insights
Com base na análise de 40 respondentes:
1.  **Perfil Conservador:** O *Public Provident Fund (PPF)* e *Fundos Mútuos* lideram o ranking de preferência (Menor média = Maior preferência).
2.  **Paradoxo de Gênero (Radar):** A visualização em radar revelou que o público feminino da amostra possui uma abertura maior ao Mercado de Ações comparado ao masculino.
3.  **Correlação de Ativos:** A função `=CORREL` revelou uma forte correlação negativa entre Títulos Públicos e Depósitos Fixos, indicando substituição de ativos na carteira de segurança.

## 🚀 Como Explorar
1.  Baixe o arquivo `Analise_Investimentos.xlsx`.
2.  Navegue pelas abas para ver a evolução da análise:
    * **Base:** Dados brutos.
    * **Cálculos:** Matriz de correlação e tabelas de apoio.
    * **Dashboard:** Painel visual com os gráficos interativos.

