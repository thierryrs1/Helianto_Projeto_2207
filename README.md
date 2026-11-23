# Projeto 2207 - Helianto Farmacêutica (CV 10387)

Implementação das melhorias no fluxo de Apontamento de Produção do Beas Manufacturing e consultas no SAP Business One v10.

## Estrutura do Projeto

### Melhoria 3 — Filtro por OP na Consulta Formatada
- `melhoria_3/SP_SPS_BEAS_RELATORIO_TEMPO.sql`: Stored Procedure com tratamento de datas padrão/fallback (`v_dataini` e `v_datafim`) e filtro flexível por OP (`belnr_id INT`).
- `melhoria_3/chamada_sap.sql`: Sintaxe de chamada compatível com o Gerador de Consultas do SAP Business One.

### Melhoria 4 — Colunas de Período na Administração de Apontamentos
Padronização de conversão de datas para os parâmetros de produção (`SPS_FTPOS_PARAMETER`), onde valores de `TYP = 'D'` podem vir em formatos distintos (`YYYY-MM-DD` ou `DD/MM/YYYY`).
- `melhoria_4/opcao_1_coluna_calculada.sql`: Criação de coluna gerada (`GENERATED ALWAYS AS`) com conversão condicional por máscara.
- `melhoria_4/opcao_2_trigger.sql`: Criação de coluna padrão com Trigger `BEFORE INSERT OR UPDATE` e atualização do histórico.
- `melhoria_4/query.sql`: Consulta de validação dos parâmetros de data.
