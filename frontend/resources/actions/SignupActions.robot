*Settings*
Documentation           Signup actions

*Keywords*
Abrir interface de cadastro
    Go To       ${BASE_URL}/signup
    Wait For Elements State     css=.signup-form    visible     5

Preencher formulário de cadastro
    [Arguments]         ${user}

    Fill Text       id=name         ${user}[name]
    Fill Text       id=lastname     ${user}[lastname]
    Fill Text       id=email        ${user}[email]
    Fill Text       id=password     ${user}[password]

Clicar botão cadastrar 
    Click           css=.submit-button >> text=Cadastrar

