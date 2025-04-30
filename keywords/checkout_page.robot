*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables.robot
Resource    ../keywords/common_keywords.robot

*** Keywords ***
Fill Checkout Form
    [Arguments]    ${first}    ${last}    ${postal}
    common_keywords.Wait until element is ready then input text    css:[data-test="firstName"]    ${first}
    common_keywords.Wait until element is ready then input text    css:[data-test="lastName"]     ${last}
    common_keywords.Wait until element is ready then input text    css:[data-test="postalCode"]   ${postal}
    common_keywords.Wait Until Element Is Ready Then Click Element  css:.btn_primary

Finish Checkout
    common_keywords.Wait Until Element Is Ready Then Click Element  css:.btn_action

Verify Order Completed
    common_keywords.Wait Until Page Contains Element Then Verify Element   id:checkout_complete_container
