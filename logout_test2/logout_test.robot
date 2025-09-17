*** Settings ***
Library    Browser
# This allows us to use locators like "Get By"
Library    Browser.Keywords.Locators

*** Variables ***
${URL}              https://algotest.in/login
${PHONE}            7028471170
${PASSWORD}         Shivam@123

*** Test Cases ***
Verify Logout Functionality
    [Documentation]    Logs in, opens the dropdown, clicks logout, and verifies successful logout.
    New Browser    chromium    headless=False
    New Page    ${URL}
    Set Viewport Size    width=390    height=844

    # --- Step 1: Login to the Application ---
    Fill Text    input[name="phone"]    ${PHONE}
    Fill Text    input[name="password"]    ${PASSWORD}
    Click    button:has-text("Login")
    Wait For Elements State    text=Dashboard    visible    10s

    # --- Step 2: Open the Dropdown Menu ---
    Click    svg.size-5[data-slot="icon"]
    Wait For Elements State    css=div.shadow-2xl    visible    10s

    # --- Step 3: Click the Logout Button ---
    # Using a unique locator for the "Logout" button.
    Click    button:has-text("Logout")

    # --- Step 4: Verify Successful Logout ---
    # After logout, the page should redirect to the login page.
    # We verify this by waiting for the "Login" button to become visible again.
    Wait For Elements State    button:has-text("Login")    visible    10s
    Take Screenshot    filename=logout_successful.png

    # --- Clean up ---
    Close Browser