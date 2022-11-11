SELECT count(proj.projeto)
	, proj.ano
	, proj.tipo

FROM atividade_camarajf_simp.atividade_camarajf.projeto proj

GROUP BY proj.ano
		, proj.tipo

ORDER BY proj.ano DESC
		, proj.tipo;