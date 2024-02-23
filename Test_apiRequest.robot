#Example of API Request
*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
Quick Get Request Test
    ${reponse}=  GET    https://www.facebook.com