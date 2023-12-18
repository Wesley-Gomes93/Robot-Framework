*** Settings ***
Resource         ../resources/main.robot
Test Setup       Dado que eu acesse o Organo
Test Teardown    Fechar o navegador



*** Test Cases ***
Verificar se ao Preencher os campos do formulario corretamente os dados sao inseridos na lista e se um novo card é criado no time esperado 
    Dado preencha os campos do formulario
    E clique no botao criar card
    Entao identificar o card no time esperado 


Verificar se é possivel criar mais de um card se preenchermos os campos corretamente
    Dado preencha os campos do formulario
    E clique no botao criar card
    Entao identificar tres card no time esperado 

Verificar se é possivel criar um card para cada time disponivel se preenchermos os campos corretamente
    Dado preencha os campos do formulario
    Entao criar e identificar um card em cada time disponivel