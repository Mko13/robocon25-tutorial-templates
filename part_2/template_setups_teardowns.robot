*** Comments ***
Tutorial: Templates - Part 2: Templates at Different Levels > Setups & Teardowns

*** Settings ***
Documentation       Setup and Teardown on keyword-level (iteration), test-level and
...                 suite-level.
...                 Test Setup and Teardown can be overriden or removed.

Library             OperatingSystem

Suite Setup         Log    This is suite setup
Suite Teardown      Log    This is suite teardown
Test Setup          Log    This is test setup
Test Teardown       Log    This is test teardown

Test Template       File Size Should Not Exceed


*** Test Cases ***
HTML
    log.html       1000000
    report.html    6000000

XML
    [Setup]    NONE
    output.xml    20000

TXT
    [Setup]    Log    Override Setup
    doc.txt            36000
    another_doc.txt    50000


*** Keywords ***
File Size Should Not Exceed
    [Documentation]    Checks given file size. Fails if exceeds max.
    [Arguments]    ${file}    ${max_size}
    [Setup]    Log    This is iteration setup
    ${size} =    Get File Size    data/${file}
    Should Be True    ${size} < ${max_size}
    [Teardown]    Log    This Is iteration teardown
