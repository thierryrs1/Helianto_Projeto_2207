CREATE OR REPLACE PROCEDURE SP_SPS_BEAS_RELATORIO_TEMPO (
	IN dataini DATE,
	IN datafim DATE,
	IN belnr_id INT DEFAULT NULL
) AS BEGIN

	SELECT 
	    T0."BELNR_ID" as "Documento",
	    T0."BELPOS_ID" as "Pos",
	    T0."POS_ID" as "Status OP",
	    TO_VARCHAR(T0."ANFZEIT", 'DD/MM/YYYY HH24:MI:SS') as "Inicio",
	    TO_VARCHAR(T0."ENDZEIT", 'DD/MM/YYYY HH24:MI:SS') as "Fim",
	    T0."ZEIT" as "Duração (Min)",
	    T4."ItemCode" as "Codigo",
	    T0."PERS_ID" as "Colaborador",
	    T1."DisplayName" as "Nome",
	    T0."MENGE_GUT" as "Quantidade OK",
	    T4."CHARGE_ID" as "Lote",
	    T0."APLATZ_ID" as "Recurso",
	    T3."BEZ" as "Operação"
	FROM 
	    "BEAS_ARBZEIT" T0
	INNER JOIN "BEAS_PERS" T1
	    ON T0."PERS_ID" = T1."PERS_ID"
	LEFT JOIN "BEAS_TIMEOPERATOR" T2
	    ON T0."TYP" = T2."TYP"
	INNER JOIN "BEAS_FTAPL" T3
	    ON T3."BELNR_ID" = T0."BELNR_ID" 
	    AND T3."BELPOS_ID" = T0."BELPOS_ID" 
	    AND T3."POS_ID" = T0."POS_ID"
	INNER JOIN "BEAS_FTPOS" T4
	    ON T4."BELNR_ID" = T0."BELNR_ID" 
	    AND T4."BELPOS_ID" = T0."BELPOS_ID"
	INNER JOIN "BEAS_FTHAUPT" T5
	    ON T5."BELNR_ID" = T0."BELNR_ID"
	INNER JOIN "BEAS_APLATZ" T6
	    ON T6."APLATZ_ID" = T0."APLATZ_ID"
	WHERE
		TO_DATE(T0."ANFZEIT") BETWEEN :dataini AND :datafim
		AND (:belnr_id IS NULL OR :belnr_id <= 0 OR T0."BELNR_ID" = :belnr_id)
	ORDER BY  
	    T0."ANFZEIT" DESC, 
	    T0."BELNR_ID" DESC, 
	    T0."BELPOS_ID" DESC, 
	    T3."SortId" DESC, 
	    T0."POS_ID" DESC, 
	    T0."BUCHNR_ID" DESC;
	    
END;
