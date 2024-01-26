**Descrição:**

Nossa API foi desenvolvida para simplificar a gestão de estacionamentos. Disponibilizamos uma coleção no Postman com todas as requisições necessárias: [Coleção Postman](https://api.postman.com/collections/24048916-0fce1ac6-e665-4030-a32f-2672f4acf174?access_key=PMAT-01HN275SRTKQC4K556B0HBFY84).

**Exemplo de Configuração do Ambiente:**

Antes de começar, é crucial configurar uma variável de ambiente com a URL do seu servidor MongoDB. Adicione o arquivo de configuração `.env` à raiz do projeto:

```env
MONGODB_URI="sua_url_aqui"
```

**Instruções para Execução:**

1. Certifique-se de que um servidor MongoDB esteja em execução.
2. Inicie o Redis para garantir o funcionamento adequado da aplicação.

**Execução de Testes:**

Execute os testes utilizando o comando `rspec` no terminal.

**Para executar o servidor:**
Utilize o comando `bundler install`.
Utilize o comando `rails s`.

