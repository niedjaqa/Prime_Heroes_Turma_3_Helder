***Settings***
Documentation       Aqui estarão todos os testes Web do curso Prime Hero.
...                 A ideia e criarmos cenários de verificação com a library Selenium. 

Library             SeleniumLibrary 
#robot  tests/webautomation.robot
#python -m robot tests/webautomation.robot

Library             FakerLibrary
#FakerLibrary 

Test Setup          Abrir Navegador
Test Teardown       Fechar Navegador 

***Variables***
${URL}          http://automationpractice.com/index.php
${BROWSER}      chrome




***Test Cases***
Caso de Teste 01: Pesquisar Produto Existente
    Acessar a página home do site Automation Practice 
    Digitar o nome do produto "Blouse" no campo de pesquisa 
    Clicar no botão pesquisar 
    Conferir se o produto "Blouse" foi listado no site 

Caso de teste 02: Produto não-existente
    Acessar a página home do site Automation Practice
    Digitar o nome do produto "itemNãoExistente" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir mensagem "No results were found for your search"

Caso de teste 03: Listar Produtos 
    Acessar a página home do site Automation Practice
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Clicar na sub categoria "Summer Dresses"
    Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página 

Caso de teste 04: Adicionar cliente
    Acessar a página home do site Automation Practice
    Clicar em "Sign in"
    Informar um email válido
    Clicar em "Create an account"
    Preencher os dados obrigatórios
    Submeter cadastro 
    Conferir se o cadastro foi efetuado com sucesso


***Keywords***
#Cenário 1

Abrir Navegador
    Open Browser        browser=${BROWSER}
    Maximize Browser Window

Fechar Navegador 
    Capture Page Screenshot
    Close Browser

Acessar a página home do site Automation Practice 
    Go To                               ${URL}
    Title Should Be                     My Store
    Wait Until Element Is Visible       id=block_top_menu

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa 
    Input Text          id=search_query_top     ${PRODUTO} 

Clicar no botão pesquisar 
    Click Element       xpath=//*[@name='submit_search']

Conferir se o produto "${PRODUTO}" foi listado no site 
    Wait Until Element is Visible       id=center_column
    Title Should Be                    Search - My Store
    Page Should Contain Image           xpath=//*[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']

#Cenário 2
Conferir mensagem "${mensagem}"
    Wait Until Element is Visible  //*[contains(text(),'${mensagem}')]


#Cenário 3

Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Mouse Over                          //*[text()='Women'][@title='Women']

Clicar na sub categoria "Summer Dresses"
    Click Element                       (//*[text( )='Summer Dresses'][@title='Summer Dresses'])[1]

Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página 
    Wait Until Element is Visible       //span[contains(text(),'Summer Dresses ')]

#Cenário 4 
Clicar em "Sign in"
    Click Element                       //a[@title='Log in to your customer account']

Informar um email válido
    ${EMAILFAKE}                FakerLibrary.Email
    Input Text          id=email_create     ${EMAILFAKE}

Clicar em "Create an account"
    Click Element       id=SubmitCreate

Preencher os dados obrigatórios
    Wait Until Element is Visible       xpath=//input[@id='id_gender2']
    Click Element                       xpath=//input[@id='id_gender2']
    Input Text                          id=customer_firstname       Niêdja
    Input Text                          id=customer_lastname        Souza
    Input Password                      id=passwd                   Wn.85994512
    Select From List By Value           id=days                     26
    Select From List By Value           id=months                   6
    Select From List By Value           id=years                    1987
    Click Element                       id=newsletter
    Input Text                          id=firstname                Niêdja
    Input Text                          id=lastname                 Souza
    Input Text                          id=company                  Prime Control
    Input Text                          id=address1                 Rua Japão, 123
    Input Text                          id=address2                 Bloco H
    Input Text                          id=city                     Curitiba
    Select From List By Value           id=id_state                 1
    Input Text                          id=postcode                 12345
    Select From List By Value           id=id_country               21
    Input Text                          id=phone                    3377-9951
    Input Text                          id=alias                    Rua das Alianças,345


Submeter cadastro 
    Click Element       id=submitAccount

Conferir se o cadastro foi efetuado com sucesso
    Wait Until Element is Visible      //*[contains(text(),'Welcome to')]

