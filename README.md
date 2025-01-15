# futinfo

<p>
  A ideia para desenvolver esse projeto veio de um desejo pessoal, voltar a acompanhar o futebol nacional com mais afinco, algo que tinha parado desde o ensino médio e gostava tanto. 
  Para o aplicativo, tinha como objetivo criar algo simples, de fácil adaptação por parte dos usuários e com boa usabilidade, realizando testes com usuários reais e colhendo feedbacks para possível alterações e melhorias. 
  Assim cheguei na versão 1.
</p>
<p>
  Nesse projeto, pude unir duas áreas que gosto bastante, a tecnólogia e o futebol. Na escolha das tecnólogias para criar o aplicativo, optei pelas que tenho mais familiaridade e algumas que tinha curiosidade. Foram elas
  o Flutter, como framework mobile, o GetX para gerenciar o estado dos widgets, o Dio para realizar as requisições a API, o padrão MVC para organização do projeto e o SQLite, única das tecnologias citadas que eu não tinha experiência e fiquei bastante empolgado em conhecer.
</p>

## Funcionalidades:
- Ver informações dos jogos atuais do campeonato brasileiro série A.
- Ver informações de jogos de rodadas especifícas do campeonato brasileiro série A.
- Ver a tabela atualizada do campeonato brasileiro série A.
- Ver o ranking de artilheiros do campeonato brasileiro série A.
- Ver informações de um jogo específico do campeonato brasileiro série A
- Ver informações sobre jogos de um time específico do campeonato brasileiro série A
- Ver o elenco de um time especifíco do campeonato brasileiro série A.
- Favoritar um time para ter acesso mais rápido a ele.
- Alternar entre o modo claro e escuro do app
- Ver todos os seus times favoritos do campeonato brasileiro série A
- Ver a tabela do campeonato brasileiro série A, destacando seus times favoritos

## Tecnologias utilizadads:
- `Flutter`: Framework multiplataforma desenvolvido pela Google e que utiliza a linguagem Dart.
- `SQLite`: Banco de dados leve, utilizado para gerenciar o favoritos.
- `MVC`: Padrão de arquitetura de software que separa o projeto em três partes principais, model, view e controller. 
- `GetX`: Gerenciador de estados popular no Flutter.
- `Dio`: Responsavél por realizar as requisições a API.

## Instalação
Após o clone do repositório, instala as dependências executando o comando:
```bash
  flutter pub get
```

Se registre no site abaixo para ter acesso ao token da API
```bash
  https://www.football-data.org/client/register
```
Crie um arquivo .env na pasta assets, como no exemplo e cole seu token da api

## Aplicativo
<p align="center">
  <img src="https://github.com/user-attachments/assets/7281b0b7-9f54-4274-81b6-4049968c831b" alt="apresentação_app" width="400"/>
</p>


## Telas do aplicativo

### Principal
  - Responsável por exibir os jogos do campeonado brasileiro série A.
  - Botão para visualizar a tabela do campeonado.
  - Select para exibir os jogos de uma rodada especifíca.
  - Definição do modo claro ou escuro.
    
<p align="left">
  <img src="https://github.com/user-attachments/assets/ef253e00-96c0-410e-875a-0eef29ce6ea3" alt="home_app" width="250"/>
  &nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/bd16cc6d-3fdb-4302-a6f9-f6a6f1415771" alt="modo_escuro_app" width="250"/>
  &nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/8350fa75-3b7e-4c73-8f54-6f6773641fff" alt="select_rodada" width="250"/>
</p>

### Favoritos
  - Mantém os times preferidos do usuário mais facilmente acessíveis.
  - Possui um botão para visualizar a tabela, destacando os times selecionados.
<p align="left">
  <img src="https://github.com/user-attachments/assets/2223d192-73e1-42a5-bb2e-91186af665ca" alt="home_app" width="250"/>
  &nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/46f02e7a-dcd3-474b-8c21-a159c6045ad8" alt="modo_escuro_app" width="250"/>
  &nbsp;&nbsp;&nbsp;
</p>

### Tabela
  - Mostra a classificação atual do campeonato.
  - Destaca os times que estão se classificando para a próxima copa Libertadores da América.
  - Destaca os times que estão na zona de rebaixamento para a série B do próximo ano.
  - Possui um botão para visualizar a tabela de artilheiros do campeonato.

<p align="left">
  <img src="https://github.com/user-attachments/assets/5864613d-4349-4f01-a599-bd4e036fa956" alt="home_app" width="250"/>
  &nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/c82ce836-50b3-4f14-9ca7-6f48fbc10357" alt="modo_escuro_app" width="250"/>
  &nbsp;&nbsp;&nbsp;
</p>

### Time
- Mostra os jogos do time em um intervalo de tempo (de um mês antes a um mês depois da data atual).
- Usuário pode definir o tempo de busca dos jogos.
- Botão para ver o elenco do time.
- Botão para favoritar e desfavoritar o time.
  
<p align="left">
  <img src="https://github.com/user-attachments/assets/471800e9-0803-4be9-a186-948ddb10087a" alt="home_app" width="250"/>
  &nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/03e6372e-464e-4d52-9b3a-7fe0a0b63543" alt="modo_escuro_app" width="250"/>
  &nbsp;&nbsp;&nbsp;
</p>


### Detalhes do jogo
- Mostra o resultado final da partida.
- Mostra os resultados parciais do primeiro e segundo tempo.
  
<p align="left">
  <img src="https://github.com/user-attachments/assets/8d6a6b4f-5eb1-4e54-ac13-5b884f08d483" alt="home_app" width="250"/>
  &nbsp;&nbsp;&nbsp;
</p>

### Funcionalidades futuras
- Dados estatísticos sobre um time
- Informações de jogadores
- Novas ligas

##
<p align="center">🚧 Em construção 🚧</p>
