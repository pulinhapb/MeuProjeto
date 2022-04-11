*Settings*
Documentation    geeks actions



*Keywords*
Clicar na opção de Seja um Geek
    Click    css=a[href="/be-geek"] >>text=Seja um Geek
    sleep    1


Validar formulário de seja um geek
    wait for elements state    //strong[contains(text(),'Trabalhe com suporte técnico quando e onde quiser')]    visible    10
    get text                   //strong[contains(text(),'Trabalhe com suporte técnico quando e onde quiser')]    equal      Trabalhe com suporte técnico quando e onde quiser

Preencher formulário
    [Arguments]                        ${geek_profile}
    Resetar formulário por completo

    Fill text    //input[@id='whatsapp']    ${geek_profile}[whats]
    Fill text    //textarea[@id='desc']     ${geek_profile}[desc]

    IF                   '${geek_profile}[printer_repair]'
    Select Options By    id=printer_repair                    text    ${geek_profile}[printer_repair]
    END

    IF                   '${geek_profile}[work]'
    Select Options By    id=work                    text    ${geek_profile}[work]
    END                  

    click         //input[@id='cost']
    Clear Text    //input[@id='cost']                               
    fill text     //input[@id='cost']                               ${geek_profile}[cost]
    click         //button[contains(text(),'Quero ser um Geek')]


Mensagem de sucesso
    [Arguments]                ${msg}                                           
    ${msg_esperada}            Set Variable                                     Seu cadastro está na nossa lista de geeks. Agora é só ficar de olho no seu WhatsApp.
    Wait for elements state    css=p >>text=${msg_esperada}                     visible                                                                                 10
    get text                   //h1[contains(text(),'${msg}')] >>text=${msg}
    click                      //a[contains(text(),'Voltar')]

Resetar formulário por completo

    Execute JavaScript    document.getElementsByClassName("be-geek-form")[0].reset();
