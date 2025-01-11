*** Settings ***
Documentation    A test suite for valid input
Library    SeleniumLibrary
#Resource    Keywords.resource
Suite Setup    Open Browser  ${url}    ${browser}



*** Variables ***
${url}    https://testautomationpractice.blogspot.com/
${browser}    safari   

*** Test Cases ***
Input personal information
    Input Text    id=name    QATEST
    Input Text    id=email    oor@gmail.com
    Input Text    id=phone    0897505224
    Input Text    id=textarea    913/212

#Select gender ratio button
    Click Element  id=female
    Click Element  id=tuesday

#select Country
    Select From List By Value    xpath=//*[@id="#country"]    canada