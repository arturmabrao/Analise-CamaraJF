select distinct(p.ano), count(p.codigo_tipo) 
 from atividade_camarajf_2013_2022.projeto as p
where upper(codigo_tipo) = 'EMENDA'
group by p.ano
