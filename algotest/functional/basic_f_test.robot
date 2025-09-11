*** Settings ***
Library    Browser

*** Variables ***
${URL}    https://algotest.in/

*** Test Cases ***
TC-01 Verify homepage loads
    New Browser    chromium    headless=False
    New Page    ${URL}
    ${result}=    Get Text    body
    Should Contain    ${result}    algoTest
    Close Browser

TC-02 Verify navigation to Features
    New Browser    chromium    headless=False
    New Page    ${URL}
    Click    role=link[name="Features"]
    ${url}=    Get Url
    Should Contain    ${url}    features
    Close Browser
