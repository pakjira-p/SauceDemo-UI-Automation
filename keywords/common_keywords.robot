*** Settings ***
Library    SeleniumLibrary
Library    ScreenCapLibrary
Resource   ../resources/variables.robot

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    Chrome   
    Maximize Browser Window
    Start Video Recording

Close Browser
    Stop Video Recording
    Close All Browsers

Wait Until Element Is Ready Then Click Element
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    5x    2s    Click Element    ${locator}

Wait Until Element Is Ready Then Input Text
    [Arguments]    ${locator}    ${text}
    Wait Until Keyword Succeeds    5x    2s    Input Text    ${locator}    ${text}

Wait Until Page Contains Element Then Verify Text
    [Arguments]    ${expected_text}
    Wait Until Keyword Succeeds    5x    2s    Page Should Contain    ${expected_text}

Wait Until Page Contains Element Then Verify Element
    [Arguments]    ${expected_locator}
    Wait Until Keyword Succeeds    5x    2s    Page Should Contain Element    ${expected_locator}

# Wait Until Page Contains Element Then Verify Element Text
#     [Arguments]    ${expected_locator}    ${expected_text}
#     Wait Until Keyword Succeeds    5x    2s    Page Should Contain Element    ${expected_locator} ${expected_text}
Wait Until Page Contains Element Then Verify Element Text
    [Arguments]    ${expected_locator}    ${expected_text}
    Wait Until Keyword Succeeds    5x    2s    Page Should Contain Element    ${expected_locator}
    Element Text Should Be    ${expected_locator}    ${expected_text}


Wait Until Element Is Ready Then Select Option By Value
    [Arguments]    ${locator}    ${value}
    Wait Until Keyword Succeeds    5x    2s    Select From List By Value    ${locator}    ${value}

Wait Until Page Is Ready Then Element Should Not Be Visible
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    5x    2s    Element Should Not Be Visible    ${locator}
