*** Settings ***
Library    Browser

*** Variables ***
${URL}              https://algotest.in/login
${PHONE}            7028471170
${PASSWORD}         Shivam@123

*** Test Cases ***
Open Dropdown Using Hamburger
    [Documentation]    Verify that clicking the hamburger menu opens dropdown.
    New Browser    chromium    headless=False
    New Page    ${URL}
    # Set the viewport to a mobile size
    Set Viewport Size    width=390    height=844

    # --- Login with phone number ---
    Fill Text    input[name="phone"]    ${PHONE}
    Fill Text    input[name="password"]    ${PASSWORD}
    Click    button:has-text("Login")
    Wait For Elements State    text=Dashboard    visible    10s

    # --- Click the hamburger menu icon ---
    Click    svg.size-5[data-slot="icon"]

    # --- Verify dropdown container is visible ---
    Wait For Elements State    css=div.shadow-2xl    visible    10s

    Take Screenshot
    Close Browser