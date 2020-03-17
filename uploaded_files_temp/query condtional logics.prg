SELECT
	C.COND_EXPRESSION_NAME
	, CD_CONDITIONAL_ASSAY_DISP = UAR_GET_CODE_DISPLAY(CD.CONDITIONAL_ASSAY_CD)
	, Trigger_Name = CE.COND_COMP_NAME
	, CE_TRIGGER_ASSAY_DISP = UAR_GET_CODE_DISPLAY(CE.TRIGGER_ASSAY_CD)
	, ALPHA_RESPONSE = N.MNEMONIC
	, N.ACTIVE_IND
	, CD_GENDER_DISP = UAR_GET_CODE_DISPLAY(CD.GENDER_CD)
	, CD_LOCATION_DISP = UAR_GET_CODE_DISPLAY(CD.LOCATION_CD)
	, CD_POSITION_DISP = UAR_GET_CODE_DISPLAY(CD.POSITION_CD)
	, CD.REQUIRED_IND
	, CD.AGE_FROM_NBR
	, CD_AGE_FROM_UNIT_DISP = UAR_GET_CODE_DISPLAY(CD.AGE_FROM_UNIT_CD)
	, CD.AGE_TO_NBR
	, CD_AGE_TO_UNIT_DISP = UAR_GET_CODE_DISPLAY(CD.AGE_TO_UNIT_CD)

FROM
	COND_EXPRESSION   C
	, COND_EXPRESSION_COMP   CE
	, CONDITIONAL_DTA   CD
	, NOMENCLATURE   N

PLAN C WHERE C.ACTIVE_IND = 1
JOIN CE WHERE C.COND_EXPRESSION_ID = CE.COND_EXPRESSION_ID         AND CE.ACTIVE_IND = 1
JOIN CD WHERE CE.COND_EXPRESSION_ID = CD.COND_EXPRESSION_ID         AND CD.ACTIVE_IND = 1
JOIN N WHERE outerjoin(CE.PARENT_ENTITY_ID) = N.NOMENCLATURE_ID

ORDER BY
	C.COND_EXPRESSION_NAME

WITH MAXREC = 20000, NOCOUNTER, SEPARATOR=" ", FORMAT
