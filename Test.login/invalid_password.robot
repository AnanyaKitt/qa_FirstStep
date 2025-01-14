*** Comments ***
###Example case for valid    login by input username, password and click login and display results###


*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}    https://practicetestautomation.com/practice-test-login/
${USERNAME}    student
${INVALID_PASSWORD}    wrong_password
${ERROR_MESSAGE}    Your password is invalid!

###Create test case by using only x path
*** Test Cases ***
Verify Invalid Password Error
    Open Browser    ${URL}    Chrome
    Input Text    xpath=//input[@id='username']    ${USERNAME}
    Input Text    xpath=//input[@id='password']    ${INVALID_PASSWORD}
    Click Button    xpath=//button[@id='submit']
    Wait Until Element Is Visible    xpath=//div[@id='error']    timeout=10 seconds
    Element Text Should Be    xpath=//div[@id='error']    ${ERROR_MESSAGE}
    Close Browser
