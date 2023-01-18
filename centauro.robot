*** Settings ***
Documentation        Esta é uma automaçao para abrir o site da centauro, efetuar login, adicionar intens e exluir do carrinho e efetuar logout
Resource             centauro_source.robot
Test Setup           Abrir o navegador
Test Teardown        Fechar o navegador

*** Test Cases ***

Caso de Teste - Buscar relatorio

    Dado que estou no site Centauro.com.br
    Quando efetuo cadastro no site

Caso de Teste - Efetuar login e Incluir item ao carrinho
    Dado que estou no site Centauro.com.br
    Quando efetuo login
    Posso incluir Item ao Carrinho
    Dentro do Carrinho Remover Item
    Efetuo logout
