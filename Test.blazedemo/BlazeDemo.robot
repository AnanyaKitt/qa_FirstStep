*** Settings ***
Library    SeleniumLibrary
Suite Setup     Open browser    ${URL}   ${BROWSER}
Suite Teardown  Close All Browsers

*** Variables ***
${url}        https://blazedemo.com/
${browser}    Chrome
${inputName}  AnanyaKitt
${address}    123 Test
${city}       Anytown
${state}      USA
${zipCode}    1234
${creditCardNumber}    99999
${nameOnCard}  Ananya Kitt
#${expected_result}


*** Test Cases ***
Choose your departure & Destination city
    Select From List By Value    xpath://select[@name='fromPort']    Paris
    Select From List By Value    xpath://select[@name='toPort']    Rome 
    Click Button   css:input[type='submit'] 
  # Wait Until Page Contains    ${expected_result} //Remove because using Auto-waiting
    @{flights}=  Get WebElements    css:table[class='table']>tbody tr
    Should Not Be Empty     ${flights}
    Click Button    css:input[type='submit']
Fill details to purchase flight
    Input Text    name=inputName    ${inputName}
    Input Text    name=address      ${address}
    Input Text    name=city         ${city}
    Input Text    name=state        ${state}
    Input Text    name=zipCode      ${zipcode}    
    Select From List By Value    xpath://select[@name='cardType']    amex  #will change and add to variables
    Input Text    name=creditCardNumber    ${creditCardNumber}
    Input Text    name=creditCardMonth    11   #default
    Input Text    name=creditCardYear    2017  #default
    Input Text    name=nameOnCard    ${nameOnCard}
    Click Button  css:input[type='submit']
    Sleep  3s


