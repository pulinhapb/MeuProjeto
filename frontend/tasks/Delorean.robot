*Settings*
Documentation       Delorean

Resource            ${EXECDIR}/resources/Database.robot

*Tasks*
DELETANDO TUDO DE USUARIO E GEEKS NO BANCO(DE VOLTA AO PASSADO)

    Connect To Postgres
    Resetar o banco de dados
    Disconnect from Database


# Deletando tudo com exceção do meu usuário fixo cadastrado no banco

#     Connect To Postgres
#     Resetar o banco de dados
#     Minha inserção de usuário fixo no banco
#     Disconnect from Database