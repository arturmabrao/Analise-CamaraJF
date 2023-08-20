
select count(*), (p.codigo_tipo)
 from atividade_camarajf_2013_2022.projeto as p
where p.situacao = 'Arquivada'
and p.aprovado = 'SIM'

group by (p.codigo_tipo)