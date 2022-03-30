*Settings*
Documentation    Attempt BeGeek test suite
Resource         ${EXECDIR}/resources/Base.robot

Suite Setup      Iniciar sessão na tentativa de criar um Geek
Test Template    Dados invalidos

*Variables*
${long_desc}    Instalo Distros Ubuntu, Debian, ElementaryOS, PopOS, Linux Mint, Kurumin, Mandrake, Connectiva, Fedora, RedHat, CentOS, Slackware, Gentoo, Archlinux, Kubuntu, Xubuntu, Suze, Mandriva, Edubuntu, KateOS, Sabayon Linux, Manjaro Linux, BigLinux, ZorinOS, Unity

*Test Cases*
Não se torna um Geek
    [Template]    Dados invalidos

    desc              Formato o seu PC    A descrição deve ter no minimo 80 caracteres
    desc              ${long_desc}        A descrição deve ter no máximo 255 caracteres
    desc              ${EMPTY}            Informe a descrição do seu trabalho
    whats             11                  O Whatsapp deve ter 11 digitos contando com o DDD
    whats             999999999           O Whatsapp deve ter 11 digitos contando com o DDD
    whats             ${EMPTY}            O Whatsapp deve ter 11 digitos contando com o DDD
    cost              aaaa                Valor hora deve ser numérico
    cost              aa12                Valor hora deve ser numérico
    cost              $%^&                Valor hora deve ser numérico
    cost              ${EMPTY}            Valor hora deve ser numérico
    printer_repair    ${EMPTY}            Por favor, informe se você é um Geek Supremo
    work              ${EMPTY}            Por favor, selecione o modelo de trabalho

*Keywords*
Dados invalidos
    [Arguments]    ${Campo}    ${entrada}    ${saida}

    ${user}    Factory User    attempt_be_geek

    Set To Dictionary    ${user}[geek_profile]    ${Campo}    ${entrada}

     Preencher formulário       ${user}[geek_profile]
     Alerta mensagem igual a    ${saida}
#    Take Screenshot            fullPage=True

Iniciar sessão na tentativa de criar um Geek

    ${user}    Factory User    attempt_be_geek

    Resetar Geek                         
    Iniciar sessão
    Fazer Login                            ${user}
    Clicar na opção de Seja um Geek
    Validar formulário de seja um geek 