CREATE DATABASE opt120;
use opt120;

CREATE TABLE usuario (
    id int AUTO_INCREMENT PRIMARY KEY,
    nome varchar(100),
    email varchar(100) NOT NULL UNIQUE,
    senha varchar(100) NOT NULL
    
);

CREATE TABLE atividade (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    descricao VARCHAR(100),
    nota FLOAT,
    data_atv DATETIME
);

CREATE TABLE usuario_atividade(
    usuario_id INT,
    atividade_id INT,
    entrega DATETIME,
    nota FLOAT,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    FOREIGN KEY (atividade_id) REFERENCES atividade(id),
    PRIMARY KEY (usuario_id, atividade_id)
);