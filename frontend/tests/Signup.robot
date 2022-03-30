*Settings*
Documentation    Signup Test Suite

Resource    ${EXECDIR}/resources/Base.robot

# Test Setup       Start Session
# Test Teardown    Finish Session
Suite Setup        Iniciar sessão
Suite Teardown     Fim o teste

*Test Cases*
Cadastrar novo usuário
    [Tags]    novo

    ${user}    Factory User     faker

    Abrir interface de cadastro
    Preencher formulário de cadastro    ${user}
    Clicar botão cadastrar 
    Usuário cadastrado                  

Duplicate user
    [Tags]    duplicado

    ${user}                   Factory User      faker
    Adicione meu usuário fixo no banco    ${user}

    Abrir interface de cadastro
    Preencher formulário de cadastro    ${user}
    Clicar botão cadastrar 
    Alerta igual a                      Já temos um usuário com o e-mail informado.

Email inválido
    [Tags]    attempt_signup

    ${user}    Factory User    wrong_email

    Abrir interface de cadastro
    Preencher formulário de cadastro    ${user}
    Clicar botão cadastrar 
    Alerta mensagem igual a             O email está estranho

Formulário vazio
    [Tags]    attempt_signup    reqf

    @{expected_alerts}    Create List
    ...                   Cadê o seu nome?
    ...                   E o sobrenome?
    ...                   O email é importante também!
    ...                   Agora só falta a senha!

    Abrir interface de cadastro
    Clicar botão cadastrar 
    Alerta mensagem de erro        ${expected_alerts}

Short Password
    [Tags]        attempt_signup            short_pass
    [Template]    Signup With Short Pass              #tem o mesmo input e output tem o mesmo comportamento  por isso usa o template
    1
    12
    123
    1234
    12345
    a
    a2
    ab3
    ab3c
    a23bc
    -1
    acb#1

*Keywords*
Signup With Short Pass
    [Arguments]    ${short_pass}

    ${user}    Create Dictionary
    ...        name=Paula                       lastname=Onofre
    ...        email=paulaonofre@hotmail.com    password=${short_pass}

    Abrir interface de cadastro
    Preencher formulário de cadastro    ${user}
    Clicar botão cadastrar 
    Alerta mensagem igual a             Informe uma senha com pelo menos 6 caracteres

