###Using feature search to find goods###

*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}            https://www.walmart.com/
${SEARCH_TERM}    Dior

*** Test Cases ***
Verify Product search
    Open Browser    ${URL}    Chrome
    Input Text      xpath=//div[@aria-label="Search"]    ${SEARCH_TERM}
