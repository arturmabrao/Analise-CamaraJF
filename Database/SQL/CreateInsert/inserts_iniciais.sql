-- INSERT TABELA PROJETOS
COPY atividade_camarajf.projeto(projeto,ano,tipo,ementa,situacao,codigo_tipo,id_projeto_camara,data_projeto,tramitacao_encerrada,aprovado)
FROM 'D:\Estudo\IF\2022\TCC2\Analise-Camara\Analise-CamaraJF\ListagemExp\ListagemExport.csv'
--FROM 'D:\Estudo\IF\2022\TCC2\Analise-Camara\Analise-CamaraJF\ListagemExp\ListagemExport_Database.csv'
DELIMITER ','
CSV HEADER;

-- INSERT TABELA AUTORIA
COPY atividade_camarajf.autoria(id_projeto_camara,nome_autor)
FROM 'D:\Estudo\IF\2022\TCC2\Analise-Camara\Analise-CamaraJF\ListagemExp\AutoriasExport.csv'
DELIMITER ','
CSV HEADER;

-- AUTALIZACAO DA TABELA DE AUTORIA, ATRIBUINDO OS IDS DOS PROJETOS AO CAMPO FK
UPDATE atividade_camarajf.autoria 
 SET id_projeto = (SELECT atividade_camarajf.projeto.id_projeto
					FROM atividade_camarajf.projeto
					WHERE atividade_camarajf.projeto.id_projeto_camara = atividade_camarajf.autoria.id_projeto_camara)
 WHERE id_projeto_camara = (SELECT atividade_camarajf.projeto.id_projeto_camara 
							FROM atividade_camarajf.projeto
							WHERE atividade_camarajf.projeto.id_projeto_camara = atividade_camarajf.autoria.id_projeto_camara);
							

-- INSERT TABELA PARLAMENTAR
INSERT INTO atividade_camarajf.parlamentar  (nome_camara)
	SELECT DISTINCT(nome_autor) 
	FROM atividade_camarajf.autoria;
	

-- AUTALIZACAO DA TABELA DE AUTORIA, ATRIBUINDO OS IDS DOS PARLAMENTARES AO CAMPO FK
UPDATE atividade_camarajf.autoria 
 SET id_parlamentar = (SELECT atividade_camarajf.parlamentar.id_parlamentar
					FROM atividade_camarajf.parlamentar
					WHERE atividade_camarajf.parlamentar.nome_camara = atividade_camarajf.autoria.nome_autor)
 WHERE nome_autor = (SELECT atividade_camarajf.parlamentar.nome_camara 
					FROM atividade_camarajf.parlamentar
					WHERE atividade_camarajf.parlamentar.nome_camara = atividade_camarajf.autoria.nome_autor);