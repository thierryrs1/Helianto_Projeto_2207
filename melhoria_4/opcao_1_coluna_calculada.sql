ALTER TABLE "SPS_FTPOS_PARAMETER" ADD (
    "DateValue" DATE GENERATED ALWAYS AS (
        CASE 
            WHEN "TYP" = 'D' AND "Value" IS NOT NULL AND "Value" != '' THEN
                CASE 
                    -- Formato YYYY-MM-DD
                    WHEN "Value" LIKE '____-__-__' 
                        THEN TO_DATE("Value", 'YYYY-MM-DD')
                    -- Formato DD/MM/YYYY
                    WHEN "Value" LIKE '__/__/____' 
                        THEN TO_DATE("Value", 'DD/MM/YYYY')
                    WHEN "Value" LIKE '____/__/__' 
                        THEN TO_DATE("Value", 'YYYY/MM/DD')
                    ELSE NULL 
                END
            ELSE NULL 
        END
    )
);

