CREATE TABLE "agenda_contato" (
    "id" integer NOT NULL PRIMARY KEY,
    "confidencial" boolean NOT NULL,
    "tratamento" varchar(4) NOT NULL,
    "nome" varchar(50) NOT NULL,
    "sobrenome" varchar(50) NOT NULL,
    "nome_fantasia" varchar(50) NOT NULL,
    "razao_social" varchar(50) NOT NULL,
    "tipo_contato" varchar(1) NOT NULL,
    "cargo" varchar(50) NOT NULL,
    "email" varchar(75) NOT NULL,
    "cnpj" varchar(13) NOT NULL,
    "ie" varchar(15) NOT NULL,
    "cpf" varchar(11) NOT NULL,
    "rg" varchar(10) NOT NULL,
    "criado_em" datetime NOT NULL,
    "modificado_em" datetime NOT NULL
);
CREATE TABLE "agenda_relacionamento" (
    "id" integer NOT NULL PRIMARY KEY,
    "contato_id" integer NOT NULL REFERENCES "agenda_contato" ("id"),
    "relaciona_com_id" integer NOT NULL REFERENCES "agenda_contato" ("id")
);
CREATE TABLE "agenda_contatotag" (
    "id" integer NOT NULL PRIMARY KEY,
    "contato_id" integer NOT NULL REFERENCES "agenda_contato" ("id"),
    "tag_id" integer NOT NULL
);
CREATE TABLE "agenda_tag" (
    "id" integer NOT NULL PRIMARY KEY,
    "tag" varchar(100) NOT NULL
);
CREATE TABLE "agenda_endereco" (
    "id" integer NOT NULL PRIMARY KEY,
    "contato_id" integer NOT NULL REFERENCES "agenda_contato" ("id"),
    "tipo_endereco" varchar(1) NOT NULL,
    "logradouro" varchar(200) NOT NULL,
    "complemento" varchar(100) NOT NULL,
    "bairro" varchar(100) NOT NULL,
    "cidade" varchar(100) NOT NULL,
    "uf" varchar(100) NOT NULL,
    "pais" varchar(100) NOT NULL,
    "cep" varchar(50) NOT NULL
);
CREATE TABLE "agenda_fone" (
    "id" integer NOT NULL PRIMARY KEY,
    "contato_id" integer NOT NULL REFERENCES "agenda_contato" ("id"),
    "fone" varchar(50) NOT NULL,
    "tipo_fone" varchar(3) NOT NULL
);
