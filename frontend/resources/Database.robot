*Settings*
Documentation           Database Helpers

Library     DatabaseLibrary
Library     factories/Users.py

*Keywords*
Connect To Postgres

    Connect To Database     psycopg2
    ...                     wqloxggg  #User 
    ...                     wqloxggg
    ...                     Av5VYG9xkAkObreH_en8YV9hfQL1Uykp   #senha
    ...                     fanny.db.elephantsql.com            #server
    ...                     5432   #porta

Resetar o banco de dados

    Execute SQL String      DELETE from public.geeks;
    Execute SQL String      DELETE from public.users;

Reseta o Geek
    
    Execute SQL String      DELETE from public.geeks;
   


Insert User
    [Arguments]     ${u}

   # ${hashed_pass}     Get Hashed Pass     ${u}[password]

     #   ${q}    Set Variable    INSERT INTO public.users (name, email, password_hash, is_geek) values ('${u}[name] ${u}[lastname]', '${u}[email]', '${u}[password]', false)
     ${q}    Set Variable    INSERT INTO public.users (name, email, password_hash, is_geek) values ('${u}[name] ${u}[lastname]', '${u}[email]', '$2b$08$incWFVZG7AtQ6JIUdKdDmufquc9dEWWwjPu8cVw8UUAAiWl1hikCG', false)

    Execute SQL String      ${q}

Minha inserção de usuário fixo no banco

    ${user}         Factory User    login
    Insert User     ${user}

    ${user2}       Factory User     be_geek
    Insert User     ${user2}

    ${user3}       Factory User     attempt_be_geek
    Insert User     ${user3}

