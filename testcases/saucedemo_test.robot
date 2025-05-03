*** Settings ***
Resource    ../keywords/login_page.robot
Resource    ../keywords/inventory_page.robot
Resource    ../keywords/productdetail_page.robot
Resource    ../keywords/cart_page.robot
Resource    ../keywords/checkout_page.robot
Resource    ../keywords/common_keywords.robot
Resource    ../resources/variables.robot

Suite Setup    Open Browser To Login Page
Suite Teardown    Close Browser

*** Test Cases ***
# -----------Authentication (Login)-------------

 T01 Login With Correct Credentials
    Login with ${username} and ${password}
    Login Should Succeed
    Prepare To Next Test

T02 Login With Incorrect Username
    Login with ${invalidUSERNAME} and ${invalidPASSWORD}
    Login Should Fail

T03 Login With empty filled
    Login with ${EMPTY} and ${EMPTY}
    Click Login Button
    Login Should Fail

# -----------Logout-------------

T04 Side Menu Functionality
    Login with ${username} and ${password}
    Open Side Menu
    Verify Side Menu Is Visible
    Close Side Menu
    Verify Side Menu Is Not Visible
    Prepare To Next Test

T05 Logout Function
    Login with ${username} and ${password}
    Open Side Menu
    Logout
    Verify This Is Login Page

# -----------Inventory Page-------------

T06 Products Verify Products Are Displayed On Inventory Page
    Login with ${username} and ${password}
    Verify This Is Inventory Page
    Verify Products Are Displayed
    Prepare To Next Test

T07 Verify Product Sorting By Price Low To High
    Login with ${username} and ${password}
    Sort Products by ${lowToHigh}
    Verify First Product Is Onesie
    Prepare To Next Test

T08 Verify Product Sorting By Price High To Low
    Login with ${username} and ${password}
    Sort Products by ${highToLow}
    Verify First Product Is Jacket
    Prepare To Next Test

T09 Verify Product Sorting By Name A To Z
    Login with ${username} and ${password}
    Sort Products by ${aToZ}
    Verify First Product Is Backpack
    Prepare To Next Test

T10 Verify Product Sorting By Name Z To A
    Login with ${username} and ${password}
    Sort Products by ${zToA}
    Verify First Product Is Red Shirt
    Prepare To Next Test

T11 View Product Detail Page
    Login with ${username} and ${password}
    Go To Product Detail Page ${id_backpack}
    Verify Product Detail Page Shown
    Prepare To Next Test

T12 Back to inventory from product detail
    Login with ${username} and ${password}
    Go To Product Detail Page ${id_backpack}
    Go Back To Inventory From Detail
    Verify This Is Inventory Page
    Prepare To Next Test

# -----------Add to Cart / Remove-------------

T13 Add one item to cart (from inventory)
    Login with ${username} and ${password}
    Add Product To Cart From Inventory ${name_backpack}
    Verify Remove Button Visible For Product ${name_backpack}
    Verify Cart Badge Shows 1
    Prepare To Next Test

T14 Add multiple items to cart (from inventory)
    Login with ${username} and ${password}
    Add Product To Cart From Inventory ${name_backpack}
    Add Product To Cart From Inventory ${name_bikeLight}
    Verify Remove Button Visible For Product ${name_backpack}
    Verify Remove Button Visible For Product ${name_bikeLight}
    Verify Cart Badge Shows 2
    Prepare To Next Test

T15 Remove item from cart (from inventory)
    Reload Page
    Login with ${username} and ${password}
    Add Product To Cart From Inventory ${name_backpack}
    Add Product To Cart From Inventory ${name_bikeLight}
    Remove Product From Inventory ${name_backpack}
    Verify Add To Cart Button Visible For Product ${name_backpack}
    Verify Cart Badge Shows 1
    Prepare To Next Test

T16 Cart badge shows correct number (from inventory)
    Reload Page
    Login with ${username} and ${password}
    Add Product To Cart From Inventory ${name_backpack}
    Add Product To Cart From Inventory ${name_bikeLight}
    Remove Product From Inventory ${name_backpack}
    Verify Add To Cart Button Visible For Product ${name_backpack}
    Verify Cart Badge Shows 1
    Remove Product From Inventory ${name_bikeLight}
    Verify Add To Cart Button Visible For Product ${name_bikeLight}
    Verify Cart Badge Is Not Visible
    Prepare To Next Test

T17 Add one item to cart (from product detail)
    Login with ${username} and ${password}
    Go To Product Detail Page ${id_backpack}
    Add Product From Detail Page
    Verify Remove Button Is Visible On Detail Page
    Verify Cart Badge Shows 1
    Prepare To Next Test

