SELECT count(p.id_projeto)
	, p.id_projeto_camara
FROM atividade_camarajf_norm.projeto p

GROUP BY p.id_projeto_camara
ORDER BY COUNT(p.id_projeto) desc