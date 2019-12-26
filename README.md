# Aluguel de Automóveis

Esta aplicação está sendo feita em Ruby on Rails 6. 
Sua finalidade é para gestão de aluguel de automóveis. 
Em nosso sistema levamos em consideração 3 atores. 
São eles recepcionista, operador de estacionamento e administrador.
O sistema não leva em consideração a interação do locatário, 
podendo adicionar esta persona futuramente.

Algumas regras de negócio e consultas presentes no códigos são inicialmente
requisitos para um vaga de emprego (podemos remove-las depois).
A intensão é futuramente aplicar novos conceitos e testar as formas de organização de códigos.

Caso queira contribuir fique a vontade para fazer comentários, pull-requests, etc.


## Instalação

Abra o terminal na pasta onde você quer instalar e execute os comandos:

```
git clone https://github.com/rodrigovenancioverissimo/aluguel-de-automoveis.git
cd aluguel-de-automoveis/
bundle install
rails db:create
rails db:migrate
yarn install
```
## Banco de dados
O sistema foi desenvolvido com base na estrutura do banco de dados que você pode ver no seguinte link
https://dbdiagram.io/embed/5dfd2858edf08a25543f4d74

O sistema foi testado no banco de dados PostgreSQL e SQLite

## Telas
O design e telas do sistema ainda estão sendo desenvolvido porém a idéia segue a seguinte:

 * Temos dois tipos de menus. 
 * Menu da barra de navegação superior, onde estão os links principais separados por perfil de usuário
 * Menu lateral onde terá os pricipais grupos de ações que o usuário poderá fazer

## Mapa do sistema (ainda em construção)
 * Operacional: para os perfis atendente e operador de estacionamento
   * Alocações: para as ações de alugar um automóvel, visualizar ou editar a alocação.
   * Alocações em atraso: para os atendentes verificar e ou entrar em contato com o locatário
   * Entrada e Saída de Automóveis: para o operador de estacionamento
   * Cadastro de clientes: para incluir ou atualizar cadastros de novos clientes
 * Administração
   * Cadastros
     * Alocações
     * Automóveis
     * Configurações
     * Pessoas
   * Relatórios
     * Automóvies
     * Clientes
     * Financeiro
