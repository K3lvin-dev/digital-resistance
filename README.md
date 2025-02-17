# digital-resistance

```markdown
# Projeto Board - Banco de Dados PostgreSQL com Docker

Este projeto configura um banco de dados PostgreSQL utilizando Docker. Ele cria as tabelas e índices necessários para o funcionamento do sistema, como a tabela `users`, `node_type`, e `node`, além de configurar índices para otimizar a busca e o autocomplete.

## Pré-requisitos

Antes de começar, verifique se você tem as seguintes ferramentas instaladas:

- [Docker](https://www.docker.com/products/docker-desktop) (inclui Docker Compose)
- [Git](https://git-scm.com/)

## Estrutura do Projeto

A estrutura do projeto é a seguinte:

```
.
├── docker-compose.yml  # Arquivo para configuração do Docker Compose
├── init.sql            # Script SQL para criar as tabelas e índices no PostgreSQL
└── README.md           # Este arquivo
```

## Como Subir o Projeto

1. **Clone o repositório**:

   Caso ainda não tenha o repositório, faça o clone para sua máquina local:

   ```bash
   git clone https://seu-repositorio.git
   cd seu-repositorio
   ```

2. **Suba o Docker**:

   No diretório onde o `docker-compose.yml` e `init.sql` estão localizados, execute o seguinte comando para iniciar o ambiente Docker:

   ```bash
   docker-compose up
   ```

   Esse comando irá:

   - Baixar a imagem do PostgreSQL (se necessário).
   - Criar o contêiner do banco de dados.
   - Rodar o script SQL de inicialização que criará as tabelas e índices automaticamente.

3. **Acessar o Banco de Dados**:

   Após o Docker estar em execução, você pode acessar o banco de dados PostgreSQL usando as credenciais definidas:

   - **Host**: `localhost`
   - **Porta**: `5432`
   - **Usuário**: `board_user`
   - **Senha**: `board_password`
   - **Banco de dados**: `board_db`

   Você pode se conectar ao banco usando qualquer cliente SQL, como o [pgAdmin](https://www.pgadmin.org/) ou a linha de comando:

   ```bash
   psql -h localhost -U board_user -d board_db
   ```

4. **Verificar Tabelas e Índices**:

   Após a inicialização do contêiner, as tabelas e índices serão criados automaticamente.

   Para verificar as tabelas, execute:

   ```sql
   \dt
   ```

   Você verá tabelas como `users`, `node_type` e `node`, além de índices criados, como `idx_node_created_at` e `idx_node_search_post`.

5. **Parar o Docker**:

   Para parar os contêineres em execução, use:

   ```bash
   docker-compose down
   ```
