*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables.robot
Resource    ../keywords/common_keywords.robot

*** Keywords ***
Open Side Menu
    common_keywords.Wait Until Element Is Ready Then Click Element    class:bm-burger-button

Logout
    common_keywords.Wait Until Element Is Ready Then Click Element      id:logout_sidebar_link

Prepare To Next Test
    Open Side Menu
    common_keywords.Wait Until Element Is Ready Then Click Element    id:reset_sidebar_link
    Logout

Verify Side Menu Is Visible
    common_keywords.Wait Until Page Contains Element Then Verify Element    class:bm-menu

Verify Side Menu Is Not Visible
    common_keywords.Wait Until Page Is Ready Then Element Should Not Be Visible    class:bm-menu

Close Side Menu
    common_keywords.Wait Until Element Is Ready Then Click Element    class:bm-cross-button

Add Product To Cart From Inventory ${product_name}
    common_keywords.Wait Until Element Is Ready Then Click Element    xpath=//div[text()='${product_name}']/ancestor::div[@class='inventory_item']//button[contains(text(), 'Add to cart')]

Verify Remove Button Visible For Product ${product_name}
    common_keywords.Wait Until Page Contains Element Then Verify Element    xpath=//div[text()='${product_name}']/ancestor::div[@class='inventory_item']//button[contains(text(), 'Remove')]

Remove Product From Inventory ${product_name}
    common_keywords.Wait Until Element Is Ready Then Click Element    xpath=//div[text()='${product_name}']/ancestor::div[@class='inventory_item']//button[contains(text(), 'Remove')]

Verify Add To Cart Button Visible For Product ${product_name}
    common_keywords.Wait Until Page Contains Element Then Verify Element    xpath=//div[text()='${product_name}']/ancestor::div[@class='inventory_item']//button[text()='Add to cart']

Verify Cart Badge Shows ${count}
    common_keywords.Wait Until Page Contains Element Then Verify Element Text    class=shopping_cart_badge    ${count}

Verify Cart Badge Is Not Visible
    common_keywords.Wait Until Page Is Ready Then Element Should Not Be Visible    class=shopping_cart_badge

Go To Cart
    common_keywords.Wait Until Element Is Ready Then Click Element   class:shopping_cart_link

Sort Products by ${Sort}
    common_keywords.Wait Until Element Is Ready Then Select Option By Value    class:product_sort_container    ${Sort}

Verify First Product Is Red Shirt
    common_keywords.Wait Until Page Contains Element Then Verify Element Text       id:item_3_title_link    Test.allTheThings() T-Shirt (Red)

Verify First Product Is Backpack
    common_keywords.Wait Until Page Contains Element Then Verify Element Text       ${id_backpack}    ${name_backpack}

Verify First Product Is Onesie
    common_keywords.Wait Until Page Contains Element Then Verify Element Text       id:item_2_title_link    Sauce Labs Onesie

Verify First Product Is Jacket
    common_keywords.Wait Until Page Contains Element Then Verify Element Text       id:item_5_title_link    Sauce Labs Fleece Jacket

Go To Product Detail Page ${item}
    common_keywords.Wait Until Element Is Ready Then Click Element    ${item}

Verify Products Are Displayed
    common_keywords.Wait Until Page Contains Element Then Verify Element    class:inventory_item

Verify This Is Inventory Page
    common_keywords.Wait Until Page Contains Element Then Verify Element    class:inventory_container



