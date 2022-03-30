*Settings*
Documentation    Test Helpers

*Keywords*
Adicione meu usuário fixo no banco
    [Arguments]                 ${user}
    Connect To Postgres
    Insert User                 ${user}
    Disconnect From Database

Fazer Login
    [Arguments]                 ${user}
    Abrir página principal
    Preencher credenciais       ${user}
    Clicar botao de entrar
  
Resetar Geek
    Connect To Postgres
    Reseta o Geek        
    Disconnect From Database
