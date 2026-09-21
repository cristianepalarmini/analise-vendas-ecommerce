-- ==========================================
-- ANÁLISE DE VENDAS E E-COMMERCE
-- ==========================================

-- Total de pedidos
SELECT
    COUNT(DISTINCT id_pedido) AS total_pedidos
FROM vendas_ecommerce;


-- Faturamento total
SELECT
    SUM(faturamento) AS faturamento_total
FROM vendas_ecommerce;


-- Lucro total
SELECT
    SUM(lucro) AS lucro_total
FROM vendas_ecommerce;


-- Ticket médio
SELECT
    AVG(faturamento) AS ticket_medio
FROM vendas_ecommerce;


-- Taxa de pedidos concluídos
SELECT
    COUNT(CASE WHEN status = 'Concluído' THEN 1 END) * 100.0
    / COUNT(*) AS taxa_pedidos_concluidos
FROM vendas_ecommerce;


-- Faturamento por categoria
SELECT
    categoria,
    SUM(faturamento) AS faturamento
FROM vendas_ecommerce
GROUP BY categoria
ORDER BY faturamento DESC;


-- Faturamento por canal
SELECT
    canal,
    SUM(faturamento) AS faturamento
FROM vendas_ecommerce
GROUP BY canal
ORDER BY faturamento DESC;


-- Faturamento por região
SELECT
    regiao,
    SUM(faturamento) AS faturamento
FROM vendas_ecommerce
GROUP BY regiao
ORDER BY faturamento DESC;


-- Produtos mais vendidos
SELECT
    produto,
    SUM(quantidade) AS quantidade_vendida
FROM vendas_ecommerce
GROUP BY produto
ORDER BY quantidade_vendida DESC;


-- Faturamento mensal
SELECT
    EXTRACT(MONTH FROM data) AS mes,
    SUM(faturamento) AS faturamento
FROM vendas_ecommerce
GROUP BY EXTRACT(MONTH FROM data)
ORDER BY mes;
