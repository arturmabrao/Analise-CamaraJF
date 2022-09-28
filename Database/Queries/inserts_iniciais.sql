-- INSERT TABELA PROJETOS
COPY atividade_camarajf.projeto(projeto,ano,tipo,ementa,situacao,codigo_tipo,id_projeto,data_projeto,tramitacao_encerrada,aprovado)
FROM 'D:\Estudo\IF\2022\TCC2\Analise-Camara\Analise-CamaraJF\ListagemExp\ListagemExport.csv'
DELIMITER ','
CSV HEADER;

-- INSERT TABELA AUTORIA
COPY atividade_camarajf.autoria(id_projeto,nome_autor)
FROM 'D:\Estudo\IF\2022\TCC2\Analise-Camara\Analise-CamaraJF\ListagemExp\AutoriasExport.csv'
DELIMITER ','
CSV HEADER;

-- INSERT TABELA PARLAMENTAR
INSERT INTO atividade_camarajf.parlamentar  (nome_camara)
	SELECT DISTINCT(nome_autor) 
	FROM atividade_camarajf.autoria
	

-- AUTALIZACAO DA TABELA DE AUTORIA, ATRIBUINDO OS IDS DOS PARLAMENTARES AO CAMPO FK
UPDATE atividade_camarajf.autoria 
 SET id_parlamentar = (SELECT atividade_camarajf.parlamentar.id_parlamentar
					FROM atividade_camarajf.parlamentar
					WHERE atividade_camarajf.parlamentar.nome_camara = atividade_camarajf.autoria.nome_autor)
 WHERE nome_autor = (SELECT atividade_camarajf.parlamentar.nome_camara 
					FROM atividade_camarajf.parlamentar
					WHERE atividade_camarajf.parlamentar.nome_camara = atividade_camarajf.autoria.nome_autor)
