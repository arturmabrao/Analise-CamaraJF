SELECT count(proj.projeto)
	, proj.ano
	, proj.tipo

FROM atividade_camarajf_simp.atividade_camarajf.projeto proj

WHERE proj.codigo_tipo = 'REQ'

	AND (
--		UPPER(proj.ementa) 	LIKE '%EMPAV%'
--	OR  UPPER(proj.ementa)	LIKE '%RECAPEAMENTO%'
--	OR  UPPER(proj.ementa)	LIKE '%RECAPIAMENTO%'
--	OR  
	   UPPER(proj.ementa)	LIKE '%TAPA BURACO%'
	   )
	
	
GROUP BY proj.ano
		, proj.tipo

ORDER BY proj.ano DESC
		, proj.tipo;