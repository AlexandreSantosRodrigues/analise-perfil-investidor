-- ANALISE DE PERFIL DO INVESTIDOR | Databricks SQL
-- Origem: finance_data.csv; tabela de estudo: workspace.default.finance_data_raw
-- Somente SELECT. Importar primeiro o CSV com delimitador ';' e cabeçalho.
-- Consultas 1 a 6 preservam as seis análises do notebook fornecido, com formatação.
-- Para executar: use uma consulta por célula SQL.

-- 0. Validacao da base: resultado esperado = 40
SELECT COUNT(*) AS participantes_validos
FROM workspace.default.finance_data_raw
WHERE LOWER(TRIM(gender)) IN ('male', 'female')
  AND TRY_CAST(age AS INT) BETWEEN 21 AND 35;

-- 1. Preferencia relativa por ouro: 4 linhas (menor ranking = maior preferencia)
SELECT *
FROM workspace.default.finance_data_raw
WHERE TRY_CAST(Gold AS INT) <= 4
  AND LOWER(TRIM(gender)) IN ('male', 'female')
ORDER BY TRY_CAST(Gold AS INT) ASC;

-- 2. Monitoramento diario / semanal: 11 linhas
SELECT *
FROM workspace.default.finance_data_raw
WHERE LOWER(TRIM(Invest_Monitor)) IN ('daily', 'weekly')
  AND LOWER(TRIM(gender)) IN ('male', 'female')
ORDER BY
  CASE
    WHEN LOWER(TRIM(Invest_Monitor)) = 'daily' THEN 1
    WHEN LOWER(TRIM(Invest_Monitor)) = 'weekly' THEN 2
  END,
  TRY_CAST(age AS INT);

-- 3. Faixa de 21 a 27 anos: 21 linhas; preserva todas as colunas
SELECT *
FROM workspace.default.finance_data_raw
WHERE TRY_CAST(age AS INT) BETWEEN 21 AND 27
  AND gender IN ('Male', 'Female')
ORDER BY TRY_CAST(age AS INT);

-- 4. Faixa de 28 a 35 anos: 19 linhas; preserva todas as colunas
SELECT *
FROM workspace.default.finance_data_raw
WHERE TRY_CAST(age AS INT) BETWEEN 28 AND 35
  AND gender IN ('Male', 'Female')
ORDER BY TRY_CAST(age AS INT);

-- 5. Fontes de informacao: 4 categorias
SELECT
  Source AS fonte_informacao,
  COUNT(*) AS total
FROM workspace.default.finance_data_raw
WHERE gender IN ('Male', 'Female')
GROUP BY Source
ORDER BY total DESC;

-- 6. Inspecao integral da tabela (inclui linhas auxiliares do CSV)
SELECT *
FROM workspace.default.finance_data_raw;
