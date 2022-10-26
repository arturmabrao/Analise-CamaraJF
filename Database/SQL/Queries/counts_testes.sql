SELECT 
--ementa 
	COUNT(pj.id_projeto_camara) numero_projetos 
	, pj.ano
	, aut.nome_autor

FROM atividade_camarajf.projeto		pj

inner join atividade_camarajf.autoria 	aut
	on pj.id_projeto = aut.id_projeto 
WHERE 
--UPPER(ementa) like '%RUA%'
--AND
(
	--UPPER(ementa) like '%RECAPEAMENTO%'
	 --OR UPPER(ementa) like '%RECAPIAMENTO%'
	 --OR UPPER(ementa) like '%ASFALTAMENTO%'
	 --OR UPPER(ementa) like '%PAVIMENTAÇÃO%'
	 -- UPPER(ementa) like '%EMPAV%'
--	 UPPER(ementa) like '%TAPA BURACO%'
	 UPPER(pj.ementa) like '%LIMPEZA%BOCA%LOBO%'
	 OR UPPER(pj.ementa) like '%LIMPEZA%BUEIRO%'
)

group by pj.ano, aut.nome_autor

order by numero_projetos desc