*** Settings ***
Documentation       Templates and the DataDriver library

Library             OperatingSystem
Library             DataDriver    data/files.csv

Suite Setup         Log    This is suite setup
Suite Teardown      Log    This Is suite teardown
Test Setup          Log    This is test setup
Test Teardown       Log    This Is test teardown

Test Template       File Size Should Not Exceed


*** Test Cases ***
Size of ${file} Should Not Exceed ${max_size} bytes.


*** Keywords ***
File Size Should Not Exceed
    [Documentation]    Checks given file size. Fails if exceeds max.
    [Arguments]    ${file}    ${max_size}
    [Setup]    Log    This Is Iteration Setup
    ${size} =    Get File Size    data/${file}
    Should Be True    ${size} < ${max_size}
    [Teardown]    Log    This Is Iteration Teardown
