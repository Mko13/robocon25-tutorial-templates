*** Comments ***
Tutorial: Templates - Part 2: Templates at Different Levels > Failed tests


*** Settings ***
Documentation       Handling keyword failure using reserved tags.
...                 - robot:stop-on-failure - don't run next iterations
...                 - robot:skip-on-failure - continue iterations, test is SKIP-ed.
...                 - robot:exit-on-failure - don't run next tests at all (NEW in RF 7.2)

Library             OperatingSystem

Suite Setup         Log    This is suite setup
Suite Teardown      Log    This is suite teardown
Test Setup          Log    This is test setup
Test Teardown       Log    This is test teardown

Test Template       File Size Should Not Exceed


*** Test Cases ***
HTML
    [Tags]    robot:stop-on-failure
    log.html       1000000
    report.html    6000000

XML
    [Tags]    robot:skip-on-failure
    output.xml    20000
    another.xml   1200000

TXT
    [Tags]    robot:exit-on-failure
    doc.txt            36000
    another_doc.txt    50000

CSV
    files.csv    1000


*** Keywords ***
File Size Should Not Exceed
    [Documentation]    Checks given file size. Fails if exceeds max.
    [Arguments]    ${file}    ${max_size}
    [Setup]    Log    This is iteration setup
    ${size} =    Get File Size    data/${file}
    Log    Fail deliberately. Print ${somevar}.
    Should Be True    ${size} < ${max_size}
    [Teardown]    Log    This is iteration teardown

