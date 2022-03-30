*Settings*
Documentation    Se tornar um Geek


Resource    ${EXECDIR}/resources/Base.robot


Suite Setup       Iniciar sessão
Suite Teardown   Fim o teste

*Test Cases*
Se tornar um Geek
     [Tags]    Usr_geek
    ${user}   Factory User    be_geek

    Adicione meu usuário fixo no banco  ${user}
    Fazer Login    ${user}
    Clicar na opção de Seja um Geek
    Validar formulário de seja um geek 
    Preencher formulário          ${user}[geek_profile]
    Mensagem de sucesso         Parabéns!
    Sair da aplicação 
   
   


# Se tornar um Geek
#      [Tags]    Usr_geek
#     ${user}   Factory User    be_geek

#     Fazer Login    ${user}
#     Clicar na opção de Seja um Geek
#     Validar formulário de seja um geek 
#     Preencher formulário          ${user}[geek_profile]
#     Mensagem de sucesso         Parabéns!
#     Sair da aplicação 

# Se tornar um Geek com tamanho menor que 80 na descrição
#      [Tags]    Usr_geek_error
#     ${user}   Factory User    Descricao_menor

#     Fazer Login    ${user}
#     Clicar na opção de Seja um Geek
#     Validar formulário de seja um geek 
#     Preencher formulário          ${user}[geek_profile]
#     Alerta mensagem igual a         A descrição deve ter no minimo 80 caracteres
#     Clicar em voltar e sair da aplicação

# Se tornar um Geek com tamanho MAIOR que o permitido
#      [Tags]    Usr_geek_maior
#     ${user}   Factory User    Descricao_maior

#     Fazer Login    ${user}
#     Clicar na opção de Seja um Geek
#     Validar formulário de seja um geek 
#     Preencher formulário          ${user}[geek_profile]
#     Alerta mensagem igual a         A descrição deve ter no máximo 255 caracteres
    