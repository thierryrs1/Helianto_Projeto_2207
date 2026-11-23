-- Opção 2: Coluna Comum + Trigger (Before Insert/Update)

-- 1. Adicionar o campo DATE
ALTER TABLE "SPS_FTPOS_PARAMETER" ADD ("DateValue" DATE);

-- 2. Criar a Trigger para preenchimento automático
CREATE OR REPLACE TRIGGER TRG_SPS_FTPOS_PARAMETER_DATE
BEFORE INSERT OR UPDATE ON "SPS_FTPOS_PARAMETER"
REFERENCING NEW ROW mynewrow
FOR EACH ROW
BEGIN
    IF :mynewrow."TYP" = 'D' AND :mynewrow."Value" IS NOT NULL AND :mynewrow."Value" != '' THEN
        IF :mynewrow."Value" LIKE '____-__-__' THEN
            :mynewrow."DateValue" := TO_DATE(:mynewrow."Value", 'YYYY-MM-DD');
        ELSEIF :mynewrow."Value" LIKE '__/__/____' THEN
            :mynewrow."DateValue" := TO_DATE(:mynewrow."Value", 'DD/MM/YYYY');
        ELSE
            :mynewrow."DateValue" := NULL;
        END IF;
    ELSE
        :mynewrow."DateValue" := NULL;
    END IF;
END;

-- 3. Atualizar o histórico existente
UPDATE "SPS_FTPOS_PARAMETER"
SET "DateValue" = CASE 
    WHEN "Value" LIKE '____-__-__' THEN TO_DATE("Value", 'YYYY-MM-DD')
    WHEN "Value" LIKE '__/__/____' THEN TO_DATE("Value", 'DD/MM/YYYY')
    ELSE NULL
END
WHERE "TYP" = 'D' AND "Value" IS NOT NULL AND "Value" != '';
