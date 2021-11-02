*** Settings ***
Documentation       Aqui estarão presentes as resoluções de todos os exercícios da Prime Heroes
...                 É muito importante informarmos o propósito desse documento. 

***Variables***
# Variável do tipo simples
${NOME}     Niêdja Souza

# Variável do tipo dicionários
&{PESSOA}
...         nome=Niêdja
...         sobrenome=Souza
...         idade=34
...         email=niedjak19@tests.com
...         cpf=01682048195
...         genero= feminino

# Variável do tipo Listas
@{FRUTAS}
...         banana
...         maçã
...         laranja
...         mamão
...         morango

***Test Cases***
Cenário: Imprimindo informações da pessoa
    Log To Console      \n${PESSOA.nome}
    Log To Console      ${PESSOA.sobrenome}
    Log To Console      ${PESSOA.idade}
    Log To Console      ${PESSOA.email}
    Log To Console      ${PESSOA.cpf}
    Log To Console      ${PESSOA.genero}

Cenário: Imprimindo lista de frutas uma por vez
    [Tags]      LISTA
    Log To Console      \n${FRUTAS[0]}
    Log To Console      ${FRUTAS[1]}
    Log To Console      ${FRUTAS[2]}
    Log To Console      ${FRUTAS[3]}
    Log To Console      ${FRUTAS[4]}

Cenário: Somando dois valores
    [Tags]      SOMA
    Somar os numeros "56" e "24" 

Cenário: Concatenar Email 
    [Tags]             EMAIL
    Criar email    niedja  souza  34

Cenário: Contar de 0 a 9 
    [Tags]      CONTAR
    Contar de 0 a 9 

Cenário: Percorrer lista de frutas 
    [Tags]      FRUTAS
    Percorrer lista de frutas

Cenário:    Criar frase
    [Tags]      Criar
    Criar Frase

Cenário: Percorrer lista de Países
    [Tags]      PAÍSES
    Percorrer lista de Países 

Cenário: Tomando decisão da cor do carro 
    [Tags]      CARRO
    Escolher um carro       'Prata'

Cenário: Listar números 5 e 8
    [Tags]      Listar
    Listar números 5 ou 8   #'5' ou '8'

***Keywords***
Somar dois números
    [Arguments]     ${NUM_A}    ${NUM_B}
    ${SOMA}         Evaluate    ${NUM_A}+${NUM_B}
    Log to Return        ${SOMA}


Somar os numeros "${NUM_A}" e "${NUM_B}"
     ${SOMA}         Evaluate    ${NUM_A}+${NUM_B}
    Log To Console       ${SOMA}

Criar email 
    [Arguments]         ${nome}     ${sobrenome}        ${idade}
    ${EMAIL}    Catenate        SEPARATOR=_         ${nome}     ${sobrenome}        ${idade}@robot.com
    Log To Console          ${EMAIL}

Contar de 0 a 9 
    FOR  ${COUNT}       IN RANGE    0   9
    Log To Console      ${COUNT}
    END


Percorrer lista de frutas 
    @{FRUTAS}       Create List     banana  maçã    laranja     mamão       morango
    FOR     ${FRUTA}    IN      @{FRUTAS}
    Log to Console      ${FRUTA}
    END

Criar frase 
    FOR     ${COUNT}        IN RANGE    0   11
        Log To Console   Estou no número:${COUNT}
    END

Percorrer lista de Países 
    @{PAÍSES}       Create List    Brasil  Japão   Ucrania     Portugal    Nigéria
    FOR     ${PAÍS}     IN      @{PAÍSES}
    Log To Console      ${PAÍSES}
    END


Escolher um carro 
    [Arguments]       ${COR_CARRO}
    IF      ${COR_CARRO}=='Preto'
        Log To Console      \nEu gostaria de comprar esse carro
    ELSE IF     ${COR_CARRO}=='Prata'
        Log To Console      \nEu também gosto dessa cor
    ELSE
        Log To Console      \nNão gostei das cores que me mostraram 
    END

Listar números 5 ou 8 
    FOR     ${NUMERO}       IN RANGE        0       11
        IF  ${NUMERO}==5
            Log To Console      Eu estou no número:${NUMERO}
        ELSE IF     ${NUMERO}==8
            Log To Console      Estou no número:${NUMERO}
        END
    END
