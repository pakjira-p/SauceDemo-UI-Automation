*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables.robot
Resource    ../keywords/common_keywords.robot

*** Keywords ***
Click Checkout
    common_keywords.Wait Until Element Is Ready Then Click Element    id:checkout

Click Continue Shopping
    common_keywords.Wait Until Element Is Ready Then Click Element    id:continue-shopping

Verify Number Of Products In Cart ${expected_count}
    ${count}=    Get Element Count    xpath=//div[@class="cart_item"]
    Should Be Equal As Integers    ${count}    ${expected_count}

Verify Cart Should Contain Item
    [Arguments]    ${item_name}    ${item_price}
    ${item}=    Get WebElement    xpath=//div[text()='${item_name}']/ancestor::div[@class='cart_item']
    common_keywords.Wait Until Element Is Ready Then Verify Contain Element     ${item}    ${item_name}
    common_keywords.Wait Until Element Is Ready Then Verify Contain Element     ${item}    ${item_price}

Remove Item From Cart ${item_name}
    common_keywords.Wait Until Element Is Ready Then Click Element    xpath=//div[@class='cart_item' and .//div[text()='${item_name}']]//button[contains(text(), 'Remove')]

Verify Cart Should Not Contain Item
    [Arguments]    ${item_name}
    common_keywords.Wait Until Page Is Ready Then Element Should Not Be Visible    xpath=//div[@class='inventory_item_name' and text()='${item_name}']

Verify Cart Is Empty
    common_keywords.Wait Until Page Is Ready Then Element Should Not Be Visible    xpath=//div[@class='cart_item']