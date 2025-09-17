*** Settings ***
Library    Browser

*** Variables ***
${LOGIN_URL}        https://algotest.in/login
${RESET_URL}        https://algotest.in/reset-password
${VALID_PHONE}      7028471170
${NEW_PASSWORD}      NewPassword@456
${DUMMY_OTP}        123456    # Use a real, valid OTP for a real test

*** Test Cases ***
Verify End-to-End Password Reset Flow
    [Documentation]    Tests the full password reset process from start to finish.
    # Step 1 & 2: Go to login page and click "Forgot Password?"
    New Browser    chromium    headless=False
    New Page    ${LOGIN_URL}
    Click    a:has-text("Forgot Password?")
    Wait For URL    ${RESET_URL}

    # Step 3 & 4: Enter mobile number and get OTP
    Fill Text    input[name="phone"]    ${VALID_PHONE}
    Click    button:has-text("Get OTP")

    # Step 5 & 6: Enter and verify OTP
    # Placeholder locators, you must confirm these from the website's UI
    Wait For Elements State    text=Enter OTP    visible
    Fill Text    input[placeholder="Enter OTP"]    ${DUMMY_OTP}
    Click    button:has-text("Verify OTP")
    
    # Step 7 & 8: Enter and confirm new password
    Fill Text    input[placeholder="Password"]    ${NEW_PASSWORD}
    Fill Text    input[placeholder="Confirm Password"]    ${NEW_PASSWORD}

    # Step 9 & 10: Click "Change Password" and verify redirection to login page
    Click    button:has-text("Change Password")
    Wait For URL    ${LOGIN_URL}

    # Step 11: Verify login with the new password
    Fill Text    input[name="phone"]    ${VALID_PHONE}
    Fill Text    input[name="password"]    ${NEW_PASSWORD}
    Click    button:has-text("Login")
    Wait For Elements State    text=Dashboard    visible    10s

    Take Screenshot
    Close Browser