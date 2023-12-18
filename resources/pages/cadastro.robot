*** Settings ***
Resource    ../main.robot

*** Variables ***
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao

@{selecionar_times}
...      //option[contains(.,'Programação')]
...      //option[contains(.,'Front-End')]
...      //option[contains(.,'Data Science')]
...      //option[contains(.,'Devops')] 
...      //option[contains(.,'UX e Design')]
...      //option[contains(.,'Mobile')]
...      //option[contains(.,'Inovação e Gestão')]
  
*** Keywords ***
Dado preencha os campos do formulario
    ${Nome}        FakerLibrary.First Name
    Input Text     ${CAMPO_NOME}      ${Nome}
    ${Cargo}       FakerLibrary.Job 
    Input Text     ${CAMPO_CARGO}     ${Cargo}
    ${Imagem}      FakerLibrary.Image Url    width=100  height=100
    Input Text     ${CAMPO_IMAGEM}   ${Imagem}
    Click Element  ${CAMPO_TIME}
    Click Element  ${selecionar_times}[0]

E clique no botao criar card
    Click Element    ${BOTAO_CARD}

Entao identificar o card no time esperado
    Element Should Be Visible    class:colaborador

Entao identificar tres card no time esperado 
    FOR    ${i}    IN RANGE    1    3
       Dado preencha os campos do formulario
       E clique no botao criar card
    END

Entao criar e identificar um card em cada time disponivel
   FOR    ${indice}    ${time}    IN ENUMERATE    @{selecionar_times}
   Dado preencha os campos do formulario
   Click Element    ${time}
   E clique no botao criar card 
   END

Dado que eu clique no botao criar card 
    Click Element    ${BOTAO_CARD}
Entao sistema deve apresentar mensagem de campo obrigatorio
    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro
