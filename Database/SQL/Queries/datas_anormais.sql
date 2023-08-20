
select *
 from atividade_camarajf_2013_2022.projeto as p
where p.data_projeto < '1999-12-31'
order by data_projeto asc
  

select *
 from atividade_camarajf_2013_2022.projeto as p
where p.data_projeto > '1999-12-31'
and date_part('Year', p.data_projeto) != p.ano
and p.data_projeto <> '2000-12-31'
order by data_projeto asc
  
 