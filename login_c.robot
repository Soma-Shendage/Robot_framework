*** Settings ***
Library    Browser

*** Variables ***
${URL}          https://algotest.in/login
${VALID_PHONE}  9876543210
${VALID_PASS}   MyStrongPass123
${INVALID_PHONE}    12345
${INVALID_PASS}     WrongPass

*** Test Cases ***
TC-05 Verify login with valid credentials
    New Browser    chromium    headless=False
    New Page    ${URL}
    Fill Text    input[name="phone"]    ${VALID_PHONE}
    Fill Text    input[name="password"]    ${VALID_PASS}
    Click    button:has-text("Login")
    # Instead of checking "Dashboard" text, check URL
    Wait For Condition    '${URL}/dashboard' in Get Url()    20s
    Close Browser

TC-06 Verify login with invalid phone
    New Browser    chromium    headless=False
    New Page    ${URL}
    Fill Text    input[name="phone"]    ${INVALID_PHONE}
    Fill Text    input[name="password"]    ${VALID_PASS}
    Click    button:has-text("Login")
    Wait For Elements State    text=Phone number has to be 10 digit Indian Number  visible    10s
    Close Browser

TC-07 Verify login with invalid password
    New Browser    chromium    headless=False
    New Page    ${URL}
    Fill Text    input[name="phone"]    ${VALID_PHONE}
    Fill Text    input[name="password"]    ${INVALID_PASS}
    Click    button:has-text("Login")
    Wait For Elements State    text=Bad phone number or password.   visible    10s
    Close Browser
