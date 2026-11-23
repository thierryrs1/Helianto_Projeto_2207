CALL SP_SPS_BEAS_RELATORIO_TEMPO (
    IFNULL((SELECT MIN("CreateDate") FROM "OINV" T0 WHERE T0."CreateDate" = [%0] and 1=0), [%0]),
    IFNULL((SELECT MIN("DocDueDate") FROM "OINV" T0 WHERE T0."DocDueDate" = [%1] and 1=0), [%1]),
    IFNULL((SELECT MIN("DocNum") FROM "OINV" T0 WHERE T0."DocNum" = [%2] and 1=0), [%2])
)
