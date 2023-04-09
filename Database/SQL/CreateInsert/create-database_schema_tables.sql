/*
CREATE DATABASE atividade_camarajf_simp
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;	
*/

CREATE SCHEMA atividade_camarajf
    AUTHORIZATION postgres;

-- -----------------------------------------------------
-- Table atividade_camarajf.legislatura
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS atividade_camarajf.legislatura (
  id_legislatura SERIAL PRIMARY KEY,
  ano_inicio integer CHECK(ano_inicio > 0) NOT NULL,
  ano_fim integer CHECK(ano_fim > 0) NOT NULL,
  data_inicio DATE NOT NULL,
  data_fim DATE NOT NULL
  );


ALTER TABLE IF EXISTS atividade_camarajf.legislatura
    OWNER to postgres;
    
-- -----------------------------------------------------
-- Table atividade_camarajf.partido
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS atividade_camarajf.partido (
  id_partido SERIAL PRIMARY KEY,
  sigla VARCHAR(45) NOT NULL,
  nome VARCHAR(100) NULL,
  data_entrada DATE NULL,
  date_saida DATE NULL
  );

ALTER TABLE IF EXISTS atividade_camarajf.partido
    OWNER to postgres;

-- -----------------------------------------------------
-- Table atividade_camarajf.parlamentar
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS atividade_camarajf.parlamentar (
  id_parlamentar SERIAL PRIMARY KEY,
  nome_completo VARCHAR(45) NULL,
  nome_camara VARCHAR(80) NULL,
  id_legislatura integer CHECK(id_legislatura > 0) NULL,
  id_partido integer NULL,
    FOREIGN KEY (id_legislatura)
    REFERENCES atividade_camarajf.legislatura (id_legislatura)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
    );

ALTER TABLE IF EXISTS atividade_camarajf.parlamentar
    OWNER to postgres;

-- -----------------------------------------------------
-- Table atividade_camarajf.mandato
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS atividade_camarajf.mandato (
  id_mandato SERIAL PRIMARY KEY,
  data_inicio DATE NULL,
  data_fim DATE NULL,
  id_parlamentar integer CHECK(id_parlamentar > 0) NULL,
  id_legislatura integer NULL,
    FOREIGN KEY (id_parlamentar)
    REFERENCES atividade_camarajf.parlamentar (id_parlamentar)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    FOREIGN KEY (id_legislatura)
    REFERENCES atividade_camarajf.legislatura (id_legislatura)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
    );

ALTER TABLE IF EXISTS atividade_camarajf.mandato
    OWNER to postgres;

-- -----------------------------------------------------
-- Table atividade_camarajf.filiacao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS atividade_camarajf.filiacao (
  id_filiacao SERIAL PRIMARY KEY,
  ativa char(1) NULL,
  id_parlamentar integer CHECK(id_parlamentar > 0) NULL,
  id_partido integer NULL,
    FOREIGN KEY (id_parlamentar)
    REFERENCES atividade_camarajf.parlamentar (id_parlamentar)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    FOREIGN KEY (id_partido)
    REFERENCES atividade_camarajf.partido (id_partido)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
    );

ALTER TABLE IF EXISTS atividade_camarajf.filiacao
    OWNER to postgres;
	
-- -----------------------------------------------------
-- Table atividade_camarajf.projeto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS atividade_camarajf.projeto (
  id_projeto SERIAL PRIMARY KEY,
  id_projeto_camara INTEGER NOT NULL,
  projeto integer CHECK(projeto  > 0) NOT NULL,
  ano integer NOT NULL,
  ementa TEXT NULL,
--  data_projeto CHAR(20) NOT NULL,
  data_projeto DATE NULL,
  tramitacao_encerrada VARCHAR(30) NULL,
  situacao VARCHAR(50) NULL,
  aprovado VARCHAR(30) NULL,
  codigo_tipo VARCHAR(10) NULL,
  tipo VARCHAR(70) NOT NULL -- integer CHECK(tipo > 0) NOT NULL
  );

ALTER TABLE IF EXISTS atividade_camarajf.projeto
    OWNER to postgres;

-- -----------------------------------------------------
-- Table atividade_camarajf.autoria
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS atividade_camarajf.autoria (
  id_autoria SERIAL PRIMARY KEY,
  id_projeto integer CHECK(id_projeto > 0) NULL,
  id_projeto_camara integer NOT NULL,
  id_parlamentar integer CHECK(id_parlamentar > 0) NULL,
  nome_autor VARCHAR(80) NULL,
    FOREIGN KEY (id_parlamentar)
    REFERENCES atividade_camarajf.parlamentar (id_parlamentar)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    FOREIGN KEY (id_projeto)
    REFERENCES atividade_camarajf.projeto (id_projeto)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
  );

ALTER TABLE IF EXISTS atividade_camarajf.autoria
    OWNER to postgres;