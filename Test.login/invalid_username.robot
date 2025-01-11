*** Comments ***
###Example case for valid    login by input username, password and click login and display results###


*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${URL}              https://practicetestautomation.com/practice-test-login/
${USERNAME}         incorrectUser
${PASSWORD}         Password123
${WELCOME_MSG}      Your username is invalid!


*** Test Cases ***
Verify Login Success
    Open Browser    ${URL}    Chrome
    Input Text    id=username    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button    id=submit
    Wait Until Element Is Visible    xpath=//div[@class="show"]
    Element Text Should Be    xpath=//div[@class="show"]    ${WELCOME_MSG}
    Close Browser
