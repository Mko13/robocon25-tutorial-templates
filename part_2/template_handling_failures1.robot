*** Comments ***
Tutorial: Templates - Part 2: Templates at Different Levels > Failed tests


*** Settings ***
Documentation       Handling test case failures using reserved tags.
...                 - robot:stop-on-failure - don't run next iterations
...                 - robot:skip-on-failure - continue iterations, test is SKIP-ed.

Library             OperatingSystem

Suite Setup         Log    This is suite setup
Suite Teardown      Log    This Is suite teardown
Test Setup          Log    This is test setup
Test Teardown       Log    This Is test teardown

Test Template       File Size Should Not Exceed


*** Test Cases ***
HTML
    [Tags]    robot:stop-on-failure
    log.html       1
    report.html    6000000

XML
    [Tags]    robot:skip-on-failure
    output.xml    1
    another.xml   120000

TXT
    doc.txt            1
    another_doc.txt    50000



*** Keywords ***
File Size Should Not Exceed
    [Documentation]    Checks given file size. Fails if exceeds max.
    [Arguments]    ${file}    ${max_size}
    [Setup]    Log    This is iteration setup
    ${size}=    Get File Size    data/${file}
    Should Be True    ${size} < ${max_size}
    [Teardown]    Log    This is iteration teardown

