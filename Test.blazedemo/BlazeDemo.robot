*** Settings ***
Library    SeleniumLibrary
Suite Setup     Open browser    ${URL}   ${BROWSER}
Suite Teardown  Close All Browsers

*** Variables ***
${url}        https://blazedemo.com/
${browser}    Chrome
${expected_result}


*** Test Cases ***
Choose your departure city
    Select From List By Value    xpath://select[@name='fromPort']    Paris
    Select From List By Value    xpath://select[@name='toPort']    Rome 
    Click Button   css:input[type='submit'] 
    Wait Until Page Contains    ${expected_result}
    @{flights}=  Get WebElements    css:table[class='table']>tbody tr
    Should Not Be Empty     ${flights}
    Click Button    css:input[type='submit'] 
    Wait Until Page Contains    ${expected_result}
    Sleep    5s


