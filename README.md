# Projeto 2207 - Helianto Farmacêutica (CV 10387)

Implementação das melhorias no fluxo de Apontamento de Produção do Beas Manufacturing e consultas no SAP Business One v10.

## Escopo - Melhoria 3

- **Melhoria 3 — Filtro por OP na Consulta Formatada**: Reestruturação da consulta do Relatório de Administração de Tempos (`SPS CONSULTAS`) para inclusão do parâmetro opcional de Ordem de Produção (OP), permitindo filtrar por período completo ou por uma OP específica dentro do período.

## Arquivos do Projeto

- `SP_SPS_BEAS_RELATORIO_TEMPO.sql`: Stored Procedure atualizada com os parâmetros de Data Inicial (`dataini`), Data Final (`datafim`) e Ordem de Produção opcional numérica (`belnr_id INT`).
- `chamada_sap.sql`: Sintaxe de chamada da procedure formatada para o Gerador de Consultas / Consulta Formatada do SAP Business One com tipagem correta de data e inteiro (`[%0]`, `[%1]`, `[%2]`).
- `CV 10387.pdf`: Proposta de serviços e escopo técnico.
