*** Settings ***
Library    RequestsLibrary
Library    RPA.PDF
Library    RPA.JSON

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Verify Create New Post
    Create Session    mysession    ${BASE_URL}
    ${payload}=    Create Dictionary    tittle=foo    body=bar    userId=1
    ${response}=    POST    url=https://jsonplaceholder.typicode.com/posts    json=${payload}
    Should Be Equal As Numbers    ${response.status_code}    201
    ${response_json}=    Convert String To Json    ${response.text}
    Should Be Equal As Strings    ${response_json["tittle"]}    foo
    Should Be Equal As Strings    ${response_json["body"]}    bar
