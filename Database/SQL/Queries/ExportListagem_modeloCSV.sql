COPY 
(
	SELECT pj.projeto Projeto
	 , pj.ano Ano
	 , pj.tipo Tipo
	 , pj.ementa Ementa
	 , pj.situacao Situacao
	 ,  
	 array_agg(aut.nome_autor) Autor
	 , pj.codigo_tipo Codigo_Tipo
	 , pj.id_projeto_camara Id_Projeto_Camara
	 , pj.data_projeto Data_Projeto
	 , pj.tramitacao_encerrada Tramitacao_Encerrada
	 , pj.aprovado Aprovado

	FROM atividade_camarajf.projeto		pj
	
	 INNER JOIN atividade_camarajf.autoria	aut
	  ON pj.id_projeto_camara = aut.id_projeto_camara
		
	GROUP BY aut.id_projeto_camara
 		, pj.projeto
 		, pj.ano
 		, pj.tipo
 		, pj.ementa
 		, pj.situacao
 		, pj.codigo_tipo
	 	, pj.id_projeto_camara
 		, pj.aprovado
 		, pj.data_projeto
 		, pj.tramitacao_encerrada
)

TO 'D:\Estudo\IF\2022\TCC2\Analise-Camara\Analise-CamaraJF\ListagemExp\ListagemExport_Database.csv' 
With CSV DELIMITER ','
HEADER;