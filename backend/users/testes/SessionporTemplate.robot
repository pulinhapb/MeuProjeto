*Settings*
Documentation    Session route test suite
Resource         ${EXECDIR}/users/resources/Base.robot

*Variables*
&{inv_pass}       email=paulinha.jampa@gmail.com    password=abc123
&{inv_email}      email=paulinha.jampa.gmail        password=abc123
&{email_404}      email=paulinha@404.com            password=abc123
&{empty_email}    email=${EMPTY}                    password=abc123
&{sem_email}      password=abc123
&{empty_pass}     email=paulinha.jampa@gmail.com    password=${EMPTY}
&{sem_pass}       email=paulinha.jampa@gmail.com

*Test Cases*

Usuário sessão INVÁLIDO
    [Template]    Tentativa de usuário que não gera token 

    #playload     +   status     + msg de erro/reponse
    ${inv_pass}       401    Unauthorized
    ${inv_email}      400    Incorrect email
    ${email_404}      401    Unauthorized
    ${empty_email}    400    Required email
    ${sem_email}      400    Required email
    ${empty_pass}     400    Required pass
    ${sem_pass}       400    Required pass


*Keywords*
Tentativa de usuário que não gera token
    [Arguments]    ${payload}    ${status_code}    ${error_message}

    ${response}    POST Session    ${payload}

    Status Should Be    ${status_code}      ${response}
    Should Be Equal     ${error_message}    ${response.json()}[error]