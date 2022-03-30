*Settings*
Documentation   Rota de usuários

*Keywords*
POST User  
    [Arguments]     ${payload}

    ${response}     POST
    ...             ${API_URL}/users
    ...             json=${payload}
    ...             expected_status=any

    [return]        ${response} 

DELETE User
    [Arguments]     ${token}

    ${headers}      Create Dictionary       Authorization=${token}

    ${response}     DELETE
    ...             ${API_URL}/users
    ...             headers=${headers}
    ...             expected_status=any

    [return]        ${response}

GET User
    [Arguments]     ${token}

    ${headers}      Create Dictionary       Authorization=${token}

    ${response}     GET
    ...             ${API_URL}/users
    ...             headers=${headers}
    ...             expected_status=any

    [return]        ${response}



PUT User  
    [Arguments]     ${token}        ${payload}
    
    ${headers}      Create Dictionary       Authorization=${token}

    ${response}     PUT
    ...             ${API_URL}/users
    ...             headers=${headers}
    ...             json=${payload}
    ...             expected_status=any

    [return]        ${response} 