*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables.robot
Resource    ../keywords/common_keywords.robot

*** Keywords ***
Remove Product From Cart
    common_keywords.Wait Until Element Is Ready Then Click Element    css:.item_pricebar > .btn_secondary

Verify Product Removed
    common_keywords.Wait Until Page Is Ready Then Element Should Not Be Visible   css:.item_pricebar > .btn_secondary

Click Checkout
    common_keywords.Wait Until Element Is Ready Then Click Element    css:.btn_action
