*** Settings ***
Library    SeleniumLibrary
Resource   testrail_integration.robot
Suite Setup    Setup TestRail
Suite Teardown    Close Browser

*** Variables ***
${URL}                  https://practicetestautomation.com/practice-test-login/
${USERNAME}             student
${INVALID_PASSWORD}     wrong_password
${TEST_ID}              3793    # Test ID at TestRail

*** Test Cases ***
Verify Invalid Password Error
    Open Browser    ${URL}    Chrome
    Input Text    xpath=//input[@id='username']    ${USERNAME}
    Input Text    xpath=//input[@id='password']    ${INVALID_PASSWORD}
    Click Button    xpath=//button[@id='submit']

    Wait Until Element Is Visible    xpath=//div[@id='error']    timeout=5 seconds
    ${error_text}=    Get Text    xpath=//div[@id='error']

    Run Keyword If    "${error_text.strip()}" == "Your password is invalid!"
    ...    Update TestRail Result    ${TEST_ID}    1    "Test Passed: Invalid password message displayed."
    ...    ELSE
    ...    Update TestRail Result    ${TEST_ID}    5    "Test Failed: Expected error message not found."
