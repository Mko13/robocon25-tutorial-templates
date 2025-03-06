*** Comments ***
Tutorial: Templates - Part 2: Templates at Different Levels > Scope


*** Settings ***
Documentation       Common Template for all tests in the suite.
...                 The Template can be overriden or removed.
...                 Each test case may have its own Template.

Library             OperatingSystem

Test Template       File Size Should Not Exceed


*** Test Cases ***
HTML
    log.html      1000000
    report.html   6000000

XML
    [Template]    NONE
    File Should Exist    data/output.xml
    Log    "No longer Template, normal Test Case"

TXT
    [Template]    File Should Not Be Empty
    data/doc.txt
    data/another_doc.txt


*** Keywords ***
File Size Should Not Exceed
    [Documentation]    Checks given file size. Fails if exceeds max.
    [Arguments]    ${file}    ${max_size}
    ${size} =    Get File Size    data/${file}
    Should Be True    ${size} < ${max_size}