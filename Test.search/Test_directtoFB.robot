*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${url}  http://www.google.com
${browser}  Chrome
${text}  name=q

${expected_result}


*** Test Cases ***
Fill data in search textbox google.com via locator
    Open Browser  ${url}  ${browser}  
    Input Text    name=q  Facebook
    Press Keys    ${text}    RETURN
    Wait Until Page Contains    ${expected_result}
    Sleep    5s
    Close Browser
    

     

