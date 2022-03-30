*Settings*
Documentation    Base Test

Library    Browser
Library    Collections

Library    factories/Users.py

Resource    actions/Comum.robot
Resource    actions/GeeksActions.robot
Resource    actions/LoginActions.robot
Resource    actions/SignupActions.robot

Resource    Database.robot
Resource    Helpers.robot

*Variables*
${BASE_URL}    https://getgeeks-paula.herokuapp.com
${BROWSER}     chromium
${HEADLESS}    false

*Keywords*
Iniciar sessão
    New Browser                ${BROWSER}                              headless=${HEADLESS}    slowMo=00:00:00
    New Page                   ${BASE_URL}
    Set Viewport Size          1280                                    768                     #maior 1140        900
    sleep                      10
    wait for elements state    //h1[contains(text(),'Fazer login')]    visible                 20
    Get Text                   //h1[contains(text(),'Fazer login')]    equal                   Fazer login

    wait for elements state    //button[contains(text(),'Entrar')]    visible    20
    Get Text                   //button[contains(text(),'Entrar')]    equal      Entrar

Fim o teste
    ${shot_name}       Screenshot Name
    Take Screenshot    fullPage=True      filename=${shot_name}