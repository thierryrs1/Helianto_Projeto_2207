# Projeto 2207 - Helianto Farmacêutica (CV 10387)

Implementação das melhorias no fluxo de Apontamento de Produção do Beas Manufacturing e consultas no SAP Business One v10.

## Escopo - Melhoria 3

- **Melhoria 3 — Filtro por OP na Consulta Formatada**: Reestruturação da consulta do Relatório de Administração de Tempos (`SPS CONSULTAS`) para inclusão do parâmetro opcional de Ordem de Produção (OP), permitindo filtrar por período completo ou por uma OP específica dentro do período.

## Implementação Técnica

- `SP_SPS_BEAS_RELATORIO_TEMPO.sql`: Stored Procedure com tratamento de datas padrão/fallback (`v_dataini` e `v_datafim`) caso venham nulas/vazias do SAP, e filtro flexível por Ordem de Produção (`belnr_id INT`).
- `chamada_sap.sql`: Sintaxe de chamada compatível com o Gerador de Consultas do SAP Business One.
- `CV 10387.pdf`: Proposta de serviços comercial/técnica aprovada.
