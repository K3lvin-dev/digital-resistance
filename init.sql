-- Criar a tabela users
CREATE TABLE users (
    id int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
    "name" varchar(100) NOT NULL,
    email varchar(100) NOT NULL,
    "password" text NOT NULL,
    CONSTRAINT users_email_key UNIQUE (email),
    CONSTRAINT users_pkey PRIMARY KEY (id)
);

-- Criar a tabela node_type
CREATE TABLE node_type (
    id SERIAL PRIMARY KEY,
    type_name VARCHAR(20) UNIQUE NOT NULL
);

-- Inserir tipos de node
INSERT INTO node_type (type_name) VALUES ('post'), ('response');

-- Criar a tabela node
CREATE TABLE node (
    id SERIAL PRIMARY KEY,
    parent_id INTEGER REFERENCES node(id) ON DELETE CASCADE,
    node_type_id INTEGER NOT NULL REFERENCES node_type(id),
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    title VARCHAR(255),
    content TEXT NOT NULL,
    likes INTEGER DEFAULT 0,
    dislikes INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    search_vector TSVECTOR GENERATED ALWAYS AS (
        setweight(to_tsvector('simple', coalesce(title, '')), 'A') || 
        setweight(to_tsvector('simple', content), 'B')
    ) STORED
);

-- Criar extensões para busca e autocomplete
CREATE EXTENSION IF NOT EXISTS pg_trgm;
CREATE EXTENSION IF NOT EXISTS unaccent;

-- Criar índice para otimizar buscas por data
CREATE INDEX idx_node_created_at ON node (created_at DESC);

-- Criar índice GIN para pesquisa em conteúdo
CREATE INDEX idx_node_content_trigram 
ON node USING GIN (content gin_trgm_ops);

-- Obter o ID do tipo 'post' manualmente e criar os índices CONCURRENTLY
-- Primeiro, obtenha o ID do tipo 'post'
SELECT id FROM node_type WHERE type_name = 'post';  -- Supondo que o ID retornado seja 1

-- Criar índices CONCURRENTLY

CREATE INDEX CONCURRENTLY idx_node_search_post 
ON node USING GIN (search_vector) 
WHERE node_type_id = 1;

CREATE INDEX CONCURRENTLY idx_node_title_trigram 
ON node USING GIN (title gin_trgm_ops) 
WHERE node_type_id = 1;

CREATE INDEX CONCURRENTLY idx_node_type_post 
ON node (node_type_id) 
WHERE node_type_id = 1;