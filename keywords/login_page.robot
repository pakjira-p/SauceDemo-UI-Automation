*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables.robot
Resource    ../keywords/common_keywords.robot

*** Keywords ***
Login with ${username} and ${password}
    common_keywords.Wait until element is ready then input text    id:user-name    ${username}
    common_keywords.Wait until element is ready then input text     id:password     ${password}
    common_keywords.Wait Until Element Is Ready Then Click Element  id:login-button

Login Should Fail
    common_keywords.Wait Until Page Contains Element Then Verify Element    css:[data-test="error"]

Login Should Succeed
    common_keywords.Wait Until Page Contains Element Then Verify Element    class:inventory_container
