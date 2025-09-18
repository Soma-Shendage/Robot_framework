*** Settings ***
Library    Browser

*** Variables ***
${URL}         https://algotest.in/login
${RESET_URL}   https://algotest.in/reset-password

*** Test Cases ***
Verify Empty Phone Number Validation
    [Documentation]    Verify validation message when clicking Get OTP without a phone number.
    New Browser    chromium    headless=False
    New Page    ${URL}

    # --- Navigate to the forgot password page ---
    Click    text=Forgot Password?
    Wait For URL    ${RESET_URL}    10s

    # --- Click Get OTP button without entering a number ---
    Wait For Elements State    button:has-text("Get OTP")    visible    10s
    Click    button:has-text("Get OTP")

    # --- Verify the validation message ---
    Wait For Elements State    text=Phone number has to be 10 digit Indian Number    visible    5s

    Take Screenshot
    Close Browser
