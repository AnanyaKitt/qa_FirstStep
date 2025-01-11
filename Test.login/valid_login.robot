###Example case for valid  login by input username, password and click login and display results###

*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}            https://practicetestautomation.com/practice-test-login/
${USERNAME}       student
${PASSWORD}       Password123
${WELCOME_MSG}    Logged In Successfully

*** Test Cases ***
Verify Login Success
    Open Browser    ${URL}    Chrome
    Input Text    id=username    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button    id=submit
    Wait Until Element Is Visible    xpath=//div[@class=post-header"]
    Element Text Should Be    xpath=//div[@class="post-header"]    ${WELCOME_MSG}
    Close Browser
