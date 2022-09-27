COPY atividade_camarajf.projeto(projeto,ano,tipo,ementa,situacao,codigo_tipo,id_projeto,data_projeto,tramitacao_encerrada,aprovado)
FROM 'D:\Estudo\IF\2022\TCC2\Analise-Camara\Analise-CamaraJF\ListagemExp\ListagemExport.csv'
DELIMITER ','
CSV HEADER;

COPY atividade_camarajf.autoria(id_projeto,nome_autor)
FROM 'D:\Estudo\IF\2022\TCC2\Analise-Camara\Analise-CamaraJF\ListagemExp\AutoriasExport.csv'
DELIMITER ','
CSV HEADER;


INSERT INTO atividade_camarajf.parlamentar  (nome_camara)
	SELECT DISTINCT(nome_autor) 
	FROM atividade_camarajf.autoria