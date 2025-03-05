*** Comments ***
Tutorial: Templates - Part 1: BASICS > Template Types


*** Settings ***
Documentation       Template from user keyword

Test Template       Should Contain At Least Twice


*** Test Cases ***                       WORD               CHAR
Templated Test Case With User Keyword
                                         Hello              l
                                         Robot Framework    r
                                         2512               2
                                         Robocon            o


*** Keywords ***
Should Contain At Least Twice
    [Documentation]    Counts given character in word. Fails if not 2.
    [Arguments]    ${string}    ${character}
    Log    ${string}, ${character}
    ${count}=    Get Count    ${string}    ${character}
    Should Be True    ${count} >= 2