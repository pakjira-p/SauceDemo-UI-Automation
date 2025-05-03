*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables.robot
Resource    ../keywords/common_keywords.robot

*** Keywords ***
Go Back To Inventory From Detail
    common_keywords.Wait Until Element Is Ready Then Click Element    class:inventory_details_back_button

Verify Product Detail Page Shown
    common_keywords.Wait Until Page Contains Element Then Verify Element    class:inventory_details_name
    common_keywords.Wait Until Page Contains Element Then Verify Element    class:inventory_details_img
    common_keywords.Wait Until Page Contains Element Then Verify Element    class:inventory_details_desc
    common_keywords.Wait Until Page Contains Element Then Verify Element    class:inventory_details_price

Add Product From Detail Page
    Click Button    xpath=//button[contains(text(), 'Add to cart')]

Verify Remove Button Is Visible On Detail Page
    Element Should Be Visible    xpath=//button[contains(text(), 'Remove')]

Remove Product From Detail Page
    Click Button    xpath=//button[contains(text(), 'Remove')]

Verify Add To Cart Button Is Visible On Detail Page
    Element Should Be Visible    xpath=//button[contains(text(), 'Add to cart')]