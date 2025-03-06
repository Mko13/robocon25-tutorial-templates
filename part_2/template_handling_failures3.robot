*** Comments ***
Tutorial: Templates - Part 2: Templates at Different Levels > Failed tests


*** Settings ***
Documentation       Handling iteration failure using automatic variables
...                 '${KEYWORD_STATUS}'

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
    output.xml    1
    another.xml   1200000

TXT
    doc.txt            36000
    another_doc.txt    50000



*** Keywords ***
File Size Should Not Exceed
    [Documentation]    Checks given file size. Fails if exceeds max.
    [Arguments]    ${file}    ${max_size}
    [Setup]    Log    This is iteration setup
    ${size} =    Get File Size    data/${file}
    #Log    Fail deliberately. Print ${somevar}.
    Should Be True    ${size} < ${max_size}
    [Teardown]    Do Something If Iteration Fails
    #[Teardown]    Skip If Fails

Do Something If Iteration Fails
    [Documentation]    Execute some action if iteration fails.
    IF    "${KEYWORD_STATUS}" == "FAIL"    Log    This Iteration Failed.

Skip If Fails
    [Documentation]    Execute some action if iteration fails.
    IF    "${KEYWORD_STATUS}" == "FAIL"    Skip