*Settings*
Documentation    Users route test suite
Resource         ${EXECDIR}/users/resources/Base.robot

*Test Cases*

Add new user
    [Tags]    1

    ${user}        Factory New User
    Remove User    ${user}

    ${response}         POST User    ${user}
    Status Should Be    201          ${response}

    ${user_id}        Set Variable      ${response.json()}[id]
    Should Be True    ${user_id} > 0


Tentativa de add mesmo usuario duas vezes
    [Tags]    duplicado

    ${user}        factory_duplicado
    ${response}    POST User            ${user}



    ${response}         POST User    ${user}
    Status Should Be    400          ${response}



Buscar usuário
    [Tags]       buscar
    ${user}      Factory Remove User
    POST User    ${user}

    ${token}            Get Token    ${user}
    ${response}         GET User     ${token}
    Status Should Be    200          ${response}

    Should Be Equal As Strings    ${user}[name]     ${response.json()}[name]
    Should Be Equal As Strings    ${user}[email]    ${response.json()}[email]

    Should Be Equal As Strings    None     ${response.json()}[whatsapp]
    Should Be Equal As Strings    None     ${response.json()}[avatar]
    Should Be Equal As Strings    False    ${response.json()}[is_geek]

Remover usuário
    [Tags]    remover

    ${user}      Factory Remove User
    Remove User    ${user}
    POST User    ${user}
  

    ${token}    Get Token    ${user}

    ${response}         DELETE User    ${token}
    Status Should Be    204            ${response}

    ${response}         GET User    ${token}
    Status Should Be    404         ${response}


Update a user
    [Tags]  atualizar

    ${user}     Factory Update User
    POST User   ${user}[before]

    ${token}        Get Token       ${user}[before]

    ${response}     PUT User        ${token}        ${user}[after]

    Status Should Be        200             ${response}

    ${response}             GET User    ${token}

    Should Be Equal As Strings      ${user}[after][name]        ${response.json()}[name]
    Should Be Equal As Strings      ${user}[after][email]       ${response.json()}[email]
    Should Be Equal As Strings      ${user}[after][whatsapp]    ${response.json()}[whatsapp]
    Should Be Equal As Strings      ${user}[after][avatar]      ${response.json()}[avatar]
    Should Be Equal As Strings      False                       ${response.json()}[is_geek]
