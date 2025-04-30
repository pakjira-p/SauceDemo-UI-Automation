*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables.robot
Resource    ../keywords/common_keywords.robot

*** Keywords ***
Open Side Menu
    common_keywords.Wait Until Element Is Ready Then Click Element    class:bm-burger-button

Logout
    common_keywords.Wait Until Element Is Ready Then Click Element      id:logout_sidebar_link

Verify Side Menu Is Visible
    common_keywords.Wait Until Page Contains Element Then Verify Element    class:bm-menu

Close Side Menu
    common_keywords.Wait Until Element Is Ready Then Click Element    class:bm-cross-button

Add First Product To Cart
    common_keywords.Wait Until Element Is Ready Then Click Element    xpath:(//button[contains(text(),'Add to cart')])[1]

Go To Cart
    common_keywords.Wait Until Element Is Ready Then Click Element   class:shopping_cart_link

Sort Products Z To A
    common_keywords.Wait Until Element Is Ready Then Select Option By Value    class:product_sort_container    za

Verify First Product Is Red Shirt
    common_keywords.Wait Until Page Contains Element Then Verify Element Text       id:item_3_title_link    Test.allTheThings() T-Shirt (Red)

Go To Product Detail Page
    common_keywords.Wait Until Element Is Ready Then Click Element    id:item_4_title_link

Verify Product Detail Page Shown
    common_keywords.Wait Until Page Contains Element Then Verify Element    class:inventory_details_desc_container

Go Back To Products From Detail
    common_keywords.Wait Until Element Is Ready Then Click Element    class:inventory_details_back_button
