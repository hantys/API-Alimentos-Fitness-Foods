# API-Alimentos-Fitness-Foods
## Backend Challenge 20230105

>  This is a challenge by [Coodesh](https://coodesh.com/)

### Tecnologias
 - Ruby
 - Rails
 - Docker
 - Redis
 - PostgreSQL
### Introdução
 API de informação nutricional dos alimentos que os usuários publicam pela aplicação móvel, dados do projeto Open Food Facts

### Instalação e execução da aplicação
- Instale o docker. [link docker](https://docs.docker.com/compose/install/)
- Instale o docker compose. [link docker-compose](https://docs.docker.com/compose/install/linux/)
- Iniciar a aplicação: ``$ make start``.
- Iniciar a com rebuild(--build --remove-orphans): ``$ make start-build``.
- Desligar a aplicação: ``$ make stop``.
- Criar banco e rodar migrações: ``$ make create``.
- Rodar seed: ``$ make seed``.
- Reseta o banco de dados e roda seed: ``$ make restart``.
- Executa os testes. obs:(Você pode passar os argumentos do RSpec logo após o comando. ARG='argumentos'): ``$ make rspec ``.
- Entra no console: ``$ make console``.
``.