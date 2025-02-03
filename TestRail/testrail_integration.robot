*** Settings ***
Library    RequestsLibrary

*** Variables ***
${TESTRAIL_URL}     https://ananyakitt.testrail.io
${TESTRAIL_USER}    xxx@hotmail.com     #Change to your email
${TESTRAIL_API_KEY}     IqF9HcClnW.o/milsj9N-8ZrKCKeSAyVVRVfOSERh    #API Key

*** Keywords ***
Setup TestRail
    ${auth}=    Create List    ${TESTRAIL_USER}    ${TESTRAIL_API_KEY}
    Create Session    testrail    ${TESTRAIL_URL}    auth=${auth}

Update TestRail Result
    [Arguments]    ${test_id}    ${status_id}    ${comment}
    ${data}=    Create Dictionary    status_id=${status_id}    comment=${comment}
    ${response}=    POST On Session    testrail    /index.php?/api/v2/add_result/${test_id}    json=${data}
    ###Log    Response Status: ${response.status_code}
    ###Log    Response Content: ${response.content}
