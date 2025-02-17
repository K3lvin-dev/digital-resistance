```markdown

Este projeto configura um banco de dados PostgreSQL utilizando Docker. As credenciais do banco de dados são configuradas por variáveis de ambiente para maior segurança.

## Pré-requisitos

- [Docker](https://www.docker.com/products/docker-desktop)

## Como Subir o Projeto

1. **Clone o repositório**:

   ```bash
   git clone https://seu-repositorio.git
   cd seu-repositorio
   ```

2. **Crie um arquivo `.env`**:

   Crie um arquivo `.env` na raiz do seu projeto com as seguintes variáveis:

   ```env
   POSTGRES_USER=board_user
   POSTGRES_PASSWORD=board_password
   POSTGRES_DB=board_db
   ```

3. **Suba o Docker**:

   Execute o seguinte comando para iniciar o ambiente Docker:

   ```bash
   docker-compose up
   ```

4. **Acessar o Banco de Dados**:

   - **Host**: `localhost`
   - **Porta**: `5432`
   - **Usuário**: `board_user`
   - **Senha**: `board_password`
   - **Banco de dados**: `board_db`

   Você pode se conectar ao banco usando um cliente SQL ou a linha de comando:

   ```bash
   psql -h localhost -U board_user -d board_db
   ```

5. **Parar o Docker**:

   Para parar os contêineres em execução, use:

   ```bash
   docker-compose down
   ```

```
