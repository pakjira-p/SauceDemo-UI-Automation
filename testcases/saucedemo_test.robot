*** Settings ***
Resource    ../keywords/login_page.robot
Resource    ../keywords/inventory_page.robot
Resource    ../keywords/cart_page.robot
Resource    ../keywords/checkout_page.robot
Resource    ../keywords/common_keywords.robot
Resource    ../resources/variables.robot

Suite Setup    Open Browser To Login Page
Suite Teardown    Close Browser

*** Test Cases ***

Login With Incorrect Username
    Login with stand_user and ${password}
    Login Should Fail

Login With Correct Credentials
    Reload Page
    Login with ${username} and ${password}
    Login Should Succeed

Logout Function
    Open Side Menu
    Logout
    common_keywords.Wait Until Page Contains Element Then Verify Element    id:login-button

Side Menu Functionality
    Login with ${username} and ${password}
    Open Side Menu
    Verify Side Menu Is Visible
    Close Side Menu

Add And Remove Product
    Add First Product To Cart
    Go To Cart
    Remove Product From Cart
    Verify Product Removed

Checkout Flow
    common_keywords.Wait Until Element Is Ready Then Click Element    xpath://button[contains(text(),'Continue Shopping')]
    Add First Product To Cart
    Go To Cart
    Click Checkout
    Fill Checkout Form    Gabriel    Florescu    123456
    Finish Checkout
    Verify Order Completed

Product Detail Page Navigation
    Open Side Menu
    common_keywords.Wait Until Element Is Ready Then Click Element    id:inventory_sidebar_link
    Go To Product Detail Page
    Verify Product Detail Page Shown
    Go Back To Products From Detail

Verify Product Sorting
    Sort Products Z To A
    Verify First Product Is Red Shirt
