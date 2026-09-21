import pandas as pd

# Carregar os dados
dados = pd.read_csv("dados/vendas_ecommerce.csv")

# Indicadores gerais
total_pedidos = dados["id_pedido"].nunique()
faturamento_total = dados["faturamento"].sum()
lucro_total = dados["lucro"].sum()
ticket_medio = dados["faturamento"].mean()

pedidos_concluidos = (dados["status"] == "Concluído").mean() * 100

print("ANÁLISE DE VENDAS E E-COMMERCE")
print("--------------------------------")
print(f"Total de pedidos: {total_pedidos}")
print(f"Faturamento total: R$ {faturamento_total:,.2f}")
print(f"Lucro total: R$ {lucro_total:,.2f}")
print(f"Ticket médio: R$ {ticket_medio:,.2f}")
print(f"Taxa de pedidos concluídos: {pedidos_concluidos:.2f}%")

# Faturamento por categoria
print("\nFATURAMENTO POR CATEGORIA")
print(
    dados.groupby("categoria")["faturamento"]
    .sum()
    .sort_values(ascending=False)
    .round(2)
)

# Faturamento por canal
print("\nFATURAMENTO POR CANAL")
print(
    dados.groupby("canal")["faturamento"]
    .sum()
    .sort_values(ascending=False)
    .round(2)
)

# Faturamento por região
print("\nFATURAMENTO POR REGIÃO")
print(
    dados.groupby("regiao")["faturamento"]
    .sum()
    .sort_values(ascending=False)
    .round(2)
)

# Produtos mais vendidos
print("\nQUANTIDADE VENDIDA POR PRODUTO")
print(
    dados.groupby("produto")["quantidade"]
    .sum()
    .sort_values(ascending=False)
    .head(10)
)
