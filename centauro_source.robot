
*** Settings ***
Library     SeleniumLibrary
Library     Process

*** Variables ***
${URL}      https://www.centauro.com.br
${NOME}     Vitor
${SOBRENOME}        Gilardino
${CPF}      21246257645
${NASC}     05011980
${TEL}      61999714567
${CEP}      71994305
${uname}        test${CPF}@email.com
${pass}         Teste2023!

*** Keywords ***

Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window
Fechar o navegador
    Capture Page Screenshot
    Close Browser

Dado que estou no site Centauro.com.br
    Go To   url=${URL}

Quando efetuo cadastro no site
    Click Button    locator=//button[contains(@id,'adopt-accept-all-button')]
    Mouse Up    locator=//a[@data-testid='router-link'][contains(.,'Meus pedidos')]
    Wait Until Element Is Visible   locator=//a[contains(.,'Entre / Cadastre-se')]
    Click Element   locator=//a[@data-testid='router-link'][contains(.,'Entre / Cadastre-se')]
    Wait Until Element Is Visible   locator=//button[contains(.,'Entrar')]
    Click Button    locator=//button[contains(.,'Criar uma conta')]
    Wait Until Element Is Visible   locator=//div[@class='_15hru0s'][contains(.,'Dados Pessoais')]
    Input Text  locator=(//input[contains(@name,'Nome')])[1]    text=${NOME}
    Input Text  locator=(//input[contains(@data-testid,'lastName')])[1]     text=${SOBRENOME}
    Press Keys  (//input[contains(@placeholder,'CPF*')])[1]     ${CPF}
    Click Element   (//input[contains(@data-testid,'birthDate')])[1]
    Press Keys  None    ${NASC}
    Select From List By Index   (//select[@data-testid='gender'])[1]    1
    Click Element   locator=(//input[contains(@data-testid,'cep')])[1]
    Press Keys  None    ${CEP}
    Click Element   locator=//label[@id='terms-accept']//*[name()='svg']
    Press Keys  (//input[@placeholder='Telefone Celular'])[1]   ${TEL}
    Input Text  locator=(//input[@placeholder='Digite seu E-mail*'])[1]     text=${uname}
    Input Text  locator=(//input[@name='Senha'])[1]     text=${CPF}
    Input Text  locator=(//input[@data-testid='confirmPassword'])[1]    text=${CPF}
    Click Element   locator=//input[@class='_159r3op8']
    Input Text  locator=//input[contains(@class,'_1s0vxaa0')]    text=7
    Wait Until Element Contains     locator=(//li[contains(.,'E-mail, CPF ou CNPJ jÃ¡ cadastrado')])[1]  text=CPF

    Sleep   5

Quando efetuo login
    Mouse Up    locator=//a[@data-testid='router-link'][contains(.,'Meus pedidos')]
    Wait Until Element Is Visible   locator=//a[contains(.,'Entre / Cadastre-se')]
    Click Element   locator=//a[@data-testid='router-link'][contains(.,'Entre / Cadastre-se')]
    Wait Until Element Is Visible   locator=//button[contains(.,'Entrar')]
    Input Text  locator=//input[@id='username']     text=${uname}
    Input Text  locator=//input[@id='password']     text=${CPF}
    Click Button    locator=//button[@type='submit']
    Wait Until Element Is Visible   locator=//a[contains(.,'Meus pedidos')]

Posso incluir Item ao Carrinho
    Input Text    //input[@placeholder='O que vocÃª procura? :)']    Bola de Futebol
    Press Keys    //input[@placeholder='O que vocÃª procura? :)']    ENTER
    Mouse Up    (//img[contains(@alt,'Bola de Basquete Penalty PlayOff I')])[1]
    Click Element    //button[contains(.,'Adicionar ao carrinho')]
    Click Element    //svg[contains(@class,'jss1 _137j409')]
    Sleep    5

Dentro do Carrinho Remover Item
    Click Element    //div[@class='_12to336'][contains(.,'remover')]
    Wait Until Element Contains    //h3[@class='_a3z50j'][contains(.,'Seu carrinho está vazio')]    text=vazio
    Sleep    5


Efetuo logout
    Mouse Up    //div[@class='login_hover _pyet5k'][contains(.,'Olá, VitorMeus pedidos')]
    Click Element    (//font[contains(.,'Sair')])[2]
    Wait Until Element Contains    //div[@class='login_hover _pyet5k'][contains(.,'Entre ou cadastre-seMeus pedidos')]    text=entre

