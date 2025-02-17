## Como Subir o Projeto

### 1. **Clone o repositório**

Clone o repositório para o seu ambiente local:

```bash
git clone https://github.com/K3lvin-dev/digital-resistance
cd seu-repositorio
```

### 2. **Crie um arquivo `.env`**

Crie um arquivo `.env` na raiz do seu projeto com as seguintes variáveis de ambiente:

```env
POSTGRES_USER=board_user
POSTGRES_PASSWORD=board_password
POSTGRES_DB=board_db
```

### 3. **Suba o Docker**

Execute o comando abaixo para iniciar o ambiente Docker com o banco de dados PostgreSQL:

```bash
docker-compose up
```

### 4. **Acessar o Banco de Dados**

Após o Docker ser iniciado, você pode se conectar ao banco de dados usando um cliente SQL ou pela linha de comando. As credenciais são as seguintes:

- **Host**: `localhost`
- **Porta**: `5432`
- **Usuário**: `board_user`
- **Senha**: `board_password`
- **Banco de Dados**: `board_db`

Para acessar via linha de comando:

```bash
psql -h localhost -U board_user -d board_db
```

### 5. **Parar o Docker**

Para parar os contêineres em execução, use o comando abaixo:

```bash
docker-compose down
```

---

