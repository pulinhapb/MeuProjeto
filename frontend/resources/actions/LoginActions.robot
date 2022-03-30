*Settings*
Documentation    Authentication actions

*Variables*
${INPUT_EMAIL}    id=email
${INPUT_PASS}     id=password

*Keywords*
Abrir página principal
    Go To    ${BASE_URL}

    Wait For Elements State    css=.login-form    visible    5

Preencher credenciais
    [Arguments]    ${user}

    Fill Text    ${INPUT_EMAIL}    ${user}[email]
    Fill Text    ${INPUT_PASS}     ${user}[password]


Prencher credencial email
    [Arguments]    ${user}

    Fill Text    ${INPUT_EMAIL}    ${user}[email]


Prencher credencial senha
    [Arguments]    ${user}

    Fill Text    ${INPUT_EMAIL}    ${user}[password]

Clicar botao de entrar
    Click    css=.submit-button >> text=Entrar

usuário igual ao logado
    [Arguments]    ${user}

    ${element}              Set Variable    css=a[href="/profile"]
    ${expected_fullname}    Set Variable    ${user}[name] ${user}[lastname]

    Wait For Elements State    ${element}    visible    5
    Wait For Elements State  //header/a[@id='user']/img[1]      visible   15
    sleep  1
    Get Text                   ${element}    equal      ${expected_fullname}

Clicar em voltar e sair da aplicação
    click   //header/div[1]/a[1]/img[1]
    Sair da aplicação 
    
Sair da aplicação 
    click    xpath=//header/button[1]/img[1]
    
validar tipo Email
    Get Property    ${INPUT_EMAIL}    type    equal    email


Alerta Login email obrigatório
    [Arguments]    ${expected_notice}

    Wait For Elements State    xpath=//span[contains(text(),'E-mail obrigatório')]>> text=E-mail obrigatório
    ...                        visible                                                                          5
    Get text                   xpath=//span[contains(text(),'E-mail obrigatório')]                              equal    E-mail obrigatório 

Alerta Login senha

    [Arguments]    ${expected_notice}

    Wait For Elements State    xpath=//span[contains(text(),'Senha obrigatória')]>> text=Senha obrigatória
    ...                        visible                                                                        5
    Get text                   xpath=//span[contains(text(),'Senha obrigatória')]                             equal    Senha obrigatória

Usuário cadastrado

    ${expect_message}    Set Variable    css=p >> text=Agora você faz parte da Getgeeks. Tenha uma ótima experiência.    

    Wait For Elements State    ${expect_message}    visible    5

# Alerta igual a
#     [Arguments]    ${expected_text}

#     ${title}      Set Variable    css=.swal2-title
#     ${content}    Set Variable    css=.swal2-html-container

#     Wait For Elements State    ${title}    visible    5
#     Get Text                   ${title}    equal      Oops...

#     Wait For Elements State    ${content}    visible    5
#     Get Text                   ${content}    equal      ${expected_text}


# Alerta mensagem de erro
#     [Arguments]    ${expected_alerts}

#     @{got_alerts}    Create List

#     ${spans}    Get Elements    xpath=//span[@class="error"]

#     FOR    ${span}    IN    @{spans}

#             ${text}           Get Text         ${span}
#             Append To List    ${got_alerts}    ${text}

#     END

#     Lists Should Be Equal    ${expected_alerts}    ${got_alerts}

