*Settings*
Documentation    Login test suite

Resource    ${EXECDIR}/resources/Base.robot


Suite Setup       Iniciar sessão
Suite Teardown    Fim o teste

*Test Cases*
Teste
    [Tags]    Usr_com_insertBD
    ${user}    factory_user         be_geek

    Abrir página principal
    Preencher credenciais      ${user}
    Clicar botao de entrar
   # usuário igual ao logado    ${user}
    # sleep     3
    # Sair da aplicação 

Senha Incorreta
    [Tags]    inv_pass
    ${user}    Create Dictionary    email=paulinha.jampa@gmail.com    password=kkk123

    Abrir página principal
    Preencher credenciais     ${user}
    Clicar botao de entrar
    Alerta igual a            Usuário e/ou senha inválidos.

Usuário inexistente
    [Tags]    user_404
    ${user}    Create Dictionary    email=paulinha.jampakkk@404.com    password=kkk123

    Abrir página principal
    Preencher credenciais     ${user}
    Clicar botao de entrar
    Alerta igual a            Usuário e/ou senha inválidos.

Email inválido
    [Tags]    inv_email
    ${user}    Create Dictionary    email=paulinha.com.br    password=abc123

    Abrir página principal
    Preencher credenciais     ${user}
    Clicar botao de entrar
    validar tipo Email

email obrigatório
    [Tags]    email_obg
    ${user}    Create Dictionary    email=${EMPTY}    password=kkk123

    Abrir página principal
    Preencher credenciais             ${user}
    Clicar botao de entrar
    Alerta Login email obrigatório    E-mail obrigatório 

senha obrigatório
    [Tags]    senha_obg
    ${user}    Create Dictionary    email=paulinha.jampa@gmail.com    password=${EMPTY}

    Abrir página principal
    Preencher credenciais     ${user}
    Clicar botao de entrar
    Alerta Login senha        Senha obrigatória

Campos obrigatórios
    [Tags]    campos_obg
    ${user}    Create Dictionary    email=${EMPTY}    password=${EMPTY}

    Abrir página principal
    Clicar botao de entrar
    Alerta Login email obrigatório    E-mail obrigatório 
    Alerta Login senha                Senha obrigatória
