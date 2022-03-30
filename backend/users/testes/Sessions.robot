*Settings*
Documentation    Sessão 

Resource    ${EXECDIR}/users/resources/Base.robot


*Test Cases*
# Primeiro CT de api
#     [Tags]    001
    
#     ${payload}     Create Dictionary    email=paulinha.jampa@gmail.com    password=pwd1983
#     ${resposta}    POST                 ${API_URL}/sessions               json=${payload}       expected_status=any

#     Status should be    200    ${resposta}

#     ${ValidarTamanho}     Get Length            ${resposta.json()}[token]
#     ${TamanhoEsperado}    Convert To Integer    140

#     Should be equal    ${TamanhoEsperado}    ${ValidarTamanho}
#     Should be equal    10d                   ${resposta.json()}[expires_in]


Senha inválida apenas com erro
    [Tags]    002

    ${payload}     Create Dictionary    email=paulinha.jampa@gmail.com    password=paula198333
    ${resposta}    POST                 ${API_URL}/sessions               json=${payload}         expected_status=any

    Status should be    401             ${resposta}
    Should be equal     Unauthorized    ${resposta.json()}[error]






#############################################################################################

Sessão de usuário válido
 # Dado que temos um usuário cadastrado
    ${payload}    Factory User Session    signup
    POST User     ${payload}

    ${payload}    Factory User Session    login

    # Quando faço uma requisição POST na rota /sessions
    ${response}    POST Session    ${payload}

    # Então o status code deve ser 200
    Status Should Be    200    ${response}

    # E deve gerar um token JWT
    ${size}             Get Length            ${response.json()}[token]
 

    Should Be True      ${size}   > 0

    # E esse token deve expirar em 10 dias
    Should Be Equal    10d    ${response.json()}[expires_in] 


Usuário não existe

    ${payload}     Create Dictionary    email=paulinha.jampakkkkkk@gmail.com    password=kkkk1983
    ${response}    POST session         ${payload}                              

    Status Should Be    401             ${response}
    Should Be equal     Unauthorized    ${response.json()}[error]    


Email nulo

    ${payload}     Create Dictionary    email=${EMPTY}    password=kkkk1983
    ${response}    POST session         ${payload}        

    Status Should Be    400               ${response}
    Should Be equal     Required email    ${response.json()}[error]    


Email formato inválido

    ${payload}     Create Dictionary    email=paulinha.jampa.gmail.com    password=kkkk1983
    ${response}    POST session         ${payload}                        

    Status Should Be    400                ${response}
    Should Be equal     Incorrect email    ${response.json()}[error]    


SEM email
    [Tags]    sememail

    ${payload}     Create Dictionary    password=paula1983
    ${response}    POST session         ${payload}            

    Status Should Be    400    ${response}

################## senha

Senha inválida

    ${payload}     Create Dictionary    email=paulinha.jampa@hotmail.com    password=kkkk1983
    ${response}    POST session         ${payload}                          

    Status Should Be    401             ${response}
    Should Be equal     Unauthorized    ${response.json()}[error]    

Senha Nula
    ${payload}     Create Dictionary    email=paulinha.jampa@hotmail.com    password=${EMPTY}
    ${response}    POST session         ${payload}                          

    Status Should Be    400                 ${response}
    Should Be equal     Required pass    ${response.json()}[error]    

