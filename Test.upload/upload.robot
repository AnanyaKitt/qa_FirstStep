*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        https://the-internet.herokuapp.com/upload
${FILE_PATH}    ${CURDIR}/testfile.txt

*** Test Cases ***
Upload File Test
    Open Browser    ${URL}    Chrome
    Choose File    xpath=//input[@id='file-upload']    ${file_path}
    Click Button    xpath=//input[@id='file-submit']
    Wait Until Element Is Visible    xpath=//div[@id='uploaded-files']    timeout=5 seconds
    ${upload_file}    Get Text    xpath=//div[@id='uploaded-files']
    Should Be Equal As Strings    ${upload_file}    testfile.txt
    Close Browser
