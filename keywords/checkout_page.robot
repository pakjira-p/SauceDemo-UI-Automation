*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables.robot
Resource    ../keywords/common_keywords.robot

*** Keywords ***
Verify Redirection To Checkout Step One
    common_keywords.Wait Until Page Contains Element Then Verify Element Text    class:title    Checkout: Your Information

Fill Checkout Form
    [Arguments]    ${first}    ${last}    ${postal}
    common_keywords.Wait until element is ready then input text    css:[data-test="firstName"]    ${first}
    common_keywords.Wait until element is ready then input text    css:[data-test="lastName"]     ${last}
    common_keywords.Wait until element is ready then input text    css:[data-test="postalCode"]   ${postal}

Verify Error Message For Missing Required Fields
    common_keywords.Wait Until Page Contains Element Then Verify Element    css:.error-message-container h3
    common_keywords.Wait Until Page Contains Element Then Verify Element Text           css:.error-message-container h3    Error: First Name is required

Verify Error Message For ZIP Code Is Not A Number
    common_keywords.Wait Until Page Contains Element Then Verify Element    css:.error-message-container h3
    common_keywords.Wait Until Page Contains Element Then Verify Element Text           css:.error-message-container h3    Error: invalid ZIP input

Click Finish Checkout
    common_keywords.Wait Until Element Is Ready Then Click Element  css:.btn_action

Verify Redirection To Checkout Step Two
    common_keywords.Wait Until Page Contains Element Then Verify Element Text    class:title    Checkout: Overview    

Verify Redirection To Order Completed
    common_keywords.Wait Until Page Contains Element Then Verify Element Text    class:title     Checkout: Complete!

Click Back Home
    common_keywords.Wait Until Element Is Ready Then Click Element    id:back-to-products