T18 Add multiple items to cart (from product detail)
    Login with ${username} and ${password}
    Add Product To Cart From Inventory ${name_backpack}
    Go To Product Detail Page ${id_bikeLight}
    Add Product From Detail Page
    Verify Remove Button Is Visible On Detail Page
    Verify Cart Badge Shows 2
    Prepare To Next Test

T19 Remove item from cart (from product detail)
    Login with ${username} and ${password}
    Add Product To Cart From Inventory ${name_backpack}
    Go To Product Detail Page ${id_bikeLight}
    Add Product From Detail Page
    Remove Product From Detail Page
    Verify Add To Cart Button Is Visible On Detail Page
    Verify Cart Badge Shows 1
    Prepare To Next Test

T20 Cart badge count correct (from product detail)
    Login with ${username} and ${password}
    Add Product To Cart From Inventory ${name_backpack}
    Go To Product Detail Page ${id_bikeLight}
    Add Product From Detail Page
    Remove Product From Detail Page
    Verify Add To Cart Button Is Visible On Detail Page
    Verify Cart Badge Shows 1
    Go Back To Inventory From Detail
    Go To Product Detail Page ${id_backpack}
    Remove Product From Detail Page
    Verify Add To Cart Button Is Visible On Detail Page
    Verify Cart Badge Is Not Visible
    Prepare To Next Test

T21 Cart page shows correct list of items
    Login with ${username} and ${password}
    Add Product To Cart From Inventory ${name_backpack}
    Add Product To Cart From Inventory ${name_bikeLight}
    Go To Cart
    Verify Cart Should Contain Item    ${name_backpack}    ${price_backpack}
    Verify Cart Should Contain Item    ${name_bikeLight}    ${price_bikeLight}
    Verify Number Of Products In Cart 2
    Prepare To Next Test

T22 Remove item from cart (cart page)
    Login with ${username} and ${password}
    Add Product To Cart From Inventory ${name_backpack}
    Add Product To Cart From Inventory ${name_bikeLight}
    Go To Cart
    Remove Item From Cart ${name_bikeLight}
    Verify Cart Should Not Contain Item    ${name_bikeLight}
    Verify Cart Should Contain Item    ${name_backpack}    ${price_backpack}
    Verify Number Of Products In Cart 1
    Prepare To Next Test

T23 Remove item from cart (cart page)
    Login with ${username} and ${password}
    Add Product To Cart From Inventory ${name_backpack}
    Add Product To Cart From Inventory ${name_bikeLight}
    Go To Cart
    Remove Item From Cart ${name_backpack}
    Remove Item From Cart ${name_bikeLight}
    Verify Cart Is Empty
    Prepare To Next Test

T24 Continue shopping from cart
    Login with ${username} and ${password}
    Go To Cart
    Click Continue Shopping
    Verify This Is Inventory Page
    Prepare To Next Test

T25 Proceed to checkout
    Set Selenium Speed    0.15s
    Login with ${username} and ${password}
    Add Product To Cart From Inventory ${name_backpack}
    Add Product To Cart From Inventory ${name_bikeLight}
    Go To Cart
    Click Checkout
    Verify Redirection To Checkout Step One
    Prepare To Next Test

# -----------Checkout Page-------------

T26 Checkout step one with missing required fields
    Login with ${username} and ${password}
    Add Product To Cart From Inventory ${name_backpack}
    Add Product To Cart From Inventory ${name_bikeLight}
    Go To Cart
    Click Checkout
    Fill Checkout Form    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Click Finish Checkout
    Verify Error Message For Missing Required Fields
    Prepare To Next Test

T27 Checkout step one with ZIP code is not a number
    Login with ${username} and ${password}
    Add Product To Cart From Inventory ${name_backpack}
    Add Product To Cart From Inventory ${name_bikeLight}
    Go To Cart
    Click Checkout
    Fill Checkout Form    ${first}    ${last}    ${invalidZip}
    Click Finish Checkout
    Run Keyword And Continue On Failure    Verify Error Message For Missing Required Fields
    Prepare To Next Test

T28 Checkout step one with ZIP code is not a number
    Login with ${username} and ${password}
    Add Product To Cart From Inventory ${name_backpack}
    Add Product To Cart From Inventory ${name_bikeLight}
    Go To Cart
    Click Checkout
    Fill Checkout Form    ${first}    ${last}    ${zip}
    Click Finish Checkout
    Verify Redirection To Checkout Step Two
    Prepare To Next Test

T29 Checkout Process End-to-End
    Login with ${username} and ${password}
    Add Product To Cart From Inventory ${name_backpack}
    Add Product To Cart From Inventory ${name_bikeLight}
    Go To Cart
    Click Checkout
    Fill Checkout Form    ${first}    ${last}    ${zip}
    Click Finish Checkout
    Verify Redirection To Checkout Step Two
    Click Finish Checkout
    Verify Redirection To Order Completed
    Click Back Home
    Verify This Is Inventory Page