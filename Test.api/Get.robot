*** Settings ***
Library     RequestsLibrary
Library    RPA.Netsuite
Library    RPA.JSON

*** Variables ***
${BASE_URL}    https://api.coingecko.com/api/v3

*** Test Cases ***
Verify Get Cryptocurrency Data
    Create Session    mysession    ${BASE_URL}
    ${response}=    GET    url=https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd
    Should Be Equal As Numbers    ${response.status_code}    200
    ${response_json}=    Convert String To Json    ${response.text}
    Should Be Equal As Numbers    ${response_json["bitcoin"]["usd"]}    98591.0
