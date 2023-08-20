select * 
 from atividade_camarajf_2013_2022.projeto as p
where COALESCE(p.aprovado,'') = ''


select -- count(*),
--p.aprovado
count(codigo_tipo),(codigo_tipo)
 from atividade_camarajf_2013_2022.projeto as p
where COALESCE(p.aprovado,'') = ''
--group by p.aprovado
group by  codigo_tipo

/*
update p
set p.data_projeto = 

from atividade_camarajf_2013_2022.projeto as p
where 1=0
and id_projeto_camara < 0
*/

select max(id_projeto_camara)
,min(id_projeto_camara) --p.aprovado
--count(codigo_tipo),(codigo_tipo)
 from atividade_camarajf_2013_2022.projeto as p
where COALESCE(p.aprovado,'') = ''
--group by p.aprovado
group by  codigo_tipo

