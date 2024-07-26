CREATE TABLE Pessoa (
    nome varchar(100),
    cpf varchar(20) PRIMARY KEY,
    email varchar(100)
);

ALTER TABLE Pessoa ADD CONSTRAINT unique_nome UNIQUE (nome);

CREATE TABLE Telefone (
    numero varchar(100),
    cpf_telefone varchar(20)
);

ALTER TABLE Telefone
    ADD FOREIGN KEY (cpf_telefone) REFERENCES Pessoa(cpf),
    ADD PRIMARY KEY (cpf_telefone, numero);

CREATE TABLE Ticket (
    endereco varchar(100),
    titulo varchar(100),
    protocolo serial,
    abertura timestamp,
    fechamento timestamp,
    patrimonio varchar(100),
    cpf_ticket varchar(20)
);

ALTER TABLE Ticket
    ADD PRIMARY KEY(protocolo),
    ADD FOREIGN KEY (cpf_ticket) REFERENCES Pessoa(cpf);

CREATE TABLE Servidor (
    siape varchar(10),
    unidade varchar(100),
    login varchar(100),
    senha varchar(100),
    cpf_servidor varchar(20)
);

ALTER TABLE Servidor
    ADD FOREIGN KEY (cpf_servidor) REFERENCES Pessoa(cpf),
    ADD PRIMARY KEY (login, cpf_servidor);

CREATE TABLE Bolsista (
    matricula varchar(10),
    login varchar(100),
    senha varchar(100),
    curso varchar(100),
    cpf_bolsista varchar(20)
);

ALTER TABLE Bolsista
    ADD FOREIGN KEY (cpf_bolsista) REFERENCES Pessoa(cpf),
    ADD PRIMARY KEY (login, cpf_bolsista);

CREATE TABLE Descricao (
    descricao varchar(500),
    data timestamp,
    autor varchar(100),
    protocolo integer
);

ALTER TABLE Descricao
    ADD FOREIGN KEY (protocolo) REFERENCES Ticket(protocolo),
    ADD FOREIGN KEY (autor) REFERENCES Pessoa(nome);